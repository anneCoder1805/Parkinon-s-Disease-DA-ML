library(ggplot2)
library(lattice)
library(caret)
library(datasets)
psData<-read.csv('PSData.csv')
psData$dStatus<-as.factor(psData$dStatus)
set.seed(1234)
preproc <- c("center", "scale")
control <- trainControl(method = "cv", number = 10)
performance_metric <- "Accuracy"
# Linear discriminant analysis (LDA)
LDA <- train(dStatus ~ .,
             data = psData, method = "lda",
             metric = performance_metric,
             trControl = control, preProcess = preproc
)
# Classification and regression trees (CART)
CART <- train(dStatus ~ .,
              data = psData, method = "rpart",
              metric = performance_metric,
              trControl = control, preProcess = preproc
)
# Support vector machine (SVM)
SVM <- train(dStatus ~ .,
             data = psData, method = "svmRadial",
             metric = performance_metric,
             trControl = control, preProcess = preproc
)
# Random forest (RF)
RF <- train(dStatus ~ .,
            data = psData, method = "rf",
            metric = performance_metric, 
            trControl = control, preProcess = preproc
)
results <- resamples(list(LDA = LDA,  CART = CART, SVM = SVM, RF = RF))
summary(results)
ggplot(results) + 
labs(y = "Accuracy") + 
theme_classic()

