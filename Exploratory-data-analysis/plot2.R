NEI <- readRDS("summarySCC_PM25.rds")
NEI_Baltimore<-subset(NEI, NEI$fips=="24510")
NEI_Baltimore_n<-aggregate(NEI_Baltimore$Emissions, by=list(NEI_Baltimore$year), FUN=sum)
barplot(NEI_Baltimore_n$x, xlab='year', ylab='total pm2.5 emission', names.arg=NEI_Baltimore_n$Group.1)
