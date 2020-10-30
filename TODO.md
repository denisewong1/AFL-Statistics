## To Do List  
1. Document architecture and names here.  The order should be  -  
Season -> Round -> Game -> Venue -> Team -> Position -> Player (Profile, Stats & Fantasy)   
Chart formatting - http://blog.yhat.com/posts/replicating-five-thirty-eight-in-r.html  
Split data in the following manner?  Create a glossary  https://www.americansocceranalysis.com/glossary  
1a. Application Framework possibilities with Shiny   
https://www.americansocceranalysis.com/home/2020/7/6/asas-new-interactive-tables  
https://towardsdatascience.com/an-open-source-solution-to-deploy-enterprise-level-r-shiny-applications-2e19d950ff35  
https://www.aflalytics.com/apps/seasonDashboard/?competition=VFLAFL  
https://www.aflgains.com/  
https://footymaths.blogspot.com/  
https://fantasy.cultivateforecasts.com/challenges  
https://gitlab.com/jphwang/online_articles/-/tree/master/  organisation of models   
2. Document Process and storage folders for each process for both code and data     
scrape -> clean and save -> EDA by each group in (1) above -> Analysis and Predictions    
Each of the groups below requires a different database
Match :
Player : tiles 
Team : tiles
Venue : home game advantage, interstate advantage, weather
Ladder : strength of schedule, eloWILMA
Premiership :
Season : margin of victory
Fantasy : Breakevens
Notes : abbreviations, new features created  
2a. What do I want forecasts or model inputs for?  How do i organise the results in folder structure?  
Home Game Advantage  
Interstate Advantage  
Player Position Estimate   
Player Offensive/Defensive   
Team Offensive/Defensive  
Schedule Strength  
Fantasy Breakevens    
3. Calculate average season margin of victory; do EDA on Ladder  
http://troywheatley.blogspot.com/search/label/Australian%20Rules%20Football  
https://www.matterofstats.com/mafl-stats-journal/2015/11/22/competitiveness-in-the-vflafl-1897-2015  
4. Calculate home game advantage and other venue stats - EDA_dfHGA.r  
Data for home ground advantage is in dfHGA.csv - mean margin for home team at end of each game  
HGA using Random Forest - http://www.matterofstats.com/mafl-stats-journal/2013/11/20/revisiting-home-ground-advantage.html  
http://www.hpnfooty.com/?p=27528  
https://theafllab.com/2018/06/28/home-ground-advantage-a-mess/  
Home vs Interstate at Home Ground, Percentage of Games won by Home Ground, Players on Home Ground - http://www.espn.com/espn/feature/story/_/id/19752486/footy-forensics-does-home-ground-advantage-exist  
Injuries by Venue - http://figuringfooty.com/2016/05/16/injuries-are-still-happening-far-too-often-at-etihad-stadium/  
Venue dimensions - https://www.afl.com.au/tickets/venues  
Weather - https://www.ncdc.noaa.gov/data-access  
Weather - https://theafllab.com/2018/07/06/environmental-factors-affecting-afl-outcomes-the-weather/  
Weather - https://theafllab.com/2018/08/23/environmental-factors-affecting-afl-outcomes-the-weather-part-2/
5. Calculate interstate advantage  
Excess Venue Experience - http://www.matterofstats.com/mafl-stats-journal/2013/11/23/whats-more-important-who-you-play-or-where-you-play-them.html   
coordinate distance calc - https://stackoverflow.com/questions/32363998/function-to-calculate-geospatial-distance-between-two-points-lat-long-using-r  
https://stackoverflow.com/questions/44773789/using-distm-function-in-r-to-calculate-distance-between-two-coordinates-gives-a  
https://stackoverflow.com/questions/29585759/calculating-distances-from-latitude-and-longitude-coordinates-in-r  
5a. Strength of Schedule and Fixture Analysis  
http://www.hpnfooty.com/?p=31263  
https://www.matterofstats.com/mafl-stats-journal/2015/12/7/the-2016-afl-draw-difficulty-and-distortion  
http://troywheatley.blogspot.com/2016/10/which-afl-club-has-easiest-fixture-in.html  
https://squiggle.com.au/fixture-analysis-2018-home-ground-advantage/  
6. Calculate ELO style team ratings for each round before adjustments for HGA venue and interstate; compare to AFL ladder
6a. Team Model - ELO Rank to calculate win probability game by game margin of victory and home/away    
https://www.mdt-datascience.com/2020/06/27/serie-a-2019-20-without-any-stop/  
https://github.com/BorutFlis/predictor  
https://github.com/lucasmaystre/kickscore  
https://www.scisports.com/losc-lille-data-analysis-exciting-squad-depth/  
https://www.kaggle.com/subhanjandas/nfl-comprehensive-data-visualization  
https://en.wikipedia.org/wiki/Scoring_rule  
http://freerangestats.info/blog/2019/03/23/afl-elo  
ELO analysis - http://pier4r.wikidot.com/pierworks:articles:2017-06:elo-inights  
https://www.pro-football-reference.com/blog/titles.html  
Change in Form - http://www.matterofstats.com/mafl-stats-journal/2014/1/7/introducing-chips?rq=chips  
Team experience on each ground, Distance travelled - https://thearcfooty.com/2016/12/29/introducing-the-arcs-ratings-system/  
Close Games - http://www.espn.com/espn/feature/story/_/id/19845122/footy-forensics-afl-world-most-even-sports-league  
https://projects.fivethirtyeight.com/complete-history-of-the-nfl/  
http://figuringfooty.com/2017/03/22/my-focus-for-2017-and-some-round-1-tips/  
https://theartandscienceofdata.wordpress.com/2016/09/17/predicting-the-english-premier-league-standings/  
https://www.espn.com.au/afl/story/_/id/27892329/afl-biggest-question-marks-every-team-heading-2020  
https://www.stuff.co.nz/sport/rugby/rugby-world-cup/rwc-2019-japan/115754410/rwc-2019-all-blacks-are-favourites-but-they-probably-wont-win-the-rugby-world-cup  
2020 predictions - https://www.abc.net.au/news/2019-10-31/crunching-the-numbers-behind-the-2020-afl-fixture/11657036  
https://towardsdatascience.com/how-to-improve-sports-betting-odds-step-by-step-guide-in-python-94626b852f45  
Simulations & good code in R - https://github.com/lazappi/afl-2018/blob/master/analysis/round5.Rmd  and https://github.com/lazappi/aflelo/blob/master/R/simulate.R  and http://lazappi.id.au/2018/04/my-afl-elo-model/  
6b. Team Model - converting ELO rank and win probability to margin of victory  
MOV adjustments - http://andr3w321.com/elo-ratings-part-2-margin-of-victory-adjustments/  
http://www.matterofstats.com/mafl-stats-journal/2014/2/16/pythagorean-expectation-for-vflafl-and-the-nrl 
https://mafl-online.squarespace.com/mafl-stats-journal/2013/1/13/determining-bookmaker-implicit-probabilities-the-risk-equali.html
Interstatus status and recent form - http://www.matterofstats.com/what-variables-are-used-in-mafl-statistical-models  
6d. Team Model - Offensive Defensive  
http://www.matterofstats.com/mafl-stats-journal/2015/11/1/an-improved-vflafl-team-rating-system-mossbods-20  
http://www.matterofstats.com/mafl-stats-journal/2017/1/5/team-rating-revisited-a-rival-for-mossbods  
https://www.matterofstats.com/mafl-stats-journal/2015/7/10/best-and-worst-afl-teams-2005-2015-a-mossbod-perspective  
https://hurlingpeoplenow.wordpress.com/2017/07/21/the-hpn-second-trimester-ish-awards-plus-round-17-team-ratings/  
http://www.matterofstats.com/mafl-stats-journal/2017/6/17/does-offence-or-defence-win-games  
6e. non ELO models  
https://www.microsoft.com/en-us/research/project/trueskill-ranking-system/?from=http%3A%2F%2Fresearch.microsoft.com%2Fen-us%2Fprojects%2Ftrueskill%2F  
http://www.glicko.net/glicko/glicko2.pdf  
https://cran.r-project.org/web/packages/trueskill/trueskill.pdf  
https://github.com/bhoung/trueskill-in-r  
https://github.com/JaseZiv/Dont-Blame-the-Data-Data-Files/tree/master/analysing_afl_team_age  
6f. Betting Odds models  
https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0198668 - Elo-Result, Elo-Goal and Elo-Odds model  
betting odds for AFL - http://www.aussportsbetting.com/data/historical-afl-results-and-odds-data/  
https://teddykoker.com/2019/12/beating-the-odds-machine-learning-for-horse-racing/  
6y. Team Model - benchmarking  
Benchmarking - https://squiggle.com.au/leaderboard/  
http://www.matterofstats.com/mafl-stats-journal/2017/9/12/errors-in-predicting-home-team-and-away-team-scores  
6z. Match & Finals Predictions   
https://cran.r-project.org/web/packages/fitzRoy/index.html  
https://github.com/JaseZiv/AFL-Crowd-Analytics  
https://stattraction.wordpress.com/2018/08/23/predictions-after-round-22-2018/  
https://stattraction.wordpress.com/2018/03/20/ladder-prediction-ratings-before-round-1-2018-and-some-housekeeping/  
https://stattraction.wordpress.com/2016/03/06/fixture-analysis-pre-round-1-2016/  
http://www.matterofstats.com/mafl-stats-journal/2017/8/10/how-close-has-the-2017-season-been  
http://www.matterofstats.com/mafl-stats-journal/2017/6/9/tipping-accuracy-vs-mae-as-a-footy-forecaster-metric  
http://troywheatley.blogspot.com/2018/07/afl-power-rankings-round-17-2018.html  
http://troywheatley.blogspot.com/2018/06/afl-power-rankings-round-13-2018.html  
https://thearcfooty.com/2019/09/11/ratings-and-projects-after-finals-week-1/  
http://insightlane.com/2018/07/09/the-miracle-of-the-saints-and-more-on-win-probabilities/  
Another model - http://figuringfooty.com/the-figuring-footy-predictions/  
https://multithreaded.stitchfix.com/blog/2016/11/22/nba-rankings/  - clustering  
https://towardsdatascience.com/toward-a-better-footy-tipping-model-an-analysis-of-basic-heuristics-80de4235e768  
https://medium.com/@craigjfranklin/toward-a-better-footy-tipping-model-the-folly-of-memory-9351670abe19  
https://blog.goodaudience.com/toward-a-better-footy-tipping-model-the-first-model-bbc8c67a472a  
https://towardsdatascience.com/footy-tipping-with-machine-learning-adding-player-data-9ccdab56a4c5  
weight index - http://old.clubelo.com/Articles/WeightIndex.html  
poisson and histogram - http://old.clubelo.com/Articles/AdaptivePoissonparametersandresulthistogram.html  
Use it to simulate outcomes for future matches Monte Carlo using rbinom - http://www.matterofstats.com/mafl-simulations/2015/7/7/simulating-the-finalists-for-2015-after-round-14   
7. Build a rating system for each player based on player stats  
https://twitter.com/FanFooty/status/1199904493174804480/photo/1 sample player dashboard   
https://www.americansocceranalysis.com/home/2020/8/3/defining-roles-how-every-player-contributes-to-goals  
https://www.americansocceranalysis.com/home/2020/5/5/goals-added-and-the-great-possession-shift  
https://www.thesignificantgame.com/portfolio/  
https://onballers.com/2017/08/24/five-new-afl-metrics-and-the-players-who-lead-them-in-2017/  
https://www.reddit.com/r/AFL/comments/8x17l4/machine_learning_in_afl_part_ii_its_all_about_the/  
https://www.pro-football-reference.com/blog/index37a8.html  
http://www.hpnfooty.com/?p=27528  
http://www.hpnfooty.com/?p=21810  
https://content.iospress.com/articles/journal-of-sports-analytics/jsa190290  
https://www.pro-football-reference.com/blog/index37a8.html  
https://www.pro-football-reference.com/blog/index6b92.html?p=465  
https://hurlingpeoplenow.wordpress.com/2017/08/31/introducing-player-approximate-value-pav/  
http://hurlingpeoplenow.tumblr.com/post/98964610922/hpn-draft-pick-trade-value-chart-v1  
https://hurlingpeoplenow.wordpress.com/2017/09/02/the-2017-pav-all-australian-team/  
http://www.matterofstats.com/mafl-stats-journal/2018/9/5/player-experience-data-analysis-and-modelling  
https://theafllab.com/2018/06/13/how-do-you-measure-a-players-form/  
9. Combining team and player rating data  
http://www.matterofstats.com/mafl-stats-journal/2018/10/7/a-first-attempt-at-combining-afl-team-and-player-data-in-a-predictive-model  
https://theafllab.com/2019/03/02/the-soldier-model/  
10.  Game scoring progression  
https://squiggle.com.au/0-4-futures/  
http://www.matterofstats.com/score-progressions/  
https://afltables.com/afl/stats/games/2019/031420190321.html - look at the very bottom table   
10. Read statistical models  
http://www.matterofstats.com/where-can-i-find-a-mafl-statistical-model-of-x  
http://www.matterofstats.com/where-can-i-find-an-example-of-the-use-of-x  
https://mafl-online.squarespace.com/where-can-i-find-a-mafl-analysis-of-x  
https://jamesblandecon.github.io/AFLAngleSetShots.html  
https://www.statsinsider.com.au/afl/afl-stats-review-key-statistics-that-defined-the-2019-season  
https://sites.google.com/site/jamesbland/code-examples?authuser=0  
11. Dashboards  
http://www.matterofstats.com/mafl-team-dashboards/matterofstats-2018-team-dashboard-for-round-23  
12. Textual Data  
http://www.fanfooty.com.au/game/bloglog.php?id=7201  
13.  Draft Picks and Player Salaries    
https://hurlingpeoplenow.wordpress.com/2017/04/04/who-is-your-afl-club-death-riding-this-year/  
https://overthecap.com/the-basics-and-methodology-of-projecting-the-nfls-compensatory-draft-picks/  
http://www.hpnfooty.com/?p=32006  
https://www.ft.com/content/84aa8b5e-c1a9-11e8-84cd-9e601db069b8?shareType=nongift  
https://www.bigfooty.com/forum/threads/resources-rules-and-regulations-a-guide-to-the-draft-trading-and-free-agency-in-the-afl.1229400/  draft resources  
https://www.footballdiehards.com/winning-fantasy-football-draft-strategies/  
14.  Player Analysis  
https://www.afl.com.au/news/441163/the-22-for-round-two-our-reporters-predict-your-line-ups  
http://www.matterofstats.com/mafl-stats-journal/2020/4/28/a-review-of-afl-player-rating-data  
https://pdfs.semanticscholar.org/765f/63edf57f6f349da9b716f170fc221394ba44.pdf  
https://github.com/devinpleuler/analytics-handbook  
https://statsbomb.com/articles/  
http://cs229.stanford.edu/proj2012/Kapania-FantasyFootballAndMachineLearning.pdf  
https://www.statsinsider.com.au/afl/the-stats-and-trends-that-defined-round-one  
https://www.abc.net.au/news/2020-06-11/how-richmond-tigers-afl-player-dustin-martin-destroys-compeition/12335750?section=sport  
https://squiggle.com.au/how-impressive-was-dustys-game/  
https://squiggle.com.au/is-patrick-dangerfield-having-a-better-2017-than-2016/  
http://figuringfooty.com/2017/06/01/are-west-coast-too-dependent-on-kennedy/  
http://insightlane.com/2018/10/15/buddy-900-and-benchmarking-the-greatest-goal-kickers-in-vfl-afl-history/  
https://plussixoneblog.com/post/the-deledio-effect/  
http://www.afl.com.au/stats/player-ratings/ratings-explained  
https://twitter.com/championdata/status/1200221394799222784/photo/1  player similarity  
http://www.espn.com/espn/feature/story/_/id/19122983/footy-forensics-statistics-champion-team-team-champions-2017-afl-season?ex_cid=espnTW_ANZL  
https://dreamteamtalk.com/2020/02/13/rory-laird-deck-of-dt-2020  scores by oppisition  
http://www.espn.com/espn/feature/story/_/id/20355634/footy-forensics-statistics-west-coast-josh-kennedy-season-ages  
https://towardsdatascience.com/predicting-premier-league-odds-from-ea-player-bfdb52597392  
https://arxiv.org/pdf/1802.00998.pdf  
http://www.82games.com/comm30.htm  
https://www.reddit.com/r/dataisbeautiful/comments/disxti/mlb_batting_average_leaders_over_time_oc/?utm_source=share&utm_medium=ios_app&utm_name=iossmf  
https://keeperleaguepod.com.au/breakout-tracker-out-now/  breakout tracker  
http://coachespanel.tv/what-is-the-50-most-relevant/  
https://www.afl.com.au/news/367727/secrets-to-success-how-best-to-use-the-new-utility-position-in-fantasy utility position  
15.  Bye Rounds  
http://www.espn.com/espn/feature/story/_/id/19693539/afl-footy-forensics-matt-cowgill-effects-byes  
16a. Team Stats Analysis - goal kicking accuracy or goal/score conversion  
http://figuringfooty.com/2016/07/07/the-goal-kicking-accuracy-fallacy/  create an index for each match/team during season  
http://figuringfooty.com/2016/06/29/goal-kicking-accuracy-maps-expscore/  
https://www.matterofstats.com/mafl-stats-journal/2015/11/23/scoring-shot-conversion-history-in-the-vflafl-1897-2015  
https://squiggle.com.au/its-2018/  
https://www.afl.com.au/news/41072/the-misfiring-mids-cruelling-the-dogs-finals-chances expected scores  
https://i.redd.it/pbpoki6bf6r31.png - what do teams that made the grand final look like?  filter by round name?  
16b.  Team Stat Analysis - team strength - inside 50 and scoring shots  
https://i.redd.it/c26a81z3dyw31.png  - margin of difference  
https://hurlingpeoplenow.wordpress.com/2016/04/29/lets-rate-team-strength-and-do-a-round-6-preview/  
http://www.espn.com/espn/feature/story/_/id/20157852/footy-forensics-sydney-swans-rewrite-history-how-done-it  
http://figuringfooty.com/2017/08/10/the-quality-and-quantity-of-shots-created-by-each-club/  
http://figuringfooty.com/2015/10/05/a-brief-analysis-of-scoring-shots-in-the-grand-final/  
http://figuringfooty.com/2016/08/08/match-analysis-using-shot-quality/  
http://figuringfooty.com/2016/08/04/a-model-to-predict-and-rate-shots-by-quality/ 
http://figuringfooty.com/2017/04/18/the-secret-weapon-of-the-afls-best-forward-line/  
http://www.matterofstats.com/mafl-stats-journal/2010/4/24/modelling-afl-team-scoring.html  
https://aflratings.com.au/2019/08/08/by-the-numbers-points-per-inside-50-round-20/  
http://www.matterofstats.com/mafl-stats-journal/2014/7/17/modelling-the-total-score-in-an-afl-game  
https://www.hpnfooty.com/?p=29844  
http://www.hpnfooty.com/?p=31703  
http://www.matterofstats.com/mafl-stats-journal/2013/6/29/game-statistics-and-game-outcomes.html  
https://twitter.com/championdata/status/1199475212300902401 scoring efficiency  
16c. Team Stat Analysis - kicks  
http://www.matterofstats.com/mafl-stats-journal/2013/8/13/just-for-kicks-an-analysis-of-the-kicking-statistics-in-afl.html  
https://miracleongraphs.com/2020/08/25/shooting-from-the-hipwood/  
16d. Team Stat Analysis - tackles  
https://plussixoneblog.com/post/the-tackle-machine/  
https://www.scisports.com/defensive-contribution-ratings-in-scisports-platform-enable-in-depth-data-driven-scouting-of-defenders/  
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
https://www.afl.com.au/news/377802  
https://www.jockreynolds.com.au/2020/02/26/all-of-the-jrsc-supercoach-2020-tools-in-one-place/  
16j. Team Stat Analysis - clearances and hard ball   
https://www.statsinsider.com.au/afl/understanding-how-clearances-shape-the-results-of-afl-games  
https://www.statsinsider.com.au/afl/stats-that-matter-the-hard-ball  
16.  Team Analysis  
https://www.statsinsider.com.au/afl/stats-that-matter-the-tactical-evolution-of-afl  
http://figuringfooty.com/2017/05/18/are-st-kilda-a-sleeping-giant/  
http://insightlane.com/2018/07/09/the-miracle-of-the-saints-and-more-on-win-probabilities/  
http://figuringfooty.com/2017/04/14/why-2017-results-are-flattering-the-cats/  
https://thearcfooty.com/2017/04/23/cant-eagles-fly/  
http://hurlingpeoplenow.tumblr.com/post/100067599722/jarryd-haynes-prospects-in-the-nfl  
https://hurlingpeoplenow.wordpress.com/2016/04/08/hpns-afl-round-3-preview/  
http://insightlane.com/australian-football/scoreworm/  
https://www.abc.net.au/news/2018-09-06/afl-finals-favourites-richmond-have-secret-tactic/10203884  
https://plussixoneblog.com/post/leaping-kangaroos/  
https://plussixoneblog.com/post/annus-horribilis-fremantle/  
http://figuringfooty.com/2016/09/15/a-fresh-way-to-think-about-footy-hawthorn-v-western-bulldogs/  
http://figuringfooty.com/2016/09/28/grand-final-preview-part-2-a-team-of-champions-or-a-champion-team/  
https://i.redd.it/r80p9l2zzog41.png  where do teams defend?  
17a Match Analysis  
https://mobile.abc.net.au/news/2019-09-28/the-data-says-afl-grand-final-might-be-closer-than-you-think/11549510?pfmredir=sm  
17.  Other interesting things 
https://github.com/liam-crow/stats-blog/tree/master/content/post  
https://www.crowdatascience.com/travelling-salesman-problem-in-r-with-location-data/  
https://www.thefatstats.com/post/predicting-the-brownlow-is-hard  
https://www.kaggle.com/c/google-football  look at discussions  
https://tomdecroos.github.io/reports/thesis_tomdecroos.pdf interesting charts  
https://blogs.fangraphs.com/the-fangraphs-uzr-primer/  interesting charts and primer  
https://www.reddit.com/r/datascience/comments/c4mgsg/daily_fantasy_sports_ownership_projection/?utm_source=share&utm_medium=ios_app - fantasy sports ownership   
https://www.afl.com.au/news/368098/roy-s-first-fantasy-team-and-five-simple-steps-to-making-yours  
https://www.kaggle.com/c/nfl-big-data-bowl-2020/discussion/121397 feature creation  
https://www.kaggle.com/jpmiller/nfl-punt-analytics eda  
https://www.kaggle.com/statsbymichaellopez/nfl-tracking-wrangling-voronoi-and-sonars vectirs  
https://www.kaggle.com/jaseziv83/comprehensive-cleaning-and-eda-of-all-variables eda  
https://www.kaggle.com/c/nfl-big-data-bowl-2020/discussion/112044 probability  
https://medium.com/fantasy-outliers  
https://www.datarobot.com/wiki/feature-impact/  
https://www.reddit.com/r/dataisbeautiful/comments/cc1cqf/viz_displaying_why_more_often_than_not_a_top3_rb/?utm_source=share&utm_medium=ios_app - position importance  
https://blog.datarobot.com/using-datarobot-to-predict-nba-player-performance  
https://becominghuman.ai/a-i-fantasy-football-week-to-week-projections-e7f8895e9cb1  
https://arxiv.org/pdf/1604.01455v2.pdf  
http://cs229.stanford.edu/proj2012/Kapania-FantasyFootballAndMachineLearning.pdf  
https://pdfs.semanticscholar.org/8e84/933903df9c5d2f73770ba6c9be8da31a751b.pdf  
https://www.kdnuggets.com/2018/08/optimization-101-data-scientists.html  
https://github.com/FantasyFootballAnalytics/FantasyFootballAnalyticsR/tree/master/R%20Scripts  
https://github.com/BriBecker/FantasyFootballAnalyticsR  
https://github.com/zzhangusf/Predicting-Fantasy-Football-Points-Using-Machine-Learning/blob/master/README.md  
https://www.pro-football-reference.com/blog/indexd65e.html?cat=8  
https://hurlingpeoplenow.wordpress.com/2016/07/15/round-17-close-games-are-still-basically-random/  
http://figuringfooty.com/2016/09/30/grand-final-preview-part-4-reader-questions/  
http://www.afl.com.au/news/2018-06-05/the-stats-files-the-three-keys-to-winning-games-in-2018  
https://www.abc.net.au/news/2017-09-07/what-chance-do-teams-really-have-of-winning-the-afl-grand-final/8862758  
https://plussixoneblog.com/post/the-round-7-rule/  
https://plussixoneblog.com/post/beyond-the-8-point-game-estimating-match-importance-in-the-afl/  
http://figuringfooty.com/2017/06/28/every-shot-in-the-2017-coleman-medal-race/  
http://footymaths.blogspot.com/2017/07/16-transition-rendition.html  
https://thearcfooty.com/2017/02/16/who-do-you-think-will-make-the-finals/  
http://footymaths.blogspot.com/2017/03/post-jlt-break.html  
http://www.matterofstats.com/mafl-stats-journal/2017/2/20/selected-afl-twitter-networks  
http://www.matterofstats.com/mafl-stats-journal/2014/3/7/attaching-probabilities-to-game-margins-the-magic-of-quantile-regression  
http://www.espn.com/espn/feature/story/_/id/19013312/footy-forensics-statistics-prove-crunch-already-2017-afl-season  
http://www.espn.com/espn/feature/story/_/id/19501873/footy-forensics-your-afl-club-key-game-trend-part-ii  
http://www.espn.com/espn/feature/story/_/id/19449458/footy-forensics-your-afl-club-key-game-trend  
https://squiggle.com.au/time-in-front-vs-wins/  
http://www.espn.com/espn/feature/story/_/id/20231436/footy-forensics-afl-finals-swing-which-games-matter-most  
https://legacy.baseballprospectus.com/glossary/index.php?context=6&category=true  
https://projects.fivethirtyeight.com/complete-history-of-the-nba/#warriors  
https://thearcfooty.com/2017/04/07/fantasy-points-what-are-they-good-for/  
http://www.espn.com/espn/feature/story/_/id/19348021/footy-forensics-afl-changing-game-trends-2017  
18. Fantasy Analysis  
https://brendankent.com/2020/09/15/coding-for-sports-analytics-resources-to-get-started/  
https://baseballwithr.wordpress.com/about/  
https://www.afl.com.au/news/510972/luck-or-skill-fantasy-champ-shares-his-secrets-to-success  
https://www.afl.com.au/news/512563/by-the-numbers-best-average-top-scores-biggest-rise-largest-fall-more  
https://dreamteamtalk.com/2020/09/22/2020-hindsight-heroes  
https://dreamteamtalk.com/2020/10/04/centre-bounce-attendances-2020  
https://theafllab.com/2019/03/19/theres-no-2019-preview-why/  
https://aflratings.com.au/2019/05/16/afl-fantasy-team-points-round-8-2/  
https://www.statsinsider.com.au/afl/brownlow  
https://github.com/cardchase/Soccer-Betting  
https://www.kaggle.com/c/nfl-big-data-bowl-2021  
https://www.reddit.com/r/fantasyfootball/comments/jagtm0/defensive_maneuvers_week_6_dst_rankings/?utm_source=share&utm_medium=ios_app&utm_name=iossmf  
http://www.sqlservercentral.com/blogs/sql-with-dustin-ryan/2016/08/23/power-bi-nfl-fantasy-football-2016-reports/  powerbi  
http://dreamteamtalk.com/wp-content/uploads/2011/03/afldreamteamcheatsheet2011.pdf  - visualisation  
https://magicnumbertheory.wordpress.com/2016/05/26/bye-planner-v2/ - visualisation    
https://dreamteamtalk.com/2019/11/24/2019-afl-draft-fantasy-prospects/  
https://keeperleaguepod.com.au/afl-draft-club-fantasy-scores/  
https://keeperleaguepod.com.au/top-20-fantasy-draftees/ draft players  
https://towardsdatascience.com/mythbusting-fantasy-premier-league-form-over-fixtures-eecf9022e834  
https://medium.com/@jonathan_hui/rl-lqr-ilqr-linear-quadratic-regulator-a5de5104c750  
http://www.afl.com.au/news/2018-02-13/how-to-dominate-fantasy-2017s-winner-reveals-all  
https://aflratings.com.au/category/injuries/ - Injury weekly pages  
http://www.fanfooty.com.au/blog/  - news pages to scrape  
https://www.espn.com/soccer/english-premier-league/story/4061662/how-firmino-and-salahsterling-and-de-bruyne-rank-among-best-duos-in-soccer-when-it-comes-to-chemistry - duos  
https://aflfantasies.com/2018/buyer-beware-part-2/  
https://aflfantasies.com/2018/band-brothers-part-3/  
https://magicnumbertheory.wordpress.com/2016/05/26/bye-planner-v2/  
https://towardsdatascience.com/fantasy-football-artificial-intelligence-cheat-sheet-ac172a23e2e1 - cheat sheet     
https://dreamteamtalk.com/2013/05/28/traded-players-output-v-expectations/ output vs expectations  
https://dreamteamtalk.com/2013/04/18/mythbusting-dt-insider-guest-post/ strategies  
https://dreamteamtalk.com/2012/05/09/hooks-quarterly-review/  
https://dreamteamtalk.com/2017/09/11/the-2017-optimal-afl-fantasy-team-finally-proves-link-between-genius-and-madness/  
https://dreamteamtalk.com/2018/08/01/how-do-you-compare-to-the-top-100-afl-fantasy-coaches-finals-2018/  
https://dreamteamtalk.com/2013/05/20/managing-your-afl-fantasy-dream-team-through-the-byes/  
https://supercoachtalk.com/supercoach-points-distribution/  
https://dspace.mit.edu/handle/1721.1/100687  
https://pdfs.semanticscholar.org/8e84/933903df9c5d2f73770ba6c9be8da31a751b.pdf  
Stanford - http://cs229.stanford.edu/proj2012/Kapania-FantasyFootballAndMachineLearning.pdf  
https://www.fantasyinsider.com.au/blog/Advanced%20Strategy/afl-analysis-should-favourite-stacks-include-the-defenders  
https://www.fantasyinsider.com.au/blog/AFL/a-beginners-guide-to-afl-dfs-game-day-strategies  
https://fantasyfootballanalytics.net/2013/06/win-your-fantasy-football-auction-draft.html  
https://github.com/zzhangusf/Predicting-Fantasy-Football-Points-Using-Machine-Learning/blob/master/README.md  
https://github.com/google-research/football - google football   
https://medium.com/@GregorydSam/best-football-analytics-pieces-e532844b12e - football analytical articles   
https://www.reddit.com/r/aflfantasy/comments/cgk6tq/planning_for_2020_already_things_i_learned_being/?utm_source=share&utm_medium=ios_app   
https://amiles.netlify.com/2019/09/building-optimal-daily-fantasy-lineups-in-r/?utm_campaign=Data_Elixir&utm_medium=email&utm_source=Data_Elixir_252  
https://fantasyfootballdatapros.com/index.php/2020/01/02/how-to-get-started-using-python-for-fantasy-football-analysis/  
https://towardsdatascience.com/basketball-analytics-predicting-win-shares-7c155651e7cc  
https://medium.com/@bdruby01  
https://i.redd.it/z845a74zlgb41.png  
https://i.redd.it/daf66mqqqsc41.png  
https://medium.com/@GregorydSam/best-football-analytics-pieces-e532844b12e  
https://preview.redd.it/otuo2ylmpl641.gif?format=mp4&s=a3b7c45fa6e2c9df168dac2772397955ad3585c9  
https://aflratings.com.au/2019/12/18/afl-fantasy-new-utility-position-strategy/  
https://squiggle.com.au/some-useful-things-i-learned-about-football/  
Implementation of Reinforcement Learning Algorithm for Fantasy Football - https://www.aaai.org/ocs/index.php/AAAI/AAAI12/paper/download/5088/5473    
Soccer Analysis Positions  https://arxiv.org/pdf/2003.10294.pdf  
18. Bookmaker Oddds  
https://cran.r-project.org/web/packages/implied/index.html  
http://lkm.fri.uni-lj.si/uploads/eriks/strumbelj_workingpaper2013.pdf  
https://help.smarkets.com/hc/en-gb/articles/115001457989-How-to-calculate-Poisson-distribution-for-football-betting  
https://www.sbo.net/strategy/football-prediction-model-poisson-distribution/  
20a. Player Positions  
https://www.foxsports.com.au/afl/mitch-robinson-why-allaustralian-panel-made-a-mockery-of-players-by-not-selecting-genuine-wingmen/news-story/9e0d4e49d1770d54788d0a2174461cef 
https://www.statsinsider.com.au/afl/size-matters-the-types-of-forwards-scoring-for-and-against-your-club  
https://www.statsinsider.com.au/afl/beyond-the-goals-how-afl-tall-forwards-compare-across-some-unsung-stats  
https://www.statsinsider.com.au/afl/afl-stats-that-matter-the-changing-face-of-the-forward  
21. R Dashboards for Fantasy Football  
https://www.r-bloggers.com/2017-fantasy-football-projections/  
https://fantasyfootballanalytics.net/  
https://rforjournalists.com/2019/11/12/how-to-track-your-fantasy-football-league-using-r/  
https://nycdatascience.com/blog/student-works/nfl-dashboard-turns-play-by-play-data-into-actionable-insights-for-fantasy-football/  
https://www.kaggle.com/ekrembayar/fifa-19-dashboard-with-r-shiny  look at all notebooks for chart ideas  
https://ekrem-bayar.shinyapps.io/FifaDash/ same as above with excellent dashboard layout and format  
https://www.footballdiehards.com/winning-fantasy-football-draft-strategies/  
https://wesleypasfield.wordpress.com/2017/11/13/hosting-an-r-shiny-application-on-amazon-ec2/  hosting on amazon  
https://www.splunk.com/en_us/blog/platform/how-to-win-at-fantasy-football-with-splunk-and-machine-learning-part-2.html   
https://scplaybook.com.au/category/playmakers-insights/  example page  
22. Images  
https://ccsearch.creativecommons.org/photos/04443241-fe18-4c77-b7c8-f5b5e0fbdf79  
https://ccsearch.creativecommons.org/photos/2549449d-535b-47d9-8be4-6c8555c3601a  
https://ccsearch.creativecommons.org/photos/ca004486-1c61-40cd-b8c7-8511e10f78c1  
https://ccsearch.creativecommons.org/photos/c244a04f-3ae6-46d1-bd5d-6db2b9402de3  
https://ccsearch.creativecommons.org/photos/eceebbe4-d245-44b0-9bfc-b62937df99a2  
https://ccsearch.creativecommons.org/photos/dab7e935-6aec-4606-aec6-797e83a2a528  
https://ccsearch.creativecommons.org/photos/dfb64502-8006-4a12-8df5-6ea372228faa  
https://ccsearch.creativecommons.org/photos/c537c085-bc15-480b-991e-3a0005cec7ef  
