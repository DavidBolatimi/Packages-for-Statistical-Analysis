#Team Members:
#Vinay Raj Raju
#Chittapragada Venkata, Sai Sri Laasya
#Mohammed, Rayyan Irbaz
#David Bolatimi

library(tidyverse)
library(dplyr)
library(lubridate)
#install.packages("nycflights13")
library(nycflights13)

date_quarter<- function(v){
  len<- length(v)
  res<-c()
  for(x in 1:len) {
    date<- as.POSIXlt(v[c(x)])
    res<-c(res, quarters(date))
    }
  return(res)
  
}

v<- c("2019-02-01", "2011-09-23", "1978-11-30")
print(v)
#Feel free to change the dates as you please

date_quarter(v)