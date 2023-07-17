# reading rds files
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")


library(dplyr)
library(ggplot2)

motor.vehicles.scc <- unique(SCC[
    grep(pattern = "mobile", 
         x = SCC$EI.Sector, ignore.case = TRUE), 1]) %>% 
    as.character()

# length(motor.vehicles.scc)

balt.mv <- NEI[NEI$SCC %in% motor.vehicles.scc & NEI$fips == "24510", ]
cal.mv <- NEI[NEI$SCC %in% motor.vehicles.scc & NEI$fips == "06037", ]


plt5 <- balt.mv %>% 
    group_by(year) %>% 
    summarise("Total.Emission" = sum(Emissions)) %>% 
    ggplot(mapping = aes(x=factor(year), y=Total.Emission)) +
    geom_bar(stat = "identity", aes(fill=factor(year))) + 
    labs(
        title = "PM2.5 Emissions from motor vehicles in Baltimore",
        x = "Year",
        y = "Total Emissions, in tons",
        fill = "Year"
    )

plt5

png(filename = "plot4.png", bg="white", width = 800, height = 500)
p
dev.off()
