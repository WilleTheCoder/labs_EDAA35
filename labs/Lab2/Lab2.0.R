#LAB2.0
setwd("C:\\code\\R\\Lab2")

#Read data
data <- data.frame(read.csv("data.txt"))

#Filter non complete cases
 removeNA <- function(data){
    data <- data[complete.cases(data),]
    data
}

#Analyze potential outliers:
  analysePotentialOutliers <- function (data, threshold){
    
   variables <- c();
   NrpotentialOutliers <- c();
   MeanNoOutliers <- c();
  
   for(i in 1:ncol(data)){
     variables[i] <- names(data[i]);
     NrpotentialOutliers[i] <- length(data[data[variables[i]]>threshold[i],i])
     MeanNoOutliers[i] <- mean(data[data[variables[i]]<threshold[i],i])
     }
  
   outliers <- data.frame(variables, NrpotentialOutliers, MeanNoOutliers)
   print(outliers)
  }
  
#define threshold
threshold <- c(5,5,0) 
#Call function
analysePotentialOutliers(removeNA(data), threshold)
  