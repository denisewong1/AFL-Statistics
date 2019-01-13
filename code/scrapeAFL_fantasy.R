## this function scrapes the fantasy player price and positions per round
##fileURL <- paste("https://www.footywire.com/afl/footy/dream_team_round?year=",season,"&round=",round,"&p=",position,"&s=S",sep="")
##fileURL <- paste("https://www.footywire.com/afl/footy/dream_team_round?year=",season,"&round=",round,"&s=S",sep="")  

library(stringr)     
library(reshape2)
library(httr)
library(tidyr)
library(stringdist)


scrapefantasy <- function() {
    
    lstPositions <- c("DE","MI","FO","RU","ALL")
    
    for (season in 2010:2010) {
        ## 23 rounds for 2012 to 2018
        ## 22 rounds for 2010 and 24 rounds for 2011
        ifelse(season>=2012,nRounds <- 23,
             ifelse(season==2011,nRounds<-24,nRounds<-22))
        
        recFantasy <- NULL
        recMissing <- NULL
        recPosition <- NULL
        fileFantasy <- paste(season,"_player_fantasy.csv",sep="")
        filePosition <- paste(season,"_player_position.csv",sep="")
        fileMissing <- paste(season,"_player_duplicate.csv",sep="")
        for(round in 1:nRounds) {
            for(j in 1:4) {
                position <- lstPositions[j]
                record <- scrapefantasy_season(season,round,position)   
                for (k in seq(record))
                    assign(paste0("df", k), record[[k]])
                    if(j == 5) {
                        recFantasy <- rbind(recFantasy,df1)
                        if (!is.null(df2)){recMissing<-rbind(recMissing,df2)}
                    } else {recPosition <- rbind(recPosition,df1)}
            }
        }
    
        
        if (j == 5) {    
            ##recNotPlaying$PlayerID <- unlist(recNotPlaying$PlayerID)
            write.csv(recFantasy, fileFantasy, row.names = FALSE)
            write.csv(recMissing, fileMissing, row.names = FALSE)
        } else {
            ##recPosition$PlayerID <- unlist(recPosition$PlayerID)
            write.csv(recPosition, filePosition, row.names = FALSE)}
        
        
    }
    
}


scrapefantasy_season <- function(season,round,position) {
    
    ##season = 2010
    ##position = "ALL"
    ##round = 2
    
    lstNickname <- c("Crows","Lions","Blues",
        "Magpies","Bombers","Dockers",
        "Cats","Suns","Giants","Hawks","Demons",
        "Kangaroos","Power","Tigers","Saints","Swans",
        "Eagles","Bulldogs")
    
    lstTeamCode <- c("AD","BL","CA",
                     "CW","ES","FR",
                     "GE","GC","GW","HW","ME",
                     "NM","PA","RI","SK","SY", 
                     "WC","WB")
    idNickname <- as.data.frame(cbind(lstTeamCode,lstNickname))
    names(idNickname) <- c("Team","Nickname")
    
    ## read mapping files    
    dirSrc <- "C:/Users/denis/Documents/DataScience/AFLStats/map/"
    filePlayer <- paste(dirSrc,"player_team.csv",sep="")
    fileGame <- paste(dirSrc,"game_score.csv",sep="")
    idPlayer <- read.csv(filePlayer)
    idGame <- read.csv(fileGame)   
    
    ## split out player name, work out career end
    idPlayer$CareerEnd <- as.integer(substrRight
            (as.character(idPlayer$Seasons),4))
    idPlayer <- subset(idPlayer,CareerEnd > season-5)
    nProfiles <- nrow(idPlayer)
    player.name <- data.frame(matrix(unlist(strsplit
        (as.character(idPlayer$Name),",")),nrow=nProfiles,byrow = T))
    names(player.name) <- c("Name.Last","Name.First")
    idPlayer <- cbind(idPlayer,Name.First=player.name$Name.First,
                      Name.Last=player.name$Name.Last)
    
    PlayerID <- NULL
    GameID <- NULL    
    
    ## read URL
    fileHeader <- "https://www.footywire.com/afl/footy/dream_team_round?"
    ifelse(position=="ALL",
        fileURL <- paste(fileHeader,
            "year=",season,"&round=",round,"&s=S",sep=""),
        fileURL <- paste(fileHeader, 
            "year=",season,"&round=",round,"&p=",position,"&s=S",sep=""))
    
    ##if (GET(fileURL)$status_code == 406) {
                         
        download.file(fileURL,"afl.html")
        doc.page <- readLines("afl.html")

        ## find start line
        doc.pattern <- "Values are points scored"
        doc.start <- grep(doc.pattern, doc.page)+1
        doc.pattern <- "More AFL Fantasy Stats"
        doc.end <- grep(doc.pattern, doc.page)-1
        doc.page <- doc.page[doc.start:doc.end]

        ## cleans up formatting charcters
        doc.page <- gsub("<.*?>", " ", doc.page)
        doc.page <- gsub("&nbsp;", "", doc.page)
        doc.page <- gsub("^ *", "", doc.page)
        doc.page <- gsub(" *$", "", doc.page)
        doc.page <- gsub("\\$","",doc.page)
        
        ## resize page
        doc.page <- doc.page[!(is.na(doc.page) | doc.page=="")]
        doc.end <- length(doc.page)
        doc.page <- doc.page[10:doc.end]
        
        ## suspended players
        suspend.page <- NULL
        suspend.row <- grep("Suspended",doc.page)
        if (length(suspend.row)) {
            suspend.page <- as.integer(doc.page[suspend.row-2])
            doc.page <- doc.page[-suspend.row]
        }
        
        ## injured players
        injury.page <- NULL
        injury.row <- grep("Injured",doc.page)
        if (length(injury.row)) {
            injury.page <- as.integer(doc.page[injury.row-2])
            doc.page <- doc.page[-injury.row]
        }
        
        ## make player data into dataframe
        nPlayers <- length(doc.page)/7
        df<-data.frame(matrix(unlist(doc.page),nrow=nPlayers,byrow = T))
        df <- df[,c(1,2,3,5,6,7)]
        names(df) <- c("Status","Name","Nickname","FtsyPx","FtsyPt","FtsyVal")
        df$FtsyPx <- gsub(",","",df$FtsyPx)
        df$Status <- "PLAYED"
        df$Status[injury.page] <- "INJURED"
        df$Status[suspend.page] <- "SUSPENDED"        
        df<-merge(df, idNickname,by=c("Nickname"))
        df$Nickname <- NULL
        df$Position <- position
        df$Season <- season
        df$Round <- paste("R",formatC(round,width=2,flag="0"),sep="")
        df$Round <- factor(df$Round)
        temp <- extract(df, Name, c("FirstName", "LastName"), "([^ ]+) (.*)")
        df$Name.First <-temp$FirstName
        df$Name.Last <- temp$LastName
        df$Name <- paste(temp$LastName,temp$FirstName,sep=", ")
        
        df <- df[,c(8:9,1:7,10:11)]
        fantasyStats <- df
        
        
        MissingStats <- NULL
        ## rename teams, match back to player & game id, name unch
        fantasyStats <- merge(fantasyStats, 
                idGame[,c("GameID","Season","Round","Team")],
                by=c("Season","Round","Team"))
        fantasyStats <- merge(fantasyStats, 
                idPlayer[,c("PlayerID","Name","Team")],
                by=c("Name","Team"),all.x=TRUE)
        lstMissing <- is.na(fantasyStats$PlayerID)
        if (length(fantasyStats$Name[lstMissing])) {
        fantasyStats$PlayerID[lstMissing]<-matchNameAlt(
            fantasyStats$Name[lstMissing],
            team=fantasyStats$Team[lstMissing],idPlayer)
        fantasyStats$PlayerID <- unlist(fantasyStats$PlayerID)
        MissingStats <- c(MissingStats,fantasyStats[lstMissing,])}
    
    if (position != "ALL") {
        listStats <- list(fantasyStats)
    } else {listStats <- list(fantasyStats, MissingStats)}
    
    listStats
                
    ##}
         
    
}


substrRight <- function(x, n){
    substr(x, nchar(x)-n+1, nchar(x))
}


matchNameAlt <- function(fullname,team,db) {
    ## split name into first & last names
    nProfiles <- length(fullname)
    if (nProfiles) {
    player.name <- data.frame(matrix(unlist(strsplit
            (as.character(fullname),",")),nrow=nProfiles,byrow = T))
    names(player.name) <- c("Name.Last","Name.First")
    
    fullname <- as.data.frame(fullname)
    fullname$Name.First <- player.name$Name.First
    fullname$Name.Last <- player.name$Name.Last
    fullname$PlayerID <- NA
    fullname$found <- "none"
    fullname$matched <- NA
    
    ##db <- subset(db,Team=team)
    ##fullname$PlayerID <- db$PlayerID[which.min(
    ##    stringdist(fullname$Name.First,db$Name.First)+
    ##    stringdist(fullname$Name.Last,db$Name.Last))]
    for (i in 1:nProfiles) {
         matchAll<-which.min((stringdist(fullname$Name.Last[i],db$Name.Last)*5
            +stringdist(fullname$Name.First[i],db$Name.First)+
            stringdist(fullname$fullname[i],db$Name)+
            stringdist(team[i],db$Team)*10))
         fullname$PlayerID[i] <- db$PlayerID[matchAll]
         fullname$matched[i] <- matchAll
         found <-db$Name[db$PlayerID==fullname$PlayerID[i]]
         fullname$found[i] <- as.character(unique(found))
    }
    ##fullname$PlayerID <- db$PlayerID[which.min(
    ##    stringdist(fullname$Name.Last,db$Name.Last))]
    fullname$PlayerID
    }
    
}



