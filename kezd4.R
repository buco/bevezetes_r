setwd("C:/BigData/bevezetes_r/")
library(ggplot2)
library(tidyr)
library(dplyr)
library(ggpubr)
library(car)
wide <- readxl::read_xlsx("dualbeat.xlsx")
head(wide)
tmp <-as.data.frame(wide)
tmp
dim(tmp)
str(tmp)
a <- tmp[1:30,1:2]
r1 <- tmp[1:10, 1:2]
r2<- tmp[10:20,1:2]
r3 <- tmp[20:30,1:2]

allr <- c(r1,r2,r3)
allr

r1pl <- ggplot(data = r1, aes(x = r1$leaf, y =r1$aluchl),
               + geom_point(color = "red"))

r1pl + geom_boxplot()
r1f <- r1pl + geom_boxplot(size = 0.2) + geom_point(color="darkred", size = 1.4)

r2pl <- ggplot(data = r2, aes(x = r2$leaf, y=r2$aluchl),
               + geom_point(color= "red"))
r2pl + geom_boxplot()
r2f <- r2pl + geom_boxplot(size = 0.2) + geom_point(color="red", size = 1.4)


r3pl <- ggplot(data = r3, aes(x = r3$leaf, y =r3$aluchl),
               + geom_point(shape=1),color = leaf,
               x.text.angle = 90)
r3pl + geom_point()
r3f <- r3pl + geom_boxplot(size = 0.2) + geom_point(color="green", size = 1.4)

r1t <- tmp[1:30,2:3]
ran <- seq(1:5)
ran

gs <- ggscatter(r1t, x = r1t$aluchl, y = r1t$kozchl,
                add = "reg.line",
                conf.int = T,
                combine = T,
                )
gs#kell még x.text vertikál + t-tesztek és overlapping plotok

ggarrange(r1f,r2f,r3f,
          labels = c("RED1","RED2","RED3"),
          ncol = 2, nrow = 2)
