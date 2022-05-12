function offspring = crossover1(parent, parent_cost)

%   offspring = crossover1(parent, parent_cost)
%   computes the offspring (child) using parent and paren_cost
%   parent is a x x n matrix (n is #features, x is #parents)
%   parent_cost is a x x 1 vector


% size of parent
[x, n] = size(parent);

% return offspring
offspring = zeros(x - 1, n);



% CODE
alpha = sqrt(parent_cost);
alpha = -alpha(1)./(alpha - alpha(1) + 1e-10);
alpha(1) = [];

for i = 1:(x - 1)
    offspring(i, :) = offspring(i, :) + alpha(i)*parent(i + 1, :) + (1 - alpha(i))*parent(1, :);
end
% temp = [parent, parent_cost];
% temp = sortrows(temp, n + 1);
% parent = temp(:, 1:n);
% parent_cost = temp(:, n + 1);
% alpha = sqrt(parent_cost);
% idx = 1;
% for i = 1:(x - 1)
%     for j = (i + 1):x
%         gamma = -alpha(i)./(alpha(j) - alpha(i) + 1e-05);
%         offspring(idx, :) = offspring(idx, :) + gamma*parent(j, :) + (1 - gamma)*parent(i, :);
%         idx = idx + 1;
%     end
% end

% =========================================================================

end

