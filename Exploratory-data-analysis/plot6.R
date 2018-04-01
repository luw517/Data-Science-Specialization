NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data1 <- subset(NEI, fips == 24510 & type == 'ON-ROAD')
data2<- subset(NEI, fips == "06037" & type == 'ON-ROAD')

data1_emissionsum<- aggregate(data1[, 'Emissions'], by=list(data1$year), sum)
data2_emissionsum<- aggregate(data2[, 'Emissions'], by=list(data2$year), sum)

data<-merge(data1_emissionsum, data2_emissionsum, by="Group.1")

par(mfrow=c(1,2))
barplot(data$x.y, xlab='year', ylab='emission from motor vehicle in Los Angeles', names.arg=data$Group.1)
barplot(data$x.x, xlab='year', ylab='emission from motor vehicle in Baltimore', names.arg=data$Group.1)
