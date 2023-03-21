rozklad = @(x) (exp(-(x-1).^2)+exp(-(x+1).^2));
C=1/integral(rozklad,-inf,inf);
C %stala normujaca 1
B = -10:0.01:10;
rozkladd=(exp(-(B-1).^2)+exp(-(B+1).^2));
A=1/trapz(B,rozkladd);
A %stala normujaca 2

%zadanie 2
figure(1);
subplot(2,1,1);
x = linspace(-10,10);
y1 = C*(exp(-(x-1).^2)+exp(-(x+1).^2));
plot(x,y1,"green");
title('Wykres');
xlabel('x');
ylabel('f(x)');

subplot(2,1,2); 
y2 = cumsum(y1)/5;
plot(x,y2,"Blue");
title('Dystrybuanta');
xlabel('x');
ylabel('f(x)');

%zadanie 3
r = @(x) x.*C.*(exp(-(x-1).^2)+exp(-(x+1).^2));
wartosc_o=integral(r,-inf,inf);
r1 = @(x) x.^2*C.*(exp(-(x-1).^2)+exp(-(x+1).^2));
wariancja = integral(r1,-inf,inf);
odchylenie_std=sqrt(wariancja);
[p,q]=findpeaks(y1,x);
moda=q;
wart= abs(y2-0.5);
min_wart=min(wart);
idx=find(wart==min_wart)
kwantyl=-10+0.2*idx

wart1= abs(y2-0.25);
min_wart1=min(wart1);
idx1=find(wart1==min_wart1)
kwantyl1=-10+0.2*idx1

wart2= abs(y2-0.75);
min_wart2=min(wart2);
idx2=find(wart2==min_wart2)
kwantyl2=-10+0.2*idx2