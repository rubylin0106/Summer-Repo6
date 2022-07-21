
# I can not knit word cloud(#Question 7 ) in r markdown , so that is why I use in here.
text1 <- readLines(file.choose("midterm"))
text1
docs <- Corpus(VectorSource(text1))
docs


inspect(docs)


toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeNumbers)

docs <- tm_map(docs, removeWords, stopwords("english"))

docs <- tm_map(docs, removeWords, c("blabla1", "blabla2"))

docs <- tm_map(docs, removePunctuation)

docs <- tm_map(docs, stripWhitespace)
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Blues"))