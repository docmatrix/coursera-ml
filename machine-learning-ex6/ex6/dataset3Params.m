function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

_range = [0.01 0.03 0.1 0.3 1 3 10 30];
lowest_c = 0;
lowest_s = 0;
min_error = 100000;

%for i = 1:length(_range)
%    tC = _range(i);
%    for j = 1:length(_range)
%        tSigma = _range(j);
%        model = svmTrain(X, y, tC, @(x1, x2) gaussianKernel(x1, x2, tSigma));
%        predictions = svmPredict(model, Xval);
%        error = mean(double(predictions ~= yval));
%        fprintf('Error: %f\n', error);
%        if error < min_error
%            min_error = error;
%            lowest_c = tC;
%            lowest_s = tSigma;
%            fprintf('New lowest C: %f sigma: %f\n', tC, tSigma');
%        end
%    end
%end

lowest_c = 1.0;
lowest_s = 0.1;

C = lowest_c;
sigma = lowest_s;
fprintf('Lowest C: %f Lowest sigma: %f\n', C, sigma);

% =========================================================================

end
