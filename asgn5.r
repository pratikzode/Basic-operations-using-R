if (!require(reshape2)) install.packages('reshape2')
library(reshape2)
data_frame <- read.csv("/home/sharan/Desktop/SL6/dataset_Facebook.csv",sep=",")
print(data_frame)
link <- subset(data_frame, data_frame['Type']=='Link')
photo <- subset(data_frame, data_frame['Type']=='Photo')
status <- subset(data_frame, data_frame['Type']=='Status')
video <- subset(data_frame, data_frame['Type']=='Video')

sorted_status<- status[with(status,order(-status[,1])),]
sorted_link<- link[with(link,order(-link[,1])),]
sorted_photo<- photo[with(photo,order(-photo[,1])),]
sorted_video<- video[with(video,order(-video[,1])),]


print(sorted_photo[0:1,])
print(sorted_status[0:1,])
print(sorted_video[0:1,])
print(sorted_photo[0:1,])


transposed_link<-t(link)
transposed_status<-t(status)
transposed_photo<-t(photo)
transposed_video<-t(video)
print(transposed_status)

#
melt_link <- melt(link,id = c('Type','Category','Page_total_likes','like','comment','share'))
print(melt_link)

melt_video <- melt(video,id=c('Type','Category','Page_total_likes','like','comment','share'))
print(melt_video)

cast_link <- dcast(melt_link,Type+Category+Page_total_likes+like+comment+share~variable)
print(cast_link)

cast_video <- dcast(melt_video,Type+Category+Page_total_likes+like+comment+share~variable)
print(cast_video)


