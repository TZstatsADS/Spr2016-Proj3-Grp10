test<-function(fit_train,dat_test){
 l<-list(baseline=predict(fit_train$svm,dat_test[,1:800]),adv=predict(ft_train$rf,dat_test[,801:950]))
 return(l)
 }