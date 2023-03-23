% Generate random data for the 0-1 knapsack problem
n = 50; % number of items
W = 100; % knapsack capacity
w = randi([1, 10], 1, n); % item weights
p = randi([1, 20], 1, n); % item profits

% Randomized algorithm
tic;
x = zeros(1, n);
for i = 1:n
    if rand() < 0.5
        x(i) = 1;
    end
end
while sum(w .* x) > W
    idx = find(x == 1);
    j = idx(randi(length(idx)));
    x(j) = 0;
end
profit = sum(p .* x);
time_random = toc;
fprintf('Randomized algorithm\n');
fprintf('Profit: %d\n', profit);
fprintf('Solution: %s\n', mat2str(x));
fprintf('Time: %f seconds\n\n', time_random);

% Sub-set sum paradigm
tic;
S = sum(p);
f = zeros(1, S+1);
for i = 1:n
    for j = S:-1:p(i)
        f(j+1) = max(f(j+1), f(j-p(i)+1)+w(i));
    end
end
j = S+1;
while f(j) > W
    j = j - 1;
end
x = zeros(1, n);
for i = n:-1:1
    if j >= p(i) && f(j-p(i)+1)+w(i) > f(j+1)
        x(i) = 1;
        j = j - p(i);
    end
end
profit = sum(p .* x);
time_subset = toc;
fprintf('Sub-set sum paradigm\n');
fprintf('Profit: %d\n', profit);
fprintf('Solution: %s\n', mat2str(x));
fprintf('Time: %f seconds\n\n', time_subset);

% Ordering paradigm
tic;
ratio = p ./ w;
[~, idx] = sort(ratio, 'descend');
x = zeros(1, n);
for i = 1:n
    if w(idx(i)) <= W
        x(idx(i)) = 1;
        W = W - w(idx(i));
    end
end
profit = sum(p .* x);
time_ordering = toc;
fprintf('Ordering paradigm\n');
fprintf('Profit: %d\n', profit);
fprintf('Solution: %s\n', mat2str(x));
fprintf('Time: %f seconds\n\n', time_ordering);
