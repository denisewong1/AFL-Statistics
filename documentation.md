
Documentation Structure  
Note : 
1. for FW files PlayerID is the source of all truth within a seasons  
2. for FW files NameRef & DOB is the source of all truth across seasons    

Project Organization
--------------------

    
    ├── AUTHORS.md  
    ├── LICENSE  
    ├── README.md  
    ├── bin  
    ├── config  
    ├── data  
    │   ├── external  
    |       ├── YYYY_BE.csv 
    |       ├── dfSalaryCap.csv  
    |       └── mapFTWotAFLNameFirst.csv   
    │   ├── results  
    |       └── ftsy  
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
    ├── notebooks  
    |   ├── 001_compile_data  
    |   └── 002_ftsy_breakeven  
    ├── reports  
    │   └── figures  
    └── src  
        ├── apps  
            ├── AFLFantasyApp          
        ├── data  
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
        ├── models  
            ├── params_ftsy.R  
            └── model_ftsy.R          
        ├── tools  
        └── visualization  
