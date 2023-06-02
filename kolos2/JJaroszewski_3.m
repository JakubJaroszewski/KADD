fullMatFileName = fullfile('kol2_dane1.csv');
s = load(fullMatFileName);
fullMatFileName = fullfile('kol2_dane2.csv');
s1 = load(fullMatFileName);

X1=s(1:59); 
Y1=s(60:118);

X2=s1(1:60);
Y2=s1(61:120);
% wykresy dorysowalem dodatkowo aby upenic sie czy na pewno wszystko wyglada dobrze
subplot(1, 2, 1);
scatter(X1, Y1, 'b', 'o'); 
hold on;
P = polyfit(X1, Y1, 1); 
yfit = polyval(P, X1); 
plot(X1, yfit);
hold off;
Wspoczyniki_dopsaowania_dane1_wspol_kieunkowy=P(1)
Wspoczyniki_dopsaowania_dane1_wyraz_wolny=P(2)
subplot(1, 2, 2);
scatter(X2, Y2, 'b', 'o'); 
hold on;
P1 = polyfit(X2, Y2, 1); 
yfit = polyval(P1, X2); 
plot(X2, yfit);
hold off;

Wspoczyniki_dopsaowania_dane2_wspol_kieunkowy=P1(1)
Wspoczyniki_dopsaowania_dane2_wyraz_wolny=P1(2)

cor1=corrcoef(X1,Y1); % policzenie macierzy korelacji
cor2=corrcoef(X2,Y2);

wspoczynik_korealcji_danych_1=cor1(2:2,1:1) % pokazanie współczyników 
wspoczynik_korealcji_danych_2=cor2(2:2,1:1)

mean(X1); % wyznaczenie sredniej i odchylen dla badanych zmiennych
var(X1);
mean(X2);
var(X2);
mean(Y1);
var(Y1);
mean(Y2);
var(Y2);


