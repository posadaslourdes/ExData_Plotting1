
plot(data$Global_active_power~data$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()