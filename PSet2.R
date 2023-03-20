#Team Members:
#David Bolatimi
#Chittapragada Venkata, Sai Sri Laasya
#Mohammed, Rayyan Irbaz
#Vinay Raj Raju

#Part I
temp_categorizer <- function(temp) {
  if(temp >= 90) {
    message('hot')
  } else if(temp >= 60 && temp <= 90) {
    message('warm')
  } else if(temp >= 32 && temp <= 60) {
    message('cold')
  } else {
    message('freezing')
  }  
}

#Part II
sentence <- c("Learning", "loops", "in", "R", "is", "not", "that", "bad") 


for (i in unique(min(nchar(sentence)):max(nchar(sentence)))) {
  words <- unique(sentence[nchar(sentence) == i])
  if (length(words) > 0) {
    message(paste(paste(words, collapse = " & "))," ","has"," ", i," ","Letters")
  }
}