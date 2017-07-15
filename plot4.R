## naming the datasets (for reproducing)

>if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

>if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
## merge the two data sets 

> if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

## get data of coal (SSC)
> CoalSubset  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
> NEISCCsubset <- NEISCC[CoalSubset, ]

> aggregatedNEISCC <- aggregate(Emissions ~ year, NEISCCsubset, sum)

> png("plot4.png", width=640, height=480)
> plot4 <- ggplot(aggregatedNEISCC, aes(factor(year), Emissions))
> plot4 <- plot4 + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions coal combustion-related sources 1999 - 2008')
> print(plot4)
> dev.off()