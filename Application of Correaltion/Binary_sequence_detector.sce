clear
clc
Tx = input("enter Tx sequence :  ") //input Binary Sequance

sample = 50                  //number of samples
n = 0:1:sample-1;
x0 = sin((2*n*%pi)/8)             //Tx-0
x1 = sin((2*n*%pi)/4)             //Tx-1

noise=rand(1,sample);           //noise generation
y0 = x0 + noise                 //if x0 recieved
y1 = x1 + noise                 //if x1 recieved

for i=1:length(Tx) 
    if Tx(i) == 0 then 
        y = y0;                 //if Tx = 0 then x0 transmitted
    else
        y = y1;
    end
    
    rx0y = max(xcorr(x0,y));    //finding max correlation btw x0 and recieved signal
    rx1y = max(xcorr(x1,y));    //finding max correlation btw x1 and recieved signal
    if rx0y > rx1y then
        Rx(i) = 0
    else
        Rx(i) = 1
    end
end

disp("Recived Binary Sequence")
disp(Rx')                       //display recieved bit array


subplot(221)
plot(x0)
title("Tx=0 signal")
xlabel("Time")
ylabel("Amplitude")

subplot(223)
plot(x1)
title("Tx=1 signal")
xlabel("Time")
ylabel("Amplitude")

subplot(222)
plot(y0)
title("Rx=0 signal")
xlabel("Time")
ylabel("Amplitude")

subplot(224)
plot(y1)
title("Rx=1 signal")
xlabel("Time")
ylabel("Amplitude")

figure(1)
subplot(211)
plot(Tx)
title("Transmitted signal")
xlabel("Time")
ylabel("Amplitude")

subplot(212)
plot(Rx)
title("recieved signal")
xlabel("Time")
ylabel("Amplitude")

