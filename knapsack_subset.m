function [total_value, selected_items] = knapsack_subset(weights, values, capacity)
% Solves the 0-1 Knapsack problem using a dynamic programming algorithm

% Initialize variables
n = length(weights);
table = zeros(n+1, capacity+1);
selected_items = zeros(n, 1);

% Fill in table row by row
for i = 1:n
    for j = 1:capacity
        if weights(i) > j
            table(i+1,j+1) = table(i,j+1);
        else
            table(i+1,j+1) = max(table(i,j+1), table(i,j-weights(i)+1) + values(i));
        end
    end
end

% Determine which items were selected
total_value = table(n+1,capacity+1);
j = capacity;
for i = n:-1:1
    if table(i,j+1) ~= table(i+1,j+1)
        selected_items(i) = 1;
        j = j - weights(i);
    end
end

end