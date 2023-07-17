# reading rds files
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")


library(dplyr)
library(ggplot2)


balt <- subset(NEI, subset = fips == "24510") %>%
    group_by(type, year) %>% 
    # group_by(year) %>% 
    mutate("Total.Emissions" = sum(Emissions, na.rm = TRUE))


png(filename = "plot3.png", bg="white", width = 800, height = 500)
ggplot(balt) + 
    geom_path(aes(year, Total.Emissions, color = type), linewidth = 1) + 
    scale_x_continuous(breaks = c(1999, 2002, 2005, 2008)) +
    labs(
        x = "Year",
        y = "Total Emissions in tons",
        title = "Total PM2.5 emissions in Baltimore, MD",
        color = "Type/Source"
    )
dev.off()

