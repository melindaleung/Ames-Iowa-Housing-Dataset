# Kaggle Competition - House Prices: Advanced Regression Techniques
## Model Fitting on the Ames, Iowa Dataset

The Kaggle competition can be found [here](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/data).

### What I did

1. Because this is a learning set, I practiced fitting the following models with default settings to the dataset:
   - Ridge Regression 
   - Lasso Regression
   - KNN
   - Decision Tree
   - Support Vector Machines

2. I used a cross-validated grid search to refine my KNN, Decision Tree and SVM model.

3. I prepared a complexity curve for one attribute for each of the three models that I tuned.

4. I performed a principal component analysis on the original training data to create principal component features. Using this new principal component features, I repeated steps 1 and 2.

### Folders

1. **data**: Contains the original train and test set from Kaggle
2. **ipynb**: Jupyter notebooks - Model Fitting, Hyperparameter Tuning, PCA
3. **submission**: Kaggle Submissions

### Kaggle Submission Scores
