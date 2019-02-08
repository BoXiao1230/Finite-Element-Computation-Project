function [Fh] = Fh_local2(x,y)
Ngp = 2; 
Wgp = [1 1];
Xgp = [-1/sqrt(3) 1/sqrt(3)];

Fh_local2 = zeros(4,1);
for i = 1:Ngp;
    eta = 1;
    xi = Xgp(i);
    N = [(1/4)*(1-xi)*(1-eta), (1/4)*(xi+1)*(1-eta), (1/4)*(1+xi)*(1+eta), (1/4)*(1-xi)*(1+eta)];
    dNdxi = [1/4*(eta-1) 1/4*(1-eta) 1/4*(1+eta) -1/4*(1+eta)];
    dNdeta = [1/4*(xi-1) -1/4*(xi+1) 1/4*(1+xi) 1/4*(1-xi)];
    J11 = dNdxi*x';
    J12 = dNdxi*y';
    J21 = dNdeta*x';
    J22 = dNdeta*y';
    Js = sqrt(J11^2 + J12^2); 
    X = 0;Y = 0;
    for I = 1:4;
        X = X + x(I)*N(I);
        Y = Y + y(I)*N(I);
    end
    Tail1 = Js*(N'*X*exp(X));
    Fh_local2 = Fh_local2 + Tail1;
    
end
Fh = Fh_local2;
end