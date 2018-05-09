library(rio)
#(#0)converted from xls to csv file. 
convert("~\\Data-wrangling-excercise-2\\titanic3.xls", 
        "~\\Data-wrangling-excercise-2\\titanic3.csv")
titanic_original <- read.csv("~\\Data-wrangling-excercise-2\\titanic3.csv")
titanic_original_2 <- read.csv("~\\Data-wrangling-excercise-2\\titanic3.csv")
#1 Port of embarkation
#Changed missing values and replaced them with S
for (i in 1:length(titanic_original$embarked))
{
  if(is.na(titanic_original$embarked[i]))
  {
    titanic_original$embarked[i] <- "S"
  }
}

#2 Age
#Replace missing age values with the mean of the age column
mean_age<-mean(titanic_original$age, na.rm = TRUE)
for (i in 1:length(titanic_original$age))
{
  if(is.na(titanic_original$age[i]))
  {
    titanic_original$age[i] <- mean_age
  }
}

#3 Lifeboat
#set missing boat values as NA
for (i in 1:length(titanic_original$boat))
{
  if(titanic_original$boat[i] == "")
  {
    titanic_original$boat[i] <- NA
  }
}

#4 Cabin
#created new column: has_cabin_number
titanic_original$has_cabin_number <- NA 

for (i in 1:length(titanic_original$cabin))
{
  if(titanic_original$cabin[i] == "")
  {
    titanic_original$has_cabin_number[i] <- 0
  }
  else if(titanic_original$cabin[i] != "")
  {
    titanic_original$has_cabin_number[i] <- 1
  }
}

#5 
write.csv(titanic_original_2, file = "titanic_original.csv")
write.csv(titanic_original, file = "titanic_clean.csv")
