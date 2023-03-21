a = 1;
%Funkcja f(x) - rozk?ad wyk?adniczy o lambda=1/a
f = @(x) (1./a).*exp(-x./a);
F = @(x) 1-exp(-x./a);

%Funkcja g(x) - rozk?ad Gaussa o sigma=1
g = @(x) 1/sqrt(2*pi)*exp((-x.^2)/2); %funkcja g?sto?ci prawdopodobie?stwa
G = @(x) 0.5.*(1+erf((x)/(sqrt(2)))); %dystrybuanta

U = @(x) -a*log(1-x);
random =rand(100,1); % utworzenie listy 100 liczb z rand
y=U(random); % utworzenie 100 liczb z odwrtonej dystrybuanty
W=f(y);

subplot(1,2,1); % tworzenie wykresu na jednej cz?sci wykresu
h=histogram(y); 
h.Normalization = 'probability'; %normowanie s?upków histogramu
x1 = 0:0.01:4;
xlabel('x');
ylabel('f(x)');
title('Rozk?ad wyk?adniczy');
hold on;
plot(x1,f(x1));
legend('histogram','f(x)');

Fzero = @(y) fzero(@(x) G(x) - y, 0);
Arrayfun = @(x) arrayfun(Fzero, x); %Dla ka?dego argumentu x stosuje funckj? odwrotn?


subplot(1,2,2);
y=Arrayfun(random);
h=histogram(y);
h.Normalization = 'probability';
x1 = -4:0.01:4;
xlabel('x');
ylabel('f(x)');
title('Rozk?ad gaussa');
hold on;
plot(x1,g(x1))
legend('histogram','f(x)');