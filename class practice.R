# practice
text2 <- readLines(file.choose("class")) # trying to read in the file (and we don't have the file )
text2
docs2 <- Corpus(VectorSource(text2)) # 
docs2
inspect(docs2)
toSpace2 <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs2 <- tm_map(docs2, toSpace2, "/") # we don' want /@ 
docs2 <- tm_map(docs2, toSpace2, "@")
docs2 <- tm_map(docs2, toSpace2, "\\|")
docs2 <- Corpus(VectorSource(text2)) # 

docs2 <- tm_map(docs2, content_transformer(tolower))

docs2 <- tm_map(docs2, removeNumbers)

docs2 <- tm_map(docs2, removeWords, stopwords("english"))

docs2 <- tm_map(docs2, removeWords, c("blabla1", "blabla2")) 

docs2 <- tm_map(docs2, removePunctuation)

docs2 <- tm_map(docs2, stripWhitespace)
)

dtm2 <- TermDocumentMatrix(docs2) # when table appear means we almost there 
ma <- as.matrix(dtm2)
va <- sort(rowSums(ma),decreasing=TRUE)
da <- data.frame(word = names(va),freq=va)
head(da,10)
inspect(docs2)
set.seed(1234)
wordcloud(words = da$word, freq = da$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Blues")) 
