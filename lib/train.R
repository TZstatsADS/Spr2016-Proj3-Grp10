## Required packages:
# R:
# Python:


system("python ./lib/Crop_Files.py")
system("python ./lib/SIFT-Final_Train.py")

features_trained <- read.csv("features_trained.csv")
dat_train <- features_trained[, 2:(ncol(features_trained)-1)]
label_train <- features_trained[, ncol(features_trained)]


saveRDS(dat_train, "./output/feature_eval.RData")
train <- function(dat_train, label_train) {
        library(e1071)
        require(caret)
        require(ggplot2)
        require(randomForest)
        library(randomForest)
        label_train <- as.factor(label_train)
        
        # color features + SVM = worst
        load("COLOR_FEATURE.RData")
        load("y_cat.RData")
        
        best_cost<-25
        svm_linear_time<-system.time(svm_linear<-svm(color_feature,y_cat,type ='C',kernel ='linear',cost=1,gamma =0))[1]
        
        
        # SIFT features + RF = best
        
        
        ##Random Forest(with crossvalidation and SIFT feature)
        numeric<-matrix(as.numeric(as.matrix(dat_train)),nrow=3686,ncol=150)
        start=Sys.time()
        rf_model<-train(x=numeric,y=label_train,method='rf',trControl=trainControl(method="cv",number=5))
        end=Sys.time()
        time_cost_rf=end-start
        
        
        model=list()
        model$baseline<-svm_linear
        model$advanced<-rf_model
        
        save(model, "finalmodel1.RData")
        return(model)
}



#print(rf_model)
#print(rf_model$finalModel)








#return a list model
#model$baseline = base model
#model$adv = best model

# Conclusion: features are more important than models.
