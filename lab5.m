clear all;
clc;
C=1;
f= @(x) (1-x.^2);
x = -1:0.1:1;
C=1/trapz(x,f(x));
xl=rand(10000,1);
g= @(x) cos(x);
F= @(x) C*(1-x.^2);
dx=0.1;
dys=cumsum(g(x)*dx); %dystrybuanta

X=[];
for k = 1:1000
    Xn = -1 + (1-(-1)).*rand(1);
    Wn=F(Xn)./g(Xn);
    Rn =rand(1);
    if (Rn < Wn)
     X=[X,Xn];
    end
end
figure(1)
h=histogram(X); 
h.Normalization = 'probability'

hold off;
dyst=cumsum(C*f(x))*dx

figure(2)
[a,b]=cdfplot(X);
b
y1=C*(1-x.^2);
f1 = @(x) x.*C.*(1-x.^2) ;
wartosc_o=integral(f1,-1,1)
f2 = @(x) x.^2*C.*(1-x.^2) ;
wariancja = integral(f2,-1,1)
odchylenie_std=sqrt(wariancja)

wart= abs(dyst-0.5);
min_wart=min(wart);
idx=find(wart==min_wart);
kwantyl=-1+0.1*idx

wart1= abs(dyst-0.25);
min_wart1=min(wart1);
idx1=find(wart1==min_wart1);
kwantyl1=-1+0.1*idx1

wart2= abs(dyst-0.75);
min_wart2=min(wart2);
idx2=find(wart2==min_wart2);
kwantyl2=-1+0.1*idx2

kwantyl_emp=quantile(X,0.5)
kwantyl_emp1=quantile(X,0.25)
kwantyl_emp2=quantile(X,0.75)
S=sum(X)/length(X)
war=0
for i= 1:length(X)
    war=war+(X(i)-S)^2
end
war=war/length(X)
Wartosc={"Wartosc_oczekiwana";"kwantyl";"kwantyl1";"kwantyl2";"wariancja"};
Teoretycznie = {-6.5052e-18;0;-0.3000;0.4000;0.2005};
Empirycznie = {0.0037; 0.0157;-0.3761;0.3680;war};
table(Wartosc,Teoretycznie,Empirycznie)











function [func] = fun(x)
    if (x<-1) %|| (x>1)
        func=C*(1+x^2)
    else
        func=0
    end
end