xaxis=zeros(1,100);
yaxis=zeros(1,100);
y1axis=zeros(1,100);
k=1;

for i=10:10:1000
    xaxis(k)=i;
    y1axis(k)=0.00097;
    arr=zeros(1,i);
    x=randi(i,1,1);
    arr(1:i/2+1)=x;
    arr(i/2+2:end) = round(10000*rand(i/2-1, 1));
    
    probab=1;
    for l=1:10
        ut=0;
    for j=1:10
        maj=randomizedMajority(arr);
        if maj==0 || arr(maj) ~= x
            ut=ut+1;
        end
    end
    probab=probab*(ut/10);
    end
    yaxis(k)=probab;
    k=k+1;
end

plot(xaxis,yaxis,xaxis,y1axis);
xlabel("number of elements");
ylabel("Probability of missing majority element");
legend("probability of missing","0.00097");
title("Probability of missing majority element");


function maj = randomizedMajority(arr)
n = length(arr);
maj=0;
count = 0;
r = randi(n,1,1);
for j = 1:n
    if arr(j) == arr(r)
        count=count+1;
    end
end
if count > n/2
    maj=r;
end
end
