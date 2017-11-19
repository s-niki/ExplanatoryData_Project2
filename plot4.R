## Question 3:
## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Read data. Files should be in the working directory
# Read PM2.5 emissions dataset
em.df <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
scc.df <- readRDS('Source_Classification_Code.rds')

# Store the coal combustion-related sources
# 'Short.Name' column for retrieving the coal combustion-related sources
scc.coal.df <- scc.df[grep('coal', scc.df$Short.Name), ]

# Store the emissions from coal combustion-related sources
coal.em.df <- em.df[em.df$SCC %in% scc.coal.df$SCC, ]

# Store the total emissions from coal combustion-related sources by year
coal.em_by_year <- aggregate(Emissions ~ year, data = coal.em.df, FUN = sum)

# Open png device
png(filename='plot4.png', width=480, height=480, units='px')

with(coal.em_by_year, {
    plot(year, Emissions, type = 'l',
         xlab="Year",
         ylab='PM2.5 Emissions (tons)',
         main='PM2.5 Emissions from coal combustion sources')
})

# Close png device
dev.off()
