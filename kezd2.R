setwd("C:/BigData/bevezetes_r/")
library(ggplot2)
library(readxl)

tmp <- readxl::read_xlsx("dualbeat.xlsx")
databa <- as.data.frame(tmp)
summary(tmp)
str(tmp)
dim(tmp)
colnames(tmp)
rownames(tmp)
tmp["1","aluchl"]

x <- tmp[2]
y <- tmp[3]
z <- tmp[4]
w <- tmp[5]
e <- tmp[6]
r <- tmp[7]
t <- tmp[8]
u <- tmp[9]
i <- tmp[10]


ggplot(data = tmp, aes(tmp$aluchl)) + geom_histogram()

gl <- ggplot(data = tmp, aes(x=tmp$aluchl, y=tmp$X__1))
gl + geom_boxplot()

gl + geom_boxplot(size = 1.2) + geom_point()

gl + geom_boxplot(size=1.2) + geom_jitter()
