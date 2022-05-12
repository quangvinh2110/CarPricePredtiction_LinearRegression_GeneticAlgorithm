function [best, best_cost, minCostCurrentEpoch] = geneticAlgorithm(X_train, y_train, epoch, k)


%   Genetic Algorithm
%   X_train is mxn matrix (data)
%   y_train is mx1 vector (label)
%   epoch is a scalar number
%   k is a scalar number (size of population)
%   range is a 1x2 vector (lower bound and upper bound)
%   numParent is a scalar number (number of best pa)
%   mutationProb is a scalar number
%   numBestChroms is a scalar number

% few useful variables
n = size(X_train, 2);  %number of features
range = [-10 10];
mutationProb = 0.15;


% need to return 
% best = zeros(1, n);
% best_cost = 0;
minCostCurrentEpoch = zeros(epoch + 1, 1);

% CODE
population = initializePopulation(k, n, range);
population_cost = costFunction(X_train, y_train, population);
[best, best_cost] = findBest(population, population_cost);
minCostCurrentEpoch(1) = best_cost;

for i = 1:epoch
    % selection
    [parent, parent_cost] = selection1(population, population_cost);

    % crossover
    offspring1 = crossover(parent, parent_cost);
    offspring2 = crossover1(parent, parent_cost);
%     offspring1 = crossover(parent, parent_cost);

    % mutation
    offspring1 = mutation(offspring1, mutationProb, range);
    offspring2 = mutation(offspring2, mutationProb, range);
%     offspring = mutation(offspring, mutationProb, range);

    % combination of offspring and old population
    offspring1_cost = costFunction(X_train, y_train, offspring1);
    offspring2_cost = costFunction(X_train, y_train, offspring2);
    offspring = [offspring1; offspring2];
    offspring_cost = [offspring1_cost; offspring2_cost];
    [population, population_cost] = elitismSelection(population, population_cost, offspring, offspring_cost);
%     population = [population; offspring1; offspring2];
%     population_cost = [population_cost; offspring1_cost; offspring2_cost];
%     offspring_cost = costFunction(X_train, y_train, offspring);
%     population = [population; offspring2];
%     population_cost = [population_cost; offspring2_cost];

    % find the best chromosome in the new population
%     bestInCurrentEpoch = population(1, :); 
%     minCostCurrentEpoch(i + 1) = population_cost(1);
    [bestInCurrentEpoch, minCostCurrentEpoch(i + 1)] = findBest(offspring, offspring_cost);
    % update the best chromosome
    if minCostCurrentEpoch(i + 1) < best_cost
        best_cost = minCostCurrentEpoch(i + 1);
        best = bestInCurrentEpoch;
    end

end


% =========================================================================

end

