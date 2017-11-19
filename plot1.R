## Question 1:
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission
## from all sources for each of the years 1999, 2002, 2005, and 2008.

## Read data. Files should be in the working directory
# Read PM2.5 emissions dataset
em.df <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
scc.df <- readRDS('Source_Classification_Code.rds')

# Store total emissions by year
em_by_year <- aggregate(Emissions ~ year, data = em.df, FUN = sum)

# Open png device
png(filename='plot1.png', width=480, height=480, units='px')

# Create plot
with(em_by_year, {
    plot(year, Emissions, type = 'l',  
         xlab="Year",
         ylab='PM2.5 Emissions (tons)',
         main='Total PM2.5 Emissions by year')
})

# Close png device
dev.off()