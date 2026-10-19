xn = [2, 3, 4, 5, 6];
xorigin = 3;
n = (1:length(xn)) - xorigin;
x_fold = xn($:-1:1);
xe = 0.5 * (xn + x_fold);
xo = 0.5 * (xn - x_fold);

disp("x(n) = ", xn);
disp("x(-n) = ", x_fold);
disp("Even part xe(n) = ", xe);
disp("Odd part xo(n) = ", xo);
disp("Verification xe(n) + xo(n) = ", xe + xo);

scf(); clf();
subplot(3, 1, 1);
plot2d3(n, xn, 2); plot(n, xn, 'bo');
xtitle("Problem 2.4: Original Signal x(n) = {2, 3, 4, 5, 6}", "n", "x(n)");
gca().data_bounds = [-3, -3; 3, 7]; xgrid();

subplot(3, 1, 2);
plot2d3(n, xe, 3); plot(n, xe, 'go');
xtitle("Even Component xe(n) = 0.5 * [x(n) + x(-n)]", "n", "xe(n)");
gca().data_bounds = [-3, -3; 3, 7]; xgrid();

subplot(3, 1, 3);
plot2d3(n, xo, 5); plot(n, xo, 'ro');
xtitle("Odd Component xo(n) = 0.5 * [x(n) - x(-n)]", "n", "xo(n)");
gca().data_bounds = [-3, -3; 3, 7]; xgrid();
