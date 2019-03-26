## this function scrapes the fantasy player price and positions per round
##fileURL <- paste("https://www.footywire.com/afl/footy/dream_team_round?year=",season,"&round=",round,"&p=",position,"&s=S",sep="")
##fileURL <- paste("https://www.footywire.com/afl/footy/dream_team_round?year=",season,"&round=",round,"&s=S",sep="")  


idPlayer <- read_idPlayer()
idGame <- read_idGame()   
dfTeam <- read_dfTeam()

## only players since 2010
idPlayer$Season.Last <- str_sub(idPlayer$Player.Seasons, 
    str_length(idPlayer$Player.Seasons)-3, 
    str_length(idPlayer$Player.Seasons))
idPlayer$Season.Last <- as.numeric(idPlayer$Season.Last)
idPlayer <- idPlayer %>% filter(Season.Last >= 2010)

## add back season id
dfTeam <- dfTeam %>%
    full_join(idGame[,c("GameID","Season","Round","Round.Type")],by=c("GameID")) 


seasonFTW_fantasy <- function() {

    lstPositions <- c("DE","MI","FO","RU")
    df <- NULL
    
    for (season in 2010:2018) {
        ## 23 rounds for 2012 to 2018, 22 for 2010, 24 for 2011
        ifelse(season>=2012,nRounds <- 23,
               ifelse(season==2011,nRounds<-24,nRounds<-22))
        for(round in 1:nRounds) {
            for(j in 1:4) {
                position <- lstPositions[j]
                record <- scrapeFTW_fantasy(season,round,position)   
                df <- rbind(df,record)
            }
        }
    }
    
    ## add back names
    df <- addFeature_FWName(df)
    df <- addFeature_Ftsy(df)
    
    
    ## split out tables and save
    idPlayerFW <- makeTbl_idPlayerFW(df)
    filename <- paste(dirData,"idPlayerFW.csv",sep="")
    write.csv(idPlayerFW, filename, row.names = FALSE)
    
    dfFtsy <- makeTbl_dfFtsy(df)
    filename <- paste(dirData,"dfFtsy.csv",sep="")
    write.csv(dfFtsy, filename, row.names = FALSE)
    
    dfFtsy
}
 



weeklyFTW_fantasy <- function(xseason,xround) {

    lstPositions <- c("DE","MI","FO","RU")
    df <- NULL
     
    for(j in 1:4) {
        position <- lstPositions[j]
        record <- scrapeFTW_fantasy(xseason,xround,position)   
        df <- rbind(df,record)
    }    
    
    ## write to file
    xroundname <- df$Round[1]
    filename <- paste(dirData,xseason,xroundname,"_FTW_ftsy.csv",sep="")
    write.csv(df, filename, row.names = FALSE)   
    
    return(df)
    
}


## scrape fantasy page
scrapeFTW_fantasy <- function(season,round,position) {
    
    ##season = 2010
    ##position = "DE"
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
    names(idNickname) <- c("TeamID","Nickname")
    
    
    ## read URL
    fileHeader <- "https://www.footywire.com/afl/footy/dream_team_round?"
    ifelse(position=="ALL",
        fileURL <- paste(fileHeader,"year=",season,"&round=",round,
            "&s=S",sep=""),
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
        ## df <- df[,c(1,2,3,5,6,7)]
        names(df) <- c("Status","Name","Nickname","CurrSalary",
                       "FtsyPx","FtsyPt","FtsyVal")
        df$CurrSalary <- gsub(",","",df$CurrSalary)
        df$CurrSalary <- as.numeric(df$CurrSalary)
        df$FtsyPx <- gsub(",","",df$FtsyPx)
        df$FtsyPx <- as.numeric(df$FtsyPx)
        df$FtsyPt <- as.numeric(as.character(df$FtsyPt))
        df$FtsyVal <- as.numeric(as.character(df$FtsyVal))
        df$Status <- "GOOD"
        df$Status[injury.page] <- "INJURED"
        df$Status[suspend.page] <- "SUSPENDED"        
        df<-merge(df, idNickname,by=c("Nickname"))
        df$Nickname <- NULL
        df$PositionID <- position
        df$Season <- season
        df$Round <- paste("R",formatC(round,width=2,flag="0"),sep="")
        df$Round <- factor(df$Round)
        temp <- extract(df, Name, c("FirstName", "LastName"), "([^ ]+) (.*)")
        df$Player.FirstName <-temp$FirstName
        df$Player.LastName <- temp$LastName
        df$Player.FWName <- df$Name; df$Name <- NULL

        ##df <- df[,c(8:9,1:7,10:11)]
        dfFtsy <- df
        
        ## get game number
        ##dfFtsy <- merge(dfFtsy, 
        ##    dfTeam[,c("GameID","Season","Round","TeamID")],
        ##    by=c("Season","Round","TeamID"))
        
        dfFtsy <- dfFtsy %>%
            left_join(dfTeam[,c("GameID","Season","Round","TeamID")],
                      by=c("Season","Round","TeamID"))   
        
        dfFtsy
    
}


## tidy names - basic name match on first and last name
addFeature_FWName <- function(df) {
    
    ## 1 : match on team and first and last name
    df$Player.LastName <- gsub("'", '', df$Player.LastName)
    df <- df %>%
        left_join(idPlayer[,c("PlayerID", "Player.FirstName",
                        "Player.LastName","TeamID")],
            by=c("Player.FirstName","Player.LastName","TeamID"))   
    summary(df$PlayerID)
    

    ## 2 : replace last name - most are "mc" or "mac" not capitalised
    dfNA <- df %>% filter(is.na(PlayerID)); df <- df %>% filter(!is.na(PlayerID))
    dfNA$Player.LastName <- gsub("-", " ", dfNA$Player.LastName)
    idName2 <- read_idName2() 
    dfNA <- merge(dfNA, idName2, by=c("Player.LastName"),all.x=TRUE) 
    dfNA$AFL.LastName <- as.character(dfNA$AFL.LastName)
    dfNA <- dfNA %>% 
        mutate(Player.LastName = ifelse(!is.na(AFL.LastName), AFL.LastName, 
                Player.LastName)) %>%
        select(-PlayerID, -AFL.LastName)   
    dfNA <- merge(dfNA, 
        idPlayer[,c("PlayerID","Player.FirstName","Player.LastName","TeamID")],
        by=c("Player.FirstName","Player.LastName","TeamID"),all.x=TRUE)     
    df <- rbind(df,dfNA)
    summary(df$PlayerID)
    
    
    ## 3 : replace first name with short first name
    dfNA <- df %>% filter(is.na(PlayerID)); df <- df %>% filter(!is.na(PlayerID))
    idName1 <- read_idName1() 
    dfNA <- merge(dfNA, idName1, by=c("Player.FirstName"),all.x=TRUE) 
    dfNA$AFL.FirstName <- as.character(dfNA$AFL.FirstName)
    dfNA <- dfNA %>% 
        mutate(Player.FirstName = ifelse(!is.na(AFL.FirstName), AFL.FirstName, 
            Player.FirstName)) %>%
        select(-PlayerID, -AFL.FirstName)
    dfNA <- merge(dfNA, 
        idPlayer[,c("PlayerID","Player.FirstName","Player.LastName","TeamID")],
            by=c("Player.FirstName","Player.LastName","TeamID"),all.x=TRUE) 
    df <- rbind(df,dfNA)
    summary(df$PlayerID)   
    

    ## 4 : replace first name with short first name (2nd time)
    dfNA <- df %>% filter(is.na(PlayerID)); df <- df %>% filter(!is.na(PlayerID))
    idName1 <- read_idName1() 
    dfNA <- merge(dfNA, idName1, by=c("Player.FirstName"),all.x=TRUE) 
    dfNA$AFL.FirstName <- as.character(dfNA$AFL.FirstName)
    dfNA <- dfNA %>% 
        mutate(Player.FirstName = ifelse(!is.na(AFL.FirstName), AFL.FirstName, 
            Player.FirstName)) %>%
        select(-PlayerID, -AFL.FirstName)
    dfNA <- merge(dfNA, 
        idPlayer[,c("PlayerID","Player.FirstName","Player.LastName","TeamID")],
            by=c("Player.FirstName","Player.LastName","TeamID"),all.x=TRUE) 
    df <- rbind(df,dfNA)
    summary(df$PlayerID)       
    
    df
    
}


## adding features to ftsy database - GameNo (for season), 
addFeature_Ftsy <- function(dfFtsy) {
    
    dfFtsy$PositionID <- as.factor(dfFtsy$PositionID)
    dfFtsy$Status <- as.factor(dfFtsy$Status)
    dfFtsy <- dfFtsy %>%
        group_by(Season, PlayerID, PositionID) %>%
        arrange(Season, PlayerID, PositionID, GameID) %>%
        mutate(Round.Cum = dense_rank(GameID)) %>%
        mutate(FtsyPt.Cum = cumsum(FtsyPt)) %>%
        mutate(FtsyPt.Mean = FtsyPt.Cum/Round.Cum) %>%
        mutate(FtsyVal = ifelse(FtsyPx,FtsyPt.Mean/(FtsyPx/100000),0)) %>%
        ungroup
    
    ## calculate px change
    dfFtsy <- dfFtsy %>%
        group_by(Season, PlayerID, PositionID, Status) %>%
        arrange(Round.Cum) %>%
        mutate(FtsyPx.Chg = ifelse(Round.Cum>1,FtsyPx/lag(FtsyPx)-1,0)) %>%
        ungroup
    
    ## sort and save
    dfFtsy <- dfFtsy %>% arrange(Season, PlayerID, PositionID, Round.Cum)
    dfFtsy

}


makeTbl_dfFtsy <- function(df) {
    
    dfFtsy <- df %>% 
        select(-Player.FirstName, -Player.LastName, -Player.FWName) 
    dfFtsy
    
}


makeTbl_idPlayerFW <- function(df) {
    
    idPlayerFW <- df %>%
        select(PlayerID, Player.FWName) %>%
        distinct(PlayerID, Player.FWName)
    idPlayerFW
}










