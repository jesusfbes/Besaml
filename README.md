# BESAML: Barely Efficient and ScalAble Machine Learning toolbox

A personal Machine Learning MATLAB toolbox. Algorithms implemented in a simple and readable way.  
Part of this code is inspired by the code of [Coursera's Machine Learning course](https://www.coursera.org/learn/machine-learning) by Andrew Ng. If you arrive here looking for a Deep Learning toolbox you probably were looking for [Lasagne](https://github.com/Lasagne/Lasagne), only related to this in a gastronomical way.


**Instalation:**

Run `besml_setup.m` file before using the toolbox. 

**Current Version:**

1. Modelling of data using a Gaussian Mixture Model (GMM) fitted using Expectation-Maximization (EM).
2. Multiclass Softmax Regression Classifier.


**Dataset included:**

I have included some small datasets to test the implemented algorithms.

1. Old Faithful Geiser Dataset [1,2].
2. Subset of MNIST dataset [3] selected in [Coursera's Machine Learning course](https://www.coursera.org/learn/machine-learning).
 

Function `fmincg`. Copyright (C) 2001 and 2002 by Carl Edward Rasmussen. Date 2002-02-13.

References:

     [1] Hardle, W. (1991) Smoothing Techniques with Implementation in S.
     New York: Springer.
     [2] Azzalini, A. and Bowman, A. W. (1990). A look at some data on
     the Old Faithful geyser. Applied Statistics 39, 357-365.
     [3] Y. LeCun, L. Bottou, Y. Bengio, and P. Haffner. "Gradient-based
     learning applied to document recognition." Proceedings of the IEEE, 86(11):2278-2324, November 1998.

