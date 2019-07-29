
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
    |         ├── YYYY_BE.csv  
    |         └── FTWotAFLFirstName.csv             
    │   ├── interim  
    │      ├── season
    |         ├── YYYY_AFLnamemap.csv  
    |         ├── YYYY_FTWnameMap.csv      
    |         └── YYYY_namemap.csv       
    │      └── weekly  
    |         ├── YYYYRxx_ftsyStat.csv  
    |         ├── YYYYRxx_PredRound.csv  
    |         └── YYYYRxx_PredSeason.csv  
    │   ├── processed
    |         ├── YYYY_features.csv  
    |         ├── YYYY_fixture.csv  
    |         ├── YYYY_ftsyAll.csv  
    |         ├── YYYY_ftsyStat.csv  
    |         ├── YYYY_idPlayer.csv  
    |         └── YYYY_magicnumber.csv      
    │   ├── raw  
    │      ├── season
    |         ├── YYYY_FTWfixture.csv  
    |         └── YYYY_FFFfixture.csv    
    │      └── weekly  
    |         ├── YYYYPxx_AFLteamlineup.csv  
    |         ├── YYYYRxx_AFLadvancedstats.csv  
    |         ├── YYYYRxx_AFLteamlineup.csv  
    |         └── YYYYRxx_FTWteamlineup.csv   
    │   └── simulations 
    |         ├── LP00x_YYYY_PL.csv
    |         ├── LP00x_YYYY_Score.csv
    |         └── LP00x_YYYY_Team.csv   
    ├── docs
    ├── notebooks
    ├── reports
    │   └── figures
    └── src
        ├── apps
           ├── AFLFantasyApp          
        ├── data
           ├── features.R  
           ├── preprocess_make.R  
           ├── preprocess_read.R  
           ├── scrapeAFL.R 
           ├── scrapeFFF.R 
           └── scrapeFTW.R          
        ├── external
        ├── models
           └── model_LP00x.R          
        ├── tools
        └── visualization
