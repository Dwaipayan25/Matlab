x=zeros(1,20);
y=zeros(1,20);
y1=zeros(1,20);
k=1;
for i=1:500:10000
    x(k)=i;
    s=0;
    for j=1:10
        s=s+findPi(i);
    end
    y(k)=s/10;
    y1(k)=3.14;
    k=k+1;
end
plot(x,y,x,y1);
title('Pi using randomised algorithm');
legend('pi','3.14');
xlabel('no of elements');
ylabel('value of pi');
function pi=findPi(n)
    incircle=0;
    for i=1:n
        x=rand(1,1);
        y=rand(1,1);
    if ((x)^2 + (y)^2) < 1
        incircle=incircle+1;
    end 
    end
    pi=4*(incircle/n);
end