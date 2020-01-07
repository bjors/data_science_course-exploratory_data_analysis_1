source("loadData.R")

par(mfrow = c(1,1))
with(consumptionData, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global active power (kilowatts)"))       

if (!file.exists("output")) {
    dir.create("output")
}
dev.copy(png, file="output/plot2.png", width=480, height=480) 
dev.off()