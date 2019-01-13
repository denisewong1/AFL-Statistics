## downloads weekly files


rm(list=ls())
library(lubridate)
library(readr)
library(tidyr)
library(dplyr)
library(reshape2)
library(data.table)
library(Metrics)
library(elo)
library(ggplot2)
library(ggthemes)


## directories
setwd("~/DataScience/AFLStats")
dirMap <- "~/DataScience/AFLStats/map/"
dirData <- "~/DataScience/AFLStats/data/"


## useful functions
source('~/DataScience/AFLStats/code/useful_read.R')
source('~/DataScience/AFLStats/code/useful_replace.R')
source('~/DataScience/AFLStats/code/useful_map.R')


## scrapers
##source('~/DataScience/AFLStats/code/scrapeAFL_weekly.R')
source('~/DataScience/AFLStats/code/scrapeAFL_game.R')


## make table functions
source('~/DataScience/AFLStats/code/makeTbl_byeRound.R')
source('~/DataScience/AFLStats/code/makeTbl_hga.R')
source('~/DataScience/AFLStats/code/makeTbl_ladder.R')
source('~/DataScience/AFLStats/code/makeTbl_ELOv20.R')

## scrape functions
##dfGame <- scrapeAFL_game()


## recalculate table functions
##dfByeRound <- makeTbl_byeRound()
##dfLadder <- makeTbl_ladder()
##dfLadderN <- makeTbl_ladderN()
##dfHGA <- makeTbl_hga()
##dfHGAN <- makeTbl_hgaN()
##dfELO <- makeTbl_ELOv20()



