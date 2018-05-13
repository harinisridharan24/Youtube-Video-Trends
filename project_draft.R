getwd()
setwd("C:/Users/harini kumar/Documents/DM1/youtube-new-2")
data = read.csv("cleaned_US_data.csv",header=TRUE,sep=",")
head(data)
data

#find NA values
is.na(data$likes)
is.na(data$dislikes)
is.na(data$views)
is.na(data$comment_count)


#replace with mean
likes.mean <- mean(data$likes, na.rm=TRUE)
data$likes[is.na(data$likes)] = likes.mean
likes.mean

dislikes.mean <- mean(data$dislikes, na.rm=TRUE)
data$dislikes[is.na(data$dislikes)] = dislikes.mean
dislikes.mean

views.mean <- mean(data$views, na.rm=TRUE)
data$views[is.na(data$views)] = views.mean
views.mean


comments.mean <- mean(data$comment_count, na.rm=TRUE)
data$comment_count[is.na(data$comment_count)] = comments.mean
comments.mean

#Calculating Likes Ratio
data$total <- data$likes + data$dislikes 
data

data$likes_ratio <- data$likes / data$total
data


#Plotting different graphs to determine the relationship among different
#attributes.. mainly considered attributes are views, likes, dislikes
#comment_count
#Found disliked video accumulated more comments
#Entertainment category accumulates more comments, likes and dislikes

#plot
plot(data$likes, data$comment_count, xlab="Likes", ylab="Comments", main="Likes vs Comments", col="blue")
plot(data$dislikes, data$comment_count, xlab="Dislikes", ylab="Comments", main="Dislikes vs Comments", col="green")
plot(data$views, data$comment_count, xlab="Views", ylab="Comments", main="Views vs Comments", col="red")
plot(data$views, data$likes, xlab="Views", ylab="Likes", main="Views vs Likes", col="orange")


#ggplot are plotted against views, likes, dislikes and comments attributes
#Also differentiated various catgories
library("ggplot2")
ggplot(data, aes(x = views, y = comment_count)) + geom_point(aes(color=category))  
ggplot(data, aes(x = likes, y = comment_count)) + geom_point(aes(color=category))
ggplot(data, aes(x = views, y = comment_count)) + geom_point(aes(color=category))
ggplot(data, aes(x = dislikes, y = comment_count)) + geom_point(aes(color=category))
ggplot(data, aes(x = views, y = likes)) + geom_point(aes(color=category))
ggplot(data, aes(x = views, y = dislikes)) + geom_point(aes(color=category))
ggplot(data, aes(x = likes_ratio/comment_count, y = category)) + geom_point(aes(color=category))
ggplot(data, aes(x = likes/dislikes, y = comment_count)) + geom_point(aes(color=category))
ggplot(data, aes(x = comment_count, y = likes)) + geom_point(aes(color=category))
ggplot(data, aes(x = comment_count, y = dislikes)) + geom_point(aes(color=category))

#Correlation Plot
#Finding the correlation among views, likes, dislikes, comment_count
#and plotting it
library("corrplot")
correlation <- cor(data[, c(10:13)])
correlation

corrplot(correlation, method = "number")


