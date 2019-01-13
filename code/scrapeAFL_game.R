## Function to scrape all match results from 1897 to current from
## https://afltables.com/afl/stats/biglists/bg3.txt 



scrapeAFL_game <- function() {
    
    fileURL <- "https://afltables.com/afl/stats/biglists/bg3.txt"
    filename <- paste(dirMap,"dfGame.csv",sep="")
    columnNames <- c(
        "GameID", "Date", "Round", "Home.Team", "Home.Score",
        "Away.Team", "Away.Score", "Venue")
    
    
    ## read data
    dfGame <- suppressMessages(
        readr::read_table(fileURL, skip = 2, col_names = columnNames)
    )
    
    
    ## separate scores
    dfGame <- dfGame %>%
        tidyr::separate(Home.Score,
                        into = c("Home.Goal", "Home.Behind", "Home.Score"),
                        sep = "\\.", convert = TRUE
        ) %>%
        tidyr::separate(Away.Score,
                        into = c("Away.Goal", "Away.Behind", "Away.Score"),
                        sep = "\\.", convert = TRUE
        )
    
    
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
    
    ## interstate status
    dfGame$Home.Interstate <- mapply(function(x,y) {
        mapTeam_Interstate(x,y)},dfGame$Home.Team, dfGame$Venue)
    dfGame$Away.Interstate <- mapply(function(x,y) {
        mapTeam_Interstate(x,y)},dfGame$Away.Team, dfGame$Venue)    
    dfGame <- dfGame %>%
        mutate(Venue.State = dfVenue$State[match(Venue,dfVenue$Venue)]) %>%
        mutate(Home.State=dfTeam$State[match(Home.Team,dfTeam$TeamCode)]) %>%
        mutate(Away.State=dfTeam$State[match(Away.Team,dfTeam$TeamCode)]) 
        
    ## return match data
    write.csv(dfGame,filename,row.names = FALSE)
    return(dfGame)
}






