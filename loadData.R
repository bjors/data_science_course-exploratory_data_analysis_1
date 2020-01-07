dataDir = "data"
dataUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists(dataDir)) {
    dir.create(dataDir)
    
    fileName = "data.zip"
    download.file(dataUrl, 
                  destfile=fileName, 
                  method="curl")
    downloadTime <- date()
    
    unzip(fileName, exdir=dataDir)
}

if (exists("consumptionData")) {
    print("using cached data")
} else {
    consumptionData <- read.csv2("data/household_power_consumption.txt", stringsAsFactors = FALSE)
    consumptionData <- consumptionData[grep("^[1,2]/2/2007", consumptionData$Date),]
    
    # Convert to date/time
    dateTime <- paste(consumptionData$Date, consumptionData$Time)
    consumptionData$datetime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")    
}
