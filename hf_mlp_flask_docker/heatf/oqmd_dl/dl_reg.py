import re
import sys
import numpy as np
import pkg_resources

#import pandas as pd
from sklearn.pipeline import Pipeline
from sklearn.base import BaseEstimator, TransformerMixin

import tensorflow as tf
from tensorflow import keras



class Preprocess(BaseEstimator, TransformerMixin):
  def __init__(self): #, *args):
    self._pattern = re.compile(r"([A-Z][a-z]?)(\d+\.\d+|\d+|\d+.|.\d+)")
    self._all_elements = ['H', 'Li', 'Be', 'B', 'C', 'N', 'O', 'F', 'Na', 'Mg', 'Al', 'Si', 'P', 'S', 'Cl',
                          'K', 'Ca', 'Sc', 'Ti', 'V', 'Cr', 'Mn', 'Fe', 'Co', 'Ni', 'Cu', 'Zn', 'Ga', 'Ge', 
                          'As', 'Se', 'Br', 'Kr', 'Rb', 'Sr', 'Y', 'Zr', 'Nb', 'Mo', 'Tc', 'Ru', 'Rh', 'Pd',
                          'Ag', 'Cd', 'In', 'Sn', 'Sb', 'Te', 'I', 'Xe', 'Cs', 'Ba', 'La', 'Ce', 'Pr', 'Nd', 
                          'Pm', 'Sm', 'Eu', 'Gd', 'Tb', 'Dy', 'Ho', 'Er', 'Tm', 'Yb', 'Lu', 'Hf', 'Ta', 'W',
                          'Re', 'Os', 'Ir', 'Pt', 'Au', 'Hg', 'Tl', 'Pb', 'Bi', 'Ac', 'Th', 'Pa', 'U', 'Np', 'Pu']

  def fit(self, X, y=None):
    return self

  def __to_features(self, formula):
    features = np.zeros(len(self._all_elements), dtype='float32')
    eles = re.sub('[.0-9]', ' ', formula).split()
    sys.tracebacklimit = 0
    for A in eles:
      assert A in self._all_elements, 'Sorry, element "{0}" not supported by this model.'.format(A)
    for A,x in self._pattern.findall(formula):
    # assert A in self._all_elements, 'Sorry, element "{0}" not supported by this model.'.format(A)
      features[self._all_elements.index(A)] = float(x)
    features /= features.sum()
    return features

  def transform(self, X): # X is a *list* of formulas
    res = []
    for s in X:
      res.append(self.__to_features(s))
    return np.array(res)

class Model():
  def __init__(self):
    self._prep = Preprocess()
    keras.backend.set_learning_phase(0) # Ignore dropout at inference
    self._mlp = keras.models.load_model(
          pkg_resources.resource_filename(__name__, './dl_reg.h5') )

    self.model = Pipeline([
                ('prep', self._prep),
                ('mlp',  self._mlp)
              ])

  def predict(self, X_pred):
    data = X_pred.split()
    return [ (x,y[0]) for x,y in zip(data, self.model.predict(data)) ]

  

if __name__ == '__main__':
  model = Model()
  X_pred = "Nb2O5 Sn1O1 Sn0.5O.5 Nb2Sn3O8"
  for x,y in model.predict(X_pred):
    print("   {0:<24} {1:8.4f}".format(x, y))
  X_pred = "Nx1O1"
  for x,y in model.predict(X_pred):
    print("   {0:<24} {1:8.4f}".format(x, y))
