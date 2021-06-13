# packages
library(dplyr)

# importing MechaCar data
df <- read.csv('MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

# Linear Regression to Predict MPG 
summary(lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length, data = df))

# importing suspension data 
table <- read.csv('Suspension_Coil.csv', stringsAsFactors = F)
# create a total summary
total_summary <- table %>% summarize(Mean=mean(PSI), Median= median(PSI), Variance= var(PSI), SD= sd(PSI))
# grouping by manufacturing lot
m_summary <- table %>% group_by(Manufacturing_Lot) %>%  summarize(Mean=mean(PSI), Median= median(PSI), Variance= var(PSI), SD= sd(PSI))

# t.test() on Suspension coils
t.test(x=table$PSI, mu=1500)
# subset for lot 1
lot1 <- subset(table, Manufacturing_Lot=='Lot1')
t.test(x=lot1$PSI, mu=1500)
# subset for lot 2
lot2 <- subset(table, Manufacturing_Lot=='Lot2')
t.test(x=lot2$PSI, mu=1500)
# subset for lot 3
lot3 <- subset(table, Manufacturing_Lot=='Lot3')
t.test(x=lot3$PSI, mu=1500)

