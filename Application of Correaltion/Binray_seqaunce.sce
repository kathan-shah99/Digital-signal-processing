clear
clc
N= 20 ;
n = 0:N-1;
x0 = sin((n*%pi)/8) //tx-0
x1 = sin((n*%pi)/4) //tx-1

w=rand(1,N);
y0 = x0 + w
y1 = x1 + w

//if recieved y0(n)
rx0y0 = xcorr(x0,y0);
rx1y0 = xcorr(x1,y0);

//if recieved y1(n)
rx1y1 = xcorr(x1,y1)
rx0y1 = xcorr(x0,y1)


subplot(221)
plot2d3(rx0y0)
title("xo & yo")

subplot(222)
plot2d3(rx1y0)
title("x1 & y0")


subplot(223)
plot2d3(rx0y1)
title("x0 & y1")

subplot(224)
plot2d3(rx1y1)
title("x1 & y1")

disp("rx1y0")
disp(max(rx1y0))

disp("rx1y1")
disp(max(rx1y1))

disp("rx0y0")
disp(max(rx0y0))

disp("rx0y1")
disp(max(rx0y1))
