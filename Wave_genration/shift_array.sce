clc
clear
x = [8 3 4 2 5]    //sequence
N = length(x)

d = input("delay ")

t = 1:N 

if d >0 then
    t_d = 1:N+d
    x_d = [zeros(1,d) x]
else
    t_d = d+1:N
    x_d = [x zeros(1,abs(d))]
end

subplot(211)
a = gca()
a.data_bounds = [-10,0;10,max(x)+1];
plot2d3(t,x)
title("original")
xlabel("time")
ylabel("amplitude")

subplot(212)
a = gca()
a.data_bounds = [-10,0;10,max(x)+1];
plot2d3(t_d,x_d)
title("delayed")
xlabel("time")
ylabel("amplitude")
