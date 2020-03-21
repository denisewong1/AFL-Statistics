Player Performance Prediction : Predicting how well a player will perform in the real-world and therefore the number of points that a player will obtain both in a single game and over a given time period.  
- how well an individual is likely to perform varies with position that the player plays in.  For example a strikers performance will depend on the number of goals he will score while a defenders performance will depend on the strength of the other team.
- how likely a player is to play a given game as players may not player due to injuries and tactical decisions.

One way is to assign probability of player scoring points based on four most significant point scoring categories -  
1. Player appearance in a game (worth 2pts over 60 mins, 1pt below 60 minutes) using a three state categorical distribution ie starting, substitute or unused.  Three probabilities are computed for each category and the highest probability is assigned to player to obtain predicted points.  
2. Clean sheet (worth 4pts to defender and 1pt to midfielder).  For clean sheet the probability of a team not conceding can be calculated using the scoreline distributions and points can be predicted based on this probability.  
3. Goals scored (worth 6pts for defender, 5pts for midfielder and 4pts for striker).  This is calculated using a Bernoulli or Binomial distribution over a single trial describing a players probability of scoring the goal given he was playing at the time.  
4. Goals created (worth 3pts per player) - another Bernoulli distribution is used for this again describing the players proability of creating the goal given he as playing at the time.  

Team Formation Optimization : Selecting an optimal team using the performance predictions so that the constraints of the fantasy league are met.  This also includes the challenge of making effective transfers in the longer fantasy leagues.  

Four different approaches may be considered.  
1. Selecting a completely random team to loosely model the behaviour of a human with no knowledge of the sport.  
2. Selecting a random team from a filtered dataset with just the higher performing players.  This is to loosely mimic the behaviour of a player with general knowledge of the sport.  
3. A filtered optimized approach picks a team from the filtered set and uses a brute force algorith to select the best team based on maximizing the predicted points that fits the constraints.  
4. Filtered actual best selects the best possible team from the filtered dataset to give a view of what the best performing team would be (this approach does not consider the budget constraint on total values).  
Using the player points prediction models discussed 100 teams are selected using each of the above methods for each prediction method using the following metrics - average points return of the 100 teams, maximum points return and the percentage of teams that produce a profit.  

Other challenges are player price forecasts, opponent modelling after every match, draft strategies and betting strategies to maximize the chances of winning cash in DFS fantasy games.  
1. Injury prediction and prevention - how do we use the features to predict probability of injury which could be based on player position or the individual actions taken by the player?  How do we consider the number of days played between consecutive matches?  



