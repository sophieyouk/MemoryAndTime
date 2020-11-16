data <- read.csv('ljaf-delay-data.csv')
data <- na.omit(data)[,-c(1,5,15)]
data$condition <- factor(data$condition)
data$Delay <- factor(data$Delay)
data$Video <- factor(data$Video)
data$Weapon <- factor(data$Weapon)
data$TPTA <- factor(data$TPTA)
data$Decision <- factor(data$Decision)
data$Chooser <- factor(data$Chooser)
data$Sex <- factor(data$Sex)
data$Video_Act <- factor(data$Video_Act)
data$Prace_revised <- factor(data$Prace_revised)
data$Cross.Race <- factor(data$Cross.Race)
data$CFMT_Quart <- factor(data$CFMT_Quart)

# Two-way table: the whole data
table(data$TPTA, data$Accuracy)
table(data$TPTA, data$Chooser, data$Accuracy)


# Two-way table: immediate
immed <- data[which(data$Delay=="Immediate"),]
table(immed$TPTA, immed$Accuracy)
table(immed$TPTA, immed$Chooser, immed$Accuracy)


# Two-way table: 2 days
day2 <- data[which(data$Delay=="2day"),]
table(day2$TPTA, day2$Accuracy)
table(day2$TPTA, day2$Chooser, day2$Accuracy)


# Two-way table: 4 days
day4 <- data[which(data$Delay=="4day"),]
table(day4$TPTA, day4$Accuracy)
table(day4$TPTA, day4$Chooser, day4$Accuracy)


# Two-way table: 8 days
day8 <- data[which(data$Delay=="8day"),]
table(day8$TPTA, day8$Accuracy)
table(day8$TPTA, day8$Chooser, day8$Accuracy)


##### Logistic regression
# Model1 – Accuracy vs. time delay & decision
model1 = glm(Accuracy~Delay, data, family=binomial)
summary(model1)


delay <- rep(c("immediate", "2day", "4day", "8day"), each=3)
rates <- rep(c("Accuracy", "True Pos", "True Neg"),4)
n <- c(0.55, 0.41, 0.68, 0.40, 0.30, 0.50, 0.35, 0.27, 0.42, 0.35, 0.21, 0.48)
timeDelay <- cbind(delay, rates, n)
timeDelay <- as.data.frame(timeDelay)
colnames(timeDelay) <- c("Delay", "Rates", "Rate")

timeDelay$Delay <- factor(timeDelay$Delay, levels = c("immediate", "2day", "4day", "8day"))
timeDelay$Rates <- factor(timeDelay$Rates, levels = c("Accuracy", "True Pos", "True Neg"))


library(ggplot2)
ggplot(timeDelay, aes(x=Delay, y=Rate, group=Rates, color=Rates)) +
  geom_line() +
  ggtitle("Accuracy and True Rates by the Time Delay")



##### Logistic regression
# Model2 – Accuracy vs. other variables
model2 = glm(Accuracy~.-condition, data, family=binomial)
summary(model2)

# Model3 – Accuracy vs. reduce less significant variables
model3 = glm(Accuracy~.-condition-Sex-Weapon-RT_Conf-CFMT_Quart-Video_Act-RT-logRT_mad-Prace_revised-logRT-Cross.Race-Decision,
             data, family=binomial)
summary(model3)



