### ATTENTION
### We have 13 images that cannot be read in R, so delete those images before running this code.
### Their names are "Abyssinian_34", "Abyssinian_5", "Egyptian_Mau_129", "Egyptian_Mau_139",
### "Egyptian_Mau_14", "Egyptian_Mau_145", "Egyptian_Mau_156", "Egyptian_Mau_167",
### "Egyptian_Mau_177", "Egyptian_Mau_186", "Egyptian_Mau_191", "staffordshire_bull_terrier_2", 
### "staffordshire_bull_terrier_22".

library(R.matlab)
setwd("~/Desktop/Frapoleon/2nd semester/ADS/project3")
dir_images <- "./images"
dir_names <- list.files(dir_images)

breed_name <- rep(NA, length(dir_names))
for(i in 1:length(dir_names)){
        tt <- unlist(strsplit(dir_names[i], "_"))
        tt <- tt[-length(tt)]
        breed_name[i] = paste(tt, collapse="_", sep="")
}
cat_breed <- c("Abyssinian", "Bengal", "Birman", "Bombay", "British_Shorthair", "Egyptian_Mau",
               "Maine_Coon", "Persian", "Ragdoll", "Russian_Blue", "Siamese", "Sphynx")

iscat <- breed_name %in% cat_breed
y_cat <- as.numeric(iscat)

# I renamed the label "0" to be "-1" just for convenience when using certain algorithms like perceptron.
for (i in (1:length(y_cat))) {
        if (y_cat[i] == 0) {
                y_cat[i] <- -1
        }
}
# this would be train labels.
writeMat("y.mat", y_catexport = y_cat)

##########################################################################

source("http://bioconductor.org/biocLite.R")
biocLite()
biocLite("EBImage")
library("EBImage")
# tuning parameters.
nR <- 10
nG <- 8
nB <- 10
rBin <- seq(0, 1, length.out=nR)
gBin <- seq(0, 1, length.out=nG)
bBin <- seq(0, 1, length.out=nB)

# create feature files
rgb_feature <- list()
for (i in (1:length(dir_names))) {
        #print(i)
        img <- readImage(paste("./images/", dir_names[i], sep = ""))
        mat <- imageData(img)
        freq_rgb <- as.data.frame(table(factor(findInterval(mat[,,1], rBin), 
                                               levels=1:nR), 
                                        factor(findInterval(mat[,,2], gBin), 
                                               levels=1:nG), 
                                        factor(findInterval(mat[,,3], bBin), 
                                               levels=1:nB)))
        rgb_feature <- as.numeric(freq_rgb$Freq)/(ncol(mat)*nrow(mat))
        name <- unlist(strsplit(dir_names[i], "[.]"))[1]
        # create a new folder named "color_feature", which is in the same directory as images folder.
        writeMat(paste("./color_feature/", name, ".mat", sep = ""), rgb_featureexport = rgb_feature)
}


