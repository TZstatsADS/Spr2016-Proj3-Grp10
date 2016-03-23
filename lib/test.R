test<-function(fit_train,dat_test){
  svm_linear<-fit_train$svm
  rf<-fit_train$rf
  color_feature<-dat_test[,1:800]
  sift<-dat_test[,801:950]
  l<-list(baseline=predict(svm_linear,color_feature),adv=predict(rf,sift))
  return(l)
}
