# AFL-Statistics

### Resources
https://fantasy.afl.com.au/landing/index.html#/landing   
http://www.matterofstats.com/  


Machine Learning Model - https://towardsdatascience.com/using-machine-learning-to-simulate-world-cup-matches-959e24d0731  
Reddit - https://www.reddit.com/r/AFL/comments/8x17l4/machine_learning_in_afl_part_ii_its_all_about_the/  
Free Kick Differential - https://www.reddit.com/r/AFL/comments/8eqyfq/does_the_freekick_differential_really_matter_how/  
Tips - http://www.afl.com.au/news/2014-07-03/learning-some-new-lines  
Stanford - http://cs229.stanford.edu/proj2012/Kapania-FantasyFootballAndMachineLearning.pdf  
Github - https://github.com/TMBish/Draftking  
Fantasy Sports - https://ieeexplore.ieee.org/document/8367900/  
More Fantasy Research - https://peterellisjones.com/posts/fantasy-machine-learning/  
Model - https://stats.stackexchange.com/questions/238143/using-afl-australian-rules-football-data-to-predict-brownlow-votes  
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
http://www.aussportstipping.com/sports/afl/elo_ratings/
http://www.aussportsbetting.com/category/afl/
https://www.reddit.com/user/AFL_gains  
https://www.reddit.com/r/AFL/comments/96eq2d/data_mining_identifies_5_types_of_football_play/  

## Stats for each Game
|Status | Desc | Link |  
|--- |--- |--- |  
|done | Games Chronological | https://afltables.com/afl/stats/biglists/bg3.txt  |  
|    | Scores and Results by season | https://afltables.com/afl/seas/2018.html |   
|    | Betting Odds for Game | http://www.aussportsbetting.com/data/historical-afl-results-and-odds-data/ | 

## Stats for each Player 
|Status | Desc | Link |  
|--- |--- |--- |  
|done | Game by Game Player Stats | https://afltables.com/afl/stats/teams/adelaide/2018_gbg.html |  
|XXXX | Game by Game Player Stats | https://afltables.com/afl/stats/2018a.html |  
|done | Player Profiles | https://afltables.com/afl/stats/alltime/adelaide.html |  
|  | Player Positions | http://dtlive.com.au/afl/dataview.php  |  

## Stats for each Team
List of Teams - https://afltables.com/afl/afl_index.html  
Player List by Team - https://afltables.com/afl/stats/teams/adelaide.html  

## Venues
https://afltables.com/afl/venues/overall.html  

## Map of Data   
id as prefix below indicates that this is a unique identifier.  

|idSeason | idTeam | idName | idRound | idStat | Value | File | DataFrame | Description |   
|--------- |------ |------- |-------- |------- |------ |----- |---------- |----- |      
| XXX | XXX | XXX | XXX | XXX | XXX | StatCount | 2018_player_gbg.csv | TBA | Game by Game Player Stats |   

Logistic Regression model - use glm family = binomial, coursera course 7 week 4 - http://data.princeton.edu/R/glms.html

To Do List  
1. Document architecture and names here 
2. fix scraper for game by game to map player IDs back into it, ditto game ID
3. scrape player positions and start and end of season fantasy value from dlive website  
4. Build mapping tables to be uploaded at each run  
5. Calculate team ratings for each round; compare to AFL ladder - https://mafl-online.squarespace.com/mafl-stats-journal/2013/10/13/building-your-own-team-rating-system.html  
6. Calculate home game advantage, interstate advantage    
7. What game statistics matter?  http://www.matterofstats.com/mafl-stats-journal/2013/6/29/game-statistics-and-game-outcomes.html - look at relationship between game stats and game outcomes (final score); remove colinearity, high correlation stats  
8. What stats matter for dream team?  https://mafl-online.squarespace.com/mafl-stats-journal/2013/6/16/game-statistics-and-the-dream-team.html  
9. Build a rating system for each player.  How does this compare to the team rating?  
10. Read statistical models - http://www.matterofstats.com/where-can-i-find-a-mafl-statistical-model-of-x  
11. Algorithms - http://www.matterofstats.com/where-can-i-find-an-example-of-the-use-of-x  
12. Think about a dashboard - http://www.matterofstats.com/mafl-team-dashboards/matterofstats-2018-team-dashboard-for-round-23  
13. Investigate ELO and other rating systems - https://en.wikipedia.org/wiki/Elo_rating_system  
14. Each stat can be grouped into action/reaction functions and hence may be interdependent (correlated).  Each stat can also correspond to particular skills (accuracy, hand-eye, foot-eye, agility, speed) and may be grouped in this manner. 
15. Each player position will value particular skills more than others - https://thearcfooty.com/2016/10/15/classifying-players-positions-using-public-data/  
16. Player Skills - https://fenixbazaar.com/2017/05/05/afl-evolution-career-mode-tips-guide-to-become-a-pro/  
17. weekly team lineup - http://www.afl.com.au/news/teams?round=1  
18. from Justin - The team stats by round are under the same website but under the team tab.  There are extra stats under the the advanced options but you cant view them all at once. They are not needed for AFL fantasy but I like to run some stats on them.


Darren O'Shaughnessy, an analyst/consultant,for the AFL Hawks, was big on removing the,component of luck/chance from game statistics to get the contribution of skill in "expected goals", which you can do something about. So, the elite athlete or coach should not make adjustments following a bad move, shot or unforced error that is a result purely of natural variation.  In using data to support decisions, he made the following points:  
have an evidence-based culture and a framework to evaluate on-field actions;  
engage in "counterfactual analysis" ("what if…"); record and evaluate, don't just count; and  
to avoid "dichotomania", grade rather than dichotomize outcomes.  
On the topic of support for live decisions (during matches):  
don't let coaches design the interface; limit the use of color to important alerts;  
use an algorithm to prioritize the most important things;  
and be aware that reacting to short-term data is usually counter-productive.  










