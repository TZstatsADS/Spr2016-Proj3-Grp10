

train <- function(dat_train, label_train) {


  install.packages("e1071")
  install.packages("caret")
  install.packages("randomForest")
  install.packages("ggplot2")
  library(e1071)
  require(caret)
  require(ggplot2)
  require(randomForest)
  library(randomForest)
  
  label_train <- as.factor(label_train)
  
  # color features + SVM = worst
  color_feature<-dat_train[,1:800]
  svm_linear<-svm(color_feature,label_train,type ='C',kernel ='linear',cost=1,gamma =0)
  
  # SIFT features + RF = best
  
  
  ##Random Forest(with crossvalidation and SIFT feature)
  sift<-dat_train[,801:950]
  rf_model<-randomForest(x=sift,y=label_train)
  
  model=list()
  model$svm<-svm_linear
  model$rf<-rf_model
  
  return(model)
}


