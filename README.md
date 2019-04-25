# AFL-Statistics

### Resources
http://www.matterofstats.com/  
https://github.com/jimmyday12/fitzRoy  
https://dreamteamtalk.com/2018/11/01/2019-afl-fixture-and-fantasy/  
https://squiggle.com.au/the-squiggle-api/  


Machine Learning Model - https://towardsdatascience.com/using-machine-learning-to-simulate-world-cup-matches-959e24d0731  
Reddit - https://www.reddit.com/r/AFL/comments/8x17l4/machine_learning_in_afl_part_ii_its_all_about_the/  
Free Kick Differential - https://www.reddit.com/r/AFL/comments/8eqyfq/does_the_freekick_differential_really_matter_how/   
Stanford - http://cs229.stanford.edu/proj2012/Kapania-FantasyFootballAndMachineLearning.pdf  
RMIT - https://researchbank.rmit.edu.au/eserv/rmit:160744/Ryall.pdf   
RMIT - https://researchbank.rmit.edu.au/eserv/rmit:8567/n2006006216.pdf   
Swinburne - Explaining match outcome in elite Australian Rules football using team performance indicators  
Swinburne - https://researchbank.swinburne.edu.au/file/ad793be7-8646-469b-a123-cc36fd9da459/1/Michael%20Bailey%20Thesis.pdf  - pg90 factors that may explain player performance  
Github - https://github.com/TMBish/Draftking  
Model - https://stats.stackexchange.com/questions/238143/using-afl-australian-rules-football-data-to-predict-brownlow-votes  
More Tips - http://www.afl.com.au/news/2018-02-13/how-to-dominate-fantasy-2017s-winner-reveals-all  
Article 1 - https://www.matterofstats.com/mafl-stats-journal/2014/11/2/the-2015-afl-draw-schedule-strength-and-imbalance  
Article 2 - http://www.matterofstats.com/mafl-stats-journal/2014/1/7/introducing-chips?rq=chips  
Article 3 - http://www.matterofstats.com/mafl-wagers-and-tips/  
Article 4 - https://intoli.com/blog/fantasy-football-for-hackers/  
Article 5 - https://dspace.mit.edu/handle/1721.1/100687  
Article 7 - https://pdfs.semanticscholar.org/8e84/933903df9c5d2f73770ba6c9be8da31a751b.pdf  
AFL Stats - http://blog.revolutionanalytics.com/2013/08/the-stats-of-australian-rules-football.html  
http://www.aussportstipping.com/sports/afl/elo_ratings/
http://www.aussportsbetting.com/category/afl/
https://www.reddit.com/r/AFL/comments/96eq2d/data_mining_identifies_5_types_of_football_play/  
http://dailyfantasysportsaustralia.com/category/tools-explained/   

More machine learning models  
http://mafl-stats.blogspot.com/2009/01/  
http://www.matterofstats.com/mafl-stats-journal/2011/10/2/cursory-mention-of-mafl-in-new-scientist-probably.html  
http://www.matterofstats.com/mafl-stats-journal/2012/11/17/another-look-at-forecasting-game-outcomes-in-running.html  
http://www.matterofstats.com/mafl-stats-journal/2012/11/28/using-the-in-running-models.html  
http://www.matterofstats.com/mafl-stats-journal/2012/12/9/the-changing-nature-of-home-team-probability.html  
http://www.matterofstats.com/mafl-stats-journal/2012/12/21/what-do-seasons-past-tell-us-about-seasons-present.html  
http://www.matterofstats.com/mafl-stats-journal/2012/12/25/persistence-in-team-mars-ratings.html  
http://www.matterofstats.com/mafl-stats-journal/2011/8/18/the-2011-performance-of-the-mars-colley-and-massey-ratings-s.html  
http://www.matterofstats.com/mafl-stats-journal/2011/8/3/predicting-the-home-teams-final-margin-a-competition-amongst.html  
https://github.com/zzhangusf/Predicting-Fantasy-Football-Points-Using-Machine-Learning/blob/master/README.md  
https://www.reddit.com/r/AFL/comments/8x17l4/machine_learning_in_afl_part_ii_its_all_about_the/  
https://aflfantasies.com/2018/the-basic-strategy/  
https://www.fantasyinsider.com.au/blog/Advanced%20Strategy/afl-analysis-should-favourite-stacks-include-the-defenders  
https://www.fantasyinsider.com.au/blog/AFL/your-top-player-projections-for-2017-fwds  
https://www.fantasyinsider.com.au/blog/AFL/a-beginners-guide-to-afl-dfs-game-day-strategies  
http://forum.fantasyinsider.com.au/d/18-afl-round-8-points-tables-discussion  
https://www.fantasyinsider.com.au/blog/Site%20News/now-available-nrl-afl-draft-guides  
https://fantasyfootballanalytics.net/2013/06/win-your-fantasy-football-auction-draft.html  
http://forum.fanfooty.com.au/index.php/board,1.0.html
https://www.theguardian.com/news/datablog/2014/sep/26/afl-grand-final-hawthorn-sydney-swans-prediction  
http://footymaths.blogspot.com/p/we-have-posted-before-on-this-blog.html  


## Questions & Order of Analysis    
1.  Given all the information above and perfect hindsight, can we pick the "ideal" team at any point in time?  Answer : we can build it using linear programming.  The problem we run into is that the players have played in multiple positions during the season.  So we need to go back and figure out the best way to classify players position given their skills performance and attributes (eg height) => question 2.  
2. Build a multi-class classification model to determine players attributes and which position best suits them. In this exercise I learn all about configuring models for multi-class classification. The problem is that the data set doesn't tell us the position that they had for each game, just what they've played for the current season and/or through the season.  This means also that for multi-position players, calculating the accuracy of prediction becomes more tricky as it needs to be halved.  One of the ways to solve this problem is to use single position players to figure out position attributes, and then test the model on multi-position players, to see if it can "pick" at least one of the multiple positions played.  As I built the models, I tried to structure a reusable framework for this type of problem with and without caret => question 3.
3. Build a reusable framework for multi-class classification problems to compare the additional features of caret vs other base/raw packages.  We will also investigate whether basic models perform better if we return probability vs raw class predictions.  




### Boundary Constraints for Fantasy vs Game
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























