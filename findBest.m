function [best, best_cost, idx] = findBest(population, population_cost)
%FINDBEST Summary of this function goes here
%   Detailed explanation goes here

% return the best chromosomes and its cost in the current population
% best = zeros(1, n);
% best_cost = 0;

% CODE
[best_cost, idx] = min(population_cost);
best = population(idx, :);

% =========================================================================

end

