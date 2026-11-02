clear; clc;

x = [1, 2, -3, 2, 1];
h = [1, 0, -1];
Lx = length(x);
Lh = length(h);
Ly = Lx + Lh - 1;

y_fold = zeros(1, Ly);
h_folded = h($:-1:1);
x_padded = [zeros(1, Lh-1), x, zeros(1, Lh-1)];
for n = 1 : Ly
    x_win = x_padded(n : n + Lh - 1);
    y_fold(n) = sum(x_win .* h_folded);
end

H_mat = zeros(Ly, Lx);
for c = 1 : Lx
    H_mat(c : c + Lh - 1, c) = h(:);
end
y_matrix = (H_mat * x(:))';

y_ref = convol(x, h);
max_err = max(abs(y_fold - y_matrix)) + max(abs(y_fold - y_ref));
mprintf("Cross Validation Max Error = %g (Numerical Zero)\n", max_err);

Ex_seq = abs(x).^2;
Ey_seq = abs(y_matrix).^2;
Ex = sum(Ex_seq);
Ey = sum(Ey_seq);
mprintf("Total Energy Ex = %d, Total Energy Ey = %d\n", Ex, Ey);

nx = 0 : Lx - 1;
ny = 0 : Ly - 1;

scf(6); clf();
subplot(2,2,1);
plot2d3(nx, x, style=2);
plot(nx, x, 'bo', 'thickness', 1.5);
title("Input Signal x(n)");
xlabel("Index n"); ylabel("Amplitude"); xgrid();

subplot(2,2,2);
plot2d3(ny, y_matrix, style=5);
plot(ny, y_matrix, 'ro', 'thickness', 1.5);
title("Linear Convolution Output y(n)");
xlabel("Index n"); ylabel("Amplitude"); xgrid();

subplot(2,2,3);
plot2d3(nx, Ex_seq, style=3);
plot(nx, Ex_seq, 'go', 'thickness', 1.5);
title("Energy Distribution of x(n) (Ex = " + string(Ex) + ")");
xlabel("Index n"); ylabel("Energy"); xgrid();

subplot(2,2,4);
plot2d3(ny, Ey_seq, style=6);
plot(ny, Ey_seq, 'mo', 'thickness', 1.5);
title("Energy Distribution of y(n) (Ey = " + string(Ey) + ")");
xlabel("Index n"); ylabel("Energy"); xgrid();
