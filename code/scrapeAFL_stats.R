## this function scrapes game by game AFL player data for a given season and 
## team name
## website : https://afltables.com/afl/stats/teams/adelaide/2018_gbg.html 
## CHECKED FOR NO DOWNLOADING ERRORS OR WARNINGS

library(stringr)     
library(reshape2)
library(httr)

## automatically exclude gws for 2011 below, goldcoast for 2010
scrapeStat <- function() {

    lstTeams <- c("adelaide","brisbaneb","brisbanel","carlton",
            "collingwood","essendon","fitzroy","fremantle","geelong",
            "goldcoast","gws","hawthorn","melbourne","kangaroos",
            "padelaide","richmond","stkilda","swans","westcoast","bullldogs")

    lstTeamCode <- c("AD","BB","BL","CA",
            "CW","ES","FI","FR","GE",
            "GC","GW","HW","ME","NM",
            "PA","RI","SK","SY", "WC","WB")
    
    lstSeasons0 <- c(2018,2017,2016)
    lstSeasons1 <- c(2015,2014,2013,2012,2011)
    lstSeasons2 <- c(2010,2009,2008,2007,2006)
    lstSeasons3 <- c(2005,2004,2003,2002,2001)
    lstSeasons4 <- c(2000,1999,1998,1997,1996)
    lstSeasons5 <- c(1995,1994,1993,1992,1991)
    lstSeasons6 <- c(1990,1989,1988,1987,1986)
    lstSeasons7 <- c(1985,1984,1983,1982,1981)
    
    ## set season range here
    lstSeasons <- c(lstSeasons0,lstSeasons1,lstSeasons2,lstSeasons3,
                    lstSeasons4,lstSeasons5,lstSeasons6,lstSeasons7)
    
    nTeams <- length(lstTeams)
    nSeasons <- length(lstSeasons)
    
    for (i in 1:nSeasons) {
        record <- NULL
        season <- lstSeasons[i]
        for (j in 1:nTeams) {
            team <- lstTeams[j]
            team.code <- lstTeamCode[j]
            xrecord <- scrapeplayer_stat_season(team,team.code,
                        as.integer(season))
            record <- rbind(record,xrecord)
        }
        filecsv <- paste(season,"_player_stat.csv",sep="")
        write.csv(record, filecsv, row.names = FALSE)       
    }
    
}



scrapeplayer_stat_season <- function(team,team.code,season) {
    
    ##team.code <- "AD"
    ##team <- "adelaide"
    ##season <- 2015

    ## read mapping files
    dirSrc <- "C:/Users/denis/Documents/DataScience/AFLStats/map/"
    filePlayer <- paste(dirSrc,"player_team.csv",sep="")
    fileGame <- paste(dirSrc,"game_score.csv",sep="")    
    idPlayer <- read.csv(filePlayer)
    idGame <- read.csv(fileGame)  
    
    ## split out player name, work out career end
    idPlayer$CareerEnd <- as.integer(substrRight
            (as.character(idPlayer$Seasons),4))
    idPlayer <- subset(idPlayer,CareerEnd > season-10)
    nProfiles <- nrow(idPlayer)
    player.name <- data.frame(matrix(unlist(strsplit
            (as.character(idPlayer$Name),",")),nrow=nProfiles,byrow = T))
    names(player.name) <- c("Name.Last","Name.First")
    idPlayer <- cbind(idPlayer,Name.First=player.name$Name.First,
            Name.Last=player.name$Name.Last)
    
    PlayerID <- NULL
    GameID <- NULL
        
    fileURL = paste("https://afltables.com/afl/stats/teams/",team,"/",
            season,"_gbg.html",sep="")
    if (GET(fileURL)$status_code == 200) {
    
    download.file(fileURL,"afl.html")
    doc.page <- scan(file="afl.html",sep='\n',what='',skipNul=TRUE)
    ##doc.page <- readLines("afl.html")
    
    ## find start line
    doc.pattern <- "Abbreviations"
    doc.start <- grep(doc.pattern, doc.page)
    doc.page <- doc.page[doc.start]
    
    ## cleans up formatting charcters
    doc.page <- gsub("<.*?>", " ", doc.page)  ## remove html formatting
    doc.page <- gsub("&nbsp;", "0", doc.page)
    doc.page <- gsub(" -", " 0", doc.page)
    
    ## finds start and end of data
    strEnd <- str_locate(doc.page,"subbed off")[2]
    doc.page <- substring(doc.page,strEnd+1)
    doc.page <- gsub("R1 ","R01 ",doc.page)
    doc.page <- gsub("R2 ","R02 ",doc.page)
    doc.page <- gsub("R3 ","R03 ",doc.page)
    doc.page <- gsub("R4 ","R04 ",doc.page)
    doc.page <- gsub("R5 ","R05 ",doc.page)
    doc.page <- gsub("R6 ","R06 ",doc.page)
    doc.page <- gsub("R7 ","R07 ",doc.page)
    doc.page <- gsub("R8 ","R08 ",doc.page)
    doc.page <- gsub("R9 ","R09 ",doc.page)    
    
    lstMoves <- c("Disposals","Kicks","Marks","Handballs","Goals", "Behinds",
        "Hit Outs", "Tackles", "Rebounds", "Inside 50s", "Clearances", 
        "Clangers", "Frees", "Frees Against", "Contested Possessions", 
        "Uncontested Possessions", "Contested Marks", "Marks Inside 50", 
        "One Percenters", "Bounces", "Goal Assists", "% Played", 
        "Brownlow Votes") ## , "Subs") ignore subs
    lstAbbr <- c("DI","KI","MK","HB","GL","BH",
        "HO","TK","RB","I5","CL",
        "CG","FF","FA","CP",
        "UP","CM","MI",
        "OP","BO","GA","%P","BR") ##,"SU") ignore subs
    
    ## finds start of each move
    playerStats <- NULL
    nMoves <- length(lstMoves)
    
    for (i in 1:nMoves) {
        df <- NULL
        desc <- lstMoves[i]
        abbr <- lstAbbr[i]
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
            df<-data.frame(matrix(unlist(player.page),nrow=nPlayers,
                    byrow = T))
            names(df) <- rounds
        
            ## remove round totals; remove player totals
            rounds <- rounds[-nRounds]
            df <- df[,-nRounds]; rounds<- rounds[-1]; nRounds<-length(rounds)
            df <- df[-nPlayers,]
            df$Player <- as.character(droplevels(df$Player))
            players <- df[,1]; nPlayers <- length(players)
            df[sapply(df, is.factor)]<-lapply(df[sapply(df,is.factor)], 
                function(x) as.numeric(as.character(x)))
        
            ## melt and add to total player stats
            df <- melt(df,id = "Player")
            df$move <- abbr
            df$Season <- season
            df <- as.data.frame(cbind(team.code,df))
            playerStats <- rbind(playerStats,df)
        }
    }
    
    names(playerStats)<-c("Team","Name","Round","StatCount","Stat","Season")
    playerStats <- merge(playerStats, 
            idGame[,c("GameID","Season","Round","Team")],
            by=c("Season","Round","Team"))
    playerStats <- merge(playerStats, idPlayer[,c("PlayerID","Name","Team")],
            by=c("Name","Team"),all.x = TRUE)
    playerStats <- playerStats[,c(7:8,1:4,6,5)]
    playerStats$Stat<- gsub("\\%P","PP",playerStats$Stat)
    playerStats
    }
    
}



substrRight <- function(x, n){
    substr(x, nchar(x)-n+1, nchar(x))
}
