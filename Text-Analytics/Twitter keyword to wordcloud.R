# Script to search twitteR for a mention or a set of mentions
mention<- searchTwitter("#searchterm+searchterm2", n=3200, lang="en", since='YYYY-MM-DD', until='YYYY-MM-DD')
#use + to separate query terms, 3200 max that Twitter API allows

tw.df<- do.call(rbind, lapply(mention, as.data.frame)) # Convert to data frame

# Optional step to save a copy of tweets to a spreadsheet
write.csv(tw.df,"mentioned_tweets.csv")

library(tm)#load necessary library for text mining

#steps to clean tweets for analysis
tw.txt<- sapply(mention, function(x) x$getText()) #converts to text vector
corpus<- Corpus(VectorSource(tw.txt)) #convert to corpus
corpus<- tm_map(corpus, removePunctuation)
corpus<- tm_map(corpus, function(x) iconv(x, to='ASCII', sub=""))
corpus<- tm_map(corpus, tolower)#converts all text to lowercase
corpus<- tm_map(corpus, function(x)removeWords(x,stopwords())) #removes "stopwords" like a, an, etc.
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x) 
corpus <- tm_map(corpus, removeURL) 

corpus<- tm_map(corpus, removeWords, "remove.this.word")

#if you want to strip re-tweets: head(strip_retweets(corpus, strip_manual=TRUE, strip_mt=TRUE)) 

text<- tm_map(corpus, PlainTextDocument) #Converts corpus to plain text, which is the format that the wordcloud package requires

#load library for wordcloud
library(wordcloud)
library(RColorBrewer)
pal2 <- brewer.pal(8,"Dark2")
wordcloud(text, scale=c(7,.2), min.freq=2,max.words=200, random.order=FALSE, colors=pal)

#if there are any words that you would like to remove, need to go back to the corpus and run the following:
corpus<- tm_map(corpus, removeWords, "remove.this.word")
#once words are removed, convert back to text and run through wordcloud again