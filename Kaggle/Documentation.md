# Final Project
## Model Fitting on the Ames, Iowa Dataset

1. fit a regression model using default settings with each of the following kinds of models:

   - ridge regression
   - lasso regression
   - knn
   - decision tree
   - support vector machines

2. Report your results. Discuss what your results tell you in terms of the underlying structure of the data. Remember that you can think about the ridge and lasso in terms of linearity, the decision tree and knn in terms of non-linearity, and knn and svm in terms of locality.
3. Use a cross-validated grid search to refine three of the above models.
4. Prepare a complexity curve for at least one attribute for each of the three models that you are tuning.
5. (Optional) Use a principal component analysis on your original data* to create principal component features. Augment the original dataset with these principal component features and repeat steps 1 and 2.
6. (Optional) Submit your results to Kaggle.

* You can either do this on your scaled numerical data or if you use Gelman scaling, you should be able to perform a PCA on the numerical and one-hot encoded categorical data.
