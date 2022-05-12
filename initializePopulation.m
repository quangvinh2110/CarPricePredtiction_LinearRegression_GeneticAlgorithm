function population = initializePopulation(k, n, range)

%   population = initializePopulation(size, range) return a random population
%   in a given range
%   k is a scalar number (size of population)
%   range is a 1x2 vector (lower bound and upper bound)
%   n is a scalar number (number of features)

% return an initial population
population = zeros(k, n);


%CODE
population = population + range(1) + (range(2) - range(1))*rand(k, n);


% =========================================================================

end

