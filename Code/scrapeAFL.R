## this function scrapes game by game AFL player data for a given season and 
## team name
## website : https://afltables.com/afl/stats/teams/adelaide/2018_gbg.html 

library(stringr)     
library(reshape2)
library(httr)

## automatically exclude gws for 2011 below, goldcoast for 2010
scrapeplayer <- function() {

    lstTeams <- c("adelaide","brisbanel","carlton","collingwood","essendon",
            "fremantle","geelong","goldcoast","gws","hawthorn","melbourne",
            "kangaroos","padelaide","richmond","stkilda","swans", "westcoast",
            "bullldogs")
    
    lstSeasons <- c("2018","2017","2016","2015","2014","2013","2012","2011",
                    "2010","2009")
    
    nTeams <- length(lstTeams)
    nSeasons <- length(lstSeasons)
    
    for (i in 1:nSeasons) {
        record <- NULL
        season <- lstSeasons[i]
        for (j in 1:nTeams) {
            team <- lstTeams[j]
            xrecord <- scrapeplayer_team_season(team,season)
            record <- rbind(record,xrecord)
        }
        filecsv <- paste(season,"_player_gbg.csv",sep="")
        write.csv(record, filecsv, row.names = FALSE)       
    }
    
}



scrapeplayer_team_season <- function(team,season) {
    
    ##team = "adelaide"
    ##season = "2012"
    
    fileURL = paste("https://afltables.com/afl/stats/teams/",team,"/",
            season,"_gbg.html",sep="")
    if (GET(fileURL)$status_code == 200) {
    
    download.file(fileURL,"afl.html")
    doc.page <- readLines("afl.html")   
    
    ## find start line
    doc.pattern <- "Abbreviations"
    doc.start <- grep(doc.pattern, doc.page)
    doc.page <- doc.page[doc.start]
    
    ## cleans up formatting charcters
    doc.page <- gsub("<.*?>", " ", doc.page)
    doc.page <- gsub("&nbsp;", "0", doc.page)
    doc.page <- gsub(" -", " 0", doc.page)
    
    ## finds start and end of data
    strEnd <- str_locate(doc.page,"subbed off")[2]
    doc.page <- substring(doc.page,strEnd+1)
    
    lstMoves <- c("Disposals","Kicks","Marks","Handballs","Goals", "Behinds",
        "Hit Outs", "Tackles", "Rebounds", "Inside 50s", "Clearances", 
        "Clangers", "Frees", "Frees Against", "Contested Possessions", 
        "Uncontested Possessions", "Contested Marks", "Marks Inside 50", 
        "One Percenters", "Bounces", "Goal Assists", "% Played", 
        "Brownlow Votes", "Subs")
    
    ## finds start of each move
    playerStats <- NULL
    nMoves <- length(lstMoves)
    
    for (i in 1:nMoves) {
        df <- NULL
        desc <- lstMoves[i]
        doc.length <- nchar(doc.page)
        strStart <- str_locate(doc.page,desc)[2]
        
        if (!is.na(strStart)) {
            player.page <- substring(doc.page,strStart+1,doc.length)
            strMid <- str_locate(player.page,"Player")[1]
            strEnd <- str_locate(player.page,"Opponent")[1]
            player.page <- substring(player.page,strMid,strEnd-1)
        
            player.page <- gsub("  +", ";",player.page)
            player.page <- strsplit(player.page, ";")
            player.page <- unlist(player.page)
        
            ## make into df, update names of columns, remove round totals
            nRounds <- which(player.page == "Tot")
            rounds<-player.page[1:nRounds]
            player.page<-player.page[-(1:nRounds)]
            nPlayers <- length(player.page)/(nRounds)
            nRounds <- length(rounds)  
            df<-data.frame(matrix(unlist(player.page),nrow=nPlayers,byrow = T))
            names(df) <- rounds
        
            ## remove round totals; remove player totals
            rounds <- rounds[-nRounds]
            df <- df[,-nRounds]; nRounds<-length(rounds)
            df <- df[-nPlayers,]
            df$Player <- as.character(droplevels(df$Player))
            players <- df[,1]; nPlayers <- length(players)
            df[sapply(df, is.factor)]<-lapply(df[sapply(df,is.factor)], 
                function(x) as.numeric(as.character(x)))
        
            ## melt and add to total player stats
            df <- melt(df,id = "Player")
            df$move <- desc
            df <- as.data.frame(cbind(season,team,df))
            playerStats <- rbind(playerStats,df)
        }
    }
    
    names(playerStats) <- c("Season","Team","Player","Round","xvalue","move")
    playerStats
    
    }
}
