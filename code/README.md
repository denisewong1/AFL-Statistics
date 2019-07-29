## preprocess_read.R
Functions for reading scraped files in \raw directory  

|Source | Season | Weekly |  
|--- |--- |--- |  
|FFF |readS_FFFfixture |  |  
|FTW |readS_FTWfixture | readW_FTWstats |  
|  |  |readW_FTWteamlineup |    
|AFL |  |readW_AFLteamlineup |    
|  |  |readW_AFLteamchange |     
|  |  |readW_AFLadvancedstats |  


## scrapers
Functions for scraping files 

|Source | Season | Weekly | Player |  
|--- |--- |--- |--- |    
|FFF |readS_FFFfixture |  |  |  
|FTW |scrape_FTWfixture | readW_FTWstats | scrape_FTWplayerprofile |  
|  |  |scrape_FTWteamlineup | scrape_FTWplayerhistory  |    
|AFL |  |readW_AFLteamlineup |  |    
|  |  |readW_AFLteamchange |  |     
|  |  |readW_AFLadvancedstats |  |  




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

