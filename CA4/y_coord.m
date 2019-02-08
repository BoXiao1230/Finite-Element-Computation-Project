function [Y] = y_coord(A)
base = [0 0 1/A 1/A];
Y = zeros(A^2,4);
for i = 1:A^2
    cof = fix((i-1)/A);
    Y(i,:) = base + (1/A)*cof*ones(1,4);
end
end
