function Plot_du(x,dU,color)
n = size(dU);
for i = 1:n
    plot([x(i) x(i+1)],[dU(i) dU(i)],color)
    hold on
end
end
