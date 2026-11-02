clear; clc;

N = 256;
[X, Y] = meshgrid(1:N, 1:N);
img_raw = 110 + 30 * sin(X / 14) + 20 * cos(Y / 14);
img = uint8(img_raw);

hist_orig = zeros(1, 256);
for k = 0 : 255
    hist_orig(k + 1) = sum(img == k);
end

cdf_val = cumsum(hist_orig) / (N * N);
img_eq = uint8(round(255 * cdf_val(double(img) + 1)));

hist_eq = zeros(1, 256);
for k = 0 : 255
    hist_eq(k + 1) = sum(img_eq == k);
end

L = 7;
if isdef("conv2") then
    kernel_blur = ones(L, L) / (L^2);
    img_blur_conv = conv2(double(img_eq), kernel_blur);
    offset = floor(L / 2);
    img_blur = uint8(img_blur_conv(1 + offset : N + offset, 1 + offset : N + offset));
else
    h_1d = ones(1, L) / L;
    tmp = zeros(N, N + L - 1);
    for r = 1 : N
        tmp(r, :) = convol(h_1d, double(img_eq(r, :)));
    end
    offset = floor(L / 2);
    tmp_cropped = tmp(:, 1 + offset : N + offset);
    img_blur_mat = zeros(N, N);
    for c = 1 : N
        c_col = convol(h_1d, tmp_cropped(:, c)');
        img_blur_mat(:, c) = c_col(1 + offset : N + offset)';
    end
    img_blur = uint8(round(img_blur_mat));
end

watermark = zeros(N, N);
watermark(108:148, 48:208) = 255;
watermark(48:208, 108:148) = 255;
alpha = 0.35;

img_wm_double = double(img_eq);
mask = (watermark > 0);
img_wm_double(mask) = (1 - alpha) * img_wm_double(mask) + alpha * watermark(mask);
img_watermarked = uint8(round(img_wm_double));

scf(5); clf();
f = gcf();
gray_levels = linspace(0, 1, 256)';
f.color_map = [gray_levels, gray_levels, gray_levels];

subplot(2,3,1);
Matplot(double(img) + 1);
title("1. Original Image");

subplot(2,3,2);
plot2d3(0:255, hist_orig);
title("2. Original Histogram");
xlabel("Intensity"); ylabel("Count"); xgrid();

subplot(2,3,3);
Matplot(double(img_eq) + 1);
title("3. Equalized Image");

subplot(2,3,4);
plot2d3(0:255, hist_eq);
title("4. Equalized Histogram");
xlabel("Intensity"); ylabel("Count"); xgrid();

subplot(2,3,5);
Matplot(double(img_blur) + 1);
title("5. Blurred (7x7 Box Kernel)");

subplot(2,3,6);
Matplot(double(img_watermarked) + 1);
title("6. Watermarked (Selective Mask)");
