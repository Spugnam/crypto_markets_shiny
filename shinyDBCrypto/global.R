# # convert matrix to dataframe
# state_stat <- data.frame(state.name = rownames(state.x77), state.x77)
# # remove row names
# rownames(state_stat) <- NULL
# # create variable with colnames as choice
# choice <- colnames(state_stat)[-1]


library(data.table)
library(dplyr)
library(ggplot2)

#setwd("/Users/Quentin/Documents/Kaggle/cryto_markets/shinyDBCrypto")
#raw.crypto <- fread("crypto.csv", stringsAsFactors = F)
raw.crypto <- fread(file.choose(), stringsAsFactors = F)

crypto <- as.data.table(raw.crypto)
crypto <- na.omit(crypto)
print("test")
crypto[,date := list(as.Date(date))][, volume := list(as.numeric(volume))] # "pipe" to update 2 columns
crypto <- as.data.frame(crypto)
choice <- colnames(crypto)[c(2,3,4,5,6,9,11)]

crypto_active <- crypto  %>%
  mutate(month=format(date,"%Y%m")) %>%
  group_by(coin) %>%
  mutate(first_month=ifelse(date==min(date),"yes", "no"),
         last_month=ifelse(date==max(date) & format(date, "%Y%m")!="201709","yes", "no")) %>%
  group_by(month) %>%
  summarise(active=n_distinct(coin),
            initiations=sum(first_month=="yes"),
            discontinuations=sum(last_month=="yes"))



