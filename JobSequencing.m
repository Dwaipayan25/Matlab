xaxis=zeros(1,50);
y1axis=zeros(1,50);
y2axis=zeros(1,50);
k=1;
for t=1:50
xaxis(k)=t;
n = 10;
deadlines = randi([1, n], 1, n);
profits = randi([1,100],1,n);

%Sub-set sum paradigm
subsets = cell(1, n);
for i = 1:n
    subsets{i} = nchoosek(1:n, i);
end

max_profit = 0;
max_subset = [];
for i = 1:n
    for j = 1:size(subsets{i}, 1)
        subset = subsets{i}(j,:);
        if all(deadlines(subset) >= (1:length(subset)))
            profit = sum(profits(subset));
            if profit > max_profit
                max_profit = profit;
                max_subset = subset;
            end
        end
    end
end

fprintf('Sub-set sum paradigm:\n');
fprintf('Optimal subset: %s\n', mat2str(max_subset));
fprintf('Profit: %d\n', max_profit);
y1axis(t)=max_profit;


%Ordering paradigm
[sorted_profits, sorted_indices]=sort(profits, 'descend');
assigned_slots = zeros(1, n);
    max_profit = 0;
for i = 1:n
    for j = min(n, deadlines(sorted_indices(i))):-1:1
        if assigned_slots(j) == 0
            assigned_slots(j) = sorted_indices(i);
            max_profit = max_profit + sorted_profits(i);
            break;
        end
    end
end

fprintf('Ordering paradigm:\n');
fprintf('Assigned slots: %s\n', mat2str(assigned_slots));
fprintf('Profit: %d\n', max_profit);
y2axis(t)=max_profit;

end

plot(xaxis,y1axis,xaxis,y2axis);
