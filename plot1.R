source("loadData.R")

par(mfrow = c(1,1))
hist(as.numeric(consumptionData$Global_active_power), col="red", xlab="Global active power (kilowatts)", main="Global Active Power")   

if (!file.exists("output")) {
    dir.create("output")
}
dev.copy(png, file="output/plot1.png", width=480, height=480) 
dev.off()