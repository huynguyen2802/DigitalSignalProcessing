month  = 0:11;
weight = [3.4 4.4 5.1 5.8 6.4 6.9 7.3 7.6 7.9 8.2 8.5 8.7];   // kg
height = [50 54 58 61 64 66 68 70 72 73 75 76];               // cm
clf();
subplot(2,1,1); plot2d3(month, weight); title("Weight"); xlabel("Month"); ylabel("kg");
subplot(2,1,2); plot2d3(month, height); title("Height"); xlabel("Month"); ylabel("cm");
