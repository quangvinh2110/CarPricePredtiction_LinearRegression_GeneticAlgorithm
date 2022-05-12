function [parent, parent_cost] = selection1(population, population_cost)

%   roulette wheel selection
%   bestParent = selection(population, population_cost) return the x best
%   parents of current population
%   population is a kxn matrix (n is #features)
%   population_cost is a kx1 vector
%   population_cost = CostFunction(X, y, population)
%   1st line of parent and parent_cost is the best chromosome in the
%   current population

% some useful variables
[k, n] = size(population);
x = 21;

% return x + 1 best parent for crossover
parent = zeros(x, n);
parent_cost = zeros(x, 1);
[parent(1, :), parent_cost(1), idx] = findBest(population, population_cost);
population(idx, :) = [];
population_cost(idx) = [];

% CODE

wheel = 1./(population_cost.*sum(population_cost));
flag = zeros(1, k - 1);

for i = 2:x
    r = rand;
    j = 0;
    while ((r > 0) || (flag(j) == 1)) && (j < k - 1)
        j = j + 1;
        r = r - wheel(j);
    end
    parent(i, :) = parent(i, :) + population(j, :);
    parent_cost(i) = parent_cost(i) + population_cost(j);
    flag(j) = 1;
end


% =========================================================================

end

