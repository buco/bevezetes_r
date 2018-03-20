#install.packages("readxl")
# bármit
library(readxl)

tmp <- readxl::read_xlsx("sample.xlsx", 2)
tmp <- as.data.frame(tmp)
str(tmp)
summary(tmp)

nev <- tmp$name
# nev elemeinek száma
length(nev)

# első elem kiválasztása
nev[1]
# első három elem kiválasztása
nev[1:3]
# első, ötödik, illetve a hatodik elem kiválasztása
nev[c(1, 5, 6)]
# az első elem kivételével mindegyik
nev[-1]
# első, ötödik, illetve a hatodik elem kivételével mindegyik
nev[c(-1, -5, -6)]

# adattábla
dim(tmp)
colnames(tmp)
tmp[sor, oszlop]
tmp[, "name"]
tmp[, c("name", "szoveg")]
tmp[1:3, c("name", "szoveg")]

tmp[,grep("magyar", tmp$szoveg)]

# FONTOS
df <- data.frame(xyz = 1)
df$x

# library(strict)
df <- data.frame(xyz = 1)
df$x

# data.table
dt <- data.table::data.table(tmp)
dt[,.(name)]

# lista

tmp_list <- list(A_1 = 1:10,
                 B = letters[1:10],
                 tükörfuró = 1:31)
tmp_list[1]
tmp_list[[1]]
tmp_list$A
tmp_list$B
tmp_list$`tükörfuró`

# adattáblát a name mentén felbontjuk és
# egy listába tároljuk el a kapott adatokat
tmp_list <- split(tmp, tmp$name)
tmp_list
lapply(tmp_list, function(x) sum(x$num))


# Feladat - 
# szűrni a chr15, chr22-re
# valamint szűrni a start-ot, legyen kisebb, mint 500000
# további legyen + irányú a strand
rm(list = ls())
# a betöltött csomagok, nem törlődnek!!!!
detach("package:strict", unload = TRUE)
tmp <- data.table::fread("02/table.bed")
