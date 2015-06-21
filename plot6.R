#setwd("/media/caraya/DATA/CURSOS/02-Datascience/Exploratory Data Analysis/Exp_Data_ProgrammingAssignment2")
#getwd()
#dir()
##----------------------------------------------------------------------------

NEI <-readRDS("summarySCC_PM25.rds")
SCC <-readRDS("Source_Classification_Code.rds")

scc<-as.character(SCC[grep("Vehicles",SCC[,4]),1])
head(scc)
index <- NEI$SCC %in% scc
dat<-subset(NEI,index)
bal<-dat[dat$fips=="24510",]
la<-dat[dat$fips=="06037",]
balx<-aggregate(bal$Emissions,by=list(bal$year),FUN=sum)
lax<-aggregate(la$Emissions,by=list(la$year),FUN=sum)
balx<-cbind(balx,rep("Baltimore",4))
lax<-cbind(lax,rep("Los Angele",4))
names(balx)<-c("Year","","")
colnames(balx)<-c("year","Emissions","city")
colnames(lax)<-c("year","Emissions","city")
dat1<-rbind(balx,lax)
city <- dat$city

x11()
qplot(dat1$year,dat1$Emissions,data=dat1
      ,main="Vehicle City Emissions"
      ,colour=city
      ,geom="line"
      ,xlab="year"
      ,ylab="Emissions")

dev.copy(png,file="plot6.png")
dev.off()


