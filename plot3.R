#setwd("/media/caraya/DATA/CURSOS/02-Datascience/Exploratory Data Analysis/Exp_Data_ProgrammingAssignment2")
#getwd()
#dir()
##----------------------------------------------------------------------------
library(ggplot2)
NEI <-readRDS("summarySCC_PM25.rds")
SCC <-readRDS("Source_Classification_Code.rds")

dat<-NEI[NEI$fips=="24510",]
x<-aggregate(dat$Emissions,by=list(dat$year,dat$type),FUN=sum)
colnames(x)<-c("year","type","Emissions")
x
type <- x$type

x11()
qplot(x$year,x$Emissions,data=x
      ,main="Baltimore City Emissions"
      ,colour=type
      ,geom="line"
      ,xlab="year"
      ,ylab="Emissions")

dev.copy(png,file="plot3.png")
dev.off()





