#LAB5
source("https://fileadmin.cs.lth.se/cs/Education/EDAA35/R_resources.R")
setwd("C:\\code\\jav\\EDAA35\\bin")
options(max.print=10000)

#Reads a file
readFile <- function(file, start = 1){
  data <- read.csv(file)
  data <- data[start:nrow(data),]
  data
}

#Plots data x
plotData <- function(x){
  plot(x, type='l')
}

#Computes and returns mean and conf. values*
calcFun <- function(n, call, threshold=1){
  
  meanVal <- vector() 
  for(i in 1:n){
    pdf("res1.pdf")
  system(call)
  calcData <- readFile("result1.txt", threshold)
  plotData(calcData) 
  dev.off()
  calcData
  meanVal[i] <- mean(calcData$time)
  }
  
  totalMean <-  mean(meanVal)
  confVal <- confidenceInterval (meanVal, confidenceLevel=0.95)
  info <- data.frame(totalMean, confVal)
  info
}

#plots a graph (pdf) if filename is given and returns data with threshold 
main <- function(call, output=NULL,threshold=1){
  system(call)
  pdf(output)
  da <- readFile("result1.txt", threshold)
  plotData(da) 
  dev.off()
  da
}

#computes and outputs a t-test
ttest <- function(){
  dataOwn <- main(JITcallown,250)
  dataJava <- main(JITcall,250)
  print(t.test(dataOwn, dataJava))
}

#Systemcalls
JITcall <- "java Lab5.ExecTime data1.txt result1.txt 600"
woJITcall <- "java -Xint Lab5.ExecTime data1.txt result1.txt 600"
JITcallown <- "java Lab5.ExecTimeOwn data1.txt result1.txt 600"

main(JITcall,"res2.pdf") 
#calcFun(10, JITcall, 250)

#main(woJITcall, "resultwoJIT.pdf")
#main(JITcall, "resultJIT.pdf", 250)

#ttest()



