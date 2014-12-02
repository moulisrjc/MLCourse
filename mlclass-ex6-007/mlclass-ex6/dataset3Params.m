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
CI=0.01;
prev=intmax();
for i=1:10
	sigmaI=0.01;
	for j=1:10
		model= svmTrain(X, y, CI, @(x1, x2) gaussianKernel(x1, x2, sigmaI));
		predictions = svmPredict(model, Xval);
		if mean(double(predictions ~= yval))<prev
			prev=mean(double(predictions ~= yval));
			C=CI;
			sigma=sigmaI;
		end
		sigmaI*=3;
	end
	CI*=3;
end




% =========================================================================

end
