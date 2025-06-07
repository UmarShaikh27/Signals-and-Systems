clc
clear all
close all

f0=2; %fundamental frequency of the signal
dur=1; %signal duration
T0=1/f0; %time period of signal
stepsize=0.01;
t=0:stepsize:dur; %time vector
xx=sin(2*pi*f0*t);
samplingfreq=  [1 5 8 17]; %%different sampling frequencies to be used


for i = [1 2 3 4]
    fs = samplingfreq(i);
    Ts=1/fs; %samping time
    [x,tt]=sampled(f0,fs,dur);
    subplot(4,1,i)
    plot(t,xx,'m','Linewidth',2) %plotting the original signal
    hold on
    plot(tt,x,'r--o','Linewidth',2) %plotting the sampled signal
    title('Sampling at fd=',fs/f0);
    xlabel('Time(s)')
    ylabel('Amplitude')
end

%% TASK 03

clc
clear all
close all
warning off
Fs=44100;  %Sampling frequency in hertz e.g 1000Hz
ch=1;  %Number of channels--2 options--1 (mono) or 2 (stereo)
datatype='uint8';
nbits=16;   %8,16,or 24
Nseconds=5;
% to record audio data from an input device such as a microphone
recorder=audiorecorder(Fs,nbits,ch);
disp('Start speaking..')
%Records audio to audiorecorder, holds control until recording completes
recordblocking(recorder,Nseconds);
disp('End of Recording.');
%Stores recorded audio signal in numeric array
x=getaudiodata(recorder,datatype);
%Write audio file
i=1;
audiowrite('test44100.wav',x,Fs);


%% TASK 04 (1)

clc
clear all
close all

f0 = 1000;
fs = 8000;
t=0:1/fs:3;

xt= sin(2*pi*f0*t); %sin wave
% soundsc(xt) 
figure
plot(xt(1:200), 'LineWidth',2 ); %plotting first 200 samples
title("Sine tone");
xlabel("time");
ylabel("Amplitude");
%% TASK 04 (2)
clc
clear all
close all

toneFreq = [1000 9000 17000 25000];
fs = 8000;
t=0:1/fs:3;

figure
for i = [1 2 3 4]
    f0 = toneFreq(i);
    xt= sin(2*pi*f0*t); %sin wave
    soundsc(xt) 
    subplot(4,1,i)
    plot(xt(1:200), 'LineWidth',2 ); %plotting first 200 samples
    title("Sine tone");
    xlabel("time");
    ylabel("Amplitude");
end

%% Task 5 (1)
 
clc
clear all
close all

f0 = 10;
fs = 1000;
t=0:1/fs:3;

xt= sin(2*pi*f0*t); %sin wave
figure
plot(xt(1:200), 'LineWidth',2 ); %plotting first 200 samples
title("Sine wave fs= 1000 Hz");
xlabel("time");
ylabel("Amplitude");

%% Task 5 (2)

clc
clear all
close all

f0 = 10;
figure
samplingfreq = [100 10 20 1000]; %original signal, fs<2f0,fs=2f0 and fs>2fo
for i = [1 2 3 4]
    fs = samplingfreq(i);
    t=0:1/fs:3;
    xt= sin(2*pi*f0*t); %sin wave
    subplot(4,1,i)
    plot(xt, 'LineWidth',2 ); %plotting first 200 samples
    title("Sine wave fs=" , fs);
    xlabel("time");
    ylabel("Amplitude");
end




