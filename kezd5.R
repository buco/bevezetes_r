setwd("C:/BigData/bevezetes_r/")
library(ggplot2)
library(tidyr)
library(dplyr)
wide <- readxl::read_xlsx("dualbeat.xlsx")
head(wide)
tmp <-as.data.frame(wide)
tmp
dim(tmp)
str(tmp)
r <- tmp[1:30, 1:2]
b <- tmp[31:56,2]
c <- tmp[57:86,2]


ggp <- ggplot(data=r, aes(x=r$leaf,y=r$aluchl, color = leaf, binwidth = 3 facets = ))
ggp + geom_boxplot()
ggp + geom_point()
ggp + geom_jitter()
  
nrow(a)
nrow <- nrow(a)
zd <- mean(a$aluchl)
zd

repeat{
  for (nrow in 1:nrow(a)
       nrow = nrow + 1,
       t.test(a$aluchl,a$kozchl, mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)
       if(nrow == 30){
         break}
}

t.test(a$aluchl[1],a$kozchl[1], mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)

b <- a[a$aluchl> 24, ]
b
str(a)

pl <- qplot(tmp$leaf, tmp$aluchl, data = tmp, color=leaf, geom = c("point","smooth"))#confidence interval + vonal + szín
zl <- qplot(tmp$leaf, tmp$aluchl, data = tmp, geom = c("point","smooth"))
pl
zl + geom_smooth(tmp ~ tmp$aluchl)

zp <- qplot(tmp$aluchl, data = tmp, fill=leaf, stat_bin(40))#histogramlike
zp

zt<- qplot(tmp$leaf, tmp$aluchl, data = tmp, facets = ~leaf)
zt

qq <- qplot(tmp$aluchl, tmp$kozchl, data = tmp, facets = leaf~., binwidth =2)
qq

u <- a%>%dplyr::filter(row_number() %% 2 == 0) ## Select even rows

o <- a%>%dplyr::filter(row_number() %% 2 == 1) ## Select odd rows

u %>%dplyr::filter(data()>mean(a$aluchl)) 

gl <- ggplot(data = a, aes(x=a$aluchl, y=a$kozchl))

plot(a$aluchl, a$kozchl)
gl + geom_boxplot()

gl + geom_boxplot(size=1.0) + geom_point()

gl + geom_boxplot(size=1.0) + geom_jitter()
plot(u,o)

for(nrow in a){
  ifelse(nrow %% 2 == 0){
    print(mean(a$aluchl[nrow %% 2 == 0]))
  }
}

for(nrow in a){
  ifelse(nrow %% 2 == 0, print(mean(a$aluchl), print(mean(a$aluchl))
}

for(nrow in a){
  ifelse(nrow %% 2 == 0, print(mean(a$aluchl)), print(mean(a$aluchl))) #tiesto grapevine
}  

for(nrow in a) {
  ifelse(nrow %% 2 == 0, print(mean(a$aluchl[nrow 2 %% == 0])))
}

awt <- mean(a$aluchl[nrow 2 %% == 0])#a sorértéke páros, és a párossorokat átlagolja

gl <- ggplot(data = tmp, aes(x=tmp$aluchl, y=tmp$X__1))

gl + geom_boxplot()

gl + geom_boxplot(size=1.0) + geom_point()

gl + geom_boxplot(size=1.0) + geom_jitter()

gl + geom_jitter(aes(size = tmp$X__1, colour = tmp$aluchl)) + geom_boxplot(size = 1.0, alpha = .6, outlier.colour = NA)

n <- gl + geom_jitter(aes(size = tmp$X__1, colour = tmp$aluchl)) + geom_boxplot(size = 1.0, alpha = .6, outlier.colour = NA)

n <- n + scale_color_manual(breaks= c("aluchl", "aluflav","aluanth","kozchl","kozflav","kozanth","felchl","felflav","felanth"),
                            values = c("yellow","blue","red3","orange","darkblue","royalblue","green","red2","green2"))
n 


t.test(ttt,tt2, mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)


v <- c("Hello","loop")
cnt <- 2

repeat {
  print(v)
  cnt <- cnt+1
  
  if(cnt > 5) {
    break
  }
}

for(nrow in 1:nrow(a))
  repeat {
    rep.row & rep.col
  }

rep.row<-function(x,n){
  matrix(t.test(x,n), mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)
}
rep.col<-function(x,n){
  matrix(t.test(x,n), mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)
}

function(a$aluchl,a$kozchl)
  
  
