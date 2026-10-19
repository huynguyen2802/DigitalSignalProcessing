function val = get_x22(m)
    val = zeros(1, length(m));
    for i = 1:length(m)
        if m(i) >= -1 & m(i) <= 2 then
            val(i) = 1;
        elseif m(i) == 3 | m(i) == 4 then
            val(i) = 0.5;
        else
            val(i) = 0;
        end
    end
endfunction

n = -6:8;
xn = get_x22(n);
ya = get_x22(n - 2);
yb = get_x22(4 - n);
yc = get_x22(n + 2);
yd = get_x22(n) .* bool2s(2 - n >= 0);
ye = get_x22(n - 1) .* bool2s(n - 3 == 0);
yf = get_x22(n.^2);
xg = 0.5 * (get_x22(n) + get_x22(-n));
xh = 0.5 * (get_x22(n) - get_x22(-n));

scf(); clf();
subplot(3, 2, 1); plot2d3(n, xn, 2); plot(n, xn, 'bo'); xtitle("Original x(n)", "n", "Amplitude"); gca().data_bounds=[-6,-0.5;8,1.5]; xgrid();
subplot(3, 2, 2); plot2d3(n, ya, 5); plot(n, ya, 'ro'); xtitle("(a) x(n - 2)", "n", "Amplitude"); gca().data_bounds=[-6,-0.5;8,1.5]; xgrid();
subplot(3, 2, 3); plot2d3(n, yb, 5); plot(n, yb, 'ro'); xtitle("(b) x(4 - n)", "n", "Amplitude"); gca().data_bounds=[-6,-0.5;8,1.5]; xgrid();
subplot(3, 2, 4); plot2d3(n, yc, 5); plot(n, yc, 'ro'); xtitle("(c) x(n + 2)", "n", "Amplitude"); gca().data_bounds=[-6,-0.5;8,1.5]; xgrid();
subplot(3, 2, 5); plot2d3(n, yd, 5); plot(n, yd, 'ro'); xtitle("(d) x(n)u(2 - n)", "n", "Amplitude"); gca().data_bounds=[-6,-0.5;8,1.5]; xgrid();
subplot(3, 2, 6); plot2d3(n, ye, 5); plot(n, ye, 'ro'); xtitle("(e) x(n - 1)delta(n - 3)", "n", "Amplitude"); gca().data_bounds=[-6,-0.5;8,1.5]; xgrid();

scf(); clf();
subplot(3, 1, 1); plot2d3(n, yf, 5); plot(n, yf, 'ro'); xtitle("(f) x(n^2)", "n", "Amplitude"); gca().data_bounds=[-6,-0.5;8,1.5]; xgrid();
subplot(3, 1, 2); plot2d3(n, xg, 3); plot(n, xg, 'go'); xtitle("(g) Even part xe(n)", "n", "Amplitude"); gca().data_bounds=[-6,-0.5;8,1.5]; xgrid();
subplot(3, 1, 3); plot2d3(n, xh, 6); plot(n, xh, 'mo'); xtitle("(h) Odd part xo(n)", "n", "Amplitude"); gca().data_bounds=[-6,-0.8;8,0.8]; xgrid();
