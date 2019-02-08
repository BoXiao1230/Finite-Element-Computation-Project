function [K,F] = K_Fq_Assembly(A)
Global_K = zeros((A+1)^2,(A+1)^2);
Global_Fq = zeros((A+1)^2,1);
X = x_coord(A);
Y = y_coord(A);

T = Index_Table(A);
for i = 1:(A^2)
    [K_local,Fq_local] = K_Fq_local(X(i,:),Y(i,:));
    
    Global_Fq(T(i,:),1) = Global_Fq(T(i,:),1) + Fq_local;
    
    r = 1;
    for j = T(i,:)
        Global_K(j,T(i,:)) = Global_K(j,T(i,:)) + K_local(r,:);
        r = r+1;
    end
end
K = Global_K;
F = Global_Fq;