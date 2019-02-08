function [X] = x_coord(A)
x = zeros(A,4);
x(1,:) = [0 1/A 1/A 0];
for i = 1:(A-1)
    x(i+1,:) = x(1,:)+ i*1/A *ones(1,4);
end
X = zeros(A^2,4);
for i = 1:A
    X([i*A-(A-1):i*A],:) = x;
end
end

    
   