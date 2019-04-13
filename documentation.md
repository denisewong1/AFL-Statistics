
Documentation Structure
https://drivendata.github.io/cookiecutter-data-science/#directory-structure  
https://github.com/mkrapp/cookiecutter-reproducible-science/tree/master/%7B%7Bcookiecutter.project_slug%7D%7D  
https://nicercode.github.io/blog/2013-04-05-projects/  
https://nicercode.github.io/blog/2013-05-17-organising-my-project/  

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
    │   ├── interim  
    │      └── weekly  
    |         ├── YYYYRxx_ftsyPt.csv  
    |         └── YYYYRxx_ftsyPx.csv         
    │   ├── processed
    |         ├── YYYY_ftsyPt.csv  
    |         ├── YYYY_ftsyPx.csv  
    |         ├── YYYY_idPlayer.csv  
    |         └── YYYY_nameMap.csv      
    │   └── raw  
    │      ├── season
    |         ├── YYYY_FTWfixture.csv  
    |         └── curr_FTWbreakevens.csv    
    │      └── weekly  
    |         ├── YYYYRxx_AFLadvancedstats.csv  
    |         ├── YYYYRxx_AFLteamlineup.csv  
    |         └── YYYYRxx_FTWstats.csv        
    ├── docs
    ├── notebooks
    ├── reports
    │   └── figures
    └── src
        ├── data
           ├── features.R  
           ├── preprocess_make.R  
           ├── preprocess_read.R  
           ├── scrapeAFL.R            
           └── scrapeFTW.R          
        ├── external
        ├── models
           └── model_LP00x.R          
        ├── tools
        └── visualization
