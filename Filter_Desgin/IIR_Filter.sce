clc;
clear;
clf();
//--------------------eqiir-function------------------------
ftype_1='hp';   //low/high/band -pass selection
approx_1='butt'; //chebyshev/butterworth/elliptic selection
approx_2='cheb1'; //chebyshev/butterworth/elliptic selection
approx_3='cheb2'; //chebyshev/butterworth/elliptic selection
approx_4='ellip'; //chebyshev/butterworth/elliptic selection

om=[0.3 0.5];   // cutoff FREQUENCIES
deltap=0.1;
deltas=0.4;
//-----------IIR digital filter----------
//--------High pass--------
//-------Butterworth----- 
[cells,fact,zzeros,zpoles] = eqiir(ftype_1,approx_1,om,deltap,deltas);
hz=fact*prod(cells.num)./prod(cells.den);
[hzm,fr]=frmag(hz,256);             //separating magnitude & frequency
S=zpk(zzeros,zpoles,1,'d');         //transfer function in zero-pole-gain form
//---------

subplot(411);
plot(fr,hzm,"m");   //mag. vs. frequency response
legend("High pass-butterworth")
xlabel("Freqeuncy")
ylabel("Magnitude")
mtlb_grid on;

//subplot(212);
//plzr(S);        //pole-zero-plot
//---------------------

//-------chebyshev-1----- 
[cells,fact,zzeros,zpoles] = eqiir(ftype_1,approx_2,om,deltap,deltas);
hz=fact*prod(cells.num)./prod(cells.den);
[hzm,fr]=frmag(hz,256);             //separating magnitude & frequency
S=zpk(zzeros,zpoles,1,'d');         //transfer function in zero-pole-gain form
//---------

subplot(412);
plot(fr,hzm);   //mag. vs. frequency response
legend("High pass-chebyshev-1")
xlabel("Freqeuncy")
ylabel("Magnitude")
mtlb_grid on;

//subplot(212);
//plzr(S);        //pole-zero-plot
//---------------------

//-------chebyshev-2----- 
[cells,fact,zzeros,zpoles] = eqiir(ftype_1,approx_3,om,deltap,deltas);
hz=fact*prod(cells.num)./prod(cells.den);
[hzm,fr]=frmag(hz,256);             //separating magnitude & frequency
S=zpk(zzeros,zpoles,1,'d');         //transfer function in zero-pole-gain form
//---------

subplot(413);
plot(fr,hzm,"m");   //mag. vs. frequency response
legend("High pass-chebyshev-2")
xlabel("Freqeuncy")
ylabel("Magnitude")
mtlb_grid on;

//subplot(212);
//plzr(S);        //pole-zero-plot
//---------------------

//-------elliptical----- 
[cells,fact,zzeros,zpoles] = eqiir(ftype_1,approx_4,om,deltap,deltas);
hz=fact*prod(cells.num)./prod(cells.den);
[hzm,fr]=frmag(hz,256);             //separating magnitude & frequency
S=zpk(zzeros,zpoles,1,'d');         //transfer function in zero-pole-gain form
//---------

subplot(414);
plot(fr,hzm,"r");   //mag. vs. frequency response
legend("High pass-Elliptical")
xlabel("Freqeuncy")
ylabel("Magnitude")
mtlb_grid on;

//subplot(212);
//plzr(S);        //pole-zero-plot
//---------------------
