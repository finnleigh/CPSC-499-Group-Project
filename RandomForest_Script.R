# Load required packages
install.packages("randomForest")

require(devtools)
install_version("randomForest", version = "3.5.3", repos = "http://cran.us.r-project.org")


library(randomForest)
library(ISLR)

# Load data
data_carbon <- read.csv("C:/Users/Condotta's Lab/Box/CLASSES_UIUC/MASTER'S DEGREE/SPRING_2023/DIGITAL AGRICULTURE/carbon_data_biserial.csv")

# Set seed for reproducibility
set.seed(123)

# Split data into training and test sets
train_idx <- sample(nrow(data_carbon), nrow(data_carbon) * 0.7)
train <- data_carbon[train_idx, ]
test <- data_carbon[-train_idx, ]

# Fit random forest model
rf_model <- randomForest(
  TOC_mg_ha ~ compost_added + winter_cover_freq + cover_crop_type+cover_crop_seeding_rate,  # Replace 'y' with the name of your response variable
  data = train,
  ntree = 500,  # Increase the number of trees for better accuracy
  mtry = sqrt(ncol(train) - 1),  # Number of variables to sample at each split
  importance = TRUE)

# Print model summary
print(rf_model)

# Make predictions on test set
preds <- predict(rf_model, newdata = test)

# Evaluate model performance
confusion_matrix <- table(test$y, preds)
print(confusion_matrix)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste0("Accuracy: ", accuracy))

# Variable importance plot
varImpPlot(rf_model)
