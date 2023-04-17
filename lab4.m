clear all;
clc;
R=1;
%promien = @(x) sqrt(R^2-x.^2);
X=rand(1000,1);
Y=rand(1000,1);
A=0;
B=0;
figure(1)
for i = 1:1000
if(sqrt(X(i)^2+Y(i)^2)<=1)
    A=A+1;
    plot(X(i),Y(i),'g--.')
else
    B=B+1;
    plot(X(i),Y(i),'b--.')
end
hold on;
end
A
B
pi=4*A/1000
p=0.5
f= @(x) fun(x,p)
X=[];
for k = 1:1000
    x=rand(1);
    y=3*rand(1);
    if y<= f(x)
        X=[X,x]
    end
end
figure(2)
h=histogram(X)
h.Normalization = 'probability';
hold on;
X=rand(1000,1);
figure(3)
for o = 1:10
    if(sqrt(o*X(i)^2)<=1)
    A=A+1;
    else
    B=B+1;
    end
    (A/(A+B))    
end
function [func] = fun(x,p)
    if x<=p
        func=2*x/p;
    else
        func=2*(1-x)/(1-p);
    end
end

