//LAB-1-SAMPLE

clc;
clear;
t = 0:0.01:0.5;
f = 5;
s = sin(2*%pi*f*t);
c = cos(2*%pi*f*t);
ep = exp(5*t);
en = exp(-9*t);

t_r = 0:0.1:1
r = t_r;

//x = ep.*t_r

//unit impulse signal
t1=-10:10;
//impulse=[zeros(1,10) 1 zeros(1,10)];
impulse = ones(t1).*(t1==0)
//unit step isgnal
step=ones(t1).*(t1>=0);
//step = [zeros(1,10) ones(1,11)]

//figure(0)
/*
subplot(2,1,1)
plot2d3(t,s)
xlabel('time')
ylabel('Amplitude')
title('sine discrete   '+string(f)+' Hz')

subplot(2,1,2)
plot2d3(t,c)
xlabel('time')
ylabel('Amplitude')
title('cos discrete   '+string(f)+' Hz')


//figure(1)
subplot(3,1,1)
plot2d3(t,ep)
xlabel('time')
ylabel('Amplitude')
title('growing exponantial')


subplot(3,1,2)
plot2d3(t,en)
xlabel('time')
ylabel('Amplitude')
title('Decaying exponantial')


subplot(3,1,3)
plot2d3(t_r,r)
xlabel('time')
ylabel('Amplitude')
title('Ramp signal')
*/

subplot(2,1,1)
plot2d3(t1,impulse)
xlabel('time')
ylabel('Amplitude')
title('unit Impulse')

subplot(2,1,2);
plot2d3(t1,step);
xlabel('time')
ylabel('Amplitude')
title('Unit Step')




