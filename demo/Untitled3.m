clc;clear all;
close all;
SNR=20;
ts=1;
fd=0;
tau=0;
pdb=[0.4 0.6 0.8 1 0.9 0.7 ];
signalinput=round(rand(1,12));
Modulated_Sequence=qammod(signalinput,16);
signaloutput_1=awgn(Modulated_Sequence,SNR);
chan = rayleighchan(ts,fd,tau,pdb);
%chan = [0.6,0.8,1,0.8,0.6];
signaloutput_2 = filter(chan,Modulated_Sequence);

N=5;
C=force_zero(filter(chan,ones(1,2*N+1)),N);
demod_out_1=qamdemod(signaloutput_1,16);
demod_out_2=qamdemod(signaloutput_2,16);
y=conv(demod_out_2,C);