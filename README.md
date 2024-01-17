# wind_power_insights

This project is divided into the following sections:

## power_generation_data

1. This folder contains the original copy of the data for four locations (*Location1.csv*, *Location2.csv*, ...) as well as a readme.txt that came as part of the data from Kaggle.
2. An R markdown file containing a basic exploration of the data, including checking for data quality, identifying trends between explanatory variables and the target variable, and transforming the data to be more suitable for machine learning modeling. This file was then formatted into a HTML for ease of viewing (*power_generation.html*).
3. The transformed datasets for the four locations used in the modeling stage (*location1_final.csv*, *location2_final.csv*, ...).

## python_model

1. Contains a jupyter notebook *wind_power_generation_model.ipynb* that loads and splits the datasets prepared in R Studio into a train and test set, then trains a simple neural network model on the training data using TensorFlow. The model's performance was measured using mean absolute and squared errors. The final model was converted to a TensorFlow Lite format for later use in the Flutter app.
2. A folder containing the original TensorFlow model (*saved_model/power_generation_predictor*)
3. A file containing the converted TensorFlow Lite model (*model.tflite*)

## wind_power_app

TBC
   
