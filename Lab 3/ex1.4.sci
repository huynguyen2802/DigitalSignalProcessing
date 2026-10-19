function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    ny = n_min : n_max;
    y1 = zeros(1, length(ny));
    y2 = zeros(1, length(ny));
    y1(find((ny >= min(n1)) & (ny <= max(n1)))) = x1n;
    y2(find((ny >= min(n2)) & (ny <= max(n2)))) = x2n;
    yn = y1 + y2;
    yorigin = 1 - n_min;
    y_min = min([x1n, x2n, yn, 0]) - 1;
    y_max = max([x1n, x2n, yn, 0]) + 1;
    scf(); clf();
    subplot(3, 1, 1);
    plot2d3(n1, x1n, style=2);
    plot(n1, x1n, 'bo');
    xtitle("Signal x1(n)", "n", "Amplitude");
    gca().data_bounds = [n_min - 1, y_min; n_max + 1, y_max];
    xgrid();
    subplot(3, 1, 2);
    plot2d3(n2, x2n, style=3);
    plot(n2, x2n, 'go');
    xtitle("Signal x2(n)", "n", "Amplitude");
    gca().data_bounds = [n_min - 1, y_min; n_max + 1, y_max];
    xgrid();
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xtitle("Added Signal y(n) = x1(n) + x2(n)", "n", "Amplitude");
    gca().data_bounds = [n_min - 1, y_min; n_max + 1, y_max];
    xgrid();
endfunction

[yn, yorigin] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
disp("yn = ", yn);
disp("yorigin = ", yorigin);
