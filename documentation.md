
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
           ├── preprocess_make.R  
           ├── preprocess_read.R  
           ├── scrapeAFL.R            
           └── scrapeFTW.R          
        ├── external
        ├── models
           └── model_LP00x.R          
        ├── tools
        └── visualization
