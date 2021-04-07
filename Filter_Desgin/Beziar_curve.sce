clc
clear

function [out] = Beziar(x,t)
    d = length(x)-1
    out = 0
    for i=1:length(x)
        c = factorial(d)/(factorial(i-1)*factorial(d-i+1))
        //disp(c(i))
        Blend = c*(t^(i-1)).*((1-t)^(d-(i-1)))
        out = out + x(i).*Blend
    end
endfunction

t = 0:0.01:1
x =squarewave(10*t) 
//x = [0 10 0 2 4 3 ]

curve = Beziar(x,t)

/*
i = 1
a= 1
for p=10:-1:1
    curve = Beziar(x(1:length(x)/p),t)
    a = a.*curve
end*/

//x = [0 10 0 10 0 10 -10 ]
//plot(Y,X)


plot(x)
plot(curve,'r')
replot([-1 1;])
