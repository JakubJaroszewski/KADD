r = -1 + (1-(-1)).*rand(30,1);
k=1:30;
x=sin(2*pi*k/30);
sort(x);
sort(x,'ascend');
max(x);
min(x);
sum(x);
prod(x);
mean(x);
std(x);
silnia(5);
w=0:0.01:pi;
t=sin(w);
pochodna=diff(t)/0.01
plot(w(1:end-1), pochodna)
function [n1] = silnia (n)
p=1;
    while(n>0)
       p=p*n;
       n=n-1;
    end
end
