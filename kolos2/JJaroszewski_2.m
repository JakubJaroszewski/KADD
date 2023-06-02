k=[0,1,2,3,4,5];
n_k=[120 255 245 195 110 55];


lambda = sum(n_k/sum(n_k).*k); 
f = @(k) (lambda.^k)*exp(-lambda)./ factorial(k);
suma = sum(n_k);
wartosc_oczekiwana=trapz(k,k.*f(k)) % wartosc oczekiwana
bar(k, n_k);
hold on;
plot(k, suma*f(k), 'r', 'Linewidth',3)
hold on;
title('Rozkład Poissona');
legend('Dane pomiarowe','Rozkład Poissona');

d = length(n_k) -1 ;
poisson = suma*f(k); 
stala1=n_k-poisson;
chi2 =sum(stala1.^2./poisson);
poziom_istotnosci_p = 0.05; 
critical_value0 = chi2inv(1 - poziom_istotnosci_p, d); 
if critical_value0 > chi2 
    disp('Na poziomie istotności 0.05 możemy przyjąć hipoteze że dane są opisane rozkładem Poissona.');
end
