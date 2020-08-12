
Documentation Structure  
Note : 
1. for FW files PlayerID is the source of all truth within a seasons  
2. for FW files NameRef & DOB is the source of all truth across seasons    

Template : https://github.com/dslp/dslp-repo-template  

Project Organization
--------------------

    
    ├── AUTHORS.md  
    ├── LICENSE  
    ├── README.md  
    ├── bin  
    ├── config  
    ├── data  
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
    |       ├── FWplayerall.rds       # compiled player position price & stats file  
    |       ├── FWplayerposition.rds  # sub-calc file, to delete  
    |       ├── FWplayerprice.rds     # sub-calc file, to delete  
    |       └── FWplayerstats.rds     # sub-calc file, to delete  
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
    ├── notebooks  
    |   ├── 001_compile_data_ftsy    
    |   ├── 002_compile_data_fitzroy  
    |   ├── 003_compile_ftsy_breakeven    
    |   └── 004_collate_ftsy_multiseason    
    ├── reports  
    │   └── figures  
    └── src  
        ├── apps  
            ├── AFLAppViz          
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
            └── useful_load_multiseason.R    # contains code to load data across multi-seasons : to be used for all future research  
        └── visualization    
        
        

Notebook Descriptions  
001_compile_data_ftsy : scrape weekly data from footywire  
002_compile_data_fitzroy : scrape weekly data from afltables - to be used for all future research   
003_compile_data_ftsy_breakeven : calculate fantasy round values and predict breakevens - makes copy in app directory   
004_collate_ftsy_multiseason : collate all fantasy data across seasons - to be used for all future research  


