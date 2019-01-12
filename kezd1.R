setwd("C:/BigData/bevezetes_r/")
library(ggplot2)
library(tidyr)

wide <- readxl::read_xlsx("dualbeat.xlsx")
head(wide)

summary(wide)
str(wide)
tmp <-as.data.frame(wide)
tmp

x <- tmp$aluchl
y <- tmp$kozchl
c <- tmp$felchl

boxplot(x,y,c,
        horizontal = TRUE)

#two sided
#assume non-equal

t.test(x,y, mu=0, alt ="two.sided", conf=0,95, var.eq=F, paired = F)
tres <- t.test(x,y, mu=0, alt="two.sided", conf= 0,95, var.eq=F, paired =F)
tres

summary(tmp)

hist(tmp[['aluchl']])

#native charting functions

qplot(tmp[['aluchl']])

ggplot(data = tmp, aes(tmp$aluchl))+geom_histogram()

gl <- ggplot(data = tmp, aes(x=tmp$aluchl, y=tmp$X__1))

gl + geom_boxplot()

gl + geom_boxplot(size=1.0) + geom_point()

gl + geom_boxplot(size=1.0) + geom_jitter()

gl + geom_jitter(aes(size = tmp$X__1, colour = tmp$aluchl)) + geom_boxplot(size = 1.0, alpha = .6, outlier.colour = NA)

n <- gl + geom_jitter(aes(size = tmp$X__1, colour = tmp$aluchl)) + geom_boxplot(size = 1.0, alpha = .6, outlier.colour = NA)

n <- n + scale_color_manual(breaks= c("aluchl", "aluflav","aluanth","kozchl","kozflav","kozanth","felchl","felflav","felanth"),
                            values = c("yellow","blue","red3","orange","darkblue","royalblue","green","red2","green2"))
n 


