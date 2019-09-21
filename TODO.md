## To Do List  
1. Document architecture and names here.  The order should be  -  
Season -> Round -> Game -> Venue -> Team -> Position -> Player (Profile, Stats & Fantasy)   
Each of these should have their own id and mapping tables which should be uploaded at the start of each run   
Table fivethirtyeight - https://cfss.uchicago.edu/hw02-explore-data.html  
Chart formatting - https://flowingdata.com/tag/fivethirtyeight/ ; http://blog.yhat.com/posts/replicating-five-thirty-eight-in-r.html ; http://www.sthda.com/english/wiki/ggplot2-title-main-axis-and-legend-titles   
2. Document Process and storage folders for each process for both code and data     
scrape -> clean and save -> EDA by each group in (1) above -> Analysis and Predictions    
Consider which table contains information for mapping and id tables  
Consider the analysis from this table before merging with another one  
Consider small and big data sets which can be built to quicken the analysis  
3. Calculate average season margin of victory; do EDA on Ladder  
http://troywheatley.blogspot.com/search/label/Australian%20Rules%20Football  
https://www.matterofstats.com/mafl-stats-journal/2015/11/22/competitiveness-in-the-vflafl-1897-2015  
4. Calculate home game advantage and other venue stats - EDA_dfHGA.r  
Data for home ground advantage is in dfHGA.csv - mean margin for home team at end of each game  
HGA using Random Forest - http://www.matterofstats.com/mafl-stats-journal/2013/11/20/revisiting-home-ground-advantage.html  
http://www.hpnfooty.com/?p=27528  
2018 fixture Analysis - https://squiggle.com.au/fixture-analysis-2018-home-ground-advantage/  
Home vs Interstate at Home Ground, Percentage of Games won by Home Ground, Players on Home Ground - http://www.espn.com/espn/feature/story/_/id/19752486/footy-forensics-does-home-ground-advantage-exist  
Injuries by Venue - http://figuringfooty.com/2016/05/16/injuries-are-still-happening-far-too-often-at-etihad-stadium/  
Venue dimensions - https://www.afl.com.au/tickets/venues  
Weather - https://www.ncdc.noaa.gov/data-access  
5. Calculate interstate advantage  
Excess Venue Experience - http://www.matterofstats.com/mafl-stats-journal/2013/11/23/whats-more-important-who-you-play-or-where-you-play-them.html   
coordinate distance calc - https://stackoverflow.com/questions/32363998/function-to-calculate-geospatial-distance-between-two-points-lat-long-using-r  
https://stackoverflow.com/questions/44773789/using-distm-function-in-r-to-calculate-distance-between-two-coordinates-gives-a  
https://stackoverflow.com/questions/29585759/calculating-distances-from-latitude-and-longitude-coordinates-in-r  
6. Calculate ELO style team ratings for each round before adjustments for HGA venue and interstate; compare to AFL ladder - EDAv20.r  
Data is stored in dfEDAv20.csv  
Improvements needed - predictive accuracy falls over time, recalculate using 5 year windows, recalculate k factors.  Take into account lack of accuracy in early rounds.    
Normalisation of games over a long history   
ELO analysis - http://pier4r.wikidot.com/pierworks:articles:2017-06:elo-inights  
MOV adjustments - http://andr3w321.com/elo-ratings-part-2-margin-of-victory-adjustments/  
Close Games - http://www.espn.com/espn/feature/story/_/id/19845122/footy-forensics-afl-world-most-even-sports-league  
Change in Form - http://www.matterofstats.com/mafl-stats-journal/2014/1/7/introducing-chips?rq=chips  
Interstate status - http://www.matterofstats.com/mafl-stats-journal/2013/9/24/the-relative-importance-of-class-and-form-in-afl.html  
Interstatus status and recent form - http://www.matterofstats.com/what-variables-are-used-in-mafl-statistical-models  
http://www.matterofstats.com/mafl-stats-journal/2016/1/26/reoptimisation-and-the-fear-of-overfitting  
Goal kicking accuracy and early round accuracy - https://squiggle.com.au/its-2018/  
Team experience on each ground, Distance travelled - https://thearcfooty.com/2016/12/29/introducing-the-arcs-ratings-system/  
https://plussixoneblog.com/post/grand-final-preview4/  
Using ELO to tell a story - https://thearcfooty.com/2017/01/28/a-complete-history-of-the-afl/  
Benchmark my results - https://plussixoneblog.com/post/round-results/  
Data visualisation -  https://projects.fivethirtyeight.com/complete-history-of-the-nfl/  
https://projects.fivethirtyeight.com/2018-nfl-predictions/?ex_cid=rrpromo  
The aim is to get an average MAE of less than 30 points per game at least  - my MAE is 26ish  
Other references and improvements to basic model  
Benchmarking - https://squiggle.com.au/leaderboard/  
Visualisation - http://figuringfooty.com/2017/03/22/my-focus-for-2017-and-some-round-1-tips/  
http://www.matterofstats.com/mafl-stats-journal/2013/12/8/optimising-the-very-simple-rating-system-vsrs.html  
https://mafl-online.squarespace.com/mafl-stats-journal/2013/10/13/building-your-own-team-rating-system.html  
Defensive and Offensive Ratings - http://www.matterofstats.com/mafl-stats-journal/2015/7/4/rating-teams-based-on-scoring-ability  
http://www.matterofstats.com/mafl-stats-journal/2015/11/1/an-improved-vflafl-team-rating-system-mossbods-20  
http://www.matterofstats.com/mafl-stats-journal/2017/1/5/team-rating-revisited-a-rival-for-mossbods  
how does ratings during the regular season stack up in the finals rounds?  
https://www.matterofstats.com/mafl-stats-journal/2015/7/10/best-and-worst-afl-teams-2005-2015-a-mossbod-perspective  
https://www.matterofstats.com/mafl-stats-journal/2015/11/22/competitiveness-in-the-vflafl-1897-2015  
https://hurlingpeoplenow.wordpress.com/2017/07/21/the-hpn-second-trimester-ish-awards-plus-round-17-team-ratings/  
https://www.matterofstats.com/mafl-stats-journal/2015/12/7/the-2016-afl-draw-difficulty-and-distortion  
benchmarking other models - http://www.matterofstats.com/mafl-stats-journal/2017/9/12/errors-in-predicting-home-team-and-away-team-scores  
Using ELO - https://plussixoneblog.com/post/grand-final-preview4/  
https://stattraction.wordpress.com/2018/08/23/predictions-after-round-22-2018/  
https://stattraction.wordpress.com/2018/03/27/ladder-prediction-after-round-1-2018/  
https://stattraction.wordpress.com/2018/03/20/ladder-prediction-ratings-before-round-1-2018-and-some-housekeeping/  
https://stattraction.wordpress.com/2016/03/06/fixture-analysis-pre-round-1-2016/  
http://www.matterofstats.com/mafl-stats-journal/2017/6/17/does-offence-or-defence-win-games  
http://www.matterofstats.com/mafl-stats-journal/2017/8/10/how-close-has-the-2017-season-been  
http://www.matterofstats.com/mafl-stats-journal/2017/6/9/tipping-accuracy-vs-mae-as-a-footy-forecaster-metric  
http://troywheatley.blogspot.com/2011/02/introducing-afl-power-rankings-part.html  
http://troywheatley.blogspot.com/2018/07/afl-power-rankings-round-17-2018.html  
http://troywheatley.blogspot.com/2018/07/afl-power-rankings-round-15-2018.html  
http://troywheatley.blogspot.com/2018/06/afl-power-rankings-round-13-2018.html  
http://troywheatley.blogspot.com/2017/07/afl-power-rankings-round-16-2017.html  
http://troywheatley.blogspot.com/2016/10/which-afl-club-has-easiest-fixture-in.html  
http://mafl-stats.blogspot.com/2009/04/from-one-year-to-next-part-2.html  
http://troywheatley.blogspot.com/2012/05/as-noted-in-this-weeks-afl-power.html  
http://insightlane.com/2018/07/09/the-miracle-of-the-saints-and-more-on-win-probabilities/  
http://troywheatley.blogspot.com/2016/05/afl-power-rankings-round-8-2016.html  
Another model - http://figuringfooty.com/the-figuring-footy-predictions/  
https://github.com/cfranklin11/footy-tipper  
https://multithreaded.stitchfix.com/blog/2016/11/22/nba-rankings/  
https://towardsdatascience.com/toward-a-better-footy-tipping-model-an-analysis-of-basic-heuristics-80de4235e768  
https://medium.com/@craigjfranklin/toward-a-better-footy-tipping-model-the-folly-of-memory-9351670abe19  
https://blog.goodaudience.com/toward-a-better-footy-tipping-model-the-first-model-bbc8c67a472a  
https://towardsdatascience.com/footy-tipping-with-machine-learning-adding-player-data-9ccdab56a4c5  
Model accuracy - http://old.clubelo.com/Articles/HowaccurateistheElosystemanditspredictions.html  
declining hga - http://old.clubelo.com/Articles/Themysteriousdeclineofhomeadvantage.html  
factor - http://old.clubelo.com/Articles/Two-LegGames.html  
weight index - http://old.clubelo.com/Articles/WeightIndex.html  
poisson and histogram - http://old.clubelo.com/Articles/AdaptivePoissonparametersandresulthistogram.html  
Use it to simulate outcomes for future matches - http://www.matterofstats.com/mafl-simulations/2015/7/7/simulating-the-finalists-for-2015-after-round-14  
8. Look at game statistics that matter - relationship between game stats and game outcomes (final score), remove colinearity & high
correlation stats  
http://www.matterofstats.com/mafl-stats-journal/2013/6/16/game-statistics-and-the-dream-team.html  
http://www.matterofstats.com/mafl-stats-journal/2013/6/29/game-statistics-and-game-outcomes.html  
http://www.matterofstats.com/mafl-stats-journal/2010/4/24/modelling-afl-team-scoring.html  
7. Build a rating system for each player based on player stats  
http://www.matterofstats.com/mafl-stats-journal/2018/11/21/classifying-recent-afl-players-by-position-part-4-2018-team-profiles-how-many-player-types-are-there  
https://onballers.com/2017/08/24/five-new-afl-metrics-and-the-players-who-lead-them-in-2017/  
https://www.reddit.com/r/AFL/comments/8x17l4/machine_learning_in_afl_part_ii_its_all_about_the/  
https://www.pro-football-reference.com/blog/index37a8.html  
https://thearcfooty.com/2016/10/15/classifying-players-positions-using-public-data/  
http://www.hpnfooty.com/?p=27528  
http://www.hpnfooty.com/?p=21810  
https://www.pro-football-reference.com/blog/index37a8.html  
https://www.pro-football-reference.com/blog/index6b92.html?p=465  
https://hurlingpeoplenow.wordpress.com/2017/08/31/introducing-player-approximate-value-pav/  
http://hurlingpeoplenow.tumblr.com/post/98964610922/hpn-draft-pick-trade-value-chart-v1  
https://hurlingpeoplenow.wordpress.com/2017/09/02/the-2017-pav-all-australian-team/  
http://www.matterofstats.com/mafl-stats-journal/2018/9/5/player-experience-data-analysis-and-modelling  
9. Combining team and player rating data  
http://www.matterofstats.com/mafl-stats-journal/2018/10/7/a-first-attempt-at-combining-afl-team-and-player-data-in-a-predictive-model  
10.  Game scoring progression  
https://squiggle.com.au/0-4-futures/  
https://afltables.com/afl/stats/games/2018/101420180906.html  
https://afltables.com/afl/seas/2018.html#1  
http://www.matterofstats.com/score-progressions/  
http://www.matterofstats.com/mafl-stats-journal/2014/7/17/modelling-the-total-score-in-an-afl-game  
10. Read statistical models
http://www.matterofstats.com/where-can-i-find-a-mafl-statistical-model-of-x  
http://www.matterofstats.com/where-can-i-find-an-example-of-the-use-of-x  
https://mafl-online.squarespace.com/where-can-i-find-a-mafl-analysis-of-x  
11. Dashboards  
http://www.matterofstats.com/mafl-team-dashboards/matterofstats-2018-team-dashboard-for-round-23  
https://mafl-online.squarespace.com/mafl-team-dashboards/2013/5/5/mafl-2013-team-dashboard-for-round-6.html  
http://www.matterofstats.com/mafl-team-dashboards/matterofstats-2018-team-dashboard-for-round-23  
http://footymaths.blogspot.com/p/season-charts.html  
13.  Draft Picks  
https://hurlingpeoplenow.wordpress.com/2017/04/04/who-is-your-afl-club-death-riding-this-year/  
14.  Player Analysis  
https://squiggle.com.au/how-impressive-was-dustys-game/  
https://squiggle.com.au/is-patrick-dangerfield-having-a-better-2017-than-2016/  
http://figuringfooty.com/2017/06/01/are-west-coast-too-dependent-on-kennedy/  
http://insightlane.com/2018/10/15/buddy-900-and-benchmarking-the-greatest-goal-kickers-in-vfl-afl-history/  
https://plussixoneblog.com/post/the-deledio-effect/  
http://www.afl.com.au/stats/player-ratings/ratings-explained  
http://www.espn.com/espn/feature/story/_/id/19122983/footy-forensics-statistics-champion-team-team-champions-2017-afl-season?ex_cid=espnTW_ANZL  
http://www.espn.com/espn/feature/story/_/id/20355634/footy-forensics-statistics-west-coast-josh-kennedy-season-ages  
15.  Bye Rounds  
http://www.espn.com/espn/feature/story/_/id/19693539/afl-footy-forensics-matt-cowgill-effects-byes  
16a. Team Stats Analysis - goal kicking accuracy or goal/score conversion  
http://figuringfooty.com/2015/08/12/how-the-best-teams-are-not-necessarily-the-ones-who-kick-the-most-goals/  
http://figuringfooty.com/2016/07/07/the-goal-kicking-accuracy-fallacy/  
http://www.matterofstats.com/mafl-stats-journal/2014/9/17/scoring-shot-conversion-rates-how-predictable-are-they  
http://www.matterofstats.com/mafl-stats-journal/2015/7/4/rating-teams-based-on-scoring-ability  
https://mafl-online.squarespace.com/mafl-stats-journal/2010/4/12/goalkicking-accuracy-across-the-seasons.html  
http://figuringfooty.com/2016/06/29/goal-kicking-accuracy-maps-expscore/  
https://www.matterofstats.com/mafl-stats-journal/2015/11/23/scoring-shot-conversion-history-in-the-vflafl-1897-2015  
https://squiggle.com.au/its-2018/  
16b.  Team Stat Analysis - team strength - inside 50 and scoring shots  
https://hurlingpeoplenow.wordpress.com/2016/04/29/lets-rate-team-strength-and-do-a-round-6-preview/  
http://www.espn.com/espn/feature/story/_/id/20157852/footy-forensics-sydney-swans-rewrite-history-how-done-it  
http://figuringfooty.com/2017/08/10/the-quality-and-quantity-of-shots-created-by-each-club/  
http://figuringfooty.com/2015/10/05/a-brief-analysis-of-scoring-shots-in-the-grand-final/  
http://figuringfooty.com/2016/08/08/match-analysis-using-shot-quality/  
http://figuringfooty.com/2015/08/07/are-good-teams-straighter-shooters-than-poor-teams/   
http://figuringfooty.com/2016/08/04/a-model-to-predict-and-rate-shots-by-quality/ 
http://figuringfooty.com/2017/04/18/the-secret-weapon-of-the-afls-best-forward-line/  
16c. Team Stat Analysis - kicks  
http://www.matterofstats.com/mafl-stats-journal/2013/8/13/just-for-kicks-an-analysis-of-the-kicking-statistics-in-afl.html  
16d. Team Stat Analysis - tackles  
https://plussixoneblog.com/post/the-tackle-machine/  
16e. Team Stat Analysis  - hitouts
http://www.espn.com/espn/feature/story/_/id/19235793/footy-forensics-afl-ruckmen-redundant  
16f. Team Stat Analysis - free kicks  
http://www.espn.com/espn/feature/story/_/id/19071496/footy-forensics-statistics-explains-free-kick-counts-2017-afl-season  
http://troywheatley.blogspot.com/2012/06/home-town-free-kick-bias-in-afl.html  
16g. Team Stat Analysis - score involvements
http://figuringfooty.com/2016/11/21/your-clubs-most-important-avenue-to-goal-score-involvements-in-2016/  
16h. Team Stat Analysis - possession chains  
http://troywheatley.blogspot.com/2018/10/afl-statistics-series-1-which.html  
https://madnessofsport.wordpress.com/2015/05/08/possession-chains-and-the-future-of-advanced-afl-statistics/  
16i. Team Stat Analysis - metres gained  
https://www.theroar.com.au/2017/03/28/stats-enough-metres-gained-irrelevant/  
https://www.theage.com.au/sport/afl/metres-gained-a-stat-for-winners-20090716-ge7zp2.html  
https://www.adelaidenow.com.au/sport/afl/the-afls-top-metre-eaters/news-story/1cfa60cdb667f03d4a2770289ccffb91  
https://www.espn.com.au/afl/story/_/id/27199381/metres-gained-breaking-afl-most-misunderstood-statistic  
16.  Team Analysis  
http://figuringfooty.com/2017/05/18/are-st-kilda-a-sleeping-giant/  
http://insightlane.com/2018/07/09/the-miracle-of-the-saints-and-more-on-win-probabilities/  
http://figuringfooty.com/2017/04/14/why-2017-results-are-flattering-the-cats/  
https://thearcfooty.com/2017/07/04/sydneys-path-finals/  
https://thearcfooty.com/2017/04/23/cant-eagles-fly/  
http://hurlingpeoplenow.tumblr.com/post/100067599722/jarryd-haynes-prospects-in-the-nfl  
https://hurlingpeoplenow.wordpress.com/2016/04/08/hpns-afl-round-3-preview/  
http://insightlane.com/australian-football/scoreworm/  
https://www.abc.net.au/news/2018-09-06/afl-finals-favourites-richmond-have-secret-tactic/10203884  
https://plussixoneblog.com/post/leaping-kangaroos/  
https://plussixoneblog.com/post/annus-horribilis-fremantle/  
http://figuringfooty.com/2016/09/15/a-fresh-way-to-think-about-footy-hawthorn-v-western-bulldogs/  
http://figuringfooty.com/2016/09/28/grand-final-preview-part-2-a-team-of-champions-or-a-champion-team/  
http://troywheatley.blogspot.com/2012/05/what-has-happened-to-collingwood.html  
https://hurlingpeoplenow.wordpress.com/2017/06/01/what-do-we-really-know-about-port-adelaide/  
17.  Other interesting things 
https://www.reddit.com/r/datascience/comments/c4mgsg/daily_fantasy_sports_ownership_projection/?utm_source=share&utm_medium=ios_app - fantasy sports ownership   
https://www.armchairanalysis.com/  
https://medium.com/fantasy-outliers  
https://www.datarobot.com/sports-analytics/  
https://www.datarobot.com/wiki/feature-impact/  
https://www.reddit.com/r/dataisbeautiful/comments/cc1cqf/viz_displaying_why_more_often_than_not_a_top3_rb/?utm_source=share&utm_medium=ios_app - position importance  
https://blog.datarobot.com/using-datarobot-to-predict-nba-player-performance  
https://becominghuman.ai/a-i-fantasy-football-week-to-week-projections-e7f8895e9cb1  
https://arxiv.org/pdf/1604.01455v2.pdf  
http://cs229.stanford.edu/proj2012/Kapania-FantasyFootballAndMachineLearning.pdf  
https://fantasyfootballers.quora.com/  
https://pdfs.semanticscholar.org/8e84/933903df9c5d2f73770ba6c9be8da31a751b.pdf  
https://www.kdnuggets.com/2018/08/optimization-101-data-scientists.html  
https://github.com/FantasyFootballAnalytics/FantasyFootballAnalyticsR/tree/master/R%20Scripts  
https://github.com/fivethirtyeight/nfl-elo-game  
https://thearcfooty.com/2017/04/23/arcs-first-birthday/  
https://github.com/BriBecker/FantasyFootballAnalyticsR  
https://github.com/zzhangusf/Predicting-Fantasy-Football-Points-Using-Machine-Learning/blob/master/README.md  
http://www.afl.com.au/news/2017-12-28/stats-glossary-every-stat-explained  
https://www.pro-football-reference.com/blog/indexd65e.html?cat=8  
https://hurlingpeoplenow.wordpress.com/2016/07/15/round-17-close-games-are-still-basically-random/  
http://figuringfooty.com/2016/09/30/grand-final-preview-part-4-reader-questions/  
http://www.afl.com.au/news/2018-06-05/the-stats-files-the-three-keys-to-winning-games-in-2018  
https://www.abc.net.au/news/2017-09-07/what-chance-do-teams-really-have-of-winning-the-afl-grand-final/8862758  
https://plussixoneblog.com/page/project-world-cup-datathon/  
https://plussixoneblog.com/post/the-round-7-rule/  
https://plussixoneblog.com/post/round-21-bring-back-match-importance/  
https://plussixoneblog.com/post/beyond-the-8-point-game-estimating-match-importance-in-the-afl/  
http://footymaths.blogspot.com/2017/03/2017-unpredictions-expected-wins.html  
http://footymaths.blogspot.com/2017/03/2017-unpredictions-expected-finish.html  
http://figuringfooty.com/2017/06/28/every-shot-in-the-2017-coleman-medal-race/  
http://footymaths.blogspot.com/2017/06/15-score-review.html  
http://footymaths.blogspot.com/2017/03/1-summer-of-footballing-love.html  
http://footymaths.blogspot.com/2017/07/16-transition-rendition.html  
https://squiggle.com.au/who-will-make-the-finals-the-wisdom-of-crowds-the-arc/  
https://thearcfooty.com/2017/02/16/who-do-you-think-will-make-the-finals/  
http://footymaths.blogspot.com/2017/03/post-jlt-break.html  
https://squiggle.com.au/who-won-the-pre-season/  
http://www.matterofstats.com/mafl-stats-journal/2017/2/20/selected-afl-twitter-networks  
https://hurlingpeoplenow.wordpress.com/2017/04/07/the-archpn-crossover-dont-stress-if-your-team-is-0-2/  
https://squiggle.com.au/how-surprising-were-the-round-7-results/  
http://www.matterofstats.com/mafl-stats-journal/2014/3/7/attaching-probabilities-to-game-margins-the-magic-of-quantile-regression  
https://hurlingpeoplenow.wordpress.com/2017/04/21/are-north-and-hawthorn-bad-or-have-they-just-faced-a-tough-draw/  
https://hurlingpeoplenow.wordpress.com/2017/03/30/what-does-winning-in-round-1-mean/  
https://thearcfooty.com/2017/04/02/3055/  
http://www.espn.com/espn/feature/story/_/id/19013312/footy-forensics-statistics-prove-crunch-already-2017-afl-season  
http://www.espn.com/espn/feature/story/_/id/19501873/footy-forensics-your-afl-club-key-game-trend-part-ii  
http://www.espn.com/espn/feature/story/_/id/19449458/footy-forensics-your-afl-club-key-game-trend  
https://squiggle.com.au/time-in-front-vs-wins/  
https://squiggle.com.au/how-close-has-the-2017-season-been-matter-of-stats/  
http://www.espn.com/espn/feature/story/_/id/20231436/footy-forensics-afl-finals-swing-which-games-matter-most  
https://hurlingpeoplenow.wordpress.com/2017/06/15/anatomy-of-an-upset-how-do-afl-teams-overcome-the-odds-to-spring-a-big-win/  
https://legacy.baseballprospectus.com/glossary/index.php?context=6&category=true  
https://projects.fivethirtyeight.com/complete-history-of-the-nba/#warriors  
https://thearcfooty.com/2017/04/07/fantasy-points-what-are-they-good-for/  
http://www.espn.com/espn/feature/story/_/id/19348021/footy-forensics-afl-changing-game-trends-2017  
18. Fantasy Analysis  
http://dream-stats.com/  - visualisations  
http://tooserious.net/forum/player_calc.php?&id=4901&pcid=46584&name=Bailey%20Banfield#YgxfL1JWHzCqiwe6.97 - visualisation  
https://aflfantasies.com/2019/happy-new-years/  comparing player performance visually  
https://sqldusty.wordpress.com/2015/08/01/power-bi-fantasy-football-player-stats-dashboards-for-download/ powerbi  
http://www.sqlservercentral.com/blogs/sql-with-dustin-ryan/2016/08/23/power-bi-nfl-fantasy-football-2016-reports/  powerbi  
https://magicnumbertheory.wordpress.com/2016/06/08/fat-cow-futures-pre-r12/  - visualisation     
http://dreamteamtalk.com/wp-content/uploads/2011/03/afldreamteamcheatsheet2011.pdf  - visualisation  
https://finalsiren.com/PreviousGames.asp?Team1ID=9&Team2ID=5&Go=Go#PlayerLast5 - visualisation  
https://magicnumbertheory.wordpress.com/2016/05/26/bye-planner-v2/ - visualisation    
https://towardsdatascience.com/mythbusting-fantasy-premier-league-form-over-fixtures-eecf9022e834  
https://medium.com/@jonathan_hui/rl-lqr-ilqr-linear-quadratic-regulator-a5de5104c750  
https://dreamteamtalk.com/2018/11/01/2019-afl-fixture-and-fantasy/  
http://www.afl.com.au/news/2018-02-13/how-to-dominate-fantasy-2017s-winner-reveals-all  
https://intoli.com/blog/fantasy-football-for-hackers/  
https://www.afl.com.au/news/2019-04-23/fantasy-dpp-additions-meet-the-record-15-new-forwards  
https://aflratings.com.au/category/injuries/ - Injury weekly pages  
http://www.fanfooty.com.au/blog/  - news pages to scrape  
https://aflfantasies.com/2018/buyer-beware-part-2/  
https://aflfantasies.com/2018/band-brothers-part-3/  
https://magicnumbertheory.wordpress.com/2016/05/26/bye-planner-v2/  
https://towardsdatascience.com/fantasy-football-artificial-intelligence-cheat-sheet-ac172a23e2e1 - cheat sheet     
https://dreamteamtalk.com/2013/05/28/traded-players-output-v-expectations/ output vs expectations  
https://dreamteamtalk.com/2013/04/18/mythbusting-dt-insider-guest-post/ strategies  
https://dreamteamtalk.com/2012/02/01/2012-fixture-study/  fixture study   
https://dreamteamtalk.com/2018/10/06/2017-18-ha-season-player-average-comparison-western-bulldogs/  
https://dreamteamtalk.com/author/aflratings/   
https://dreamteamtalk.com/2019/01/19/roys-best-22-for-2019-january-edition/  
https://dreamteamtalk.com/2012/05/09/hooks-quarterly-review/  
https://dreamteamtalk.com/category/resources/sample-teams/  
https://dreamteamtalk.com/2017/09/11/the-2017-optimal-afl-fantasy-team-finally-proves-link-between-genius-and-madness/  
https://dreamteamtalk.com/2018/08/01/how-do-you-compare-to-the-top-100-afl-fantasy-coaches-finals-2018/  
https://dreamteamtalk.com/2013/05/20/managing-your-afl-fantasy-dream-team-through-the-byes/  
http://dailyfantasysportsaustralia.com/category/tools-explained/   
https://supercoachtalk.com/supercoach-points-distribution/  
https://dspace.mit.edu/handle/1721.1/100687  
https://pdfs.semanticscholar.org/8e84/933903df9c5d2f73770ba6c9be8da31a751b.pdf  
Stanford - http://cs229.stanford.edu/proj2012/Kapania-FantasyFootballAndMachineLearning.pdf  
http://forum.fanfooty.com.au/index.php/board,1.0.html  
https://www.fantasyinsider.com.au/blog/Advanced%20Strategy/afl-analysis-should-favourite-stacks-include-the-defenders  
https://www.fantasyinsider.com.au/blog/AFL/a-beginners-guide-to-afl-dfs-game-day-strategies  
https://www.fantasyinsider.com.au/blog/Site%20News/now-available-nrl-afl-draft-guides  
https://fantasyfootballanalytics.net/2013/06/win-your-fantasy-football-auction-draft.html  
https://github.com/zzhangusf/Predicting-Fantasy-Football-Points-Using-Machine-Learning/blob/master/README.md  
https://github.com/google-research/football - google football   
https://medium.com/@GregorydSam/best-football-analytics-pieces-e532844b12e - football analytical articles   
https://public.tableau.com/profile/gordon.rae#!/vizhome/FantasyFootball201920/FantasyFootballGuide  visualisation  
https://www.reddit.com/r/aflfantasy/comments/cgk6tq/planning_for_2020_already_things_i_learned_being/?utm_source=share&utm_medium=ios_app   




