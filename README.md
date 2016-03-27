# Project CatsDogs: Predictive analytics-model evaluation and selection

# Group 10: Weihan Li, Aoyuan Liao, Robert Minnich, Tara Shui, Yusen Wang

Please see doc folder for our presentation file, Project_3.html

#### - for cats versus dogs image data

Read [full project description](doc/project3_desc.md)

In this project, we will carry out model evaluation and selection for predictive analytics on image data. As data scientists, we often need to evaluate different modeling/analysis strategies and decide what is the best. Such decisions need to be supported with sound evidence in the form of model assessment, validation and comparison. In addition, we also need to communicate our decision and supporting evidence clearly and convincingly in an accessible fashion.

![image](https://i.ytimg.com/vi/8Ryo8Pf4NNE/hqdefault.jpg)

---
Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.

Project 3 - Team 10

Team members: Bob Minnich, Yusen Wang, Aoyuan Liao

Summary: In this project, we investigated the affects of feature selection and model selection to determine if a cat or a dog appeared in an image. We explored many different possibilites and weighed the tradeoffs of accuracy versus speed during the classification process.

Bob Minnich did the following:
* Explored multiple data pre-processing techniques. Attemped using Gaussian Filtering and Edge detection to help remove noise and background from the images to focus on the cat and dog only. Used Edge Detection to find high frequency information within the image to allow SIFT to focus on keypoints of the face of the animal.
* Explored Face Detection using Harr Cascades to automatically locate a cat or dog face within the image. This was done in order to reduce image size (increase speed of image detection) and remove all possible background noise  (increase accuracy of image detection)
* Used boxed face detection from original dataset  to crop images.
* Utilized SIFT to create key points and Image Vocabulary
* Used Cross Validation with 5 K-fold to determine values for the number of keypoints to understand how these variables affect accuracy of image classification. Choose the lowest number possible with reasonable accuracy to be able to speed up image processing. 
* Used Cross Validation with 5 K-fold to determine values for the number of clusters for K-Means detection. Choose faster, sampling method of K-Means called Mini Batch K-Means to greatly improve cluster finding speed.
* Used Cross Validation  with 5 K-fold to test multiple machine learning algorithms on image vocabulary (Random Forests, Gaussian Naïve Bayes, Linear Discriminant Analysis, Quadratic Discriminant Analysis, Neural Networks and SVM)  and determined Random Forests to be the best algorithm for accuray.
* Assisted in preparing presentation, presented presentation.

Yusen Wang did the following:
* Focused on building baseline model with appropriate color features.
* Used R to extract RGB color features, HSV color features and spatial color features.
* Used Python to compare different machine learning models’ (Average Perceptron, SVM with rbf kernel, SVM with linear kernel, SVM with polynomial kernel, Linear Discriminant Analysis, Quadratic Discriminant Analysis) performance on each one of the three color features. Used 5-fold cross validation to avoid over-fitting. Selected the best model based on CV error rate and running time. 
* Explored how to load Python code in R. If having trouble with rPython package, one perfect solution is opening R in mac terminal and using system() function to run .py file. 
* Explored advanced image analysis using opencv. 
* Assisted in extracting SIFT features, especially in combining multi key points of faces into one rectangle. Found a solution to successfully run groupRectangles() in Python without crush. 
* Assisted in writing train.R and test.R, extracting color features of test images, and debugging.

Aoyuan Liao did the following:
* Trained the baseline model with choosen RGB color features in R.
* Explored the difference of accuracy when using different color features (RGB, HSV and spatial color features) with 5-fold cross validation and determined the best color histogram with the appropriate bin size.
* Performed parameters tuning for the baseline model (linear SVM) with 5-fold cross validation using both color features and SIFT features and compared the difference of accuray and running time when using different features in our baseline model.
* Explored other machine learning models' (RBF SVM, Adaboost, Random Forest) performance for accuracy and running time on color features and SIFT futures in R. Used 5-fold cross validation to estimate prediction accuracy and avoid overfitting. Selected the best model and the best features based on estimated prediction accuracy and training time.
* Used principal component analysis to explore the amount of data variability that different numbers of principal components account for. Found appropriate numbers of pricipal components to represent variability within color features and SIFT features.
* Wrote train.R, test.R for model evaluation. Extracted color features for test images.
* Assisted in choosing best values for the number of keypoints and for the number of clusters in K-Means detection.


