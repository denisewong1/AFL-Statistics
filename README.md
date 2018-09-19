# AFL-Statistics

### Resources
https://fantasy.afl.com.au/landing/index.html#/landing   
http://www.matterofstats.com/  


Machine Learning Model - https://towardsdatascience.com/using-machine-learning-to-simulate-world-cup-matches-959e24d0731  
Reddit - https://www.reddit.com/r/AFL/comments/8x17l4/machine_learning_in_afl_part_ii_its_all_about_the/  
Free Kick Differential - https://www.reddit.com/r/AFL/comments/8eqyfq/does_the_freekick_differential_really_matter_how/  
Tips - http://www.afl.com.au/news/2014-07-03/learning-some-new-lines  
Stanford - http://cs229.stanford.edu/proj2012/Kapania-FantasyFootballAndMachineLearning.pdf  
RMIT - https://researchbank.rmit.edu.au/eserv/rmit:160744/Ryall.pdf 
RMIT - https://researchbank.rmit.edu.au/eserv/rmit:8567/n2006006216.pdf  
Swinburne - Explaining match outcome in elite Australian Rules football using team performance indicators
Swinburne - https://researchbank.swinburne.edu.au/file/ad793be7-8646-469b-a123-cc36fd9da459/1/Michael%20Bailey%20Thesis.pdf  - pg90 factors that may explain player performance  
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
|  | Player Prices & Positions |https://www.footywire.com/afl/footy/dream_team_round?year=2018&round=23&p=DE&s=S |  

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

## Output Variables
1. Game - Win Margin; Win %  
2. Player - FantasyPt, FantasyPx, FantasyPxChg, FantasyPtChg     

## To Do List  
1. Document architecture and names here 
2. scrape player positions and start and end of season fantasy value from dlive website  
3. Build mapping tables to be uploaded at each run  
4. Calculate team ratings for each round; compare to AFL ladder - https://mafl-online.squarespace.com/mafl-stats-journal/2013/10/13/building-your-own-team-rating-system.html  
5. Calculate home game advantage, interstate advantage    
6. What game statistics matter?  http://www.matterofstats.com/mafl-stats-journal/2013/6/29/game-statistics-and-game-outcomes.html - look at relationship between game stats and game outcomes (final score); remove colinearity, high correlation stats  
7. What stats matter for dream team?  https://mafl-online.squarespace.com/mafl-stats-journal/2013/6/16/game-statistics-and-the-dream-team.html  
8. Build a rating system for each player.  How does this compare to the team rating?  
9. Read statistical models - http://www.matterofstats.com/where-can-i-find-a-mafl-statistical-model-of-x  
10. Algorithms - http://www.matterofstats.com/where-can-i-find-an-example-of-the-use-of-x  
11. Think about a dashboard - http://www.matterofstats.com/mafl-team-dashboards/matterofstats-2018-team-dashboard-for-round-23  
12. Investigate ELO and other rating systems - https://en.wikipedia.org/wiki/Elo_rating_system  
13. Each stat can be grouped into action/reaction functions and hence may be interdependent (correlated).  Each stat can also correspond to particular skills (accuracy, hand-eye, foot-eye, agility, speed) and may be grouped in this manner. 
14. Each player position will value particular skills more than others - https://thearcfooty.com/2016/10/15/classifying-players-positions-using-public-data/  
15. Player Skills - https://fenixbazaar.com/2017/05/05/afl-evolution-career-mode-tips-guide-to-become-a-pro/  
16. weekly team lineup - http://www.afl.com.au/news/teams?round=1  
17. from Justin - The team stats by round are under the same website but under the team tab.  There are extra stats under the the advanced options but you cant view them all at once. They are not needed for AFL fantasy but I like to run some stats on them.


### Boundary Constraints for Fantasy vs Game
1.  Per game, 22 players with only 18 allowed on the field at any one time - hence sum of %P should be at least 18 for weekly team  

2.  Each Round you must select a starting line-up of 22 Players (6 Defenders, 8 Midfielders, 2 Rucks, 6 Forwards). Each team historically comprises three backs (2 × Back Pocket, 1 × Full Back), three half-backs (2 × Half-Back Flank, 1 × Centre-Half Back), three midfielders (2 × Wing. 1 × Centre), three followers/rovers (2 × followers, 1 × rover), three half-forwards (2 × Half-Forward Flank, 1 × Centre-Half Forward), three forwards (2 × Forward Flank, 1 × Full Forward) and four players on the bench.  
 
3.  Starting $wallet is $12m.  So sum fantasy price <= $12m

4.  

Game Notes -
1.  Darren O'Shaughnessy, an analyst/consultant,for the AFL Hawks, was big on removing the,component of luck/chance from game statistics to get the contribution of skill in "expected goals", which you can do something about. So, the elite athlete or coach should not make adjustments following a bad move, shot or unforced error that is a result purely of natural variation.  
2.  The ball can be moved in several ways namely via a kick, handball or run and bounce, failure to dispose of the football correctly results in a free kick to the opposition.  
If a tackle is performed correctly, and the player being tackled had a reasonable amount of time to dispose of the ball, a free kick is
awarded to the player who performed the tackle.  
Dangerous physical contact (such as a tackle above the shoulders) are discouraged with a free kick, 50 metre penalty or suspension depending upon the severity of the incident. Infringements are also awarded (free kick and 50 metre penalty) for interference
when marking, deliberate slowing of play, pushing an opponent in the back and many others.  
A shepherd on the other hand, is a push, bump or block on an opposition player who is within a five metre radius of the football.  The idea behind this manoeuvre is it allows players from the attacking team space to run into and prevents players from the defending team an opportunity to tackle or at the very least apply pressure.  
A unique feature of AFL is the mark, whereby a player catches the kicked ball which was deemed to have travelled at least 15 metres by a field umpire. The player who marked the ball is then entitled to an unimpeded free kick.  
From a defensive point of view, players are also permitted to spoil and smother the football. These are typically referred to as one percenter’s, primarily due to their infrequency and defensive nature. A team which continually measures high on one percenter’s, essentially means they are applying defensive pressure on opponents by doing the little extra efforts which make turnovers more likely. 
The objective of a spoil is to stop an opposition player from taking possession (usually via a mark) by punching the incoming football with a clenched fist. 
A smother is performed by blocking the football with outstretched hands immediately after it has been kicked by an opposition player and prevents the ball from traveling to its initial destination.  
Each quarter commences with a centre bounce where a field umpire restarts play by bouncing the ball into the centre of the ground or propelling the ball into the air. Once the ball is in the air the two opposing ruckmen from both teams compete in a ruck dual. The primary objective of each ruckman in the ruck contest is to tap the ball to the advantage of a team mate, or gain a significant amount of ground by knocking the ball into the general direction of their respective goals. (Hitout)  
3.  The Fixture - A unique feature of AFL is the unbalanced nature of the competition in respect to team quality and home advantage. From 1996 to 2010 the fixture has been unbalanced, with 22 rounds and 16 teams, which results in any given team playing eight opponents once and seven opponents twice.  
4.  The Ladder - Teams are awarded four premiership points for a win, two premiership points for a draw and zero premiership points for a loss during the Home and Away Season. At the conclusion of each round, teams are ranked based on their cumulative premiership points and in the case of two or more teams having an equal number of premiership points, their ladder position is further determined by their percentage.  
5. Odds ratios come from transforming the logistic regression coefficients such that the independent variables affect the odds instead of the logged odds of the dependent variable.  This is calculated by simply taking the exponent of the logistic regression coefficients. For the exponentiated coefficients, a coefficient of 1 leaves the odds unchanged, a coefficient greater than 1 increases the odds and a coefficient which is less than 1 reduces the odds.  
6. Home Game Advantage - three explanations as to why home advantage may exist: learning/familiarity (tactical) factors, travel (physiological) factors and crowd (psychological) factors. Courneya and Carron (1992) build on this suggesting referee bias as another factor to consider. Although these factors are usually cited as the cause of home advantage in team sports, the precise contribution of each factor still remains relatively unknown.  Performance of the nominated home team increased as the difference in all matches ever played at the home venue increased (ground familiarity). Furthermore, when the nominal away team traveled interstate the authors found the further they traveled the greater the disadvantage.  . These factors include psychological (crowd support and stadium density), physiological (distance travelled and origin of away team) and tactical (ground familiarity). Then the contribution of each factor towards home advantage is deduced by utilising a multiple linear regression model on margin of victory which is adjusted for any difference in team quality.  Can calculate ground familiarity factor.  It is widely assumed that West Coast and Fremantle have the greatest home advantage in AFL, since any visiting team has to travel at least 2160 kilometres.  The initial home advantage model accounts for ground familiarity (GF), travel fatigue [TRAVEL, VIC and ln(DIST)], crowd intimidation (CROWD and DENS).  The results suggest there are only two statistically significant predictors of home advantage in AFL, ground familiarity and distance travelled by the visiting team.  Calculate HGA by year and see how much it changes from year to year.   
7. Salary Cap -  in AFL there is a salary cap for total player payments for each club, and the drafting system helps reward poorly performing teams by awarding them early draft choices.  These equalization policies assist in making a more even competition. Therefore, on average, we expect the stronger teams to get weaker and the weaker teams to get stronger. Authors such as James and Stein (1961) suggest using team ratings from the end of the previous year but shrinking them towards the mean. For example, suppose Essendon had a rating of 1900 at the end of season 2000 where 1500 is the league average. Essendon’s initial rating at the beginning of season 2001 using a factor of 1/2 would be (1900 − 1500)/2 + 1500 = 1700.  The Elo rating system is designed to be self correcting, which means its easier for a higher rated team to lose points than gain points and vice versa for low rated teams. Therefore, if the initial ratings are not an accurate measure of a teams ability, as the season progresses the Elo ratings system will self correct towards a teams true ability. 
8. Elo ratings were originally developed by Arpad Elo to calculate the relative skill of chess players. It is a numerical system in which differences in ratings can be converted into scoring or winning probabilities.  In simple terms, the Elo ratings system calculates the expected number of games a player is expected to win in a given tournament. If a player exceeds these expectations they receive a ratings increase, while a player that falls short of these expectation receive a rating decrease. A powerful attribute of the Elo ratings system is that a player can win a tournament and receive a rating decrease if that player loses more games than expected. However, in AFL, the performance of each team cannot only be measured by win/loss, but also by the magnitude of that win (or loss). Akin to the world Football Elo rating system, a goal difference index is introduced here and adapted for AFL to magnify rating increases (and decreases) for strong wins (or losses).  
9.  A unique feature of the Betfair exchange is the Application Programming Interface (API). The sports API enables users to develop programs which seamlessly integrate with the Betfair sports exchange.  AUS Exchange: http://apiau.betfair.com/gexchange/v3/BFExchangeService  Full descriptions of the parameters available for return by each service defined in BetfairAPI6Examples can be found in the Betfair Sports Exchange API 6 Reference Guide.  
10. In-Play Betting Data as a Measure of Expectation - Traditionally, implied probabilities of betting odds are calculated by taking the inverse of the betting odds (1/price) and normalizing the probabilities such that they sum to one. For example, in round 22 season 2009 Hawthorn hosted Essendon at the MCG. Hawthorn went into the game slight favourites paying $1.87 for a win, while Essendon were paying $2.05. Therefore, the implied probabilities of Hawthorn and Essendon are 53.48% (1/1.87) and 48.78% (1/2.05) respectively. Normalizing these probabilities gives Hawthorn and Essendon a 52.30% [53.48/(53.48+48.78)] and 47.70% [48.78/(53.48+48.78)] chance of winning respectively.  To measure the accuracy of the implied probability forecasts over time, comparisons are made between the percentage of games correctly classified by the probability forecasts and score difference at each of the quarter time breaks. The additional information the probability forecasts incorporated should be of greater importance at the earlier stages of the match since the outcome is largely unknown. However, as the game progresses the score difference should have greater influence as teams have less opportunity to make up a deficit.  It is important to note that the normalized implied probabilities deduced from the in-play betting odds does not represent the true probability of either team winning, since the true probability will always be unknown. However, over time the in-play betting markets will always correct towards the true probability.  This self correction will occur due to the “wisdom of crowds”, that is, the collective ideas (i.e. probability of winning) of a large crowd (i.e. betting exchange).  
11. Home Advantage - In a balanced schedule, where each team plays each other team as many times with one team at home as the other, home advantage is typically expressed as the average difference between the home and away team score (Stefani and Clarke, 1992). This balance allows home advantage to be obtained which is not confounded with team quality.  























