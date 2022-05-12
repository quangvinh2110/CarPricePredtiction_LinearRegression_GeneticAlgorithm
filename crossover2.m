function offspring = crossover2(parent, parent_cost)

%   offspring = crossover1(parent, parent_cost)
%   computes the offspring (child) using parent and paren_cost
%   parent is a x x n matrix (n is #features, x is #parents)
%   parent_cost is a x x 1 vector
%   parent_cost = CostFunction(X, y, parent)

% size of parent
[x, n] = size(parent);

% return offspring
offspring = zeros(x - 1, n);



% CODE
alpha = sqrt(parent_cost);
alpha = alpha(1)./(alpha + alpha(1));
alpha(1) = [];

for i = 1:(x - 1)
    offspring(i, :) = offspring(i, :) + alpha(i)*parent(i + 1, :) + (1 - alpha(i))*parent(1, :);
end


% =========================================================================

end
