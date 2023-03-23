xaxis=zeros(1,50);
y1axis=zeros(1,50);
y2axis=zeros(1,50);
y3axis=zeros(1,50);
k=1;
for i=1:50
    xaxis(k)=i;
    n = 50; 
    W = 100; 
    weights = randi([1, 20], [1, n]);
    values = randi([1, 50], [1, n]);
    
    %% Randomized algorithm
    best_solution = zeros(1, n);
    best_value=0;
    for i = 1:n
        if rand() < 0.5
            best_solution(i) = 1;
        end
    end
    while sum(w .* best_solution) > W
        idx = find(best_solution == 1);
        j = idx(randi(length(idx)));
        best_solution(j) = 0;
    end
    best_value = sum(p .* best_solution);
    disp("Randomized algorithm:");
    disp("Best value: " + best_value);
    disp("Best solution: " + mat2str(best_solution));
    y1axis(k)=best_value;
    
    %% Subset sum paradigm
    dp = zeros(n+1, W+1);
    for i = 1:n
        for w = 1:W
            if weights(i) > w
                dp(i+1, w+1) = dp(i, w+1);
            else
                dp(i+1, w+1) = max(dp(i, w+1), dp(i, w-weights(i)+1) + values(i));
            end
        end
    end
    best_value = dp(n+1, W+1);
    best_solution = zeros(1, n);
    i = n;
    w = W;
    while i > 0 && w > 0
        if dp(i, w+1) ~= dp(i+1, w+1)
            best_solution(i) = 1;
            w = w - weights(i);
        end
        i = i - 1;
    end
    disp("Subset sum paradigm:");
    disp("Best value: " + best_value);
    disp("Best solution: " + mat2str(best_solution));
    y2axis(k)=best_value;
    
    %% Ordering paradigm
    ratios = values ./ weights;
    [~, indices] = sort(ratios, 'descend');
    best_value = 0;
    best_solution = zeros(1, n);
    total_weight = 0;
    for i = 1:n
        if total_weight + weights(indices(i)) <= W
            best_solution(indices(i)) = 1;
            total_weight = total_weight + weights(indices(i));
            best_value = best_value + values(indices(i));
        else
            break;
        end
    end
    disp("Ordering paradigm:");
    disp("Best value: " + best_value);
    disp("Best solution: " + mat2str(best_solution));
    y3axis(k)=best_value;

    k=k+1;
end

plot(xaxis,y1axis,xaxis,y2axis,xaxis,y3axis);
legend('Randomised Algorithm','SubsetSum Paradigm','Ordering Paradigm');
xlabel('test number');
ylabel('Maximum Profit');
title('01knapsack comparisions');
