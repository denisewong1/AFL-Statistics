## the text i want starts after row 1200
## i got busted for doing too much scraping ... this might no longer work
## https://www.footywire.com/afl/footy/ft_match_list?year=2010


scrapeAFL_fixture <- function(xseason) {
    
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
    doc.pattern <- "BYE"
    doc.page <- doc.page[-(grep(doc.pattern, doc.page)-1)]
    doc.page <- doc.page[-grep(doc.pattern, doc.page)]
    
    
    ## there should now be 7 columns of data
    nMatch <- length(doc.page)/7
    df <- data.frame(matrix(unlist(doc.page),nrow=nMatch,byrow = T),
                     stringsAsFactors = FALSE)
    
    ## tidy up columns
    colnames(df) <- c("MatchDate","Home","v","Away","Venue","Crowd","Result")
    for (i in 1:nMatch) {
        if (df$Home[i]=="Date") { Round.Number <- df$MatchDate[i]}
        df$v[i] <- Round.Number
    }
    df <- df %>% filter(Home != "Date") %>% rename(Round.Number = v)
    df$Crowd <- as.numeric(df$Crowd)

    ## convert match date to date/time
    splitDate <- as.data.frame(do.call(rbind,str_split(df$MatchDate," ")),
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
        select(-Round.Number)     
                      
    ## reorder columns
    df <- df %>% 
        select(Round, MatchTime, MatchDay, MatchDate, 
               TeamIDHome, TeamIDAway, Venue, Crowd, Result)
    
    ## check for na's
    print(sum(is.na(df)==TRUE))
    return(df)
    
}
    