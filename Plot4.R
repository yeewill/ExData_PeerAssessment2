##Coursera Exploratory Data Analysis Week 4 Project 2
##William Yee
##Written on November 20, 2016
##plot4.R


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

##merge the data
if(!exists("NEISCC")){
NEISCC<- merge(NEI,SCC, by="SCC")
}
##coal related only
coal.match<- grepl("coal", NEISCC$Short.Name, ignore.case = T)
coal.data<- NEISCC[coal.match,]
##Aggregate the coal data by year
coal.data<- aggregate(Emissions~year,coal.data, sum)
png("plot4.png")
g<- ggplot(coal.data, aes(x=factor(year), y= Emissions))
g<- g + geom_bar(stat = "identity")
g<- g + ggtitle(expression("Total Coal Related PM"[2.5]*" Emissions")) +xlab("Year") + ylab(expression("Total PM"[2.5]*" Emissions"))
g           
dev.off()
