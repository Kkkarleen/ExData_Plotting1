#unzip the data
file<-"exdata_data_household_power_consumption.zip"
unzip(file,exdir=".")

#read in data from file 
power<-read.table("household_power_consumption.txt",skip=1, sep=";")

#assign column names
colnames(power)<-c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                   "Sub_metering_3")



#subset dataset with specific date "2007-02-01 and 2007-02-02"

subsetpower<-subset(power, Date%in% c("1/2/2007","2/2/2007"))


#convert date variable to date class
subsetpower$Date<-as.Date(subsetpower$Date, format="%d/%m/%Y")


datetime<-paste(as.Date(subsetpower$Date),subsetpower$Time)
subsetpower$datetime<- as.POSIXct(datetime)

#Open a graphics device
png(filename="Plot2.png", width=480,height = 480)

#create plot
with(subsetpower, {
        plot(Global_active_power~datetime, type="l",
             ylab = "Global Active Power (kilowatts)", xlab="")
})

#close the graphics device
dev.off()
