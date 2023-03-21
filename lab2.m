clear all;
clc;
sigx=1;
sigy=1;
ro=0.8;
mix=5;
miy=5;
figure(1);
subplot(2,2,1);
x = -10:0.5:10;
y=x;
[X,Y] = meshgrid(x);
F = X.*1/(2.*pi.*sigx.*sigy.*(1-ro.^2).^(1/2)).*exp(-1/(2.*(1-ro.^2)).*(((x-mix).^2/sigx.^2+(y-miy).^2/sigy.^2)-2.*ro.*(x-mix).*(y-miy)/(sigx.*sigy)));
surf(X,Y,F)
dx=0.5
dystx=cumsum(1/(2.*pi.*sigx.*sigy.*(1-ro.^2).^(1/2)).*exp(-1/(2.*(1-ro.^2)).*(((x-mix).^2/sigx.^2+(y-miy).^2/sigy.^2)-2.*ro.*(x-mix).*(y-miy)/(sigx.*sigy)))).*dx;
dysty=cumsum(dystx,2).*dx;
dyst=dysty;
R = X.*dyst;
subplot(2,2,2);
surf(X,Y,R);
%wartosc_o=integral(rozklad(x,y),-inf,inf);
%function [n] = rozklad (x,y)
%sigx=1;
%sigy=1;
%ro=0.8;
%mix=5;
%miy=5;
%1/(2.*pi.*sigx.*sigy.*(1-ro.^2).^(1/2)).*exp(-1/(2.*(1-ro.^2)).*(((x-mix).^2/sigx.^2+(y-miy).^2/sigy.^2)-2.*ro.*(x-mix).*(y-miy)/(sigx.*sigy)));
%end