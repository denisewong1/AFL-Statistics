## Function to scrape all match results from 1897 to current from
## https://afltables.com/afl/stats/biglists/bg3.txt 


scrapeAFLT_game <- function() {
    
    idTeam <- read_idTeam()
    idVenue <- read_idVenue()
    
    fileURL <- "https://afltables.com/afl/stats/biglists/bg3.txt"
    columnNames <- c(
        "GameID", "Date", "Round", "Home.Team", "Home.Score",
        "Away.Team", "Away.Score", "Venue")
    
    ## read data
    df <- suppressMessages(
        readr::read_table(fileURL, skip = 2, col_names = columnNames)
    )
    
    ## separate scores
    df <- df %>%
        tidyr::separate(Home.Score,
                        into = c("Home.Goal", "Home.Behind", "Home.Score"),
                        sep = "\\.", convert = TRUE
        ) %>%
        tidyr::separate(Away.Score,
                        into = c("Away.Goal", "Away.Behind", "Away.Score"),
                        sep = "\\.", convert = TRUE
        )
    
    ## tidy and add features
    df <- addFeature_Game(df)
    
    ## split tables and save
    idGame <- makeTbl_idGame(df)
    filename <- paste(dirData,"idGame.csv",sep="")
    write.csv(idGame,filename,row.names = FALSE)
    
    dfGame <- makeTbl_dfGame(df)
    filename <- paste(dirData,"dfGame.csv",sep="")
    write.csv(dfGame,filename,row.names = FALSE)    
    
    dfTeam <- makeTbl_dfTeam(df)
    filename <- paste(dirData,"dfTeam.csv",sep="")
    write.csv(dfTeam,filename,row.names = FALSE)    
    
    return(idGame)
    
}


makeTbl_dfTeam <- function(df) {
 
    dfTeam.Home <- df %>%
        select(GameID, Home.Team, Home.Goal, Home.Behind, Home.Score, Margin, 
               Home.Interstate) %>%
        rename(TeamID = Home.Team, Goal = Home.Goal, Behind = Home.Behind,
               Score = Home.Score, StatusIS = Home.Interstate) %>%
        mutate(StatusHA = "HOME")
    dfTeam.Away <- df %>%
        select(GameID, Away.Team, Away.Goal, Away.Behind, Away.Score, Margin, 
               Away.Interstate) %>%
        rename(TeamID = Away.Team, Goal = Away.Goal, Behind = Away.Behind,
               Score = Away.Score, StatusIS = Away.Interstate) %>%
        mutate(StatusHA = "AWAY") %>%
        mutate(Margin = -Margin)
    dfTeam <- rbind(dfTeam.Home, dfTeam.Away) %>%
        arrange(GameID)
    dfTeam
       
}


makeTbl_dfGame <- function(df) {
    
    dfGame <- df %>% 
        select(GameID, VenueID, Home.Team, Away.Team) %>%
        rename(TeamID.Home = Home.Team, TeamID.Away = Away.Team)
    dfGame
    
}


makeTbl_idGame <- function(df) {
    idGame <- df %>%
        select(GameID, Date, Round, Season, Round.Type, Round.Number,
               Round.Global)
    idGame
}


addFeature_Game <- function(dfGame) {
    
    ## tidy formatting
    dfGame <- dfGame %>%
        mutate(
            Margin = Home.Score - Away.Score,
            Date = lubridate::dmy(Date),
            Season = lubridate::year(Date)
        )
    
    
    ## tidy round data
    dfGame <- dfGame %>%
        group_by(GameID) %>%
        mutate_at(c("Round"), replace_rounds) %>%
        ungroup()
    
    round_levels <- c(
        "R01", "R02", "R03", "R04", "R05", "R06", "R07", "R08", "R09",
        "R10", "R11", "R12", "R13", "R14", "R15", "R16", "R17",
        "R18", "R19", "R20", "R21", "R22", "R23", "R24",
        "QF/EF", "SF", "PF", "GF"
    )
    finals <- c("QF", "EF", "SF", "PF", "GF")
    
    dfGame <- dfGame %>%
        mutate(Round.Type = ifelse(Round %in% finals, "Finals", "Regular"))
    
    dfGame <- dfGame %>%
        mutate(
            Round.New = ifelse(stringr::str_detect("QF/EF", Round), 
                               "QF/EF", Round),
            Round.New = factor(Round.New, levels = round_levels)
        )
    
    dfGame <- dfGame %>%
        group_by(Season) %>%
        mutate(Round.Number = dense_rank(Round.New)) %>%
        select(-Round.New) %>%
        ungroup()
    
    dfGame <- dfGame %>%
        mutate(Round.Global = dense_rank(Season*100+Round.Number)) 
    
    
    ## tidy team data
    dfGame <- dfGame %>%
        group_by(GameID) %>%
        mutate_at(c("Home.Team", "Away.Team"), replace_teams) %>%
        mutate_at(c("Home.Team", "Away.Team"), mapTeam_fullname) %>%
        ungroup()
    
    
    ## get venue
    dfGame <- dfGame %>%
        mutate(VenueID = idVenue$VenueID[match(Venue,idVenue$Venue.Name)])
    
    
    ## get teamref
    dfGame <- dfGame %>%
        mutate(Home.AFLRef = idTeam$Team.AFLRef[
            match(Home.Team,idTeam$Team.Code)]) %>%
        mutate(Away.AFLRef = idTeam$Team.AFLRef[
            match(Away.Team,idTeam$Team.Code)]) 
    
    
    ## interstate status
    dfGame$Home.Interstate <- mapply(function(x,y) {
        mapTeam_Interstate(x,y)},dfGame$Home.Team, dfGame$Venue)
    dfGame$Away.Interstate <- mapply(function(x,y) {
        mapTeam_Interstate(x,y)},dfGame$Away.Team, dfGame$Venue)    
    dfGame <- dfGame %>%
        mutate(Venue.State = idVenue$Venue.State[match(Venue,idVenue$VenueID)]) %>%
        mutate(Home.State=idTeam$Team.State[match(Home.Team,idTeam$Team.Code)]) %>%
        mutate(Away.State=idTeam$Team.State[match(Away.Team,idTeam$Team.Code)]) 
  
    ## game html link 
    dfGame %>%
        mutate(AFLhtml = paste("https://afltables.com/afl/stats/games/",
        Season,"/",
        formatC(pmin(Home.AFLRef,Away.AFLRef),width=2,format="d",flag="0"),
        formatC(pmax(Home.AFLRef,Away.AFLRef),width=2,format="d",flag="0"),
        format(Date,"%Y%m%d"),".html",sep=""))
    
}







