Fs = 600; n = 0:59;
x  = sin(2*%pi*240/Fs*n) + 3*sin(2*%pi*360/Fs*n);
x2 = -2*sin(0.8*%pi*n);
disp(max(abs(x - x2)));

t  = 0:1/20000:0.05;
xa = sin(480*%pi*t) + 3*sin(720*%pi*t);
ya = -2*sin(480*%pi*t);
clf();
subplot(2,1,1); plot2d(t, xa); title("x_a(t) goc"); xlabel("t (s)"); ylabel("x_a");
subplot(2,1,2); plot2d(t, ya); title("y_a(t) = -2sin(480 pi t) sau khoi phuc"); xlabel("t (s)"); ylabel("y_a");
