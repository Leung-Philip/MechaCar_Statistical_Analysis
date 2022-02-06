library(dplyr) #import library

#Deliverable 1
mpg <- read.csv('MechaCar_mpg.csv', check.names=F, stringsAsFactors=F) #read csv
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg, data=mpg) #linear regression
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg)) #wrap in summary()

#Deliverable 2
coil <- read.csv('Suspension_Coil.csv', check.names=F, stringsAsFactors=F) #read csv
total_summary <- coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups='keep') #PSI Summarize
lot_summary <- coil %>% group_by(Manufacturing_Lot) %>%summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups='keep') ##group by lot

#Deliverable 3
t.test(coil$PSI, mu=1500)#t-test for population mean
#t.test(formula = PSI ~ Manvufacturing_Lot, data=coil, subset(coil, Manufacturing_Lot=='Lot1'), mu=1500) #t-test for lot 1
subset_lot1 <- subset(coil, coil$Manufacturing_Lot=='Lot1')
t.test(subset_lot1$PSI, mu=1500)

subset_lot2 <- subset(coil, coil$Manufacturing_Lot=='Lot2')
t.test(subset_lot2$PSI, mu=1500)


subset_lot3 <- subset(coil, coil$Manufacturing_Lot=='Lot3')
t.test(subset_lot3$PSI, mu=1500)





