clc;
clear;
//---------------wfir-Function----------
forder=11;              //order of filter
fcutoff=[0.10 0.30];    //cutoff frequencies
wintype="hn";           //window type: kaiser/hamming/hann
wintype2="hm"
wintype3="kr"
//-------FIR filter design---------

//-----Hanning window--------
ftype="bp";             //filter type: bandpass
[h,hm,fr]=wfir(ftype,forder,fcutoff,wintype,[0 0]);

ftype="lp";            //filter type: lowpass
[h2,hm2,fr2]=wfir(ftype,forder,fcutoff,wintype,[0 0]);

ftype="hp";             //filter type: highpass
[h3,hm3,fr3]=wfir(ftype,forder,fcutoff,wintype,[0 0]);

//--------Plotting Response--------

subplot(311);
plot(fr,hm,"r");

subplot(312);
plot(fr2,hm2,'r');

subplot(313);
plot(fr3,hm3,'r');

//-----Hamming window--------
ftype="bp";             //filter type: bandpass
[h,hm,fr]=wfir(ftype,forder,fcutoff,wintype2,[0 0]);

ftype="lp";            //filter type: lowpass
[h2,hm2,fr2]=wfir(ftype,forder,fcutoff,wintype2,[0 0]);

ftype="hp";             //filter type: highpass
[h3,hm3,fr3]=wfir(ftype,forder,fcutoff,wintype2,[0 0]);

//----Plotting Response------
subplot(311);
plot(fr,hm,"g");

subplot(312);
plot(fr2,hm2,'g');

subplot(313);
plot(fr3,hm3,'g');

//-----triangualr window--------
ftype="bp";             //filter type: bandpass
[h,hm,fr]=wfir(ftype,forder,fcutoff,wintype3,[0 0]);

ftype="lp";            //filter type: lowpass
[h2,hm2,fr2]=wfir(ftype,forder,fcutoff,wintype3,[0 0]);

ftype="hp";             //filter type: highpass
[h3,hm3,fr3]=wfir(ftype,forder,fcutoff,wintype3,[0 0]);

//----Plotting Response------
subplot(311);
plot(fr,hm,"m");
mtlb_grid on;
legend(["Hanning", "Hamming", "Kesiar"]);
title("FIR Bandpass filter");
xlabel("Frequency (Hz)")
ylabel("Gain")

subplot(312);
plot(fr2,hm2,'m');
mtlb_grid on;
legend(["Hanning", "Hamming", "Kesiar"]);
title("FIR Low Pass filter");
xlabel("Frequency (Hz)")
ylabel("Gain")

subplot(313);
plot(fr3,hm3,'m');
mtlb_grid on;
legend(["Hanning", "Hamming", "Kesiar"]);
title("FIR High Pass filter");
xlabel("Frequency (Hz)")
ylabel("Gain")
