clc
clear
//DTMF for Phone

function [f1,f2] = DTMF_encoder(x)
    
    ro_f1=[700 770 850 940];  
    co_f1=[1220 1350 1490];
    
    select x
    case 1 then
        f1 = ro_f1(1)
        f2 = co_f1(1)
    case 2 then
        f1 = ro_f1(1)
        f2 = co_f1(2)
    case 3 then
        f1 = ro_f1(1)
        f2 = co_f1(3)
    case 4 then
        f1 = ro_f1(2)
        f2 = co_f1(1)
    case 5 then
        f1 = ro_f1(2)
        f2 = co_f1(2)
    case 6 then
        f1 = ro_f1(2)
        f2 = co_f1(3)
    case 7 then
        f1 = ro_f1(3)
        f2 = co_f1(1)
    case 8 then
        f1 = ro_f1(3)
        f2 = co_f1(2)
    case 9 then
        f1 = ro_f1(3)
        f2 = co_f1(3)
    case 0 then
        f1 = ro_f1(4)
        f2 = co_f1(2)
    else
        disp(" Error - ---Enter Valid Number btw (0-9)")
        f1 = 0
    end
endfunction

function [x] = DTMF_decoder(f1,f2)
    
    tol = 5
    if (((f1 > 940-tol)&&(f1 < 940+tol))&&((f2 > 1350-tol)&&(f2<1350+tol)))
        x = 0
    elseif(((f1 > 700-tol)&&(f1 < 700+tol))&&((f2 > 1220-tol)&&(f2<1220+tol)))
        x = 1
    elseif(((f1 > 700-tol)&&(f1 < 700+tol))&&((f2 > 1350-tol)&&(f2<1350+tol)))
        x = 2
    elseif (((f1 > 700-tol)&&(f1 < 700+tol))&&((f2 > 1490-tol)&&(f2<1490+tol)))
        x = 3
    elseif (((f1 > 770-tol)&&(f1 < 770+tol))&&((f2 > 1220-tol)&&(f2<1220+tol)))
        x = 4
    elseif(((f1 > 770-tol)&&(f1 < 770+tol))&&((f2 > 1350-tol)&&(f2<1350+tol)))
        x = 5
    elseif (((f1 > 770-tol)&&(f1 < 770+tol))&&((f2 > 1490-tol)&&(f2<1490+tol)))
        x = 6
    elseif (((f1 > 850-tol)&&(f1 < 850+tol))&&((f2 > 1220-tol)&&(f2<1220+tol)))
        x = 7
    elseif(((f1 > 850-tol)&&(f1 < 850+tol))&&((f2 > 1350-tol)&&(f2<1350+tol)))
        x = 8
    elseif(((f1 > 850-tol)&&(f1 < 850+tol))&&((f2 > 1490-tol)&&(f2<1490+tol)))
        x = 9
    else
        x = 12
    end
endfunction

x = input("enter Phone Number---> ")
sr =1
fs = 8000
N = 1:fs/2
temp = []
//f = sr*(0:(length(N)/2))/length(N)      //K*fs/N
//disp("Before Decoding")
for i=1:length(x)
    [fr,fc] = DTMF_encoder(x(i))  
    disp(string(x(i))+"--"+string(fr)+"-"+string(fc)) 
    y = 1*(sin(2*3.14*(fr/fs)*N) +sin(2*3.14*(fc/fs)*N))
    temp = [temp y]
end
//plot(temp)
//sound(temp,fs)

k = 1
j = 1

//-------for FFT plot-----------
f = 1:2:(fs/2)
n = length(f)
//--------------------------------

FFT = []
while j<=10
    sep = temp(k:fs*j/2)
    FFT_temp = abs(fft(sep))     //FFT of given Digit 
    FFT(:,j) = FFT_temp          //store in matrix
    //--------------plotting Each digit FFT---------
    subplot(2,5,j)
    q = int(length(FFT_temp)/2)  //for removal of image FFT
    plot(f,FFT(1:q,j)')          //plot FFT of jth digit upto half of length(FFT)
    title(string(x(j)) + " FFT")
    xlabel("Frequency- Hz")
    ylabel("Amp-")         
    k = k + fs/2                //start cut
    j = j + 1                   //end cut fs*j/2
    //-------------------------------------
end

disp("after Decoding")

for i=1:10
    tem = FFT(:,i)
    L = length(tem)/2
    tem = tem(1:L)
   
    fr_id = find(tem == max(tem))      //get Row Frequency
    row_f = f(fr_id)
    //removal of row frequency & its FFT from frequency array & FFT array
    
    //-----fining col frequency--------
    col_tem = tem(fr_id+fs/500:L)           //get col Frequency
    fc = f(fr_id+fs/500:L)
    //figure(1)
    //subplot(2,5,i)
    //plot(fc,col_tem')
    fc_id = find(col_tem == max(col_tem))      //get col Frequency
    col_f = fc(fc_id)
    //disp(string(row_f)+"---"+string(col_f))
    fre(:,i) = [row_f,col_f]
        //-------------------------------------
end

//----------------frequency to digit converter-----------
disp("decoded-digit")
d = 0
for i=1:10
    ff = fre(:,i)
    d(i) = (DTMF_decoder(ff(1),ff(2))) 
end
disp(d')
//plot(fs,abs(fft(temp)))
//sound(temp,fs)
