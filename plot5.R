## naming the datasets (for reproducing)

>if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

>if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# How have emissions from motor vehicle (=non-cars) sources changed from 1999-2008 in Baltimore City? (Baltimore=24510)

> MotorSubset <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

> aggregatedMotor <- aggregate(Emissions ~ year, subsetNEI, sum)

> png("plot5.png", width=840, height=480)
> plot5 <- ggplot(aggregatedMotor, aes(factor(year), Emissions))
> plot5 <- plot5 + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions motor vehicle (type = ON-ROAD) in Baltimore City (fips = "24510") 1999 - 2008')
> print(plot5)
> dev.off()