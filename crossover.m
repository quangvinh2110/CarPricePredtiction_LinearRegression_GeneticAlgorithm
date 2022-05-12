function offspring = crossover(parent, parent_cost)

%   offspring = crossover(parent, parent_cost)
%   computes the offspring (child) using parent and paren_cost
%   parent is a 2 Xxn matrix (n is #features, x is #parents)
%   parent_cost is a Xx1 vector
%   parent_cost(1) = CostFunction(X, y, parent)

% size of parent
[x, n] = size(parent);

% return offspring
offspring = zeros(x*(x - 1)/2, n);



% CODE
alpha = sqrt(parent_cost);
idx = 1;
for i = 1:(x - 1)
    for j = (i + 1):x
        gamma = alpha(i)./(alpha(i) + alpha(j));
        offspring(idx, :) = offspring(idx, :) + gamma*parent(j, :) + (1 - gamma)*parent(i, :);
        idx = idx + 1;
    end
end


% =========================================================================

end

