

| Category       | Statistic    | Alt Name     | Description  |
| :------------- | :----------: | -----------: | -----------: |
| Aggregate      | AF           | And Again    | AFL Fantasy Points    |
| Aggregate      | CL           | Like this \| | Clearances |
| Aggregate      | DI           | And Again    | Disposals    |
| Aggregate      | MK           | And Again    | Marks    |
| Aggregate      | SC           | And Again    | Supercoach Score    |
| Aggregate      | TK           | And Again    | Tackles    |
| Disposal       | BO           | Like this \| | Bounces |
| Disposal       | ED           | Like this \| | Effective Disposal |
| Disposal       | HB           | Like this \| | Handballs |
| Disposal       | HO           | Like this \| | Hitouts |
| Disposal       | KI           | Like this \| | Kicks |
| Disposal       | MG           | Like this \| | Metres Gained |
| Other          | BH           | Like this \| | Behinds |
| Other          | CG           | Like this \| | Clangers |
| Other          | FA           | Like this \| | Frees For |
| Other          | FF           | Like this \| | Frees Against |
| Other          | GA           | Like this \| | Goal Assists |
| Other          | GL           | Like this \| | Goals |
| Other          | I5           | Like this \| | Inside 50 |
| Other          | OP           | Like this \| | One Percenters |
| Other          | R5           | Like this \| | Rebound 50 |
| Other          | SI           | Like this \| | Score Involvement |
| Other          | TO           | Like this \| | Turnover |
| Possession     | CM           | Like this \| | Contested Mark |
| Possession     | CP           | Like this \| | Contested Possession |
| Possession     | CC           | Like this \| | Centre Clearance |
| Possession     | IT           | Like this \| | Intercept |
| Possession     | M5           | Like this \| | Marks Inside 50 |
| Possession     | MX           | Like this \| | Marks Other |
| Possession     | ST           | Like this \| | Stoppage Clearance |
| Possession     | T5           | Like this \| | Tackles Inside 50 |
| Possession     | TX           | Like this \| | Tackles Other |
| Possession     | UP           | Like this \| | Uncontested Possession |
| Ratio          | DE           | Like this \| | Disposal Efficiency | 
| Ratio          | GP           | Like this \| | Goal Accuracy | 
| Ratio          | TG           | Like this \| | Time on Ground | 
 
 
 CL = ST + CC : total clearances = stoppage + centre clearances
DI = KI + HB : disposals = kicks + handballs  
dream team score is linear combination  
AF = BH + FA + FF + GL + HB + HO + KI + MK + TK 
 
   lstStat$Match <- c("BH","BO","CC","CG","CM","CP","ED","FA","FF","GA",
                   "GL","HB","HO","I5","IT","KI","M5","MG","MX","OP",
                   "R5","SX","ST","T5","TX","TO","UP")
lstStat$Play <- c("Played","GN","TG")
lstStat$Total <- c("BG","CL","DI","MK","TK","SI","SS")
lstStat$Ratio <- c("DE","GP","CU")
lstStat$Adv <- c("CC","IT","MG","SX","ST","T5","TX","TO")
lstStat$Pos <- c("DEF","FOR","MID","RUC")
lstStat$AF <- c("AF","AF.Price","AF.Value","AF.Score")
lstStat$SC <- c("SC","SC.Price","SC.Value","SC.Score")
lstStat$All <- unique(c(lstStat$Match,lstStat$Play,lstStat$Total,lstStat$Adv,
                        lstStat$Ratio,lstStat$Pos,lstStat$AF,lstStat$SC))

# Other Groupings
lstStat$LocFwd <- c("GL","BH","I5","M5","T5","GA","SI","SX","SS")
lstStat$LocMid <- c("ST","CC","CL","TX","MX")
lstStat$LocDef <- c("R5")
lstStat$Possession <- c("MX","M5","TX","T5","CP","UP","CM","IT")
lstStat$Disposal <- c("HO","KI","HB","GL","BH","MG","ED","BO")
lstStat$Pressure <- c("CM","CP","TX","T5","HO","CC","ST")
lstStat$Error <- c("CG","FA")
lstStat$Other <- c("TO","FF","OP","SX","GA")
  
  Feature Creation
  * BG : Hard Ball Get = TK + CL + CP
* MX : Marks not inside 50
* SX : Score involvement excluding scoring shots
* TX : Tackles not inside 50
* SS : Scoring Shots  
* GN : Game Number since 2010

Ratios have to be recreated at other grouping levels
* CU : Contested to uncontested possession percentage 
* GP : Goal kicking accuracy
