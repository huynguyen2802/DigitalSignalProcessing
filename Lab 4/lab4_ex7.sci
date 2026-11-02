clear; clc;

x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = length(x);

x_fold = x(pmodulo(-(0 : N - 1), N) + 1);
y_fold = zeros(1, N);
for n = 0 : N - 1
    shift_idx = pmodulo((0 : N - 1) - n, N) + 1;
    x_shift = x_fold(shift_idx);
    y_fold(n + 1) = sum(h .* x_shift);
end

X_circ = zeros(N, N);
for col = 0 : N - 1
    shift_col = pmodulo((0 : N - 1) - col, N) + 1;
    X_circ(:, col + 1) = x(shift_col)';
end
y_circ_mat = (X_circ * h(:))';

y_dft = real(ifft(fft(x) .* fft(h)));

err_norm = norm(y_fold - y_circ_mat) + norm(y_fold - y_dft);
mprintf("Circular Convolution Absolute Error Across All 3 Methods = %g\n", err_norm);

Ex_seq = abs(x).^2;
Ey_seq = abs(y_circ_mat).^2;
Ex = sum(Ex_seq);
Ey = sum(Ey_seq);
mprintf("Period Energy: Ex = %d, Ey = %d\n", Ex, Ey);

n_plot = 0 : 2*N - 1;
x_periodic = [x, x];
y_periodic = [y_circ_mat, y_circ_mat];

scf(7); clf();
subplot(2,2,1);
plot2d3(n_plot, x_periodic, style=2);
plot(n_plot, x_periodic, 'bo', 'thickness', 1.5);
title("Periodic Signal x(n) over 2 Periods");
xlabel("Index n"); ylabel("Amplitude"); xgrid();

subplot(2,2,2);
plot2d3(n_plot, y_periodic, style=5);
plot(n_plot, y_periodic, 'ro', 'thickness', 1.5);
title("Circular Convolution y(n) over 2 Periods");
xlabel("Index n"); ylabel("Amplitude"); xgrid();

subplot(2,2,3);
plot2d3(0:N-1, Ex_seq, style=3);
plot(0:N-1, Ex_seq, 'go', 'thickness', 1.5);
title("Energy of x(n) in 1 Period (Ex = " + string(Ex) + ")");
xlabel("Index n"); ylabel("Energy"); xgrid();

subplot(2,2,4);
plot2d3(0:N-1, Ey_seq, style=6);
plot(0:N-1, Ey_seq, 'mo', 'thickness', 1.5);
title("Energy of y(n) in 1 Period (Ey = " + string(Ey) + ")");
xlabel("Index n"); ylabel("Energy"); xgrid();
