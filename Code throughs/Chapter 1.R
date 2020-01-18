### Chapter 1 code through

## example 1.1 Calculating confusion matrix

library(rpart)
library(tidyverse)
load("C:/Data/r/PDSwR2-master/Statlog/loan_model_example.RData")

glimpse(d)
model

# creates 2x2 tables 
conf_mat <- table(actual = d$Loan_status, pred = predict(model, type = 'class'))
conf_mat

#            pred
# actual     BadLoan GoodLoan
# BadLoan       41      259
# GoodLoan      13      687

# computes overall model accuracy, what percent predictions correct = .728
(accuracy <- sum(diag(conf_mat)) / sum(conf_mat))  # 728 / 1000

## sum(diag(conf_mat)) = 728 = 41 + 687, actual bad = pred bad + actual good = pred good
## sum(conf_mat)  all cases (1000)


# computes precision of bad loan predictions, how many did default
(precision <- conf_mat["BadLoan", "BadLoan"] / sum(conf_mat["BadLoan", ]))

# conf_mat["BadLoan", "BadLoan"] = cell actual bad = pred bad 41
# sum(conf_mat["BadLoan", ]) = 300, or all actual bad

# computes recall - percent of bad loans
(recall <- conf_mat["BadLoan", "BadLoan"] / sum(conf_mat["BadLoan", ]))

# computes fall positive - how many mistakenly identified as bad
(fpr <- conf_mat["GoodLoan", "BadLoan"] / sum(conf_mat["GoodLoan", ]))
