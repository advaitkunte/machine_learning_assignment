library("e1071") # for SVM
library("class") # for KNN

# INIT
# load training data and labels
data = read.csv("training.csv",header=TRUE,fileEncoding="latin1")

# load training data
train = data[,3:201]
# load training labels
trainL= data[,1] 

# load test data and labels
test = read.csv("test-data.csv",header=TRUE,fileEncoding="latin1")
# load test data
test = test[,3:201]

# load test labels
testL = read.csv("test-labels.csv",header=TRUE,fileEncoding="latin1")
# load just the test labels
testL = testL[,1]


# UNCOMMENT THE REQUIRED TECHNIQUES

# K NEAREST NEIGHBOURS
predictions = knn(train, test, trainL, k = 20)
# change the k value

# SVM
# model <- svm (train,trainL,type="C-classification",kernel="linear")
# kernel = "sigmoid,polynomial,linear" default is RBF
# predictions = predict(model,test)

# NAIVE BAYES
# classifier <- naiveBayes(train,as.factor(trainL))
# predictions = predict(classifier,test)


# count of correct predictions
count = 0

for (i in 1:dim(data.frame(testL))[1])
{
	if(predictions[i]==testL[i])
	{
		count = count + 1
	}
}

# accuracy, giver percentage of correct prediction of test data
accu = count / (dim(data.frame(testL))[1]) * 100