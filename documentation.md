
Documentation Structure  
Note : 
1. for FW files NameRef is the source of all truth across seasons    
2. for FW files Season & RoundID is the source of all truth across seasons - MatchID only available for games played per player

Template : https://github.com/dslp/dslp-repo-template  

Project Organization
--------------------

    
    ├── AUTHORS.md  
    ├── LICENSE  
    ├── README.md  
    ├── bin  
    ├── config  
    ├── data                          # use rds files for future models                        
    │   ├── fitzRoy  
    |       ├── Afixture.rds   
    |       ├── Astats.rds   
    |       ├── Bstats.rds  
    |       ├── ladder.rds 
    |       └── fixture.rds    
    │   ├── footywire  
    |       ├── FWbetting.rds   
    |       ├── FWbyeround.rds   
    |       ├── FWmatchid.rds  
    |       ├── FWplayerid.rds 
    |       └── FWplayerall.rds       # compiled player position price & stats file  
    │   ├── results  
    |       └── ftsy  
    |           ├── predType_ftsyseason.csv    
    |           ├── YYYY_ftsy.csv    
    |           ├── YYYY_magicnumber.csv    
    |           └── YYYY_preseasonpxest.csv           
    │   ├── round  
    |       ├── YYYYRRR_FWplayerpos.csv  
    |       └── YYYYRRR_FWplayerstats.csv           
    |   └── season  
    |       ├── YYYY_FWbetting.csv  
    |       ├── YYYY_FWfixture.csv    
    |       ├── YYYY_FWplayerftsy.csv    
    |       └── YYYY_FWplayerid.csv           
    ├── docs  
    ├── notebooks                    # see notebook.md for descriptions and principles of all notebooks  
    ├── reports  
    │   └── figures  
    └── src  
        ├── apps  
            ├── AFLAppViz          
        ├── data                     # code in relation to sourcing and compiling the data  
            ├── collate_footywire.R  
            ├── compile_helper.R  
            ├── compilefitzRoy.R              
            ├── compileFW.R  
            ├── scrape_helper.R  
            ├── scrapeAT.R  
            ├── scrapeDT.R  
            ├── scrapefitzRoy.R  
            ├── scrapeFF.R              
            └── scrapeFW.R          
        ├── eda  
            └── EDA001_draft.Rmd          
        ├── models                   # only for live models  
            ├── params_ftsy.R  
            └── model_ftsy.R          
        ├── tools  
        └── visualization    
        
        




