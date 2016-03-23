
load("COLOR_FEATURE.RData")
x<-color_feature
n<-nrow(x)
d<-ncol(x)

m=apply(x,MARGIN=c(2),FUN=mean)  #mean

m_matrix<-matrix(m,nrow=n,ncol=d,byrow=TRUE)

x<-x-m_matrix #to be centered

pc=prcomp(x)

sum=0
ss=vector()  ## variance included
for (i in 1:d){
  sum=sum+(pc$sdev[i])^2
  ss=cbind(ss,sum)
}

for (i in 1:d){
  ss[i]=ss[i]/sum
} 

plot(as.numeric(ss)~seq(1:d),xlab='the number of components',ylab='proportion of var')

##if we choose 400 principal components and get new features n*400
new_features<-x%*%(pc$rotation[,1:400])

save(new_features,m,pc,file="new_features.RData")
