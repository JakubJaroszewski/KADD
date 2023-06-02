f= @(x) exp(-x+exp(-x)) %gestosc prawdopodobienstwa 
F= @(x) exp(-exp(-x)) % dystrybuanta
U=@(x) -log(-log(x)) %odwrotna dystrybuanta
random =rand(1000000,1);
y=U(random); %wyzanczone liczby peudolosowe

x = linspace(-5,10,1000000);
%dyst=cumsum(y)*dx;
dyst=F(x);
figure(2)
[a,b]=cdfplot(y);
hold on
plot(x,dyst)
legend('Empirical CDF','Theoretical CDF','Location','best')
dx=0.00001
C=1/trapz(x,f(x));
f1 = @(x) x.*C.*exp(-x+exp(-x)) ;
wartosc_oczekiwana =integral(f1,0,1)

f2 = @(x) x.^2.*C.*exp(-x+exp(-x));
wariancja = integral(f2,-4,0)

% kwantyl 0.5 policzony empirycznie 
wart= abs(dyst-0.5);
min_wart=min(wart);
idx=find(wart==min_wart);
kwantyl=-3.5+dx*idx(1)

% kwantyl 0.25 policzony epmirycznie 
wart1= abs(dyst-0.25);
min_wart1=min(wart1);
idx1=find(wart1==min_wart1);
kwantyl1=-3.5+dx*idx1

% kwantyl 0.75 policzony empirycznie
wart2= abs(dyst-0.75);
min_wart2=min(wart2);
idx2=find(wart2==min_wart2);
kwantyl2=-3.5+dx*idx2

% kwantyle wg matlaba (emirycznie)
kwantyl_emp=quantile(y,0.5)
kwantyl_emp1=quantile(y,0.25)
kwantyl_emp2=quantile(y,0.75)

% wariancja liczona wg matlaba
WAR=var(y);
Wartosc={"wartosc oczekiwana";"kwantyl_0.25";"kwantyl_0.5";"kwantyl_0.75";"wariancja"};
Teoretycznie = {wartosc_oczekiwana;kwantyl1;kwantyl;kwantyl2;wariancja};
Empirycznie = {b.mean;kwantyl_emp1;b.median;kwantyl_emp2;WAR};
table(Wartosc,Teoretycznie,Empirycznie)