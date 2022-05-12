function J = costFunction(X, y, population)

%   J = CostFunction(X, y, population) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y
%   X is a mxn matrix 
%   y is a mx1 vector
%   population is a kxn matrix

% Initialize some useful values
m = length(y); % number of training examples
k = size(population, 1); % number of chromosomes

% Cost function J
J = zeros(k, 1);

% CODE
temp = X*population' - y;
for i = 1:k
    J(i) = J(i) + temp(:, i)'*temp(:, i);
end

J = 1./m*J;

%temp = X*theta - y;
%J = J + (1/(2*m))*(temp')*temp;



% =========================================================================

end


