## Question 2:
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Read data. Files should be in the working directory
# Read PM2.5 emissions dataset
em.df <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
scc.df <- readRDS('Source_Classification_Code.rds')

# Store the emissions in Baltimore City
baltimore_em.df = em.df[em.df$fips == '24510', ]

# Store the total emissions in Baltimore City by year
baltimore_em_by_year <- aggregate(Emissions ~ year, data = baltimore_em.df, FUN = sum)


# Open png device
png(filename='plot2.png', width=480, height=480, units='px')

with(baltimore_em_by_year, {
    plot(year, Emissions, type = 'l',
         xlab="Year",
         ylab='PM2.5 Emissions (tons)',
         main='Total PM2.5 Emissions in Baltimore City')
})

# Close png device
dev.off()
