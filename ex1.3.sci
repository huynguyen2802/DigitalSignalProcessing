n = 0:63;
x = cos(%pi*n/2) - sin(%pi*n/8) + 3*cos(%pi*n/4 + %pi/3);
N = 16;
err = max(abs(x(1:48) - x(1+N:64)))
clf();
subplot(2,1,1); plot2d3(n, x);
title("(e) x(n) - periodic, N = 16"); xlabel("n"); ylabel("x(n)");

n2 = 0:63;
xb = 3*cos(5*n2 + %pi/6);
subplot(2,1,2); plot2d3(n2, xb);
title("(b) x(n) = 3cos(5n+pi/6) - NOT periodic"); xlabel("n"); ylabel("x(n)");
for N2 = 1:30
    e(N2) = max(abs(xb(1:30) - xb(1+N2:30+N2)));
end
disp(min(e));
