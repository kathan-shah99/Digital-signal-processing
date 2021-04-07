//---Author :Kathan-shah-----

clc
clear

a = [1 2 3 4 5]

//------------------------Manual-FFT----------- 
function [final]=FFT(x)
N = length(x)

for k=0:N-1
    y = 0
    for j=0:N-1
        y = y  + (x(j+1)*(exp(((-2*%i*%pi)*(k*j))/N)))
    end
    final(k+1) = y'
end
endfunction

disp(inc)
DFT = FFT(a)
disp("Manually FFT")
disp(DFT')

disp("In-built FFT")
disp(fft(a))






