clear; clc;
xdel(winsid());                       

Fs = 8000;
N = 8000;                             
t = (0 : N - 1) / Fs;                  
f1 = 440;                              
f2 = 1200;                             

x_clean = 0.60 * sin(2 * %pi * f1 * t);
x_noise = 0.35 * sin(2 * %pi * f2 * t);
x_noisy = x_clean + x_noise;

audio_filename = "demo_audio.wav";
if isdef("audiowrite") then
    audiowrite(audio_filename, x_noisy(:), Fs);
    [y_read, Fs_read] = audioread(audio_filename);
    y_read = y_read';                
else
    wavwrite(x_noisy, Fs, 16, audio_filename);
    [y_read, Fs_read, nbits] = wavread(audio_filename);
end
mprintf("Loaded Audio File: Fs = %d Hz, Total Samples = %d\n", Fs_read, length(y_read));

M = 7;
h_lpf = ones(1, M) / M;
y_conv = convol(h_lpf, y_read);
y_filtered = y_conv(1 : N);           

f_axis = (0 : floor(N/2) - 1) * (Fs / N);
Y_orig_mag = abs(fft(y_read)) / N;
Y_filt_mag = abs(fft(y_filtered)) / N;

scf(4); clf();
subplot(2,2,1);
plot(t(1:200), y_read(1:200), 'b-', 'thickness', 1.5);
title("Time Domain: Noisy Audio Signal (First 25 ms)");
xlabel("Time (s)"); ylabel("Amplitude"); xgrid();

subplot(2,2,2);
plot(t(1:200), y_filtered(1:200), 'r-', 'thickness', 1.5);
title("Time Domain: Filtered Audio Signal (First 25 ms)");
xlabel("Time (s)"); ylabel("Amplitude"); xgrid();

subplot(2,2,3);
plot(f_axis, 2 * Y_orig_mag(1 : floor(N/2)), 'b-', 'thickness', 1.5);
title("Magnitude Spectrum: Before Filtering");
xlabel("Frequency (Hz)"); ylabel("Magnitude"); xgrid();

subplot(2,2,4);
plot(f_axis, 2 * Y_filt_mag(1 : floor(N/2)), 'r-', 'thickness', 1.5);
title("Magnitude Spectrum: After 7-Point FIR Filtering");
xlabel("Frequency (Hz)"); ylabel("Magnitude"); xgrid();
