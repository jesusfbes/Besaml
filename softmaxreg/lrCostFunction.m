function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
N = length(y); % number of training examples

%Sigmoid
h = 1.0 ./ (1.0 + exp(-X*theta));

% Cost function
J = (sum(-y.*log(h)-(1-y).*log(1-h))./ N) + (lambda./(2*N)).*sum(theta(2:end).^2) ;

% Gradient of cost function
grad = ((X'*(h - y)) ./ N) +  (lambda./N).*[0;theta(2:end)] ;

% =============================================================

grad = grad(:);

end
