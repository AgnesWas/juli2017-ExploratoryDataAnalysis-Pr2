## naming the datasets

>if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

>if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}


## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
## for each of the years 1999, 2002, 2005, and 2008.

>totalemissions <- aggregate(Emissions ~ year, NEI, sum)

>png('plot1.png')

>barplot(height=totalemissions$Emissions, names.arg=totalemissions$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions per year'))

>dev.off()