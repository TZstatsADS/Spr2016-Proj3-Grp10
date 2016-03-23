install.packages("e1071")
library(e1071)

load("COLOR_FEATURE.RData")
load("y_cat.RData")
load("dir_names.RData")

index<-sample(1:length(y_cat),length(y_cat))

y<-y_cat[index]
x<-color_feature[index,]

n<-length(y)
train.n<-round(0.8*n)
train.ix<-sort(sample(1:n,train.n))
train.x<-x[train.ix,]
test.x<-x[-train.ix,]
train.y<-as.factor(y[train.ix])
test.y<-as.factor(y[-train.ix])
cost<-2^seq(-10,10,1)
gama<-10^(-5:-1)

# cost<-2^seq(-5,6,0.25)
# cost<-c(25) the best cost I found is 25

#linear svm 
err.linear<-function(train.x,train.y,cost,K){
  ix<-sample(1:length(train.y))
  begin<-1+seq(0,K-1)*round(length(train.y)/K)
  end<-begin+round(length(train.y)/K)-1
  len<-length(cost)
  err<-rep(0,len)
  for (i in 1:len){
    for (k in 1:K){
      test.ix<-ix[begin[k]:end[k]]
      train.ix<-ix[-(begin[k]:end[k])]
      m<-svm(train.x[train.ix,],train.y[train.ix],type ='C',
             kernel ='linear',cost=cost[i],gamma =0)
      y_hat<-predict(m,train.x[test.ix,])
      err[i]<-err[i]+sum(y_hat!=train.y[test.ix])/length(train.y[test.ix])
    }
  } 
  err<-err/K
  return(err)
}

err_lin<-err.linear(train.x,train.y,cost,5)

plot(cost,err_lin,type="l")#plot error rate for linear svm versus cost(para)


best_cost<-cost[which.min(err_lin)]
svm_linear<-svm(train.x,train.y,type ='C',kernel ='linear',cost=best_cost,gamma =0)
y1<-predict(svm_linear,test.x)
best_cost
sum(y1!=test.y)/length(test.y) 

#RBF svm 
err.kernel<-function(train.x,train.y,cost,gama,K){
  ix<-sample(1:length(train.y))
  begin<-1+seq(0,K-1)*round(length(train.y)/K)
  end<-begin+round(length(train.y)/K)-1
  len_co<-length(cost)
  len_ga<-length(gama)
  err<-matrix(0,nrow=len_co,ncol=len_ga)
  for (i in 1:len_co){
    for (j in 1:len_ga){
      s=0
      for (k in 1:K){
        test.ix<-ix[begin[k]:end[k]]
        train.ix<-ix[-(begin[k]:end[k])]
        m<-svm(train.x[train.ix,],train.y[train.ix],type="C",kernel="radial",cost=cost[i],gamma=gama[j])
        y_hat<-predict(m,train.x[test.ix,])
        s<-s+sum(y_hat!=train.y[test.ix]) /length(train.y[test.ix])
      }
      err[i,j]<-s/K
    }
    
  }
  return(err)
}
err_ker<-err.kernel(train.x,train.y,cost,gama,5)

color=c("black","blue","yellow","red","green")
plot(cost,err_ker[,1],type="l")
name<-c(paste("gamma=",gama[1]))
for (j in 2:length(gama)){
  lines(cost,err_ker[,j],col=color[j])
  name<-cbind(name,paste("gamma=",gama[j]))
}
legend('topright', name, 
       lty=1, col=color, bty='n', cex=.75,yjust=10)#plot error rate for RBF svm versus cost&gama(para)

mm=err_ker[1,1]
index<-c(1,1)
for (i in 1:nrow(err_ker)){
  for (j in 1:ncol(err_ker)){
    if (err_ker[i,j]<mm){
      mm=err_ker[i,j]
      index[1]<-i
      index[2]<-j
    }
  }
}
svm_RBF<-svm(train.x,train.y,type="C",kernel="radial",cost=cost[index[1]],gamma=gama[index[2]])
y2<-predict(svm_RBF,test.x)
cost[index[1]]
gama[index[2]]
sum(y2!=test.y)/length(test.y) #RBF result