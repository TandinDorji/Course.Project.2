# reading rds files
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")


library(dplyr)
library(ggplot2)


coal.source <- SCC[grep("coal", SCC$EI.Sector, ignore.case = TRUE), 1] %>% 
    as.character() %>% 
    unique()

NEI.coal <- subset(NEI, subset = NEI$SCC %in% coal.source)

plot4 <- NEI.coal %>% 
    group_by(year) %>% 
    summarise("Total.Emission" = sum(Emissions)) %>% 
    ggplot(mapping = aes(x=factor(year), y=Total.Emission)) +
    geom_bar(stat = "identity", aes(fill=factor(year))) + 
    labs(
        title = "PM2.5 Emissions from coal combustion-related sources",
        x = "Year",
        y = "Total Emissions, in tons",
        fill = "Year"
    )

plot4

png(filename = "plot4.png", bg="white", width = 800, height = 500)
plot4
dev.off()
