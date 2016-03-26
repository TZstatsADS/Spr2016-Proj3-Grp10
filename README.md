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

Team members: Bob Minnich

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

