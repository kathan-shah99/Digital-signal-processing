clc
clear 
//-------------ECG singal genration------------
t = 0:1:40
triangular = [0 1 2 3 4 5 6 7 8 9 10 9 8 7 6 5 4 3 2 1 0]/2

parabola = (0.05*(t-20).*(t-20)-20)/50;  //parabola

zero = zeros(1,100)
//zero_noise = rand(1,100)

Ewave = []
ECG = [triangular parabola zero]
ECG_n = [triangular parabola zero]
    
ECG = [ECG ECG ECG ECG]                 //oringal ECG wave
ECG_n = ECG.*rand(1,length(ECG))        //noisy ECG wave

subplot(211)
plot(ECG)
xtitle("ECG wave")
xlabel("samples")
ylabel("magnitudes")
mtlb_grid()

subplot(212)
plot(ECG_n)
xtitle("ECG noisy wave")
xlabel("samples")
ylabel("magnitudes")
mtlb_grid()
