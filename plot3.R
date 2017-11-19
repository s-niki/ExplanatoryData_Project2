## Question 3:
## Of the four types of sources indicated by the type (point, nonpoint, 
## onroad, nonroad) variable, which of these four sources have seen decreases in emissions 
## from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.


library(ggplot2)

## Read data. Files should be in the working directory
# Read PM2.5 emissions dataset
em.df <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
scc.df <- readRDS('Source_Classification_Code.rds')

# Store the emissions in Baltimore City
baltimore_em.df = em.df[em.df$fips == '24510', ]

# Store the total emissions in Baltimore, grouped by type and year
baltimore_em_total <- aggregate(Emissions ~ type + year, baltimore_em.df, FUN = sum)

# Open png device
png(filename='plot3.png', width=1200, height=640, units='px')

plot3 <- qplot(year, Emissions, data=baltimore_em_total, facets = . ~ type) +  
    geom_line() +
    xlab("Year") +
    ylab('PM2.5 Emissions (tons)') +
    ggtitle('Total PM2.5 Emissions in Baltimore City')

print(plot3)

# Close png device
dev.off()
