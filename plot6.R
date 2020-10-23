library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
q6 <- NEI %>% filter((fips == "24510" | fips == "06037") & type == "ON-ROAD") %>% 
        group_by(year, fips) %>% summarise(total_emission = sum(Emissions)) %>%
png(filename = "plot6.png", width = 480, height = 480, units = "px")
ggplot(q6, aes(x = year, y = total_emission)) + geom_point(aes(color = fips), size = 4) + labs(y = "tons", color = "City\n") +
        scale_color_manual(labels = c("Los Angeles County", "Baltimore City"), values = c("red", "green")) +
        ggtitle("Emssion from Moter Vehicle in Baltimore City and Los Angeles County")
dev.off()