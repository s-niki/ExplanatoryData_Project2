## Question 6:
## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?


library(ggplot2)

## Read data. Files should be in the working directory
# Read PM2.5 emissions dataset
em.df <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
scc.df <- readRDS('Source_Classification_Code.rds')

# Store the emissions from motor vehicle sources (type = ON-ROAD) in Baltimore City (fips code: '24510') and Los Angeles (fips code: '06037')
city.em <- em.df[em.df$type == 'ON-ROAD' & em.df$fips %in% c('24510', '06037'), ]

# Store the total emissions for Baltimore City and Los Angeles, grouped by year and city
city.em_by_year <- aggregate(Emissions ~ year + fips, data = city.em, FUN = sum)

# Add city names for the plot
city.em_by_year$city = city.em_by_year$fips
city.em_by_year[which(city.em_by_year$fips == '24510'), 'city'] = 'Baltimore City'
city.em_by_year[which(city.em_by_year$fips == '06037'), 'city'] = 'Los Angeles'

# Open png device
png(filename='plot6.png', width=640, height=480, units='px')

plot6 <- qplot(year, Emissions, data=city.em_by_year, facets = . ~ fips) +  
    geom_line() +
    xlab("Year") +
    ylab('PM2.5 Emissions (tons)') +
    ggtitle('Total PM2.5 Emissions in Los Angeles (06037) and Baltimore City (24510)')

print(plot6)

# Close png device
dev.off()
