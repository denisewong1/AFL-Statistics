## this function scrapes all games played and the result
## website : https://afltables.com/afl/stats/biglists/bg3.txt

library(stringi)
library(stringr)     
library(reshape2)
library(httr)

## automatically exclude gws for 2011 below, goldcoast for 2010


scrapegame <- function() {
    
    fileURL = "https://afltables.com/afl/stats/biglists/bg3.txt"
    if (GET(fileURL)$status_code == 200) {
    
    download.file(fileURL,"afl.html")
    doc.page <- readLines("afl.html")   
    
    lstTeams <- c("Adelaide","Brisbane Bears","Brisbane Lions","Carlton",
            "Collingwood","Essendon","Fitzroy","Footscray","Fremantle",
            "Geelong","Gold Coast","GW Sydney","Hawthorn","Melbourne",
            "North Melbourne","Port Adelaide","Richmond","St Kilda","Sydney",
            "West Coast","Western Bulldogs","South Melbourne","University",
            "Kangaroos")
    
    lstTeamCode <- c("AD","BB","BL","CA",
            "CW","ES","FI","FO","FR","GE",
            "GC","GW","HW","ME","NM",
            "PA","RI","SK","SY", 
            "WC","WB","SM","UN","KA")
    
    ## find start line
    doc.end <- length(doc.page)
    doc.page <- doc.page[3:doc.end]
    
    ## splits columns in data frame
    doc.page <- gsub("  +", ";",doc.page)
    doc.page <- gsub("[.] ", ";",doc.page)
    doc.page <- strsplit(doc.page, ";")
    doc.page <- unlist(doc.page)
    
    nGames <- length(doc.page)/8
    df<-data.frame(matrix(unlist(doc.page),nrow=nGames,byrow = T))
    names(df) <- c("GameID","Date", "Round","Team.Home","Score.Home",
            "Team.Away","Score.Away","Venue")
    df$GameID <- gsub("[.]","",df$GameID)
    df$Season <- substr(df$Date,str_length(df$Date)-3,length(df$Date))
    df$Date <- as.character(df$Date)
    df$Team.Home <- as.character(df$Team.Home)
    df$Team.Away <- as.character(df$Team.Away)
    
    for (i in 1:nGames) {
         if(str_length(df$Date[i])==10) df$Date[i]<-paste("0",df$Date[i],sep="")
         df$Team.Home[i]<-lstTeamCode[grep(df$Team.Home[i],lstTeams)]
         df$Team.Away[i]<-lstTeamCode[grep(df$Team.Away[i],lstTeams)]
    }
    df$Date <- as.Date(df$Date)
    
    ## extract final scores    
    xHome <- data.frame(matrix(unlist(strsplit
            (as.character(df$Score.Home),"[.]")),nrow=nGames,byrow = T))[,3]
    xAway <- data.frame(matrix(unlist(strsplit
            (as.character(df$Score.Away),"[.]")),nrow=nGames,byrow = T))[,3]    

    df <- df[c(1:2,9,3:8)]  ## reorder columns
    filecsv <- "game.csv"
    write.csv(df, filecsv, row.names = FALSE)     
    
    }
    
}
