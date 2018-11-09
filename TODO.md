## To Do List  
1. Document architecture and names here.  The order should be  - Season -> Round -> Game -> Team -> Position -> Player 
2. Build mapping tables to be uploaded at each run  
3. Calculate ELO style team ratings for each round before adjustments for HGA venue and interstate; compare to AFL ladder    
http://www.matterofstats.com/mafl-stats-journal/2014/1/7/introducing-chips?rq=chips  
http://www.matterofstats.com/mafl-stats-journal/2013/9/24/the-relative-importance-of-class-and-form-in-afl.html  
http://www.matterofstats.com/what-variables-are-used-in-mafl-statistical-models  
To calculate Cmarg  
Initial Rating = 1000  
New Rating = Old Rating + k(i) * (Actual Margin - Expected Margin)  
Actual Margin = Points Scored - Points Conceded  
Expected Margin (Home) = Difference in Rating + f * Difference in Form + s * Interstate Status + HGA(j)  
Difference in Rating = Own Rating - Opponent Rating  
Difference in Form = Change in Own Rating (last x games) - Change in Opponent Rating (last x games)  
Rating for New Season = C x Rating at end of Previous Season + (1 - C) * 1000  
To calculate Cprob  
Probability of Home Team Win = psi(Expected Margin; mu = 0, sigma = sigma)  
where  
C = carryover parameter between seasons is in (0,1) interval = 60.99%  
Cprob converts predicted margin Cmarg and converts it to estimated victor probability assuming normal distribution with mean zero and
an optimally chosen sigma  
Cmarg parameters chosen to minimise MAE across games for 10 year period  
Cprob sigma chosen to minimise sum of log probability over same period  
Parameter selection  
Cmarg minimises Abs Error = |Actual Margin - Expected Margin|  
Cprob minimises LPS = 1 + log(2)(Probability Attached to Winning Team)  
k(i) and f and s and HGA(j) determined optimally via solving linear programming problem  
k(i) such that  
k(1) = rounds 1-6 = 9.72%
k(2) = rounds 7-11= 6.17%  
k(3) = rounds 12-17 = 6.41%  
k(4) = rounds 18+ = 8.93%  
k(5) = finals = 1.37%
C = 60.99%  
f = form difference = 0.653  
s = interstate status = 5.568  
The aim is to get an average MAE of less than 30 points per game at least    
Other references and improvements to basic model  
https://mafl-online.squarespace.com/mafl-stats-journal/2013/10/13/building-your-own-team-rating-system.html  
http://www.matterofstats.com/mafl-stats-journal/2011/8/28/mars-ratings-how-important-are-teams-initial-ratings.html   
http://www.matterofstats.com/mafl-stats-journal/2015/7/4/rating-teams-based-on-scoring-ability  
http://www.matterofstats.com/mafl-stats-journal/2015/11/1/an-improved-vflafl-team-rating-system-mossbods-20  
http://www.matterofstats.com/mafl-stats-journal/2017/1/5/team-rating-revisited-a-rival-for-mossbods  
https://www.matterofstats.com/mafl-stats-journal/2014/11/2/the-2015-afl-draw-schedule-strength-and-imbalance  
4. Calculate home game advantage  
http://www.matterofstats.com/mafl-stats-journal/2010/9/20/adding-some-spline-to-your-models.html   
https://blog.revolutionanalytics.com/2013/08/the-stats-of-australian-rules-football.html  
5. Calculate interstate advantage  
6. Calculate venue experience  
http://www.matterofstats.com/mafl-stats-journal/2013/12/22/estimating-team-and-venue-specific-home-ground-advantage-usi.html  
7. Look at game statistics that matter - relationship between game stats and game outcomes (final score), remove colinearity & high
correlation stats  
http://www.matterofstats.com/mafl-stats-journal/2013/6/16/game-statistics-and-the-dream-team.html  
http://www.matterofstats.com/mafl-stats-journal/2013/6/29/game-statistics-and-game-outcomes.html  
http://www.matterofstats.com/mafl-stats-journal/2013/8/13/just-for-kicks-an-analysis-of-the-kicking-statistics-in-afl.html    
http://www.matterofstats.com/mafl-stats-journal/2010/4/24/modelling-afl-team-scoring.html  
http://www.matterofstats.com/mafl-stats-journal/2014/9/17/scoring-shot-conversion-rates-how-predictable-are-they  
8. Build a rating system for each player based on player stats  
https://thearcfooty.com/2016/10/15/classifying-players-positions-using-public-data/  
https://fenixbazaar.com/2017/05/05/afl-evolution-career-mode-tips-guide-to-become-a-pro/  
9. Combining team and player rating data  
http://www.matterofstats.com/mafl-stats-journal/2018/10/7/a-first-attempt-at-combining-afl-team-and-player-data-in-a-predictive-model  
10. Read statistical models
http://www.matterofstats.com/where-can-i-find-a-mafl-statistical-model-of-x  
http://www.matterofstats.com/where-can-i-find-an-example-of-the-use-of-x  
11. Dashboards  
http://www.matterofstats.com/mafl-team-dashboards/matterofstats-2018-team-dashboard-for-round-23  
https://mafl-online.squarespace.com/mafl-team-dashboards/2013/5/5/mafl-2013-team-dashboard-for-round-6.html  
12. weekly team stuff to include during season    
lineup - http://www.afl.com.au/news/teams?round=1  
13. from Justin - The team stats by round are under the same website but under the team tab.  There are extra stats under the the advanced options but you cant view them all at once. They are not needed for AFL fantasy but I like to run some stats on them.

## Fantasy Strategy  
1.       Pick the right rookies
2.       Plan for bye rounds
3.       12 premium players
4.       Bulk of scorers are from midfield
5.       Scores of best 18 players from overall match squad for bye rounds
6.       Trade injured players immediately
7.       Find a measure of consistency
8.       Identify undervalued aspects of player performance – this is more important than accuracy
9.       Use a two year history
10.   100 point player – consistency, valuation
11.   Distribution of points earned FO/DE/MI/RU
12.   Margin of victory impact on fantasy points
13.   Breakeven point score for each player – try to guess?
14.   Use expert starting team in lineup – rookies midpriced and stars
