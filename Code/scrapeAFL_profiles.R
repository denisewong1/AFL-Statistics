## this function scrapes AFL player, team and season and creates a unique
## player ID
## website : https://afltables.com/afl/stats/alltime/adelaide.html 

library(stringr)     
library(reshape2)
library(httr)

## automatically exclude gws for 2011 below, goldcoast for 2010
scrapeplayer <- function() {

    lstTeams <- c("adelaide","brisbaneb","brisbanel","carlton",
            "collingwood","essendon","fitzroy","fremantle","geelong",
            "goldcoast","gws","hawthorn","melbourne","kangaroos",
            "padelaide","richmond","stkilda","swans", "westcoast","bullldogs")

    lstTeamCode <- c("AD","BB","BL","CA",
            "CW","ES","FI","FR","GE",
            "GC","GW","HW","ME","NM",
            "PA","RI","SK","SY", "WC","WB")
    
    nTeams <- length(lstTeams)
    record <- NULL
    for (i in 1:nTeams) {
        team <- lstTeams[i]
        team.code <- lstTeamCode[i]
            xrecord <- scrapeplayer_team(team,team.code)
            record <- rbind(record,xrecord)
    }
    
    ## make unique list of players
    profile <- unique(record[,c("Name","DOB","Height","Weight")])
    profile$PlayerID <- seq.int(nrow(profile))
    profile <- profile[c(5,1,2,3,4)]  ## reorder columns
    
    ## split out player first & last name
    nProfiles <- nrow(profile)
    player.name <- data.frame(matrix(unlist(strsplit
            (as.character(profile$Name),",")),nrow=nProfiles,byrow = T))
    names(player.name) <- c("Name.Last","Name.First")
    profile <- cbind(profile,Name.First=player.name$Name.First,
            Name.Last=player.name$Name.Last)
        
    ## reference back to player record
    nRecords <- nrow(record)
    for (i in 1:nRecords) {
        matchPlayer <- grep(record$Name[i],profile$Name) 
        matchDOB <- grep(record$DOB[i],profile$DOB)
        record$PlayerID[i] <- profile$PlayerID[intersect(matchPlayer,matchDOB)]
    }
    
    filecsv <- "player_team_season.csv"
    write.csv(record, filecsv, row.names = FALSE)       
    
    filecsv <- "player_profile.csv"
    write.csv(profile, filecsv, row.names = FALSE)       
    
}



scrapeplayer_team <- function(team,team.code) {
    
    fileURL = paste("https://afltables.com/afl/stats/alltime/",team,
            ".html",sep="")
    if (GET(fileURL)$status_code == 200) {
    
    download.file(fileURL,"afl.html")
    doc.page <- readLines("afl.html")   
    
    ## find start and end of data
    doc.pattern <- 'table class="sortable"'
    doc.start <- grep(doc.pattern, doc.page)+2
    doc.pattern <- "Order of appearance"
    doc.end <- grep(doc.pattern, doc.page)-1
    doc.page <- doc.page[doc.start:doc.end]
    
    ## cleans up formatting charcters
    doc.page <- gsub("<.*?>", " ", doc.page)
    doc.page <- gsub("&nbsp;", "0", doc.page)
    ## doc.page <- gsub(" -", " 0", doc.page)
    
    playerProfile <- NULL
    ## split the document into player & season page data
    player.page <- NULL ; season.page <- NULL
    doc.length <- length(doc.page)/2
    for (i in 1:doc.length) {
        doc.row <- (i-1)*2+1
        player.page <- rbind(player.page,doc.page[doc.row])
        season.page <- rbind(season.page,doc.page[doc.row+1])
    }
    
    ## format player page
    player.page <- gsub("^  +", "",player.page)
    player.page <- gsub("  +", ";",player.page)
    player.page <- gsub("cm", "",player.page)
    player.page <- gsub("kg", "",player.page)
    player.page <- strsplit(player.page, ";")
    player.page <- unlist(player.page)
    nPlayers <- length(player.page)/8    
    df1<-data.frame(matrix(unlist(player.page),nrow=nPlayers,byrow = T))
    df1<-cbind(team.code,df1)
    
    ## format season page
    season.page <- gsub(", ", "",season.page)
    season.page <- gsub("^ ", "",season.page)
    season.page <- strsplit(season.page, "  ")
    df2<-data.frame(matrix(unlist(season.page),nrow=nPlayers,byrow = T))
    
    ## recombine tables
    playerProfile <- as.data.frame(cbind(NA,df1,df2))
    
    names(playerProfile) <- c("PlayerID","Team","Cap","JumperNo","Name","DOB",
            "Height","Weight","Games","Goals","Seasons","Debut","Last")
    playerProfile

    }
    
}
