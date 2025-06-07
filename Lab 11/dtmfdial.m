function[xx] = dtmfdial(keyNames,fs)
%DTMFDIAL Create a signal vector of tones which will dial
% a DTMF (Touch Tone) telephone system.
% usage: xx = dtmfdial(keyNames,fs)
% keyNames = vector of characters containing valid key names
% fs = sampling frequency

xx=[]; %%signal vector that is the concatenation of DTMF tones.
dtmf.keys = ...
['1','2','3','A';
'4','5','6','B';
'7','8','9','C';
'*','0','#','D'];
dtmf.colTones = ones(4,1)*[1209,1336,1477,1633];
dtmf.rowTones = [697;770;852;941]*ones(1,4);
%This is an incomplete function
%----Write your code here----
dur=0.2; %duration of each tone
for i = 1:length(keyNames)
    key = keyNames(i);  %extract one key from the keys vector
    xx = [xx,zeros(1,500)]; %add silence
    [row,col] = find(key==dtmf.keys); %find row and column indices
    f1 = dtmf.colTones(row,col); %get column frequency
    f2 = dtmf.rowTones(row,col); %get row frequency 
    t=0:1/fs:dur; %time vector
    sumSignal = cos(2*pi*f1*t)+cos(2*pi*f2*t); %signal
    xx = [xx, sumSignal]; %concatenating the signal with our main signal
end