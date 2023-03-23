x=zeros(1,20);
y=zeros(1,20);
k=1;
for i=500:500:10000
    x(k)=i;
    y(k)=integral(i);
k=k+1;
end
ans=0;
for i=1:20
    ans=ans+y(i);
end
fprintf('The area is: %f\n', ans/20);
function pi=integral(n)
    incircle=0;
    for i=1:n
        x=2*rand(1,1);
        y=2*rand(1,1);
        if y  <= ((4-x^2)^0.5)
            incircle=incircle+1;
end end
    pi=4*(incircle/n);
end