##Coursera Exploratory Data Analysis Week 4 Project 2
##William Yee
##Written on November 20, 2016
##plot3.R


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

##Subset to baltimore only using fip column
NEI.blt<-subset(NEI, fips =="24510")


##Aggregate by year and sum
NEI.blt.agg<- aggregate(Emissions~ year + type, NEI.blt ,sum)

png("plot3.png")
g<- qplot(NEI.blt.agg$year,NEI.blt.agg$Emissions, color=NEI.blt.agg$type, geom= "line")
g<- g + ggtitle(expression("Total PM"[2.5]*" Emissions in Baltimore by Source and Year")) +xlab("Year") + ylab(expression("Total PM"[2.5]*" Emissions"))
g<- g + scale_color_discrete(name="Emission Type")
g
dev.off()