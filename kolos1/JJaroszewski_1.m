f= @(x) cos(pi*x./2);
x = 0:0.01:1;
C=1/trapz(x,f(x))
F = @(x) C*cos(pi*x./2);
figure(1)
subplot(1,2,1);
plot(x,F(x)/C);
title ('Funkcja gestosc prawd.');
hold off;
dx=0.01;
subplot(1,2,2);
dyst=cumsum(F(x))*dx;
plot(x,dyst,"Blue");
title ('Dystrybuanta');
F1 = @(x) x.*C.*cos(pi*x./2) ;
wartosc_oczekiwana =integral(F1,0,1)
f2 = @(x) x.^2*C.*cos(pi*x./2);
wariancja = integral(f2,0,1)

% kwantyl 0.5 policzony empirycznie 
wart= abs(dyst-0.5);
min_wart=min(wart);
idx=find(wart==min_wart);
kwantyl=0+dx*idx(1)

% kwantyl 0.25 policzony epmirycznie 
wart1= abs(dyst-0.25);
min_wart1=min(wart1);
idx1=find(wart1==min_wart1);
kwantyl1=0+dx*idx1

% kwantyl 0.75 policzony empirycznie
wart2= abs(dyst-0.75);
min_wart2=min(wart2);
idx2=find(wart2==min_wart2);
kwantyl2=0+dx*idx2