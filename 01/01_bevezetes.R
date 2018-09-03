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
tmp <- readxl::read_xlsx("data/sample.xlsx")
summary(tmp)
str(tmp)

# adat beolvasása a xlsx csomag segítségével
tmp <- xlsx::read.xlsx("data/sample.xlsx")
tmp <- xlsx::read.xlsx("data/sample.xlsx", sheetIndex = 1)
summary(tmp)
str(tmp)

# adat beolvasása a openxlsx csomag segítségével
tmp <- openxlsx::read.xlsx("data/sample.xlsx")
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
tmp_cookie <- 'ig_cb=1; mid=W2gRPQALAAE-24HmLO852SmO-kba; mcd=3; fbm_124024574287414=base_domain=.instagram.com; shbid=4430; csrftoken=QujWzZurGHyTXPX93Dbf00uDrpE1ZeA7; ds_user_id=1763994906; csrftoken=QujWzZurGHyTXPX93Dbf00uDrpE1ZeA7; rur=PRN; sessionid=IGSC178df3ba53c903382d8d03b1fe8be58d2a9b25cac388885fdeed69fb6c367922%3AoQ4Ih4K8GzXU8jo1Y7Y8RUvHoMKjR5LA%3A%7B%22_auth_user_id%22%3A1763994906%2C%22_auth_user_backend%22%3A%22accounts.backends.CaseInsensitiveModelBackend%22%2C%22_auth_user_hash%22%3A%22%22%2C%22_platform%22%3A4%2C%22_token_ver%22%3A2%2C%22_token%22%3A%221763994906%3AJcw5A9l2j2D4UVcBX4JZselbGDHQhZTd%3Aeb2a680cd2c3bf22dccfd45ba4fbd730879691168eca1511cd1411a99cffc3c5%22%2C%22last_refreshed%22%3A1535976881.5858511925%7D; fbsr_124024574287414=0SqqizLXmE3wHwP3QeTDwcGM1iv1rOypY6FWfdH3_vw.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUUJ1NWl1cjlqN2l4NmdGaFQ3Zms1MHZjYVh0d0k1Y2gtaVZzcm9OZFp0QWswQTBTVWNGVy02SUdzT1FlaXY4N0tBRGEwN2taU0hpb3JJdUR2Q0xjMkdCZmF2QXVLd1lPZW5sZVgwZFhkUWRmTi1BdW4wNWtnbFlwTzRNSHZHaFVvSzF0OGZlWXBnQnI1U25nTEN6anFMa2xnSDByV2lQM29fNXNzakw0NlgtcG1leWVtSlE0S3VEczhaRW9SRmRuZ0RoWU82VHZuLUlsU1dMS29tcGFOeGV5Y0FWek1aSnlVRzVFaUhyWXJVMDdzUU0yVFJVcDlQZDMwRmQxVlFKRmxaN0xIbnpIbURKWkFmNDlaX2kxMU5Rc1B5NHdHSW9FU2hDTlJteDVlVkk0eFVMRTV1c2VZWm5lOVFlaGZ6MlVUeWNlenBOWks5SC02N1JkR3hIX1k4aiIsImlzc3VlZF9hdCI6MTUzNTk3Njg4NSwidXNlcl9pZCI6IjE1MDUxNzQ4NDEifQ; urlgen="{}:1fwnko:V5p7YwFSO19HaERajMEmdJkODIw"'
u_agent <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36"

tmp <- httr::GET(url, add_headers("User-Agent" = u_agent,
                                   "Cookie" = tmp_cookie,
                                   "Accept" = "text/html",
                                   "Accept-Language" = "en"))
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

