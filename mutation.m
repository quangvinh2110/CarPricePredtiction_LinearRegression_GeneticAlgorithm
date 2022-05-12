function mutant = mutation(offspring, mutationProb, range)

%   mutant = mutation(offspring) Perform mutation on the offspring
%   offspring is a Xxn vector (n is the #features)
%   mutationProb is a scalar number
%   range is a 1x2 vector

% return mutant
mutant = zeros(size(offspring));

% CODE
randomVal = rand(size(offspring, 1), 1);
check = (randomVal < mutationProb);
mutant = mutant + offspring + check.*((range(2) - range(1))*rand(size(offspring)) + range(1));



% =========================================================================

end

