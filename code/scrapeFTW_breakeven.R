## contents of webpage updated weekly without history
## https://www.footywire.com/afl/footy/dream_team_breakevens



## scrape player breakevens
scrapeFTW_breakeven <- function() {
    
    
    url <- "https://www.footywire.com/afl/footy/dream_team_breakevens"
    
    download.file(url,"afl.html")
    doc.page <- readLines("afl.html")
    length(doc.page)    
    
    
    ## find approx start line
    doc.pattern <- "AFL Fantasy Breakevens \\(Round "
    doc.start <- grep(doc.pattern, doc.page)
    doc.end <- length(doc.page)
    doc.page <- doc.page[doc.start[1]:doc.end]
    
    ## tidy some formatting
    doc.page <- doc.page %>%
        str_replace_all(pattern = "</t.*?>", replacement = " ") %>%
        str_replace_all(pattern = "<t.*?>", replacement = " ") %>%
        str_replace_all(pattern = "&nbsp;", replacement = " ") %>%
        str_replace_all(pattern = "\\s+", replacement = " ") %>%
        str_replace_all(pattern = "^ ", replacement = "")     
    doc.page <- doc.page[-which(doc.page=="")]
    
    
    ## locate first player
    doc.pattern <- 'a href="pr-'
    doc.list <- grep(doc.pattern, doc.page) 
    doc.nameurl <- doc.page[doc.list+0]
    doc.price <- doc.page[doc.list+3]
    doc.average <- doc.page[doc.list+5]
    doc.breakeven <- doc.page[doc.list+6]
    doc.likelihood <- doc.page[doc.list+7]
    
    
    ## tidy formatting
    doc.nameurl <- doc.nameurl %>%
        str_replace_all(pattern = "<td.*?>", replacement = " ") %>%
        str_replace_all(pattern = "&nbsp;", replacement = " ") %>%
        str_replace_all(pattern = "</a>", replacement = " ") %>%
        str_replace_all(pattern = "^ .*?pr-", replacement = "pr-") %>%
        str_replace_all(pattern = ">", replacement = "; ")
    
    ## split the page
    df <- as.data.frame(do.call(rbind,str_split(doc.nameurl,";")),
                        stringsAsFactors=FALSE)
    colnames(df) <- c("playerurl","ShortName")
    
    ## tidy the data
    df <- df %>%
        mutate(playerurl = substring(playerurl,1,nchar(playerurl)-1)) %>%
        mutate(playerurl = str_trim(playerurl)) %>%
        mutate(playerurl = paste0("https://www.footywire.com/afl/footy/",
                                  playerurl,sep="")) %>%
        mutate(ShortName = str_trim(ShortName)) %>%
        select(ShortName,playerurl)
     df$FtsyPx <- str_trim(doc.price)
     df$FtsyPt.Mean <- str_trim(doc.average)
     df$FtsyPt.Breakeven <- str_trim(doc.breakeven)
     df$FtsyPt.Likelihood <- str_trim(doc.likelihood)
     
     ## save file
     filename <- paste(dirData,"FTW_breakeven.csv",sep="")
     write.csv(df, filename, row.names = FALSE)
    
     return(df)
    
}