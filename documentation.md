
Documentation Structure
https://drivendata.github.io/cookiecutter-data-science/#directory-structure  
https://github.com/mkrapp/cookiecutter-reproducible-science/tree/master/%7B%7Bcookiecutter.project_slug%7D%7D  

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
    │   ├── processed
    │   └── raw  
    │      ├── season
    │      └── weekly  
    ├── docs
    ├── notebooks
    ├── reports
    │   └── figures
    └── src
        ├── data
           ├── preprocess.R 
           ├── scrapeAFL.R            
           └── scrapeFTW.R          
        ├── external
        ├── models
        ├── tools
        └── visualization
