##Coursera Exploratory Data Analysis Week 4 Project 2
##William Yee
##Written on November 20, 2016
##plot5.R

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
NEI.blt.road<-subset(NEI, fips =="24510" & type=="ON-ROAD")

##Aggregate the data
data2plot<- aggregate(Emissions~year, NEI.blt.road, sum)

##plot the data
png("plot5.png")
g<- ggplot(data2plot, aes(x=factor(year), y= Emissions))
g<- g + geom_bar(stat = "identity")
g<- g + ggtitle(expression("Total Car Related PM"[2.5]*" Emissions in Baltimore")) +xlab("Year") + ylab(expression("Total PM"[2.5]*" Emissions"))
g           
dev.off()
