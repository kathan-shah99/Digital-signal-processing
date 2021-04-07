clc
clear

//--------------------echo-filter------------
//numerator
b = [1 zeros(1,16000) 0.1];     //1 sec delay , 10% attenuation(0.1)

//denomintor
a = [1];

//read audio singal
[x,Fs] = wavread('/Users/kathan/Desktop/test.wav')  

Y = filter(b,a,x);

subplot(211)
plot(x)
title("Orignal singal")
ylabel("Magnitude")

subplot(212)
plot(Y)
title("Echoing singal")
ylabel("Magnitude")

sound(Y)


