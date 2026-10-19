Fs = 8000; n = 0:15;
x5 = cos(2*%pi*5000/Fs*n);   x3 = cos(2*%pi*3000/Fs*n);
x9 = cos(2*%pi*9000/Fs*n);   x1 = cos(2*%pi*1000/Fs*n);
disp(max(abs(x5 - x3)));     // ~0 : 5 kHz la alias cua 3 kHz
disp(max(abs(x9 - x1)));     // ~0 : 9 kHz la alias cua 1 kHz

clf();
subplot(2,1,1); plot2d3(n, x5); title("5 kHz @ Fs=8 kHz (trung voi 3 kHz)"); xlabel("n"); ylabel("x(n)");
subplot(2,1,2); plot2d3(n, x9); title("9 kHz @ Fs=8 kHz (trung voi 1 kHz)"); xlabel("n"); ylabel("x(n)");
