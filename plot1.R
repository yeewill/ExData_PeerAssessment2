##Coursera Exploratory Data Analysis Week 4 Project 2
##William Yee
##Written on November 20, 2016
##plot1.R


##download the data
url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url=url, destfile = "data.zip")
unzip("data.zip")
##read the data
SCC<- readRDS("Source_Classification_Code.rds")
NEI<- readRDS("summarySCC_PM25.rds")
##create sums by year
yearly.data<- with(NEI, aggregate(Emissions,by=list(year),sum))
##plot the data to png
png("plot1.png")
barplot(height=yearly.data$x, names.arg = yearly.data$Group.1)
title(main=expression( 'Total PM'[2.5]* ' Emissions by Year'), ylab = expression('Total PM'[2.5]* ' Emission'), xlab = "Year")
dev.off()