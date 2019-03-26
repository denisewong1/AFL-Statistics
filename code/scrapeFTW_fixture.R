## i got busted for using it too often in development ... works sometimes
## https://www.footywire.com/afl/footy/ft_match_list?year=2010


## usage notes
##xseason <- 2019
##df <- scrapeFTW_fixture(xseason)
##filename <- paste(dirData,xseason,"_FTW_fixture.csv",sep="")
##write.csv(df, filename, row.names = FALSE)


scrapeFTW_fixture <- function(xseason) {
    
    ## team name and round lookup
    lstTeam <- as.data.frame(rbind(
        c("AD","Adelaide"), c("BL","Brisbane"),   c("CA","Carlton"), 
        c("CW","Collingwood"), c("ES","Essendon"),  c("GC","Gold Coast"), 
        c("FR","Fremantle"),  c("GE","Geelong"), c("GW","GWS"),  
        c("HW","Hawthorn"),  c("ME","Melbourne"), c("NM","North Melbourne"), 
        c("PA","Port Adelaide"), c("RI","Richmond"), c("SK","St Kilda"),  
        c("SY","Sydney"), c("WB","Western Bulldogs"),   c("WC","West Coast")),
        stringsAsFactors=FALSE)
    names(lstTeam) <- c("TeamID","Name")
    
    lstRound <- as.data.frame(rbind(
        c("R01","Round 1"), c("R02","Round 2"), c("R03","Round 3"), 
        c("R04","Round 4"), c("R05","Round 5"), c("R06","Round 6"),
        c("R07","Round 7"), c("R08","Round 8"), c("R09","Round 9"),
        c("R10","Round 10"), c("R11","Round 11"), c("R12","Round 12"),
        c("R13","Round 13"), c("R14","Round 14"), c("R15","Round 15"),
        c("R16","Round 16"), c("R17","Round 17"), c("R18","Round 18"),
        c("R19","Round 19"), c("R20","Round 20"), c("R21","Round 21"),
        c("R22","Round 22"), c("R23","Round 23"), c("R24","Round 24"),
        c("QF","Qualifying Final"), c("SF","Semi Final"), 
        c("PF","Preliminary Final"), c("EF","Elimination Final"),
        c("GF","Grand Final")), stringsAsFactors=FALSE)
    names(lstRound) <- c("Round","Round.Number")
    
    ## make url and download file
    url <- paste0("https://www.footywire.com/afl/footy/ft_match+list?year=",
                  xseason,sep="")
    
    download.file(url,"afl.html")
    doc.page <- readLines("afl.html")
    length(doc.page)
    
    ## find start line
    doc.pattern <- "Home v Away Teams"
    doc.start <- grep(doc.pattern, doc.page) - 4
    doc.end <- length(doc.page)
    doc.page <- doc.page[doc.start[1]:doc.end]

    ## tidy formatting and remove empty rows
    doc.page <- doc.page %>%
        str_replace_all(pattern = "<.*?>", replacement = " ") %>%
        str_replace_all(pattern = "&nbsp;", replacement = " ") %>%
        str_replace_all(pattern = "\\s+", replacement = " ") %>%
        str_replace_all(pattern = "^ ", replacement = "") %>%
        str_replace_all(pattern = "^First ", replacement = "") %>%
        str_replace_all(pattern = "^Second ", replacement = "") 
    doc.page <- doc.page[-which(doc.page=="")]
    
    ## find end line
    doc.pattern <- "AFL Fixture"
    doc.end <- grep(doc.pattern, doc.page) - 1
    doc.start <- 1
    doc.page <- doc.page[1:doc.end[1]]
    
    ## this gets player names and removes goals column
    doc.pattern <- "^[[:upper:]][.] [A-Z].*?[a-z] .*?[0-9] $"
    doc.page <- doc.page[-grep(doc.pattern, doc.page)]
    doc.pattern <- "Goals"
    doc.page <- doc.page[-grep(doc.pattern, doc.page)]
    doc.page <- str_trim(doc.page)
    doc.pattern <- "^-"
    doc.page <- doc.page[-grep(doc.pattern, doc.page)]    
    
    ##doc.pattern <- "BYE"
    ##doc.page <- doc.page[-(grep(doc.pattern, doc.page)-1)]
    ##doc.page <- doc.page[-grep(doc.pattern, doc.page)]
    
    ## make list of rounds
    doc.pattern1 <- "^Date"  
    doc.round <- grep(doc.pattern1, doc.page) 
    doc.page[doc.round-1]
    
    ## make list of games
    doc.pattern2 <- "^v"  
    doc.match <- grep(doc.pattern2, doc.page)
    doc.page[doc.match-2]
    doc.page[doc.match-1]
    doc.page[doc.match+1]
    doc.page[doc.match+2]
    
    df <-  data.frame(matrix(ncol=5,nrow=length(doc.match)), 
                      stringsAsFactors=FALSE)
    colnames(df) <- c("Round.Number","Kickoff","Home","Away","Venue")
    
    iround <- 1
    for (i in 1: length(doc.match)) {
        if (doc.match[i] > doc.round[min(iround+1,length(doc.round))]) { 
            iround <- min(iround + 1,length(doc.round)) }
        imatch <- doc.match[i]
        df$Round.Number[i] <- doc.page[doc.round[iround]-1]
        df$Kickoff[i] <- doc.page[doc.match[i]-2]
        df$Home[i] <- doc.page[doc.match[i]-1]
        df$Away[i] <- doc.page[doc.match[i]+1]
        df$Venue[i] <- doc.page[doc.match[i]+2]
    }

    ## convert match date to date/time
    splitDate <- as.data.frame(do.call(rbind,str_split(df$Kickoff," ")),
                               stringsAsFactors=FALSE)
    df <- df %>%
        mutate(MatchDay = splitDate[,1]) %>%
        mutate(MatchTime = splitDate[,4]) %>%
        mutate(MatchDate =paste(splitDate[,2],splitDate[,3],xseason,sep=" "))%>%
        mutate(MatchDate = as.Date(MatchDate,"%d %b %Y"))
        
    ## tidy up team names and round numbers
    df <- df %>%
        rename(Name = Home) %>%
        left_join(lstTeam, by= c("Name")) %>%
        rename(TeamIDHome = TeamID) %>%
        select(-Name) 
    df <- df %>%
        rename(Name = Away) %>%
        left_join(lstTeam, by= c("Name")) %>%
        rename(TeamIDAway = TeamID) %>%
        select(-Name)  
    df <- df %>%
        left_join(lstRound, by= c("Round.Number")) %>%
        mutate(Season = xseason) %>%
        select(-Round.Number)
                      
    ## reorder columns
    df <- df %>% 
        select(Season, Round, MatchTime, MatchDay, MatchDate, 
               TeamIDHome, TeamIDAway, Venue)
    
    ## check for na's
    ## print(sum(is.na(df)==TRUE))
    return(df)
    
}

