# reading rds files
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

dim(NEI)
str(NEI)
head(NEI)
unique(NEI$Pollutant)
unique(NEI$type)
unique(NEI$year)
summary(NEI)

dim(SCC)
str(SCC)

names(NEI)
names(SCC)
head(SCC)

table(SCC$Data.Category)