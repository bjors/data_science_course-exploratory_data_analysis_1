source("loadData.R")

par(mfrow = c(1,1))
with(consumptionData, {
    plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(datetime, Sub_metering_1)
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

if (!file.exists("output")) {
    dir.create("output")
}
dev.copy(png, file="output/plot3.png", width=480, height=480) 
dev.off()