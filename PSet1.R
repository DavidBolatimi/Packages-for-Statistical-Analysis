#Team Members:
#Chittapragada Venkata, Sai Sri Laasya
#Mohammed, Rayyan Irbaz
#Vinay Raj Raju
#David Bolatimi

#Part I
library(tidyverse)

#Reading and merging all three data frames of EPL#
epl_13 <- read_csv("C:/Users/Earlham College CGE/Downloads/EPL_13-14.csv")
epl_14 <- read_csv("C:/Users/Earlham College CGE/Downloads/EPL_14-15.csv")
epl_15 <- read_csv("C:/Users/Earlham College CGE/Downloads/EPL_15-16.csv")
epl_combined <- rbind(epl_13, epl_14, epl_15)

#Selecting the data required for the problem
epl_data <- select(epl_combined, Season, Team, GF, GA, GD)
#Creating a new column to calculate the goal difference
epl_data <- mutate(epl_data, Calculated_field = (GF - GA))
colnames(epl_data)
#Checking for the type of data in the GD column
class(epl_data$GD)
#Checking for the type of data in the new column added above
class(epl_data$Calculated_field)
#Looking for difference in GD column & our calculated column
epl_data <- mutate(epl_data, points_check = (GD - Calculated_field))

#We have some discrepancies: there is an error when we try to calculate the difference
#between GD & our calculated field, non-numeric argument to binary operator.
#Why? This is caused because the GD column entries are of type characters, whereas the Calculated field is of type numeric.
#Converting the GD data into numeric column
epl_data$GD <- as.numeric(epl_data$GD)

#Creating a new column with the difference in the goal data
epl_data <- mutate(epl_data, points_check = (GD - Calculated_field))
epl_data$points_check <- as.numeric(epl_data$points_check)
epl_data

#Checking if there is any NA data in the dataframe
is.na(epl_data$points_check)

#Creating new tibble
#Extracting the NA's from the dataframe
epl_nadata <- epl_data[is.na(epl_data$points_check), ]

#Part II
Tt <- read_csv('C:/Users/Earlham College CGE/Documents/titanic_data.csv')

#Get working directory
getwd( )
#1.

df <- select(Tt,Survived, Name, Sex, Age, Fare, Embarked)

#Create new column Survival_Status
survival <- cbind()
survival = ifelse(df$Survived==1, "Survived", "Did Not Survive")

df['Survival_status'] <- survival

#Table Summary statistics
df %>%
  group_by(Survival_status) %>%
  summarise(Avg_Age = mean(Age), Avg_Fare = mean(Fare))
#Our tibble shows NA for Average age because we have null values in our Age column so R could not calculate the average.

#2.Percentage of passengers that survived
perc_surv <- select(df,Survival_status, Survived, Sex, Embarked)


perc_surv %>% 
  group_by(Sex, Embarked) %>% 
  summarise(Survival_perc = sum(Survived)/156)
