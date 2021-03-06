### Notebook Principles  
Notebooks are self contained.  Each notebook should contain an rmd file and test code for models and articles written within it.  


### 00* Data Gathering & Cleaning   
Data gathering will ideally be done here.  If any errors are spotted in the future we need to come back to this set of notebooks to fix it before progressing.  
001_compile_data_ftsy : scrape weekly data from footywire  
002_collate_footywire_multiseason : collate and clean all fantasy data across seasons - to be used for all future research  
003_collate_fitzroy_multiseason : scrape weekly data from afltables - to be used for all future research   
004_collate_postgres : replaces 001 & 002 above by putting data into a postgres database
  
  
### 01* Feature Creation from Models   
Any final feature creation for the data should be done in this series.  


### 02* EDA    
The EDA series is intended to ensure that understanding the data and what needs to be done to it only occurs once.  The relevant notebook-dataset should be reviewed prior to starting work on the actual models.  This series includes analysis of correlated, non zero variance and linear sums of various columns.  
020_EDA_footywire_FW_playerall_rds


### 03* Models  
Models are conceived here in an RMD file.  If they are good they will be replicated in the model directory.  
Naming convention for the player models : playerXXX where XXX relates to lstStat$xxx which defines the group for all the stats produced by the model.  
All model results should have ONLY the following information : NameRef, Season, RoundID, MatchID, followed by the list of stats.
031_model_ftsybreakeven : calculate fantasy round values and predict breakevens - makes copy in app directory   
032_model_player_position : estimate player positions  
033_model_linprog_ftsyteam : estimate best ftsy team  
034_model_player_ppm : estimate average player points per minute for season/match

All models will be saved into an .R file with the same name as the project (excluding project number).  
All models have the following functions which uses the naming conventions  
* model_name_data : gathers data from postgres database - source useful_postgresql.R file  
* model_name_chart : gets predictions/results for the primary id key and puts it in a chart format, this may contain more than one chart per player  
* model_name_train : trains individual models eg rf, gbm, etc
* model_name_results : prediction results
* model_name_prediction : runs only forecast model and saves results  
* model_name_production : runs the full model and saves results  
* model_name_accuracy : how the model is performing in production  

The first part of the model_name will contain the primary id key : 031 player_ftsyBE, 032 player_position, 033 round_ftsyteamLP, 034 player_ppm  


### 04* Charts  
Any charts from the data directories for the app are created here?  
041_chart_footywire_FW_playerall_rds  


  
