//---Author :krutarth-Trivedi-----
clc;
clear;

//----------------Multiplication--&--Additon----- DFT ----------------

input=[4 6 3 2 5];  //test signal
N=length(input);    //length of iterations of k & n

add=0;        //additions in dft algorithm
mul=0;       //multiplications in dft algorithm

for k=1:N do
    out(1,k)=0;
    for n=1:N do
        out(1,k) = out(1,k)+ input(n)*exp((-%i*2*%pi*(k-1)*(n-1))/N);
        add = add + 1;
        mul = mul + 1;
    end
    add=add-1;      //complex additions only to count
end

disp("Additions in DFT : " +string(add));
disp("Multiplications in DFT : " +string(mul));
