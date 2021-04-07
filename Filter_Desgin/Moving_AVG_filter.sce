clc
clear

function[value] = AVG(x)
    sum = 0
    for i=1:length(x)
        sum = sum + x(i)
    end
    value = sum/length(x)
endfunction

f = 3
t = 0:0.001:1
arr = rand(1,length(t))  + sin(2*%pi*f*t)

window = 100

//-------------------------moving average filter------------
for i=1:length(arr)
    if i >= length(arr)-window
        window = window - 1
    end
    signal(i) = AVG(arr(i:i+window))
    //disp(i)
end


//subplot(211)
plot(t,arr)
plot(t,signal,'r')
title("Noisy Data")
xlabel("Time")
ylabel("Magnitude")




    
    

