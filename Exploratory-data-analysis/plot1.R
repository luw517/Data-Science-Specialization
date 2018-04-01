NEI <- readRDS("summarySCC_PM25.rds")
emissionnew<-aggregate(NEI$Emission, by=list(NEI$year), FUN=sum)
barplot(emissionnew$x, xlab='year', ylab='total pm2.5 emission', names.arg=emissionnew$Group.1)
