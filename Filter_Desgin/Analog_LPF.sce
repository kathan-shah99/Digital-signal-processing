clc;
clear;

// Evaluate magnitude response of the filter
fcut = 5;   //cutoff freq in hz
n = 5;      // Filter order
hc1 = analpf(n, 'cheb1', [0.1 0], fcut*2*%pi);
hc2 = analpf(n, 'cheb2', [0 0.1], fcut*2*%pi);
he = analpf(n, 'ellip', [0.1 0.1], fcut*2*%pi);
hb = analpf(n, 'butt', [0 0], fcut*2*%pi);
hc1.dt = 'c';
hc2.dt = 'c';
he.dt = 'c';
hb.dt = 'c';
clf();
[fr, hf] = repfreq(hc1, 0, 15);
plot(fr, abs(hf), 'b')
[fr, hf] = repfreq(hc2, 0, 15);
plot(fr,abs(hf),'r')
[fr, hf] = repfreq(he, 0, 15);
plot(fr,abs(hf),'g')
[fr, hf] = repfreq(hb, 0, 15);
plot(fr, abs(hf), 'm')

legend(["Chebyshev I", "Chebyshev II", "Elliptic", "Butterworth"]);
mtlb_grid on;
xlabel("Frequency (Hz)")
ylabel("Gain")
title("Analog filters of order " + string(n));
 
 
