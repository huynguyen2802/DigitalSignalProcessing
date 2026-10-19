function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = conv(xn, hn);
    yorigin = xorigin + horigin - 1;
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;
    n_min = min([min(nx), min(nh), min(ny)]) - 1;
    n_max = max([max(nx), max(nh), max(ny)]) + 1;
    y_min = min([xn, hn, yn, 0]) - 1;
    y_max = max([xn, hn, yn, 0]) + 1;
    scf(); clf();
    subplot(3, 1, 1);
    plot2d3(nx, xn, style=2);
    plot(nx, xn, 'bo');
    xtitle("Input Signal x(n)", "n", "Amplitude");
    gca().data_bounds = [n_min, y_min; n_max, y_max];
    xgrid();
    subplot(3, 1, 2);
    plot2d3(nh, hn, style=3);
    plot(nh, hn, 'go');
    xtitle("Impulse Response h(n)", "n", "Amplitude");
    gca().data_bounds = [n_min, y_min; n_max, y_max];
    xgrid();
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xtitle("Convolved Output y(n) = x(n) * h(n)", "n", "Amplitude");
    gca().data_bounds = [n_min, y_min; n_max, y_max];
    xgrid();
endfunction

[yn, yorigin] = convolution([1, 2, 3, 1], 2, [1, 2, 1, -1], 1);
disp("yn = ", yn);
disp("yorigin = ", yorigin);
