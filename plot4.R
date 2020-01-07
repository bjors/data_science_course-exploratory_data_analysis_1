source("loadData.R")

par(mfrow=c(2,2), mar=c(5,5,2,2))
with(consumptionData, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global active power"))       
with(consumptionData, plot(datetime, Voltage, type="l"))
with(consumptionData, {
    plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(datetime, Sub_metering_1)
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
})
legend ("topright", box.lwd=0, bg="transparent", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(consumptionData, plot(datetime, Global_reactive_power, type="l"))

if (!file.exists("output")) {
    dir.create("output")
}
dev.copy(png, file="output/plot4.png", width=480, height=480) 
dev.off()