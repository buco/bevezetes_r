setwd("C:/BigData/bevezetes_r/")
library(ggplot2)
library(tidyr)
library(dplyr)

wide <- readxl::read_xlsx("dualbeat.xlsx")
head(wide)

summary(wide)
str(wide)
tmp <-as.data.frame(wide)
tmp
attach(tmp)

tmp[2:9]
tmp[2,3]
tmp[3,3]
t <- tmp[5]
t
z <-tmp[2]
z
t.test(t,z, mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)
tt.test(tmp[2,3], tmp[3,3], mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)
t.test(tmp[2,2:10], tmp[45,2:10], mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)

t.
#for ciklus 86x fusson le, i legyen row legyen az i változó!!!
t.test()
ttbase <- tmp[2,2:10]
ttbase2 <- tmp[3,2:10]
for (row in 1:nrow tmp):  
  row <- tmp[2,2:10] 
  x <- row_number(row+1)
  ttbase <- t.test(row, x, mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)
  
  
for (row in tmp[2:30]):
  

for(row in 2:nrow(tmp))
  count(row+1)
  for(col in 2:ncol(tmp))
    count(col+1)
    t.test(tmp[row,col], mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)

rownames(tmp)
nrow(tmp)
str(tmp)

tt1 <- tmp[1,-1]   #a hely a 1:3 után az összes oszlop behívását jelenti!!
tt2 <- tmp[2,-1]
try <- tmp[3,-1]
try2 <- tmp[4,-1]
sorr <- tmp[1,1]
sorr
zsuzsi <- tmp[1:30,2] # ez az első 30 sor chlorofillja a prox résznél
#30 sornyi adat, az aluchl oszlopból
feri <- tmp[57:86,2]
feri
t.test(zsuzsi,feri, mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)

boxplot(zsuzsi,feri,
        horizontal = T)
t.test(tt1,tt2, mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)
t.test(try,try2, mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)

cutdata <- tmp %>% slice(1:10) #a tmpből az 1:10ig levő sorokat adja ki

ggplot(tmp, aes(x =leaf, y = aluchl, col= aluchl,aluflav,aluanth,kozchl,kozflav,kozanth,felchl,felflav,felanth, size = aluchl,aluflav,aluanth,kozchl,kozflav,kozanth,felchl,felflav,felanth)) + geom_point(alpha = 0.5)+
  geom_smooth(method = lm)
       