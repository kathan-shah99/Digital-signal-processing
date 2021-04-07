clc
clear
x = [1 2 3 4 5 6 7 8 9 10]
y = x

for i=1:length(x)-1
    y(i+1) = x(length(x)-i+1)
end

disp("before Circular-Shift")
disp(x)
disp("After Circular-Shift")
disp(y)

z1 = fft(y)
z2 = fft(x)

z1_r = real(z1)
z1_i = imag(z1)

z2_r = real(z2)
z2_i = imag(z2)

subplot(221)
plot2d3(z1_r)
title("Z1 Real")
xlabel("index")
ylabel("Amplitude")

subplot(222)
plot2d3(z1_i)
title("Z1 Imaginary")
xlabel("index")
ylabel("Amplitude")

subplot(223)
plot2d3(z2_r)
title("Z2 Real")
xlabel("index")
ylabel("Amplitude")

subplot(224)
plot2d3(z2_i)
title("Z2 Imaginary")
xlabel("index")
ylabel("Amplitude")

