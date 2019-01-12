setwd("C:/BigData/bevezetes_r/")
library(ggplot2)
library(tidyr)
library(dplyr)
library(ggpubr)

wide <- readxl::read_xlsx("dualbeat.xlsx")
tmp <-as.data.frame(wide)
dim(tmp)
str(tmp)

a <- tmp[1:30,1:2]## a piros fény alatt nevelt összes növény (r11a=első növény első levele adaxiális oldala, r11ab az abaxiális) , a levélnyél felett mért chlorofill értéke

ev <- a%>%dplyr::filter(row_number() %% 2 == 0) ## Select even rows = abaxiális oldala a levélnek

od <- a%>%dplyr::filter(row_number() %% 2 == 1) ## Select odd rows = adaxiális oldala a levélnek 

evpl <- ggplot(data=ev, aes(x=ev$leaf, y=ev$aluchl))
evfinal <- evpl + geom_boxplot(size = 0.2) + geom_point(color="darkred", size = 1.4) + labs(title = "red plant abaxial leaves",
                                                                                            subtitle = "proximal measurement",
                                                                                            caption = "source:dualex",
                                                                                            x = "leaves", y = "chlorofill values") + theme(axis.text.x = element_text(face = "bold", size = 8,angle = 90), plot.margin = unit(c(0,0,0,0),"cm")) + coord_cartesian(ylim = c(10,30)) + scale_y_continuous(limits = c(10,30))
evfinal ##levél x axis, érték y axis,  szín, méret, és a magyarázatok beállítva

odpl <- ggplot(data = od, aes(x=od$leaf, y=od$aluchl))
odfinal <- odpl + geom_boxplot(size = 0.2) + geom_point(color="darkred", size = 1.4) + labs(title = "red plant adaxial leaves",
                                                                                            subtitle = "proximal measurement",
                                                                                            caption = "source:dualex",
                                                                                            x = "leaves", y = element_blank()) + theme(axis.text.x = element_text(face = "bold", size = 8,angle = 90), plot.margin = unit(c(0,0,0,0),"cm")) + coord_cartesian(ylim = c(10,30)) + scale_y_continuous(limits = c(10,30))
odfinal## ugyanaz mint evfinalnál

ggarrange(evfinal,odfinal,heights = c(0.2,0.1),
          nrow = 1, ncol = 2,
          common.legend = T,
          legend = "bottom")##egymás mellé teszem a két plotot.

meanev <- ev$aluchl
meanod <- od$aluchl

tresult <- t.test(meanev,meanod, mu = 0, alt= "two.sided", conf = 0.95, var.equal = FALSE, paired = F)#tehát az adax és abax oldalak chlorofillátlaga nem tér el szignifikánsan
tresult
