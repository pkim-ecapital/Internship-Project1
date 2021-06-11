# Loads tidyquant, lubridate, xts, quantmod, TTR 
library(tidyverse)
library(tidyquant)
stock <- tq_get("AAPL")
AAPL = tq_get("AAPL", get="stock.prices", from = "2004-01-01") 
ggplot (AAPL, aes(date,close)) + geom_line()
plot(diff(log(AAPL$close)),type='l', main='log returns plot') #returns log difference of closing prices

library(tseries)
adf.test(diff(log(AAPL$close)), alternative="stationary", k=0)

acf(diff(log(AAPL$close))) #auto correlation function, gives us values of any auto correlation with its lagged values, determines the order of our parameters for our arima model

