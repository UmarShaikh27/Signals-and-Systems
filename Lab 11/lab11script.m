%TASK 01
clc
clear all
close all
fs = 8000;
% ftable = [1;2;3;4;5]*[80,110];
% fs = 8000; xx = [ ];
% keys = rem(3:12,10) + 1;
% for ii = 1:length(keys)
%     kk = keys(ii);
%     xx = [xx,zeros(1,400)];
%     krow = ceil(kk/2);
%     kcol = rem(kk-1,2) + 1;
%     dur=0.15;
%     t=0:1/fs:dur;
%     xx = [xx, cos(2*pi*ftable(krow,kcol)*t)];
% end
%soundsc(xx,fs);

%xx = dtmfdial(['1','2','3','4','A'],8000);
%soundsc(xx,fs);

fb = 852;  
L = 40; 
fs = 8000;
B=maxbeta(L,fb,fs)

dtmfdesign([697,770,852,941,1209,1336,1477,1633], 150, fs)

%% dtmfrun check

clc;
clear;
close all;

fs = 8000;
tk = ['A','B','C','D','*','#','0','1','2','3','4','5','6','7','8','9'];
xx = dtmfdial( tk, fs );
soundsc(xx, fs)
L = 150; %¡--use your value of L
dtmfrun(xx, L, fs)
