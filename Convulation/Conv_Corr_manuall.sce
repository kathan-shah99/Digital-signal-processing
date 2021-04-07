clc
clear
function [co] = convulation(x,h)
    lx = length(x)
    lh = length(h)
    x_ori = x
    h_ori = h
    if lx > lh then
        h = [h zeros(1,lx-lh)]
    else
        x = [x zeros(1,lh-lx)]
    end
    
    N = length(h)
    j = N
    for i=1:length(h)
        c(i) = h(j)
        j = j-1
    end
    c = c'
    
    for i=1:(2*N)-1
        if i <= N then
            q1 = [c zeros(1,N-i)]
            q2 = [zeros(1,N-i) x]
        else
            q1 = [x zeros(1,i-N)]
            q2 = [zeros(1,i-N) c]
        end
        out = 0
    
        for j=1:length(q1)
            out = out + q1(j)*q2(j)
        end
     
        //out = sum(h.*x)
        co(i) = out
    end
    co = co(1:((2*N-1)-abs(lx-lh)))       //convulation
    //disp(conv(x_ori,h_ori))
    co = co'
endfunction
 
function [co] = correlation(x,h)
    lx = length(x)
    lh = length(h)
    x_ori = x
    h_ori = h
    if lx > lh then
        h = [h zeros(1,lx-lh)]
    else
        x = [x zeros(1,lh-lx)]
    end
    c = h
    N = length(h)
    for i=1:(2*N)-1
        if i <= N then
            q1 = [c zeros(1,N-i)]
            q2 = [zeros(1,N-i) x]
        else
            q1 = [x zeros(1,i-N)]
            q2 = [zeros(1,i-N) c]
        end
        out = 0
    
        for j=1:length(q1)
            out = out + q1(j)*q2(j)
        end
     
        //out = sum(h.*x)
        co(i) = out
    end
    
    if lh > lx then
        co = co(1:((2*N)-(lh-lx)))            //backward padding removal--correlation
    elseif lh < lx then
        co = co(abs(lx-lh):length(co))        //forward padding removal---correltion
    else
        co = co
    end
    co = co'  
    //disp(xcorr(x_ori,h_ori))
    endfunction


x1 = [1 2 3 4 5]
x2 = [1 2 4 5 7]
h = [1 1 1 1 5]

//--------convualtion-------------
y_conv = convulation(x1,h)

disp("manually convulation")
disp(y_conv)

disp("in-buit convulation")
disp(conv(x1,h))

//--------correlation--------------
y_corr = correlation(x1,x2)

disp("manually correlation")
disp(y_corr)

disp("in-buit correlation")
disp(xcorr(x1,x2))
