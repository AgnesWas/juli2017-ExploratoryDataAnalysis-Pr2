# Compare emissions from motor vehicle sources (=non-cars) in Baltimore City (=24510) with emissions from motor 
# vehicle sources in Los Angeles County (=06037), California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

> subsetBCLA <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

> aggregatedBCLA <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
> aggregatedBCLA$fips[aggregatedBCLA$fips=="24510"] <- "Baltimore"
> aggregatedBCLA$fips[aggregatedBCLA$fips=="06037"] <- "Los Angeles"

> png("plot6.png", width=1040, height=480)
> plot6 <- ggplot(aggregatedBCLA, aes(factor(year), Emissions))
> plot6 <- plot6 + facet_grid(. ~ fips)
> plot6 <- plot6 + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions motor vehicle (type=ON-ROAD) in Baltimore City (fips = "24510") vs Los Angeles (fips = "06037")  1999-2008')
> print(plot6)
> dev.off()