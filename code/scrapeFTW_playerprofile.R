## function to scrape master list of players from
## https://www.footywire.com/afl/footy/dream_team_breakevens
## because the other page only has players who played for the week
## do this at start of season to get pre-season prices
## this page refreshes during the season
## https://analysisofafl.netlify.com/data/2017-06-28-getting-afl-player-data/
## https://analysisofafl.netlify.com/data/getting-old-player-data/



scrapeFTW_playerprofile <- function(playerURL) {
     
    doc.page <- read_html(playerURL)
    
    
    player.name <- doc.page %>%
        html_nodes("#playerProfileName") %>%
        html_text()
    
    player.team <- doc.page %>%
        html_nodes("#playerProfileTeamDiv a b") %>%
        html_text()
    
    player <- as.data.frame(cbind(FTWName = player.name,
                Team = player.team), stringsAsFactors=FALSE)
    
    return(player)
    
}    

