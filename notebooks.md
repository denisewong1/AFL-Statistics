### Notebook Principles  
Notebooks are self contained.  Each notebook should contain an rmd file and test code for models and articles written within it.  


### Data Gathering & Cleaning   
Data gathering will ideally be done here.  If any errors are spotted in the future we need to come back to this set of notebooks to fix it before progressing.  
001_compile_data_ftsy : scrape weekly data from footywire  
002_compile_data_fitzroy : scrape weekly data from afltables - to be used for all future research   
003_compile_data_ftsy_breakeven : calculate fantasy round values and predict breakevens - makes copy in app directory   
004_collate_footywire_multiseason : collate and clean all fantasy data across seasons - to be used for all future research  
  
  
### Feature Creation  
Any final feature creation for the data should be done in this series.  


### EDA    
The EDA series is intended to ensure that understanding the data and what needs to be done to it only occurs once.  The relevant notebook-dataset should be reviewed prior to starting work on the actual models.  This series includes analysis of correlated, non zero variance and linear sums of various columns.  



### Models  
Models are tested here.  If they are good they will be replicated in the model directory.  


  
