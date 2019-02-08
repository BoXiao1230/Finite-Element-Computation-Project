Ngp = 2; 
Wgp = [1 1];
Xgp = [-1/sqrt(3) 1/sqrt(3)];
K_local = zeros(4,4);
Fq_local = zeros(4,1);
x = [0.5 1 1 0.5];
y = [0.5 0.5 1 1];
for i = 1:Ngp;
    for j = 1:Ngp;
        xi = Xgp(i);
        eta = Xgp(j);
        N = [(1/4)*(1-xi)*(1-eta), (1/4)*(xi+1)*(1-eta), (1/4)*(1+xi)*(1+eta), (1/4)*(1-xi)*(1+eta)];
        X = 0; Y = 0;
        for I = 1:4;
            X = X + x(I)*N(I);
            Y = Y + y(I)*N(I);
        end
        J = 0.25*eye(2);
        B = [(eta-1) (1-eta) (1+eta) -(1+eta)
            (xi-1) -(xi+1) (1+xi) (1-xi)];
        K_local = K_local + (B')*B*det(J)*Wgp(i)*Wgp(j);
        Tail = N'*(X^2 + Y^2)*exp(X*Y)*(-1)*det(J)*Wgp(i)*Wgp(j);
        Fq_local = Fq_local + Tail;

    end
end

Fh_local1 = zeros(4,1);
for i = 1:Ngp;
    xi = 1;
    eta = Xgp(i);
    N = [(1/4)*(1-xi)*(1-eta), (1/4)*(xi+1)*(1-eta), (1/4)*(1+xi)*(1+eta), (1/4)*(1-xi)*(1+eta)];
    X = 0;Y = 0;
    for I = 1:4;
        X = X + x(I)*N(I);
        Y = Y + y(I)*N(I);
    end
    Tail1 = 1/4*(N'*Y*exp(Y));
    Fh_local1 = Fh_local1 + Tail1;
    
end

Fh_local2 = zeros(4,1);
for i = 1:Ngp;
    xi = Xgp(i);
    eta = 1;
    N = [(1/4)*(1-xi)*(1-eta), (1/4)*(xi+1)*(1-eta), (1/4)*(1+xi)*(1+eta), (1/4)*(1-xi)*(1+eta)];
    X = 0;Y = 0;
    for I = 1:4;
        X = X + x(I)*N(I);
        Y = Y + y(I)*N(I);
    end
    Tail2 = 1/4*(N'*X*exp(X));
    Fh_local2 = Fh_local2 + Tail2;
end

% Results:
K_local
f = Fh_local1 + Fh_local2 + Fq_local

    




