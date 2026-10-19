function stemplot(n, x, ttl)
    plot2d3(n, x);
    a = gca();
    a.data_bounds = [min(n)-1, min(0,min(x))-1; max(n)+1, max(0,max(x))+1];
    title(ttl);
    xlabel("n");
    ylabel("Amplitude");
endfunction
n  = -2:1;
x  = [1 -2 3 6];

// y1(n) = x(-n)
n1 = -1:2;
y1 = [6 3 -2 1];
// y2(n) = x(n+3)
n2 = -5:-2;
y2 = [1 -2 3 6];
// y3(n) = 2x(-n-2)
n3 = -3:0;
y3 = [12 6 -4 2];

clf(0);
scf(1); clf();
subplot(2,1,1); stemplot(n,  x,  "x(n)");
subplot(2,1,2); stemplot(n1, y1, "y_1(n) = x(-n)");

scf(2); clf();
subplot(2,1,1); stemplot(n,  x,  "x(n)");
subplot(2,1,2); stemplot(n2, y2, "y_2(n) = x(n+3)");

scf(3); clf();
subplot(2,1,1); stemplot(n,  x,  "x(n)");
subplot(2,1,2); stemplot(n3, y3, "y_3(n) = 2x(-n-2)");
