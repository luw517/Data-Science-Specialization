NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
scc_coal<-SCC[grep("coal", SCC$Short.Name),]
data<-merge(NEI, scc_coal, by="SCC")
g<-ggplot(data=data, aes(year, Emissions))
g+geom_boxplot(aes(group=year))
