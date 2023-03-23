function [total_value, selected_items] = knapsack_ordering(weights, values, capacity)
% Solves the 0-1 Knapsack problem using an ordering algorithm

% Calculate value-to-weight ratio for each item
ratios = values ./ weights;

% Sort items in descending order of value-to-weight ratio
[sorted_ratios, indices] = sort(ratios, 'descend');
sorted_weights = weights(indices);
sorted_values = values(indices);

% Initialize variables
n = length(weights);
current_items = zeros(n, 1);
current_weight = 0;
current_value = 0;

% Iterate through sorted items and add to knapsack if feasible
for i = 1:n
    if current_weight + sorted_weights(i) <= capacity
        current_items(indices(i)) = 1;
        current_weight = current_weight + sorted_weights(i);
        current_value = current_value + sorted_values(i);
    end
end

% Return the selected items and total value
selected_items = current_items;
total_value = current_value;

end