
train <- function(dat_train, label_train) {
  
        library(e1071)
        require(caret)
        require(ggplot2)
        require(randomForest)
        library(randomForest)
        label_train <- as.factor(label_train)
        
        # color features + SVM = worst
#         load("COLOR_FEATURE.RData")
#         load("y_cat.RData")
        color_feature<-dat_train[,1:800]
        best_cost<-25
        svm_linear<-svm(color_feature,y_cat,type ='C',kernel ='linear',cost=1,gamma =0)
        
        
        # SIFT features + RF = best
        
        
        ##Random Forest(with crossvalidation and SIFT feature)

        rf_model<-train(x=dat_train[,801:950],y=label_train,method='rf',trControl=trainControl(method="cv",number=5))
        
        model=list()
        model$svm<-svm_linear
        model$rf<-rf_model
        
        return(model)
}



#print(rf_model)
#print(rf_model$finalModel)








#return a list model
#model$baseline = base model
#model$adv = best model

# Conclusion: features are more important than models.
