function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

z = X * theta;
logh = log(sigmoid(z));
log_one_sub_h = log(1 - sigmoid(z));
errors = -y .* logh - (1 - y) .* log_one_sub_h;

mask = ones(size(theta'));
mask(1) = 0;

J = 1 / m * sum(errors) + lambda / (2 * m) * sum(mask .* theta'.^2);
grad = 1 / m * sum(repmat(sigmoid(z) - y, 1, length(theta)) .* X) + lambda / m .* mask .* theta';

a = (1 / m * X' * (sigmoid(z) - y))';
b = lambda / m .* mask .* theta';

grad = a + b;


% =============================================================

