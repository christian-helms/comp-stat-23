getwd()
setwd("data")
getwd()
dataset <- read.delim("NanoporeDataSet.csv")
summary(dataset)
head(dataset)
?read.delim
summary(dataset)
dataset[2]
dataset.signal_positive <- subset(dataset, dataset$end_reason == "signal_positive")
filtered2 <- subset(dataset.signal_positive, dataset.signal_positive$Quality >= 8)
odd <- subset(filtered2, filtered2$Channel_Number %% 2 == 1)
even <- subset(filtered2, filtered2$Channel_Number %% 2 == 0)
summary(odd)
summary(even)
if (3 < 2) {
  print("yes")
} else {
  print("no")
}
?ggplot2::geom_histogram
