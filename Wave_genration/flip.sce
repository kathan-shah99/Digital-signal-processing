clc
clear
//flipping of given sequence
x = [4 3 2 1];
//y = []
//N = length(x)

x_in = [zeros(1) x zeros(1)]
N = length(x_in)

n = 1:1:N
a = N
for i=1:N
    y(i) = x_in(a)
    a = a - 1
end

subplot(211)
plot2d3(n,x_in)
title("original")
xlabel("time")
ylabel("amplitude")


subplot(212)
plot2d3(n,y)
title("flipped")
xlabel("time")
ylabel("amplitude")

