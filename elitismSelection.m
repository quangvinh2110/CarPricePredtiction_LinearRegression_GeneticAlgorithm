function [newPopulation, newPopulation_cost] = elitismSelection(population, population_cost, offspring, offspring_cost)

%   newPopulation = elitismSelection(population, population_cost, offspring, offspring_cost)
%   first copy a few best chromosomes to new population, then create new 
%   population by combining population and offspring 
%   offspring is a x x n matrix (n is the #features)
%   population is a k x n matrix
%   population_cost is a k x 1 matrix
%   offspring is a (x*(x+1)/2)xn matrix
%   offspring_cost is a (x*(x+1)/2)x1 matrix

% size of population
[k, n] = size(population);
k1 = size(offspring, 1);

% return new population
% newPopulation = zeros(size(population));
% newPopulation_cost = zeros(size(population_cost));

% CODE
population = [population; offspring];
population_cost = [population_cost; offspring_cost];
temp = [population population_cost];
temp = unique(temp, 'rows');
temp = sortrows(temp, n + 1);
temp = temp(1:k, :);
newPopulation = temp(:, 1:n);
newPopulation_cost = temp(:, n + 1);






% =========================================================================

end

