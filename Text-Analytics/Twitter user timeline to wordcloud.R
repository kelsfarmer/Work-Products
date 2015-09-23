# Script to search a particular Twitter user's timeline
user<- userTimeline('@Username', n=3600) #3600 max that Twitter API allows

# Convert to data frame
tw.df<- do.call(rbind, lapply(user, as.data.frame))

# Optional step to save a copy of tweets to a spreadsheet
write.csv(tw.df,"user_tweets.csv")

#load necessary library for text mining
library(tm)

#steps to clean tweets for analysis
tw.txt<- sapply(user, function(x) x$getText()) #converts to text vector
corpus<- Corpus(VectorSource(tw.txt)) #convert to corpus
corpus<- tm_map(corpus, removePunctuation)
corpus<- tm_map(corpus, tolower)#converts all text to lowercase
corpus<- tm_map(corpus, function(x)removeWords(x,stopwords())) #removes "stopwords" like a, an, etc.
corpus<- tm_map(corpus, PlainTextDocument)

#load library for wordcloud
library(wordcloud)
library(RColorBrewer)
pal2 <- brewer.pal(8,"Dark2")
wordcloud(corpus,min.freq=2,max.words=100, random.order=T, colors=pal2)