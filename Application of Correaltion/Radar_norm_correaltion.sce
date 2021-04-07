//LAB-4 RADAR - APPLICAITON OF CORREALATION
clc
clear
clf()
x=[5 9 2 1 5 4 5];          //Triangle pulse transmitted by radar
n=[-3 -2 -1 0 1 2 3];       // Index of Triangular Pulse
D=10;

nd=n+D;
y=x;                        // Delayed Signal

w=rand(1,length(x));      // Noise Generation
nw=nd;

//-------------------------If present-------------------------------

// If object is present we receive the signal R(n) = x(n-D) + Noise
R=1*y+w;                // Original Signal+Noise
nr=nw;                  // Index of received signal at RADAR
R_P=xcorr(x,R);


nmin=min(n)+min(nr);        // Lowest index of y(n)
nmax=max(n)+max(nr);        // Highest index of y(n)

n_r=nmin:nmax;

//finding at which index correlation value is max -- n_r(delay_index)
delay_index = find(R_P == max(R_P))
disp("delay index --> "+string(n_r(delay_index)))
disp("correaltion @ delay index --> "+string(R_P(delay_index)))

//-----------------------Normlized Correlation---------------------------------

//normalized correlation (max correlation value < 1)
R_norm = 0  //R^2 --recieved signal square
x_norm = 0  //X^2 --transmitting signal square
R_re = 0    //correlation

//finding R^2 & X^2
for i=1:length(R)
    R_norm = R_norm + R(i)**2
    x_norm = x_norm + x(i)**2
    R_re = R_re + R(i)*x(i) //manual correlation 
end

R_Pnorm = sqrt(R_norm*x_norm)
norm_corr = R_re / R_Pnorm      //normlaized correlation value btw 0 to 1
disp("Present correlation --> " + string(100*norm_corr) + "%")

subplot(311)
plot2d3(n,x);
replot([min(n)-1 1+max(n);0 max(x)+1])
title("Transmitting signal")
xlabel("Time")
ylabel("Amplitude")

subplot(312)
plot2d3(nr,R);
replot([min(nr)-1 1+max(nr);0 max(R)+1])
title("Recived delay = " + string(D) +  " signal")
xlabel("delayed Time")
ylabel("Amplitude")

subplot(313)
plot2d3(n,w);
title("Noise recieved signal")
xlabel("Time")
ylabel("Amplitude")

figure(1)
subplot(211)
plot2d3(n_r,R_P);
title("recieved signal correation")
xlabel("index")
ylabel("Correlation Value")

//-----------------------------Not Present-----------------------

// If object is not present we receive the signal R(n) = Noise

R1=w;                       // only Noise Signal
nr=nw;
R_A=xcorr(x,R1);
nmin=min(n)+min(nr);		// Lowest index of y(n)
nmax=max(n)+max(nr);		// Highest index of y(n)
n_received=nmin:nmax;


subplot(212)
plot2d3(n_received,R_A);
title("not recived correlation")
xlabel("index")
ylabel("correaltion Value")

//------------------------------Normalized correaltion-------------------------------
R_norm_A = 0
x_norm_A =  0
R_re_A = 0
for i=1:length(R)
    R_norm_A = R_norm_A + R1(i)**2
    x_norm_A = x_norm_A + x(i)**2
    R_re_A = R_re_A + R1(i)*x(i)
end

R_Pnorm_A = sqrt(R_norm_A*x_norm_A)
norm_corr_A = R_re_A / R_Pnorm_A

disp("Absent correlation --> " + string(100*norm_corr_A) + "%")


