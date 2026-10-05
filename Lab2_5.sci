function stemplot(n, x, ttl)
    plot2d3(n, x);
    a = gca();
    a.data_bounds = [min(n)-1, min(0,min(x))-1; max(n)+1, max(0,max(x))+1];
    title(ttl);
    xlabel("n");
    ylabel("Amplitude");
endfunction
n  = -1:1;
x  = [1 3 -2];
xf = x($:-1:1);
xe = 0.5*(x + xf);
xo = 0.5*(x - xf);

clf();
subplot(3,1,1); stemplot(n, x,  "x(n)");
subplot(3,1,2); stemplot(n, xo, "Odd component x_o(n)");
subplot(3,1,3); stemplot(n, xe, "Even component x_e(n)");
disp(xe); disp(xo);
