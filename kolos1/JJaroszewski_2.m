f= @(x) exp(-x+exp(-x)) %gestosc prawdopodobienstwa 
F= @(x) exp(-exp(-x)) % dystrybuanta
U=@(x) -log(-log(x)) %odwrotna dystrybuanta
random =rand(1000000,1);
y=U(random); %wyzanczone liczby peudolosowe

