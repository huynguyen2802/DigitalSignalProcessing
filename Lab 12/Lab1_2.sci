// x(t)=3sin(100*pi*t)
//->f=50, t=1/50s, 5 period=0:1/50:1/10.
disp("Ex1.2.1");
f0=50;
t0=1/f0;
period=0:t0/100:5*t0;
t=period;
function x=signal(t); x=3*sin(100*%pi*t);
endfunction;

subplot(3,1,1);
plot(t, signal(t),'r-', 'LineWidth', 2);
title("1. Analog signal xa(t) in 5 period");
xlabel("Time");
ylabel("Amplitude");
xgrid();

// t=n*Ts=n/Fs, Fs=300 samples/s. 
//->x(n)=xa(t)=xa(n/Fs)
disp("Ex1.2.2");
Fs = 300;
N = 6;                          
n = 0 : (5 * N - 1);             
xn = 3 * sin((%pi / 3) * n);

subplot(3, 1, 2);
plot2d3(n, xn, 2);
plot(n, xn, 'r.');
title('2. Discrete-time signal x(n) in 5 periods (Period N = 6)');
xlabel('n (samples)');
ylabel('Amplitude');
xgrid();

delta = 0.1;
xq = delta * floor(xn ./ delta); // Phuong phap Truncation

subplot(3, 1, 3);
plot2d3(n, xq, 5);
plot(n, xq, 'b.');
title('3. Quantized signal x_q(n) with Delta = 0.1 (Truncation)');
xlabel('n (samples)');
ylabel('Amplitude');
xgrid();
