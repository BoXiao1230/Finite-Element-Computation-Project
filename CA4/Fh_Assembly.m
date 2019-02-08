function [Fh] = Fh_Assembly(A)
Global_Fh1 = zeros((A+1)^2,1);
Global_Fh2 = zeros((A+1)^2,1);
T = Index_Table(A);
X = x_coord(A);
Y = y_coord(A);

for i = 1:(A^2)
     if X(i,2) == X(A,2)
         Fh1 = Fh_local1(X(i,:),Y(i,:));
         Global_Fh1(T(i,:),1) = Global_Fh1(T(i,:),1) + Fh1;
     end
end

for i = 1:(A^2)
    if Y(i,3) == Y(A^2,3)
        Fh2 = Fh_local2(X(i,:),Y(i,:));
        Global_Fh2(T(i,:),1) = Global_Fh2(T(i,:),1) + Fh2;
    end  
end
Fh = Global_Fh1 + Global_Fh2; 
end

    