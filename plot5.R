## Question 5:
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 

## Read data. Files should be in the working directory
# Read PM2.5 emissions dataset
em.df <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
scc.df <- readRDS('Source_Classification_Code.rds')

# Store the emissions from motor vehicle sources (type = ON-ROAD) in Baltimore City (fips code: '24510')
baltimore.m.em <- em.df[em.df$type == 'ON-ROAD' & em.df$fips == '24510', ]

# Store the total Baltimore emissions from motor vehicle sources by year
baltimore.m.em_by_year <- aggregate(Emissions ~ year, data = baltimore.m.em, FUN = sum)

# Open png device
png(filename='plot5.png', width=480, height=480, units='px')

with(baltimore.m.em_by_year, {
    plot(year, Emissions, type = 'l',
         xlab="Year",
         ylab='PM2.5 Emissions (tons)',
         main='PM2.5 Emissions from motor vehicles in Baltimore City')
})

# Close png device
dev.off()
