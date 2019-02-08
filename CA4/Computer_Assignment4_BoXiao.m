%% (1) Finite Solution Uh
%6x6 node elements:
U1 = Compute_U(6)
% 12x12 node elements:
U2 = Compute_U(12)
% 24x24 node elements:
U3 = Compute_U(24)

%% Preparation for Plotting
A = 6;
index1 = [1 + ((A+1)^2 - A)]/2;
index2 = index1 + A;
U_1 = U1(index1:index2);
sz = size(U_1);
x_1 = linspace(0,1,sz(1));
Du_1 = zeros(A,1);
for i = 2:(A+1)
    Du_1(i-1) = [U_1(i) - U_1(i-1)]/[x_1(2) - x_1(1)];
end 
    
A = 12;
index1 = [1 + ((A+1)^2 - A)]/2;
index2 = index1 + A;
U_2 = U2(index1:index2);
sz = size(U_2);
x_2 = linspace(0,1,sz(1));
Du_2 = zeros(A,1);
for i = 2:(A+1)
    Du_2(i-1) = [U_2(i) - U_2(i-1)]/[x_2(2) - x_2(1)];
end

A = 24;
index1 = [1 + ((A+1)^2 - A)]/2;
index2 = index1 + A;
U_3 = U3(index1:index2);
sz = size(U_3);
x_3 = linspace(0,1,sz(1));
Du_3 = zeros(A,1);
for i = 2:(A+1)
    Du_3(i-1) = [U_3(i) - U_3(i-1)]/[x_3(2) - x_3(1)];
end

x_exact = linspace(0,1,100);
U_exact = exp(0.5*x_exact);
Du_exact = 0.5*exp(0.5*x_exact);
%% Plots for (1) and (2)
% Comparison between Uh and the Exact Solution along y = 0.5
figure
subplot(2,1,1)
plot(x_1,U_1,'r-')
hold on
plot(x_2,U_2,'b-')
hold on
plot(x_3,U_3,'m-')
hold on
plot(x_exact,U_exact,'k-');
xlabel('x')
ylabel('U')
title('Comparison between Uh & Uh,x to the Exact Soln along y=0.5');
legend('6x6','12x12','24x24','Exact Soln','location','northwest');

% Comparison between Uh,x and the Exact Solution along y = 0.5
subplot(2,1,2)
n1 = size(Du_1);
for i = 1:n1(1)
    plot([x_1(i) x_1(i+1)],[Du_1(i) Du_1(i)],'r-')
    hold on
end
n2 = size(Du_2);
for i = 1:n2(1)
    plot([x_2(i) x_2(i+1)],[Du_2(i) Du_2(i)],'b-')
    hold on
end
n3 = size(Du_3);
for i = 1:n3(1)
    plot([x_3(i) x_3(i+1)],[Du_3(i) Du_3(i)],'m-')
    hold on
end
plot(x_exact,Du_exact,'k-')
xlabel('x')
ylabel('U,x')

%% Plots for (3)
e1 = abs(U_1 - exp(0.5*x_1'));
e2 = abs(U_2 - exp(0.5*x_2'));
e3 = abs(U_3 - exp(0.5*x_3'));
figure
plot(x_1,e1,'r-')
hold on
plot(x_2,e2,'b-')
hold on
plot(x_3,e3,'m-')
hold on
xlabel('x')
ylabel('Error along y = 0.5')
title('Comparison of the Finite Solution Errors along y=0.5');
legend('6x6','12x12','24x24','location','northwest');
%% Plots for (4)
E1 = abs(U1((49+1)/2) - exp(0.25));
E2 = abs(U2((169+1)/2) - exp(0.25));
E3 = abs(U3((625+1)/2) - exp(0.25));
E = [E1,E2,E3];
h = sqrt(2)*[1/6,1/12,1/24];
figure
loglog(h,E,'r-*')
xlabel('log(h)')
ylabel('Errors at (0.5,0.5)')
title('Comparison of the Finite Solution Errors at x=0,5 y=0.5');
rate_of_convergence = [log(E(3))-log(E(1))]/(log(1/24*sqrt(2))-log(1/6*sqrt(2)))