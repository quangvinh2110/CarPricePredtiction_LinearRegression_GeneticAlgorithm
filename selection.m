function [parent, parent_cost] = selection(population, population_cost)

%   ranking selection
%   bestParent = selection(population, population_cost) return the x best
%   parents of current population
%   population is a kxn matrix (n is #features)
%   population_cost is a kx1 vector
%   population_cost = CostFunction(X, y, population)

% some useful variables
[k, n] = size(population);
x = 20;

% return x best parent for crossover
parent = zeros(x + 1, n);
parent_cost = zeros(x + 1, 1);
temp = zeros(x, n + 1);

% CODE
pop = [population population_cost];
pop = sortrows(pop, n + 1);

wheel = (1:k)/sum(1:k);
flag = zeros(1, k);

for i = 1:x
    r = rand;
    j = 0;
    while ((r > 0) || (flag(j) == 1)) && (j < k)
        j = j + 1;
        r = r - wheel(j);
    end
    temp(i, :) = temp(i, :) + pop(k - j + 1, :);
    flag(j) = 1;
end

temp = [pop(1, :); temp];
parent = parent + temp(:, 1:n);
parent_cost = parent_cost + temp(:, n + 1);






% =========================================================================

end

