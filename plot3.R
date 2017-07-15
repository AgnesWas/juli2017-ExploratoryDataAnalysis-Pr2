# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? (Baltimore=24510)
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

> totalemissionssubset3 <- aggregate(Emissions ~ year + type, subsetNEI, sum)

> png("plot3.png", width=640, height=480)
> plot <- ggplot(totalemissionssubset3, aes(year, Emissions, color = type))
> plot <- plot + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, (fips == "24510") 1999-2008')
> print(plot)
> dev.off()