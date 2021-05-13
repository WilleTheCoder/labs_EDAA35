#LAB2.1
setwd("C:\\code\\R\\Lab2")

#Github commits contributors
#returns vector with authors and their latest 

 contributors <- function (file, n){
   #Read file with seperator = "|"  and create a data.frame
   data2 <- data.frame(read.csv(file, sep="|", stringsAsFactors=F))
   #Add headers
   colnames(data2) <- c("Audit_nbr", "Author", "Date", "Commit_lines");
   #Get the n most frequent authors
   top_n <- tail(sort(table(data2$Author)),n);
   #Barplot decreasing order
   barplot(top_n[order(top_n, decreasing=T)]);
   
   #create vector commit with author and their latest commit
   Author <- data2[,2];
   Date <- data2[,3];
   commit <- tapply(Date, Author, max);
   commit <- sort(commit);
   commit
 }
 
#Call function
a <- contributors("newfile.txt", 4)

#print result
print(a)
 
