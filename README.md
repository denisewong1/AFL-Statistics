# AFL-Statistics
AFL Statistics
www.afltables.com

### Resources
https://afltables.com/afl/stats/2018.html  
https://afltables.com/afl/stats/biglists/bg.html  
https://fantasy.afl.com.au/landing/index.html#/landing   
http://www.matterofstats.com/  
https://www.championdata.com/index.php/media-services/fantasy-and-tipping.html  

Machine Learning Model - https://towardsdatascience.com/using-machine-learning-to-simulate-world-cup-matches-959e24d0731  
Reddit - https://www.reddit.com/r/AFL/comments/8x17l4/machine_learning_in_afl_part_ii_its_all_about_the/  
Tips - http://www.afl.com.au/news/2014-07-03/learning-some-new-lines  
Stanford - http://cs229.stanford.edu/proj2012/Kapania-FantasyFootballAndMachineLearning.pdf  
Github - https://github.com/TMBish/Draftking  
Fantasy Sports - https://ieeexplore.ieee.org/document/8367900/  
More Fantasy Research - https://peterellisjones.com/posts/fantasy-machine-learning/  
Australian Sports Conference - https://www.sportsci.org/2017/sac.pdf  
Model - https://stats.stackexchange.com/questions/238143/using-afl-australian-rules-football-data-to-predict-brownlow-votes  
RMIT - https://researchbank.rmit.edu.au/eserv/rmit:160744/Ryall.pdf  
More Tips - http://www.afl.com.au/news/2018-02-13/how-to-dominate-fantasy-2017s-winner-reveals-all  
Article 1 - https://www.matterofstats.com/mafl-stats-journal/2014/11/2/the-2015-afl-draw-schedule-strength-and-imbalance  
Article 2 - http://www.matterofstats.com/mafl-stats-journal/2014/1/7/introducing-chips?rq=chips  
Article 3 - http://www.matterofstats.com/mafl-wagers-and-tips/  
Article 4 - https://intoli.com/blog/fantasy-football-for-hackers/  
Article 5 - https://dspace.mit.edu/handle/1721.1/100687  
Article 6 - https://developer.ibm.com/dwblog/2017/espn-fantasy-football-watson-ai-playoffs/
Article 7 - https://pdfs.semanticscholar.org/8e84/933903df9c5d2f73770ba6c9be8da31a751b.pdf  
Dream Stats - http://dream-stats.com/  
AFL Stats - http://blog.revolutionanalytics.com/2013/08/the-stats-of-australian-rules-football.html  

## Stats for each Game
Master List of All Games in Chronological Order - https://afltables.com/afl/stats/biglists/bg3.txt  
Game Scores and Results by Season - https://afltables.com/afl/seas/2018.html  

## Stats for each Player 
|Status | Desc | Link |  
|--- |--- |--- |  
|done | Game by Game Player Stats | https://afltables.com/afl/stats/teams/adelaide/2018_gbg.html |  
|XXXX | Game by Game Player Stats | https://afltables.com/afl/stats/2018a.html |  
|  | Player Profiles | https://afltables.com/afl/stats/alltime/adelaide.html |  
|  | Player Positions | http://dtlive.com.au/afl/dataview.php  |  

## Stats for each Team
List of Teams - https://afltables.com/afl/afl_index.html  
Player List by Team - https://afltables.com/afl/stats/teams/adelaide.html  

## Venues
https://afltables.com/afl/venues/overall.html  

## Mapping Table  
id as prefix below indicates that this is a unique identifier.  
|idSeason | idTeam | idName | idRound | idStat | Value | File | DataFrame | Description |   
|--- |--- |--- |--- |--- |--- |--- |--- |--- |      
| XXX | XXX | XXX | XXX | XXX | XXX | StatCount | 2018_player_gbg.csv | TBA | Game by Game Player Stats |   

Logistic Regression model - use glm family = binomial, coursera course 7 week 4 - http://data.princeton.edu/R/glms.html

To Do List  
1. create list of unique player names; fix josh kennedy? from https://afltables.com/afl/stats/alltime/adelaide.html create unique list of players by name and birthdate and then assign an id to them for the master list of names; then go through each data frame and map id back to the unique list of players.
2. download remaining years of data to 1991  
3. Document architecture and names here
4. create master tables of team names, stats, fantasy points etc as a csv file
5. Download fixture for each season to map player/team performance over time. https://afltables.com/afl/stats/biglists/bg3.txt  - can the scores be reconciled to game by game totals?  
6. scrape player positions and start and end of season fantasy value from dlive website  
7. Build mapping tables to be uploaded at each run  
8. Calculate team ratings for each round; compare to AFL ladder - https://mafl-online.squarespace.com/mafl-stats-journal/2013/10/13/building-your-own-team-rating-system.html  
9. Calculate home game advantage, interstate advantage    
10. What game statistics matter?  http://www.matterofstats.com/mafl-stats-journal/2013/6/29/game-statistics-and-game-outcomes.html - look at relationship between game stats and game outcomes (final score); remove colinearity, high correlation stats  
11. What stats matter for dream team?  https://mafl-online.squarespace.com/mafl-stats-journal/2013/6/16/game-statistics-and-the-dream-team.html  
12. Build a rating system for each player.  How does this compare to the team rating?  
13. Read statistical models - http://www.matterofstats.com/where-can-i-find-a-mafl-statistical-model-of-x  
14. Algorithms - http://www.matterofstats.com/where-can-i-find-an-example-of-the-use-of-x  
15. Think about a dashboard - http://www.matterofstats.com/mafl-team-dashboards/matterofstats-2018-team-dashboard-for-round-23  
16. Investigate ELO and other rating systems - https://en.wikipedia.org/wiki/Elo_rating_system  
17. Each stat can be grouped into action/reaction functions and hence may be interdependent (correlated).  Each stat can also correspond to particular skills (accuracy, hand-eye, foot-eye, agility, speed) and may be grouped in this manner. 
18. Each player position will value particular skills more than others - https://thearcfooty.com/2016/10/15/classifying-players-positions-using-public-data/  
19. Player Skills - https://fenixbazaar.com/2017/05/05/afl-evolution-career-mode-tips-guide-to-become-a-pro/  
20. weekly team lineup - http://www.afl.com.au/news/teams?round=1  










