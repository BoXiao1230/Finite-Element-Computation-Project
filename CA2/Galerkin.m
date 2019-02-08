function [K_global,Fq_global,Fn_global,x,U,dU] = Galerkin(n)
%n represent n elements
le = 1/ n;
ke = (1/le)*[1,-1;-1 1];
x = linspace(0,1,n+1);
K = zeros(n+1,n+1);
Fq = zeros(n+1,1);

for i = 1:n
    K(i,i) = K(i,i) + ke(1,1);
    K(i,i+1) = K(i,i+1) + ke(1,2);
    K(i+1,i) = K(i+1,i) + ke(2,1);
    K(i+1,i+1) = K(i+1,i+1) + ke(2,2);
    
    f1 = exp(0.5*(x(i) + x(i+1)))*[-1*exp(le/2)/le + exp(-le/2) + exp(-le/2)/le];
    f2 = exp(0.5*(x(i) + x(i+1)))*[exp(le/2)/le - exp(le/2) - exp(-le/2)/le];
    Fq(i) = Fq(i) + f1;
    Fq(i+1) = Fq(i+1) + f2;
end

K_global = K;

Fq_global = Fq;

F(n+1) = exp(1);
Fn_global = F';

% Computation of U
F = Fn_global + Fq_global;
f = F(2:end); %(n by 1)
f = f - K_global((2:end),1);
k = K_global((2:end),(2:end));
u = k\f;
U = [1;u];

% Computation of dU
dU = zeros(n,1);
for i = 1:n
    dU(i) = [U(i+1)-U(i)]/le;
end








