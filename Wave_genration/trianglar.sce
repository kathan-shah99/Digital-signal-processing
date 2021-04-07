//---Author :Kathan-shah-----

//LAB-1-DSP-EX-2 & 3
clear 
clc
N = 2*5

t=[-2*N:0.5:N*2]

//genrating triangular function with N = 5 , i.e tri(n/2N)
for i= 1:length(t)
    if abs(t(i)) <= N then
        tri(i) = (1-(abs(t(i))/N))
    elseif abs(t(i)) > N then
        tri(i)  = 0
    else 
        tri(i) = 0
        end
end

//genrating rectangular function with N1 = 7 , i.e rect(n/2N)
N1 = 2*7
t1 = [-2*N1:0.5:2*N1]

for i= 1:length(t1)
    if abs(t1(i)) <= N1 then
        rect(i) = 1
    elseif abs(t1(i)) > N1 then
        rect(i)  = 0
    else 
        rect(i) = 0
        end
end

subplot(211)
plot2d3(t,tri)
title('tri (n/2*' + string(N/2) + ')')
xlabel('time')
ylabel('Amplitude')


subplot(212)
plot2d3(t1,rect)
title('rect (n/2*' + string(N1/2) + ')')
xlabel('time')
ylabel('Amplitude')


//tri function from rect function 
/*
for i=1:length(t1)
    if abs(t1(i)) <= (N1/2) then
        tri_rect(i) = -rect(i)*(1-abs(i))
    elseif abs(t1(i)) > (N1/2) then
        tri_rect(i) = 0
    else 
        tri_rect(i) = 0
        end
end*/
