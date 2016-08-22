function [y_pred, p] = predictLogReg(thetas, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
% It also return in p the probability of being of each class 


N = size(X, 1);


% Add ones to the X data matrix
X = [ones(N, 1) X];


h = 1.0 ./ (1.0 + exp(-thetas*X'));
p = bsxfun(@rdivide, h, sum(h));

[dummy, y_pred ] = max(h) ;

p = p' ;
y_pred = y_pred';

end