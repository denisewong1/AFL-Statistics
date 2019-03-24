## sample url and run
## url <- "https://www.afl.com.au/match-centre/2019/1/carl-v-rich"
## df <- scrapeAFL_teamlineup(2019,1,"CA","RI")


## function to scrape team line up
scrapeAFL_teamlineup <- function(xseason,xround,TeamIDHome,TeamIDAway) {

    options(warn=-1)
    
    ## code conversion list
    lstTeam <- as.data.frame(rbind(
        c("AD","adel"), c("BL","bl"),   c("CA","carl"), c("CW","coll"), 
        c("ES","ess"),  c("GC","gcfc"), c("FR","fre"),  c("GE","geel"), 
        c("GW","gws"),  c("HW","haw"),  c("ME","melb"), c("NM","nmfc"), 
        c("PA","port"), c("RI","rich"), c("SK","stk"),  c("SY","syd"), 
        c("WB","wb"),   c("WC","wce")))
    names(lstTeam) <- c("TeamID","Code")
    
    lstLineup <- as.data.frame(rbind(
        c("I/C","bench"), c("Emg","emerg"),
        c("B","match"),  c("HB","match"),  c("C","match"),
        c("F","match"),  c("Fol","match"), c("HF","match"),
        c("SUB","match")))
    names(lstLineup) <- c("Cat","Type")    
        
    
    ## make url
    codeHome <- as.character(lstTeam$Code[lstTeam$TeamID==TeamIDHome])
    codeAway <- as.character(lstTeam$Code[lstTeam$TeamID==TeamIDAway])
    url <- paste0("https://www.afl.com.au/match-centre/",xseason,"/",
                  xround,"/",codeHome,"-v-",codeAway,sep="")
    
    ## read page    
    afldata <- read_html(url) %>% 
        html_nodes('.posGroup') %>%
        html_text() 
    
    ## tidy formatting
    afldata <- afldata %>%
        str_replace_all(pattern = "\n", replacement = " ") %>%
        str_replace_all(pattern = "\t", replacement = " ") %>%
        str_replace_all(pattern = ", ", replacement = ";") %>%
        str_replace_all(pattern = "\\s+", replacement = " ") %>%
        str_replace_all(pattern = "^ ", replacement = "") %>%
        str_replace(pattern = " ", replacement = "; ")
    
    ## designate home teams
    lineupHome <- afldata[1:8]
    teamHome <- paste(lineupHome,strrep("; ",9-str_count(lineupHome,";")))
    teamHome <- strsplit(teamHome,"; ")
    teamHome <- as.data.frame(matrix(unlist(teamHome),nrow=8,byrow=T))
    teamHome <- teamHome %>% 
        rename(Cat = V1) %>%
        melt(id.vars="Cat") %>%
        mutate(TeamID = TeamIDHome) %>%
        mutate(HomeAway = "Home") 
        
    
    ## designate home teams
    lineupAway <- afldata[11:18]
    teamAway <- paste(lineupAway,strrep("; ",9-str_count(lineupAway,";")))
    teamAway <- strsplit(teamAway,"; ")
    teamAway <- as.data.frame(matrix(unlist(teamAway),nrow=8,byrow=T))
    teamAway <- teamAway %>% 
        rename(Cat = V1) %>%
        melt(id.vars="Cat") %>%
        mutate(TeamID = TeamIDAway) %>%
        mutate(HomeAway = "Away") 
    
    ## tidy formatting and add additional columns
    dfTeam.Lineup <- rbind(teamHome,teamAway) %>%
        mutate(value = gsub("^ *|(?<= ) | *$", "", value, perl = TRUE)) %>%
        filter(value!="") %>%
        select(-variable) %>%
        arrange(TeamID, Cat) %>%
        full_join(lstLineup,by=c("Cat")) %>%
        filter(!is.na(value)) %>%
        mutate(Season = xseason) %>%
        mutate(Round.Number = xround) %>%     
        rename(Player.Name = value) %>%
        select(Season,Round.Number,TeamID,HomeAway,Cat,Type,Player.Name)
    
    options(warn=0)    
    return(dfTeam.Lineup)
    
}



## test code
## alternate read versions - can be split on \n or \t
##afldata <- read_html(url) %>% 
##    html_nodes('.posGroup') %>%
##    html_text() %>%
##    strsplit(split = "\t") %>% 
##    unlist() %>%
##    .[. != ""]

## player names - testing alternate versions
##afldatav2 <- read_html(url) %>% 
##    html_nodes('.posGroup') %>%
##    html_nodes('li') %>%
##    html_text()   

## player positions - testing alternate versions
##afldatav3 <- read_html(url) %>% 
##    html_nodes('.posGroup') %>%
##    html_nodes('.pos') %>%
##    html_text()   


## old code
## remove formatting
##afldata <- gsub("\n","",afldata)
##afldata <- gsub("\t","",afldata)
##afldata <- gsub(", ",";",afldata)
##afldata <- gsub("^ *|(?<= ) | *$", "", afldata, perl = TRUE) 
##afldata <- gsub("I/C", "IC", afldata, perl = TRUE) 
##afldata <- sub(" ","; ",afldata)