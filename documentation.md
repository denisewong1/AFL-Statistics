
Documentation Structure
https://drivendata.github.io/cookiecutter-data-science/#directory-structure  
https://github.com/mkrapp/cookiecutter-reproducible-science/tree/master/%7B%7Bcookiecutter.project_slug%7D%7D  
https://nicercode.github.io/blog/2013-04-05-projects/  
https://nicercode.github.io/blog/2013-05-17-organising-my-project/  


Note : FTWName & TeamID is the source of all truth  

Project Organization
--------------------

    .
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
    |           └── YYYY_magicnumber.csv           
    │   ├── round
    |       ├── YYYYRRR_FWplayerpos.csv  
    |       └── YYYYRRR_FWplayerstats.csv        
    |   └── season
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
            ├── compileFW.R  
            ├── scrape_helper.R  
            ├── scrapeAT.R 
            ├── scrapeDT.R 
            └── scrapeFW.R          
        ├── eda
            └── EDA001_draft.Rmd          
        ├── models
            ├── params_ftsy.R
            └── model_ftsy.R          
        ├── tools
        └── visualization
