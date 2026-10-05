n = -5:5;
ur = n .* bool2s(n >= 0);
clf();
plot2d3(n, ur);
title("Unit ramp signal u_r(n)");
xlabel("n");
ylabel("u_r(n)");
