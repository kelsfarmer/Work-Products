> mention<- searchTwitter("internet+things+energy", n=3200)

> corpus<- tm_map(corpus, removeWords, c("fasullo", "thestreet", "john", "says", "just", "4biz", "even", "forbes", "symantec", "valaafshar", "radheshk"))
> corpus<- tm_map(corpus, removeWords, c("mouserelec", "msft4work", "cisco", "sai", "ceylanparlakay", "telefonica", "sapvoice", "baypm", "tom"))

> corpus<- tm_map(corpus, removeWords, c("mouserelec", "msft4work", "cisco", "sai", "ceylanparlakay", "telefonica", "sapvoice", "baypm", "tom"))
> text<- tm_map(corpus, PlainTextDocument)

pal3 <- brewer.pal(8,"Dark2")
> png(file="iotsocial.png", width=9, height=8, units="in", res=900)
> wordcloud(text, scale=c(2,.3), min.freq=3,max.words=40, random.order=FALSE, colors=pal3)
> dev.off()

> png(file="iotdetail.png", width=9, height=8, units="in", res=900)
> wordcloud(text, scale=c(2,.3), min.freq=3,max.words=90, random.order=FALSE, colors=pal3)
> dev.off()
RStudioGD 
2 
> 