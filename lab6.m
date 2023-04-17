
[x,y]=galton(10); 
%plot(x,y,'b*');
mu=0
sigma=4
N=10
X=[]
for t = 0:100000
p=0
for i = 0:N-1
    r = -1 + (1-(-1)).*rand(1,1); % losowanie od -1 do 1
    %hold on
    if (r>0)
        %plot(p,N-i,'r*');
        %y(i)
        p=p+1;
        %hold on
    else
        %plot(p,N-i,'r*');
        p=p-1;
       % hold on
    end
   % hold off
   % pause(1)
end

X=[X,p];
if(t==10 || t==10^2 || t==10^3 || t==10^4 || t==10^5)
   histogram(X)
   pause(1) %aktualizowanie tutaj dla kazego wykresu powinienien dopasywa sie gauss
end
end
%trzeba policzyc parametry go gassa

figure(2)
x = -10:0.1:10;
h=histogram(X);
h.Normalization = 'probability';
hold on;
plot(x,2.2*normpdf(x,mu,sigma))

function [x, y] = galton(N)
x = 0;
y = 0;
for i = 1:N
xx = -(N-i):2:((N-i)+2);
n = length(xx);
x(end:end+n-1) = xx;
y(end:end+n-1) = ones(1, n)*(i);
end
x = x(1:end-1);
y = y(1:end-1);
end