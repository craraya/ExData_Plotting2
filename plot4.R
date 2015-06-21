#setwd("/media/caraya/DATA/CURSOS/02-Datascience/Exploratory Data Analysis/Exp_Data_ProgrammingAssignment2")
#getwd()
#dir()
##----------------------------------------------------------------------------

NEI <-readRDS("summarySCC_PM25.rds")
SCC <-readRDS("Source_Classification_Code.rds")

scc<-as.character(SCC[grep("Coal",SCC[,4]),1])
head(scc)
index <- NEI$SCC %in% scc
dat<-subset(NEI,index)
x <- aggregate(dat$Emissions,by=list(dat$year),FUN=sum)

x11()
barplot(beside=TRUE,x$x
        ,main="Total Coal Pollution"
        ,names.arg=x$Group.1
        ,col=c(1,2,3,4)
        ,xlab="year"
        ,ylab="total pollution")

dev.copy(png,file="plot4.png")
dev.off()