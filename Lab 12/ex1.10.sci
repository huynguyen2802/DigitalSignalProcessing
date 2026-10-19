Fs = 1000; n = 0:99;
x   = 3*cos(2*%pi*300/Fs*n) + 2*cos(2*%pi*900/Fs*n);
xal = 3*cos(0.6*%pi*n)      + 2*cos(0.2*%pi*n);
disp(max(abs(x - xal)))
b     = log2(1024);
Fs2   = 10000/b;
xmax  = 5; xmin = -5; L = 1024;
Delta = (xmax - xmin)/(L - 1)

clf();
plot2d3(n, x); title("x(n) sau khi lay mau Fs = 1000 Hz");
xlabel("n"); ylabel("x(n)");
