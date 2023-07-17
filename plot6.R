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

cal.balt.mv <- NEI[NEI$SCC %in% motor.vehicles.scc & (NEI$fips == "24510" | NEI$fips == "06037"), ]


plt6 <- cal.balt.mv %>% 
    group_by(fips, year) %>% 
    summarise("Total.Emission" = sum(Emissions)) %>% 
    ggplot(mapping = aes(x=factor(year), y=Total.Emission)) +
    geom_point(aes(color = fips, group = fips), size=3) + 
    labs(
        title = "PM2.5 Emissions from motor vehicles",
        x = "Year",
        y = "Total Emissions, in tons",
        color = "City"
    ) +
    scale_color_discrete(labels = c("California", "Baltimore"))

plt6

png(filename = "plot4.png", bg="white", width = 800, height = 500)
p
dev.off()
