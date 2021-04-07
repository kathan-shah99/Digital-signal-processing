//LAB-1-MOD-1
//genrating under damped exponantials
clc;
clear;

t = 0:0.01:5;
f = 5;
s = sin(2*%pi*f*t);
ep = exp(-t);
en = exp(t);

under_damped = s.*ep
plot(t,under_damped)
title('Under damped Exponantial')
xlabel('time')
ylabel('Amplitude')
