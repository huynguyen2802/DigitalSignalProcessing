function val = get_x26(m)
    val = bool2s((m >= 0) & (m <= 3));
endfunction

n = -3:7;
xn = get_x26(n);
x2n = get_x26(n - 2);

yb = get_x26(n.^2);
yb_delay2 = get_x26((n - 2).^2);
yb2 = get_x26((n.^2) - 2);

scf(); clf();
subplot(5, 1, 1); plot2d3(n, xn, 2); plot(n, xn, 'bo'); xtitle("Problem 2.6(b)-(1): x(n)", "n", "x(n)"); gca().data_bounds=[-3,-0.5;7,1.5]; xgrid();
subplot(5, 1, 2); plot2d3(n, yb, 3); plot(n, yb, 'go'); xtitle("Problem 2.6(b)-(2): y(n) = x(n^2)", "n", "y(n)"); gca().data_bounds=[-3,-0.5;7,1.5]; xgrid();
subplot(5, 1, 3); plot2d3(n, yb_delay2, 5); plot(n, yb_delay2, 'ro'); xtitle("Problem 2.6(b)-(3): y(n - 2)", "n", "y(n-2)"); gca().data_bounds=[-3,-0.5;7,1.5]; xgrid();
subplot(5, 1, 4); plot2d3(n, x2n, 2); plot(n, x2n, 'bo'); xtitle("Problem 2.6(b)-(4): x2(n) = x(n - 2)", "n", "x2(n)"); gca().data_bounds=[-3,-0.5;7,1.5]; xgrid();
subplot(5, 1, 5); plot2d3(n, yb2, 6); plot(n, yb2, 'mo'); xtitle("Problem 2.6(b)-(5): y2(n) = T[x2(n)]", "n", "y2(n)"); gca().data_bounds=[-3,-0.5;7,1.5]; xgrid();

yc = get_x26(n) - get_x26(n - 1);
yc_delay2 = get_x26(n - 2) - get_x26(n - 3);
yc2 = x2n - get_x26((n - 1) - 2);

scf(); clf();
subplot(5, 1, 1); plot2d3(n, xn, 2); plot(n, xn, 'bo'); xtitle("Problem 2.6(c)-(1): x(n)", "n", "x(n)"); gca().data_bounds=[-3,-1.5;7,1.5]; xgrid();
subplot(5, 1, 2); plot2d3(n, yc, 3); plot(n, yc, 'go'); xtitle("Problem 2.6(c)-(2): y(n) = x(n) - x(n - 1)", "n", "y(n)"); gca().data_bounds=[-3,-1.5;7,1.5]; xgrid();
subplot(5, 1, 3); plot2d3(n, yc_delay2, 5); plot(n, yc_delay2, 'ro'); xtitle("Problem 2.6(c)-(3): y(n - 2)", "n", "y(n-2)"); gca().data_bounds=[-3,-1.5;7,1.5]; xgrid();
subplot(5, 1, 4); plot2d3(n, x2n, 2); plot(n, x2n, 'bo'); xtitle("Problem 2.6(c)-(4): x2(n) = x(n - 2)", "n", "x2(n)"); gca().data_bounds=[-3,-1.5;7,1.5]; xgrid();
subplot(5, 1, 5); plot2d3(n, yc2, 6); plot(n, yc2, 'mo'); xtitle("Problem 2.6(c)-(5): y2(n) = T[x2(n)]", "n", "y2(n)"); gca().data_bounds=[-3,-1.5;7,1.5]; xgrid();

yd = n .* get_x26(n);
yd_delay2 = (n - 2) .* get_x26(n - 2);
yd2 = n .* x2n;

scf(); clf();
subplot(5, 1, 1); plot2d3(n, xn, 2); plot(n, xn, 'bo'); xtitle("Problem 2.6(d)-(1): x(n)", "n", "x(n)"); gca().data_bounds=[-3,-0.5;7,5.5]; xgrid();
subplot(5, 1, 2); plot2d3(n, yd, 3); plot(n, yd, 'go'); xtitle("Problem 2.6(d)-(2): y(n) = n * x(n)", "n", "y(n)"); gca().data_bounds=[-3,-0.5;7,5.5]; xgrid();
subplot(5, 1, 3); plot2d3(n, yd_delay2, 5); plot(n, yd_delay2, 'ro'); xtitle("Problem 2.6(d)-(3): y(n - 2)", "n", "y(n-2)"); gca().data_bounds=[-3,-0.5;7,5.5]; xgrid();
subplot(5, 1, 4); plot2d3(n, x2n, 2); plot(n, x2n, 'bo'); xtitle("Problem 2.6(d)-(4): x2(n) = x(n - 2)", "n", "x2(n)"); gca().data_bounds=[-3,-0.5;7,5.5]; xgrid();
subplot(5, 1, 5); plot2d3(n, yd2, 6); plot(n, yd2, 'mo'); xtitle("Problem 2.6(d)-(5): y2(n) = n * x2(n)", "n", "y2(n)"); gca().data_bounds=[-3,-0.5;7,5.5]; xgrid();
