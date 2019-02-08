%% 5 Linear Elements
[K_global1,Fq_global1,Fn_global1,x1,U1,dU1] = Galerkin(5);
%% 10 Linear Elements
[K_global2,Fq_global2,Fn_global2,x2,U2,dU2] = Galerkin(10);
%% 20 Linear Elements
[K_global3,Fq_global3,Fn_global3,x3,U3,dU3] = Galerkin(20);

%% (2)
% U and U,x using 5 elements:
U1
dU1
% U and U,x using 10 elements:
U2
dU2
% U and U,x using 20 elements:
U3
dU3

%% (3) 
%Plots for U
figure
subplot(2,1,1)
x_real = linspace(0,1,100);
y_real = exp(x_real);
plot(x1,U1,'r-',x2,U2,'b-',x3,U3,'m-',x_real,y_real,'k-');
xlabel('x')
ylabel('u')
title('Comparison of Unknown u')
legend('5 Linear Elements','10 Linear Elements','20 Linear Elements','Exact Soln','Location','northwest')

% Plots for U,x
subplot(2,1,2)
Plot_du(x1,dU1,'r-')
hold on
Plot_du(x2,dU2,'b-')
hold on
Plot_du(x3,dU3,'m-')
hold on

x_real = linspace(0,1,100);
y_real = exp(x_real);
plot(x_real,y_real,'k-')
xlabel('x')
ylabel('du/dx')
title('Comparison of Unknown u,x')