# This is better explained in the 01. EDA in the full dataset.

import pandas as pd
import numpy as np

train = pd.read_csv('train.csv') #Load data
train.drop('Id', axis=1, inplace=True) #Drop ID column

# Change categorical variables from object type to category type
for column in train.select_dtypes(['object']).columns: 
    train[column] = train[column].astype('category')

# Change certain numeric variables into categorical variables
to_be_category = ['MSSubClass', 'OverallQual', 'OverallCond', 'BsmtFullBath', 'BsmtHalfBath', 'FullBath', 
                 'HalfBath', 'BedroomAbvGr', 'KitchenAbvGr', 'TotRmsAbvGrd', 'Fireplaces', 'GarageCars', 'MoSold']
for column in to_be_category:
    train[column] = train[column].astype('category')

# Replace NA's in numeric variables with the mean
train.LotFrontage.fillna(train.LotFrontage.mean(), inplace=True)
train.MasVnrArea.fillna(train.MasVnrArea.mean(), inplace=True)
train.GarageYrBlt.fillna(train.GarageYrBlt.mean(), inplace=True)

# These NA's indicate that the house just doesn't have it
empty_means_without = ['Alley','BsmtQual','BsmtCond','BsmtExposure','BsmtFinType1', 'BsmtFinType2', 'FireplaceQu',
                       'GarageType','GarageFinish','GarageQual','GarageCond','PoolQC','Fence','MiscFeature']
for feature in empty_means_without:
    train[feature].cat.add_categories(['None'], inplace=True)
    train[feature].fillna('None', inplace=True)

train.dropna(inplace=True) #Drop any remaining NA's

train = pd.get_dummies(train) #One-hot encode
train = np.log(train + 1) #Deskew
train = train - train.mean()/(2*train.std()) #Scaling using Gelman's method of 2 SD