function [K,Fq] = K_Fq_local(x,y)

Ngp = 2; 
Wgp = [1 1];
Xgp = [-1/sqrt(3) 1/sqrt(3)];
K_local = zeros(4,4);
Fq_local = zeros(4,1);

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
       
        dNdxi = [1/4*(eta-1) 1/4*(1-eta) 1/4*(1+eta) -1/4*(1+eta)];
        dNdeta = [1/4*(xi-1) -1/4*(xi+1) 1/4*(1+xi) 1/4*(1-xi)];
        J11 = dNdxi*x';
        J12 = dNdxi*y';
        J21 = dNdeta*x';
        J22 = dNdeta*y';
        J = [J11 J12;J21 J22]; 
        B = inv(J)*[dNdxi;dNdeta];
        K_local = K_local + (B')*B*det(J)*Wgp(i)*Wgp(j);
        Tail = N'*(X^2 + Y^2)*exp(X*Y)*(-1)*det(J)*Wgp(i)*Wgp(j);
        Fq_local = Fq_local + Tail;

    end
end
K = K_local;
Fq = Fq_local;
end

