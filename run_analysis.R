#Set default working directory to "../UCI HAR Dataset"
#Step 1
#read data
subtrain<-read.table("./train/subject_train.txt")
subtest<-read.table("./test/subject_test.txt")
trainy<-read.table("./train/y_train.txt")
testy<-read.table("./test/Y_test.txt")
train<-read.table("./train/X_train.txt")
test<-read.table("./test/X_test.txt")
#start to combine
#comtrain<-cbind(subtrain,trainy,train)
#comtest<-cbind(subtest,testy,test)


#Steps 2
feature<-read.table("features.txt")
#feature$V2<-gsub("-","_",feature$V2) #Replace "-" to "_"
#feature$V2<-gsub("\\()","",feature$V2) #Remove "()"
colnames(train)<-as.character(feature$V2)
colnames(test)<-as.character(feature$V2)
#extract mean std columns
extractfeature<-c(agrep("mean()",feature$V2),agrep("std()",feature$V2)) 
meanstd1<-train[,sort(extractfeature)]
#colnames(meanstd1)<-as.character(feature$V2[sort(extractfeature)])
meanstd2<-test[,sort(extractfeature)]
#colnames(meanstd2)<-as.character(feature$V2[sort(extractfeature)])

#Bind datasheets
bindmeanstd<-rbind(meanstd1,meanstd2)
bindlabel<-rbind(trainy,testy)
bindsubject<-rbind(subtrain,subtest)
meanstd<-cbind(bindsubject,bindlabel,bindmeanstd)
colnames(meanstd)[1:2]<-c("Subject","ActivityLabel")

#Step 3
label<-read.table("activity_labels.txt")
meanstd$ActivityLabel<-label$V2[meanstd$ActivityLabel]

#Step 4
columnname<-names(meanstd)
columnname<-gsub("-","_",columnname) #Replace "-" to "_"
columnname<-gsub("\\()","",columnname) #Remove "()" 
columnname<-gsub("^t","Time_",columnname)
columnname<-gsub("^f","FFT_",columnname)
colnames(meanstd)<-columnname

#Step 5
dataout<-aggregate(. ~ ActivityLabel+Subject,data = meanstd,FUN=mean)

write.table(dataout,file="dataout.txt",row.names = FALSE)