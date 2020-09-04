Ratios have to be recreated for other grouping levels : eg team, season etc


| Category       | Statistic    | Alt Name     | Description            | Notes  |
| :------------- | :----------: | -----------: | ---------------------: | -----------: |
| Aggregate      | AF           | And Again    | AFL Fantasy Points     | BH + FA + FF + GL + HB + HO + KI + MK + TK |
| Aggregate      | BG           | And Again    | Hard Ball Get          | TK + CL + CP : to create |
| Aggregate      | CL           | Like this \| | Clearances             | ST + CC |
| Aggregate      | DI           | And Again    | Disposals              | KI + HB |
| Aggregate      | MK           | And Again    | Marks                  | |
| Aggregate      | SC           | And Again    | Supercoach Score       | |
| Aggregate      | SS           | And Again    | Scoring Shots          | BH + GL |
| Aggregate      | SX           | And Again    | SI less scoring shots  | SI - GL - BH |
| Aggregate      | TK           | And Again    | Tackles                | |
| Disposal       | BO           | Like this \| | Bounces                | |
| Disposal       | ED           | Like this \| | Effective Disposal     | |
| Disposal       | HB           | Like this \| | Handballs              | |
| Disposal       | HO           | Like this \| | Hitouts                | |
| Disposal       | KI           | Like this \| | Kicks                  | |
| Disposal       | MG           | Like this \| | Metres Gained          | |
| Other          | BH           | Like this \| | Behinds                | |
| Other          | CG           | Like this \| | Clangers               | |
| Other          | FA           | Like this \| | Frees For              | |
| Other          | FF           | Like this \| | Frees Against          | |
| Other          | GA           | Like this \| | Goal Assists           | |
| Other          | GL           | Like this \| | Goals                  | |
| Other          | GN           | Like this \| | Game No since 2010     | new feature : to create |
| Other          | I5           | Like this \| | Inside 50              | |
| Other          | OP           | Like this \| | One Percenters         | |
| Other          | R5           | Like this \| | Rebound 50             | |
| Other          | SI           | Like this \| | Score Involvement      | |
| Other          | TO           | Like this \| | Turnover               | |
| Possession     | CM           | Like this \| | Contested Mark         | |
| Possession     | CP           | Like this \| | Contested Possession   | |
| Possession     | CC           | Like this \| | Centre Clearance       | |
| Possession     | IT           | Like this \| | Intercept              | |
| Possession     | M5           | Like this \| | Marks Inside 50        | |
| Possession     | MX           | Like this \| | Marks Other            | MK - M5 |
| Possession     | ST           | Like this \| | Stoppage Clearance     | |
| Possession     | T5           | Like this \| | Tackles Inside 50      | |
| Possession     | TX           | Like this \| | Tackles Other          | TK - T5 |
| Possession     | UP           | Like this \| | Uncontested Possession | |
| Ratio          | CU           | Like this \| | Contested Possession % | Contested to uncontested possession percentage : to create |
| Ratio          | DE           | Like this \| | Disposal Efficiency    |  |
| Ratio          | GP           | Like this \| | Goal Accuracy          | new feature : to create |
| Ratio          | TG           | Like this \| | Time on Ground         |  |
 

#### Groups : lstStat 
* some groups have not yet been created, or have not found use for yet  

| Category       | Notes            | Statistic       | 
| :------------- | :--------------: | :----------: | 
| Match          | fully available  | "BH","BO","CC","CG","CM","CP","ED","FA","FF","GA","GL","HB","HO","I5","IT","KI","M5","MG","MX","OP","R5","SX","ST","T5","TX","TO","UP" |
| Play           | match statistic  | "Played","GN","TG" |
| Total          | aggregate        | BG","CL","DI","MK","TK","SI","SS" |
| Ratio          | ratio            | "DE","GP","CU" | 
| Adv            | from 2015 incl   | "CC","IT","MG","SX","ST","T5","TX","TO" |    
| Pos            | position         | "DEF","FOR","MID","RUC" | 
| AF             | AFL Fantasy      | "AF","AF.Price","AF.Value","AF.Score" | 
| SC             | Supercoach       | "SC","SC.Price","SC.Value","SC.Score" | 
| All            | complete         | lstStat$Match,lstStat$Play,lstStat$Total,lstStat$Adv,lstStat$Ratio,lstStat$Pos,lstStat$AF,lstStat$SC | 
| Location       | location         | "GL","BH","I5","M5","T5","GA","SI","SX","SS","ST","CC","CL","TX","MX","R5" | 
| Possession     | possession       | "MX","M5","TX","T5","CP","UP","CM","IT" | 
| Disposal       | disposal         | "HO","KI","HB","GL","BH","MG","ED","BO" | 
| Pressure       | pressure         | "CM","CP","TX","T5","HO","CC","ST" | 
| Error          | error            | "CG","FA" | 
| Other          | other            | "TO","FF","OP","SX","GA" | 

  
