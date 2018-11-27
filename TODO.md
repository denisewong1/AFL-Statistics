## To Do List  
1. Document architecture and names here.  The order should be  -  
Season -> Round -> Game -> Venue -> Team -> Position -> Player (Profile, Stats & Fantasy)   
Each of these should have their own id and mapping tables which should be uploaded at the start of each run   
2. Document Process and storage folders for each process for both code and data     
scrape -> clean and save -> EDA by each group in (1) above -> Analysis and Predictions    
Consider which table contains information for mapping and id tables  
Consider the analysis from this table before merging with another one  
Consider small and big data sets which can be built to quicken the analysis  
3. Calculate average season margin of victory; do EDA on Ladder  
http://troywheatley.blogspot.com/search/label/Australian%20Rules%20Football  
https://www.matterofstats.com/mafl-stats-journal/2015/11/22/competitiveness-in-the-vflafl-1897-2015  
https://www.matterofstats.com/mafl-stats-journal/2015/11/23/scoring-shot-conversion-history-in-the-vflafl-1897-2015  
4. Calculate home game advantage  
http://www.matterofstats.com/mafl-stats-journal/2013/11/20/revisiting-home-ground-advantage.html  
http://www.matterofstats.com/mafl-stats-journal/2013/11/23/whats-more-important-who-you-play-or-where-you-play-them.html  
5. Calculate interstate advantage  
6. Calculate home ground advantage and other venue stats  - EDA_dfHGA.r  
> 001  
> 002  
> 003  
> 004  
> 005  
> 006  
Data for home ground advantage is in dfHGA.csv - mean margin for home team at end of each game
7. Calculate ELO style team ratings for each round before adjustments for HGA venue and interstate; compare to AFL ladder    
http://footymaths.blogspot.com/p/below-are-aggregated-end-of-season.html  
http://www.matterofstats.com/mafl-stats-journal/2014/1/7/introducing-chips?rq=chips  
http://www.matterofstats.com/mafl-stats-journal/2013/9/24/the-relative-importance-of-class-and-form-in-afl.html  
http://www.matterofstats.com/what-variables-are-used-in-mafl-statistical-models  
http://www.matterofstats.com/mafl-stats-journal/2016/1/26/reoptimisation-and-the-fear-of-overfitting  
The aim is to get an average MAE of less than 30 points per game at least    
Other references and improvements to basic model  
http://www.matterofstats.com/mafl-stats-journal/2013/12/8/optimising-the-very-simple-rating-system-vsrs.html  
https://mafl-online.squarespace.com/mafl-stats-journal/2013/10/13/building-your-own-team-rating-system.html  
http://www.matterofstats.com/mafl-stats-journal/2011/8/28/mars-ratings-how-important-are-teams-initial-ratings.html   
http://www.matterofstats.com/mafl-stats-journal/2015/7/4/rating-teams-based-on-scoring-ability  
http://www.matterofstats.com/mafl-stats-journal/2015/11/1/an-improved-vflafl-team-rating-system-mossbods-20  
http://www.matterofstats.com/mafl-stats-journal/2017/1/5/team-rating-revisited-a-rival-for-mossbods  
https://www.matterofstats.com/mafl-stats-journal/2014/11/2/the-2015-afl-draw-schedule-strength-and-imbalance  
http://www.matterofstats.com/mafl-stats-journal/2013/9/12/team-ratings-bookmaker-prices-and-the-recent-predictability.html  
https://www.matterofstats.com/mafl-stats-journal/2015/7/4/rating-teams-based-on-scoring-ability  
https://www.matterofstats.com/mafl-stats-journal/2015/7/10/best-and-worst-afl-teams-2005-2015-a-mossbod-perspective  
https://www.matterofstats.com/mafl-stats-journal/2015/11/22/competitiveness-in-the-vflafl-1897-2015  
https://hurlingpeoplenow.wordpress.com/2017/07/21/the-hpn-second-trimester-ish-awards-plus-round-17-team-ratings/  
https://www.matterofstats.com/mafl-stats-journal/2015/12/7/the-2016-afl-draw-difficulty-and-distortion  
http://www.matterofstats.com/mafl-stats-journal/2017/9/12/errors-in-predicting-home-team-and-away-team-scores  
http://www.matterofstats.com/mafl-stats-journal/2017/6/17/does-offence-or-defence-win-games  
http://www.matterofstats.com/mafl-stats-journal/2017/8/10/how-close-has-the-2017-season-been  
http://www.matterofstats.com/mafl-stats-journal/2017/6/9/tipping-accuracy-vs-mae-as-a-footy-forecaster-metric  
http://troywheatley.blogspot.com/2011/02/introducing-afl-power-rankings-part.html  
http://troywheatley.blogspot.com/2018/07/afl-power-rankings-round-17-2018.html  
http://troywheatley.blogspot.com/2018/07/afl-power-rankings-round-15-2018.html  
http://troywheatley.blogspot.com/2018/06/afl-power-rankings-round-13-2018.html  
http://troywheatley.blogspot.com/2018/05/afl-power-rankings-round-7-2018.html  
http://troywheatley.blogspot.com/2017/07/afl-power-rankings-round-16-2017.html  
http://troywheatley.blogspot.com/2016/10/which-afl-club-has-easiest-fixture-in.html  
http://troywheatley.blogspot.com/2012/05/what-has-happened-to-collingwood.html  
http://mafl-stats.blogspot.com/2009/04/from-one-year-to-next-part-2.html  
http://troywheatley.blogspot.com/2012/05/as-noted-in-this-weeks-afl-power.html  
http://troywheatley.blogspot.com/2012/06/home-town-free-kick-bias-in-afl.html  
http://insightlane.com/2018/07/09/the-miracle-of-the-saints-and-more-on-win-probabilities/  
http://troywheatley.blogspot.com/2016/05/afl-power-rankings-round-8-2016.html  
http://figuringfooty.com/2016/06/29/goal-kicking-accuracy-maps-expscore/  
http://www.matterofstats.com/mafl-simulations/2015/7/7/simulating-the-finalists-for-2015-after-round-14  
8. Look at game statistics that matter - relationship between game stats and game outcomes (final score), remove colinearity & high
correlation stats  
http://www.matterofstats.com/mafl-stats-journal/2013/6/16/game-statistics-and-the-dream-team.html  
http://www.matterofstats.com/mafl-stats-journal/2013/6/29/game-statistics-and-game-outcomes.html  
http://www.matterofstats.com/mafl-stats-journal/2013/8/13/just-for-kicks-an-analysis-of-the-kicking-statistics-in-afl.html    
http://www.matterofstats.com/mafl-stats-journal/2010/4/24/modelling-afl-team-scoring.html  
http://www.matterofstats.com/mafl-stats-journal/2014/9/17/scoring-shot-conversion-rates-how-predictable-are-they  
8. Build a rating system for each player based on player stats  
https://thearcfooty.com/2016/10/15/classifying-players-positions-using-public-data/  
https://fenixbazaar.com/2017/05/05/afl-evolution-career-mode-tips-guide-to-become-a-pro/  
https://www.pro-football-reference.com/blog/index37a8.html  
https://www.pro-football-reference.com/blog/index6b92.html?p=465  
https://hurlingpeoplenow.wordpress.com/2017/08/31/introducing-player-approximate-value-pav/  
http://hurlingpeoplenow.tumblr.com/post/98964610922/hpn-draft-pick-trade-value-chart-v1  
https://hurlingpeoplenow.wordpress.com/2017/09/02/the-2017-pav-all-australian-team/  
http://www.matterofstats.com/mafl-stats-journal/2018/9/5/player-experience-data-analysis-and-modelling  
http://troywheatley.blogspot.com/2018/10/afl-statistics-series-1-which.html  
9. Combining team and player rating data  
http://www.matterofstats.com/mafl-stats-journal/2018/10/7/a-first-attempt-at-combining-afl-team-and-player-data-in-a-predictive-model  
10.  Game scoring progression  
https://afltables.com/afl/stats/games/2018/101420180906.html  
https://afltables.com/afl/seas/2018.html#1  
http://www.matterofstats.com/score-progressions/  
http://www.matterofstats.com/mafl-stats-journal/2014/7/17/modelling-the-total-score-in-an-afl-game  
10. Read statistical models
http://www.matterofstats.com/where-can-i-find-a-mafl-statistical-model-of-x  
http://www.matterofstats.com/where-can-i-find-an-example-of-the-use-of-x  
11. Dashboards  
http://www.matterofstats.com/mafl-team-dashboards/matterofstats-2018-team-dashboard-for-round-23  
https://mafl-online.squarespace.com/mafl-team-dashboards/2013/5/5/mafl-2013-team-dashboard-for-round-6.html  
http://www.matterofstats.com/mafl-team-dashboards/matterofstats-2018-team-dashboard-for-round-23  
http://footymaths.blogspot.com/p/season-charts.html  
12. weekly team stuff to include during season    
lineup - http://www.afl.com.au/news/teams?round=1  
https://www.footywire.com/  
https://www.footywire.com/afl/footy/tp-adelaide-crows  - alternate data source?  
https://www.footywire.com/afl/footy/pr-geelong-cats--patrick-dangerfield  - fantasy history?  
13.  Other interesting things  
http://www.matterofstats.com/mafl-stats-journal/2017/2/20/selected-afl-twitter-networks  
http://www.matterofstats.com/mafl-stats-journal/2014/3/7/attaching-probabilities-to-game-margins-the-magic-of-quantile-regression  

13. from Justin - The team stats by round are under the same website but under the team tab.  There are extra stats under the the advanced options but you cant view them all at once. They are not needed for AFL fantasy but I like to run some stats on them.

## Fantasy Strategy  
1. Pick the right rookies  
2. Plan for bye rounds  
3. 12 premium players  
4. Bulk of scorers are from midfield  
5. Scores of best 18 players from overall match squad for bye rounds  
6. Trade injured players immediately  
7. Find a measure of consistency  
8. Identify undervalued aspects of player performance – this is more important than accuracy  
9. Use a two year history  
10. 100 point player – consistency, valuation  
11. Distribution of points earned FO/DE/MI/RU  
12. Margin of victory impact on fantasy points  
13. Breakeven point score for each player – try to guess?  
14. Use expert starting team in lineup – rookies midpriced and stars  
