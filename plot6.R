##Coursera Exploratory Data Analysis Week 4 Project 2
##William Yee
##Written on November 20, 2016
##plot6.R

##download the data
url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url=url, destfile = "data.zip")
unzip("data.zip")
##read the data
if(!exists("SCC")){
        SCC<- readRDS("Source_Classification_Code.rds")
}
if(!exists("NEI")){
        NEI<- readRDS("summarySCC_PM25.rds")
}

##load ggplot2
library(ggplot2)

##Subset to baltimore and cars
NEI.bltla.road<-subset(NEI, fips %in% c("24510", "06037") & type=="ON-ROAD")

##Aggregate the data
data2plot<- aggregate(Emissions~year+ fips, NEI.bltla.road, sum)

##plot the data
png("plot6.png")
g<- ggplot(data2plot, aes(x=factor(year), y= Emissions))
g<- g + geom_bar(stat = "identity")
g<- g + ggtitle(expression("Total Car Related PM"[2.5]*" Emissions in Balitmore and Los Angeles")) +xlab("Year") + ylab(expression("Total PM"[2.5]*" Emissions"))
labels<- c("06037" = "Los Angeles", "24510" = "Baltimore")
g<- g + facet_grid(.~fips, labeller = labeller(fips=labels))
g
dev.off()
