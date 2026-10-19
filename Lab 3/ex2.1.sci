function [yn, yorigin] = fold_sig(xn, xorigin)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;
endfunction

function [yn, yorigin] = delay_sig(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
endfunction

nx = -3:3;
xn = [0, 1/3, 2/3, 1, 1, 1, 1];
xorigin = 4;

[v1, v1_orig] = fold_sig(xn, xorigin);
[y1, y1_orig] = delay_sig(v1, v1_orig, 4);
ny1 = (1:length(y1)) - y1_orig;

[v2, v2_orig] = delay_sig(xn, xorigin, 4);
[y2, y2_orig] = fold_sig(v2, v2_orig);
ny2 = (1:length(y2)) - y2_orig;

nc = -8:8;
xc = zeros(1, length(nc));
for i = 1:length(nc)
    m = -nc(i) + 4;
    if (m >= -3) & (m <= -1) then
        xc(i) = 1 + m/3;
    elseif (m >= 0) & (m <= 3) then
        xc(i) = 1;
    end
end

scf(); clf();
subplot(4, 1, 1);
plot2d3(nx, xn, style=2); plot(nx, xn, 'bo');
xtitle("Problem 2.1(a): Signal x(n)", "n", "x(n)");
gca().data_bounds = [-8, -0.2; 8, 1.5]; xgrid();

subplot(4, 1, 2);
plot2d3(ny1, y1, style=5); plot(ny1, y1, 'ro');
xtitle("Problem 2.1(b.1): Fold then Delay by 4 -> y1(n) = x(-n + 4)", "n", "y1(n)");
gca().data_bounds = [-8, -0.2; 8, 1.5]; xgrid();

subplot(4, 1, 3);
plot2d3(ny2, y2, style=3); plot(ny2, y2, 'go');
xtitle("Problem 2.1(b.2): Delay by 4 then Fold -> y2(n) = x(-n - 4)", "n", "y2(n)");
gca().data_bounds = [-8, -0.2; 8, 1.5]; xgrid();

subplot(4, 1, 4);
plot2d3(nc, xc, style=6); plot(nc, xc, 'mo');
xtitle("Problem 2.1(c): Signal x(-n + 4)", "n", "x(-n+4)");
gca().data_bounds = [-8, -0.2; 8, 1.5]; xgrid();
