clc
clear
x1 = [1 4 3]
x2 = [1 2 3 2 5]

m = length(x1)
n = length(x2)

if m>n then                     //padding given two arrays for making same length
    x2 = [x2 zeros(1,(m-n))]
elseif m<n then
    x1 = [zeros(1,(n-m)) x1]
else
    disp("no padding")
end

s = x1 + x2             //sample-1

m = x1.*x2             //sample-1

y = 2*x1 + 3*x2     //mod-1

subplot(311)
plot2d3(s)
title("x1 + x2")
xlabel("time")
ylabel("amplitude")

subplot(312)
plot2d3(m)
title("x1 * x2")
xlabel("time")
ylabel("amplitude")

subplot(313)
plot2d3(y)
title("2*x1 + 3*x2")
xlabel("time")
ylabel("amplitude")
