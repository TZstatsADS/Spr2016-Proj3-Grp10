## Required packages:

# R:
# library(e1071)
# require(caret)
# require(ggplot2)
# require(randomForest)
# library(randomForest)

# Python:
# import numpy as np
# import cv2
# import os
# import pandas as pd
# from PIL import Image, ImageDraw
# import sklearn
# from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
# from sklearn.discriminant_analysis import QuadraticDiscriminantAnalysis
# from sklearn.naive_bayes import GaussianNB
# from sklearn import cluster
# from sklearn import cross_validation
# from sklearn.externals import joblib
# from os import listdir
# from os.path import isfile, join


system("python ./lib/SIFT-Final_Test.py")
features_test <- read.csv("features_trained.csv")

dat_test <- features_test[, 2:ncol(features_test)]
fit_train <- source("./lib/train.R") # call from train.R


test <- function(fit_train, dat_test) {
        beseline <-  predict(fit_train$baseline, dat_test)
        adv <- predict(fit_train$advanced, .....)
        label_hat <- list()
        label_hat$beseline <- beseline
        label_hat$adv <- adv 
        return(label_hat)
}


# return a list prediction
# prediction$baseline: vector of class label prediction in 0/1 (0=dog,1=cat) based on the basline model
# prediction$adv: vector of class label prediction in 0/1 (0=dog,1=cat) based on the adv model





