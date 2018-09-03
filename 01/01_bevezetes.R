# szükséges könyvtárak telepítése
install.packages("data.table")
install.packages("openxlsx")
install.packages("xlsx")
install.packages("jsonlite")
install.packages("httr")
install.packages("listviewer")
install.packages("tidyverse")

# pipe
library(magrittr)

# adat beolvasása a readxl csomag segítségével
tmp <- readxl::read_xlsx("sample.xlsx")
summary(tmp)
str(tmp)

# adat beolvasása a xlsx csomag segítségével
tmp <- xlsx::read.xlsx("sample.xlsx")
summary(tmp)
str(tmp)

# adat beolvasása a openxlsx csomag segítségével
tmp <- openxlsx::read.xlsx("sample.xlsx")
summary(tmp)
str(tmp)

# beolvasott adatok kiírása
# table
write.table(tmp,
            file = "sample.table",
            row.names = FALSE,
            col.names = TRUE,
            sep = "\t")
# csv forma
write.csv(tmp,
          file = "sample.csv",
          row.names = FALSE)


# json format
tmp2 <- jsonlite::toJSON(tmp, pretty = TRUE)
writeLines(tmp2, "sample.json")

# vagy 

tmp %>%
  jsonlite::toJSON(.,  pretty = TRUE) %>%
  writeLines(., "sample2.json")

# csv beolvasása
tmp <- data.table::fread("sample.csv")
read.csv("sample.csv")

# tab szeparált adatok beolvasása
read.table("sample.table")

# soronkénti beolvasás
readLines("sample.csv")

# json formátumú adat beolvasás
jsonlite::fromJSON("sample2.json")

# read.csv és a data.table összehasonlítása
tmp <- data.table::fread("reviews.csv")

ido <- Sys.time()
tmp <-  read.csv("reviews.csv")
Sys.time() - ido


# json 
library(httr)
url <- "https://www.instagram.com/robert.herczeg/?__a=1"
tmp <- GET(url)
tmp
tmp <- content(tmp)
listviewer::jsonedit(tmp)


# webscraping
library(rvest)

url <- "https://www.ratebeer.com/brewers/roth-serf337z337-kft/17222/"

tmp <- url %>% xml2::read_html(.) %>% rvest::html_table(., fill = TRUE)
tmp[[1]]
summary(tmp[[1]])

# readLines csv beolvasása
tmp <- readLines("sample.csv") %>%
  strsplit(., ",") %>%
  lapply(., function(x)  gsub("\"", "", x)) %>%
  as.data.frame(.) %>%
  t()

# adatok letöltése adatbázisból
# install.packages("RMySQL")
library(RMySQL)
# kapcsolat kialakítása
mydb <- dbConnect(MySQL(),
                  user = 'user',
                  password = 'password',
                  dbname = 'database_name',
                  host = 'host')
# kérés illseztése
dbSendQuery(mydb, 'drop table if exists some_table, some_other_table')
# adatok letöltése
data <- fetch(rs, n = -1)

