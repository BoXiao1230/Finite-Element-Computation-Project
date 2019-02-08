function [U] = Compute_U(A)

[K_global,Fq_global] = K_Fq_Assembly(A);
[Fh_global] = Fh_Assembly(A);
F_global = Fh_global + Fq_global;

for i = 1:(A+1)
    K_global(i,:) = 0;
    F_global(i) = 1;
    F_global = F_global - 1.*K_global(:,i);
    K_global(:,i) = 0;
    K_global(i,i) = 1;
end


for j = (A+2):(A+1):[(A+1)^2-A]
    K_global(j,:) = 0;
    F_global(j) = 1;
    F_global = F_global - 1.*K_global(:,j);
    K_global(:,j) = 0;
    K_global(j,j) = 1;
end

U = K_global\F_global;
end










