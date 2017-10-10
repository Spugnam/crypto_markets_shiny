library(PerformanceAnalytics)
data(edhec)
edhec %>% head
Return.portfolio(edhec["1997",1:5], rebalance_on="quarters") # returns time series
Return.portfolio(edhec["1997",1:5], rebalance_on="quarters", verbose=TRUE) # returns list
# with a weights object
data(weights) # rebalance at the beginning of the year to various weights through time
weights %>% head
chart.StackedBar(weights)
x <- Return.portfolio(edhec["2000::",1:11], weights=weights,verbose=TRUE)
str(x)
chart.CumReturns(x$returns)
chart.StackedBar(x$BOP.Weight)
chart.StackedBar(x$BOP.Value)

#table.Correlation	
#Comparison of correlalations and significance statistics

#table.Autocorrelation

#charts.PerformanceSummary, 