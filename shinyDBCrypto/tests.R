library(ggplot2)

crypto$coin <- as.factor(crypto$coin)
data <- crypto[100000:105000,crypto$coin, drop=FALSE]

crypto1 <- crypto[1000:20000,]
hist(data=crypto1, x=log(crypto1$close))

ggplot(crypto) + geom_histogram(aes(x=close))

crypto[,"open", drop=FALSE]


library(googleVis)

rm(crypto2)

Line <- gvisLineChart(data = crypto[crypto$symbol=="BTC",], 
                      xvar = "date", 
                      yvar ="close") #, options=list(vAxis.logScale = TRUE))
plot(Line)

crypto[crypto$symbol=="BTC",] %>% head(10)
