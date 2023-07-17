# reading rds files
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")


tot_bmd <- with(subset(NEI, subset = fips == "24510"), tapply(Emissions, factor(year), sum))

png(filename = "plot2.png", bg="white", width = 800, height = 500, pointsize = 20)
par(mar=c(5.1, 5.1, 4.1, 1))

barplot(tot_bmd, names.arg = unique(NEI$year), col = unique(NEI$year), main = "PM2.5 emission in Baltimore City, Maryland", xlab="Year", ylab="Amount of PM2.5 emitted, in tons")

dev.off()
