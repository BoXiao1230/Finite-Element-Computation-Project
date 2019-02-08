function [T] = Index_Table(A)
table = zeros(A^2,4);
for i = 1:A^2
    junk = i + floor((i-1)/A);
    table(i,:) = [junk junk+1 junk+A+2 junk+A+1];
end
T = table;
end