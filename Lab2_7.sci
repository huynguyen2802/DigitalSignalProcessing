function stemplot(n, x, ttl)
    plot2d3(n, x);
    a = gca();
    a.data_bounds = [min(n)-1, min(0,min(x))-1; max(n)+1, max(0,max(x))+1];
    title(ttl);
    xlabel("n");
    ylabel("Amplitude");
endfunction
n  = -1:3;
x1 = [0 0 1 3 -2];
x2 = [0 1 2 3 0];
y  = x1 .* x2;

clf();
subplot(3,1,1); stemplot(n, x1, "x_1(n)");
subplot(3,1,2); stemplot(n, x2, "x_2(n)");
subplot(3,1,3); stemplot(n, y,  "y(n) = x_1(n) . x_2(n)");
disp(y);
