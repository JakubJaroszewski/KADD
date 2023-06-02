set1= linspace(0, 5, 51);
set2 = linspace(0, 5, 51);
set3 = linspace(0, 5, 51);

W = @(x) x.^3-2*x+1;

L1=W(set1); % wyzanczenie wartosci w punktach od 0,0.1 do 5 uywajac tablic set
L2=W(set2);
L3=W(set3);
for i= 1:51
szum1(i)=normpdf(0,0.1);
szum2(i)=normpdf(0,0.5);
szum3(i)=normpdf(0,2);
end
daneY=L1+szum1;
daneY1=L2+szum2;
daneY2=L3+szum3;

subplot(1, 3, 1);
scatter(set1, daneY, 'b', 'o');
hold on;
P = polyfit(set1,daneY, 3); 
yfit = polyval(P, set1); 
plot(set1, yfit);
hold off;
subplot(1, 3, 2);
scatter(set2,daneY1, 'b', 'o');
hold on;
P1 = polyfit(set2,daneY1, 3); 
yfit1 = polyval(P1, set2); 
plot(set2, yfit1);
hold off;
subplot(1, 3, 3);
scatter(set3,daneY2, 'b', 'o');
hold on;
P2 = polyfit(set3,daneY2, 3); 
yfit2 = polyval(P2, set3); 
plot(set3, yfit2);
hold off;
Roznice_w_wspolczynikach=[P(4)-1,P1(4)-1,P2(4)-1] %dopasowanie rozni sie tylko wyrazem wolnym w kazdym przpadku
disp('Widzimy, ze wraz ze wzrostem odchylenia maleje roznica w wyrazie wolym dopasowania, reszta wspolczynkow pozostaje bez zmian');
