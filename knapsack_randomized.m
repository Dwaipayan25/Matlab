function [total_value, selected_items] = knapsack_randomized(weights, values, capacity, num_iterations)
% Solves the 0-1 Knapsack problem using a randomized hill-climbing algorithm

% Initialize variables
n = length(weights);
current_items = rand(n, 1) > 0.5;
current_value = current_items' * values;
current_weight = current_items' * weights;

% Iterate for specified number of iterations
for i = 1:num_iterations
    % Generate a random neighbor by flipping one bit
    neighbor_items = current_items;
    flip_index = randi(n);
    neighbor_items(flip_index) = ~neighbor_items(flip_index);
    neighbor_value = neighbor_items' * values;
    neighbor_weight = neighbor_items' * weights;
    
    % If the neighbor is feasible and has higher value, move to it
    if neighbor_weight <= capacity && neighbor_value > current_value
        current_items = neighbor_items;
        current_value = neighbor_value;
        current_weight = neighbor_weight;
    end
end

% Return the selected items and total value
selected_items = current_items;
total_value = current_value;

end