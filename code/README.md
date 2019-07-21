## preprocess_read.R
Functions for reading scraped files in \raw directory  

|Source | Season | Weekly |  
|--- |--- |--- |  
|FFF |readS_FFFfixture <- function(xseason) |  |  
|FTW |readS_FTWfixture <- function(xseason) |readW_FTWbreakeven <- function(xseason) |  
|FFF |  |readW_FTWstats <- function(xseason,xroundname) |  
|AFL |  |readW_AFLteamlineup <- function(xseason,xroundname) |  
|  |  |readW_AFLteamchange <- function(xseason,xroundname) |  
|  |  |readW_AFLadvancedstats <- function(xseason,xroundname) |  





## Scrapers 
Scrapers for each individual page because the websites have different formats for player names.

|Source | Frequency | Desc | Scraper | Link |   
|--- |--- |--- |--- | --- |   
|AFL | Hist | Game | scrapeAFLT_game.R | https://afltables.com/afl/stats/biglists/bg3.txt |   
|FTW | Ad-hoc | Player Profile | scrapeFTW_playerprofile.R | https://www.footywire.com/afl/footy/pr-hawthorn-hawks--tom-mitchell | 
|FTW | Preseason | Fixture | scrapeFTW_fixture.R | https://www.footywire.com/afl/footy/ft_match_list?year=2017 |   
|AFLT | Weekly | Team Lineup | scrapeAFLT_teamlineup.R | https://www.afl.com.au/match-centre/2012/1/gws-v-syd |  
|FTW | Weekly | Ftsy Breakeven | scrapeFTW_breakeven.R | https://www.footywire.com/afl/footy/dream_team_breakevens |  
|FTW | Weekly | Fantasy Price | scrapeFTW_fantasy.R | https://www.footywire.com/afl/footy/dream_team_round?year=2019&round=1&p=DE&s=T |  
  

Sources :
AFLT : www.afltables.com, AFL : www.afl.com, FTW : www.footywire.com

