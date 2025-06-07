%% Task 03
clc 
clear all
close all
n = -20:0.1:20;
zn = (sin(0.3142.*n));
noise =  0.1*randn(size(n));
xn = zn + noise;
y1 = movmean(xn,5);

a = 0.001;
impulse = (1./(a*sqrt(pi))).*exp((-1.*(n.^2))./(a ^ 2));
impulse=impulse/(max(impulse));
hn = movmean(impulse,5);

y2 = conv(xn,hn);
Lengthy2 = length(y1) + length(hn) - 1;
y2n = -(Lengthy2-1)/2 : (Lengthy2-1)/2;

length(y2)
length(n)

subplot 411 
plot(n,xn)
title('xn')

subplot 412
plot(n,hn)
title('hn')

subplot 413
plot(n,y1)
title('y1')

subplot 414
plot(y2n,y2)
title('y2')

%% Task 05
clc
clear all
close all

[h,Fh] = audioread("1st_baptist_nashville_balcony.wav");
disp(size(h));

% soundsc(h,Fh)
% pause(length(h)/Fh)

[x,Fx] = audioread("ringtone.wav")
disp(size(x));
% soundsc(x,Fx)
% pause(length(x)/Fx)

%Extracting the first and second channel from the audio
%in simple words h1 will have all rows of first column and h2 will have all
%rows of second column
h1 = h(:,1);
h2 = h(:,2); 

y1 = conv(h1,x);
y2 = conv(h2,x);
y = [y1,y2];
% soundsc(y,Fx)
% pause(length(y)/Fx)

subplot 311
plot(h)
title('hn')

subplot 312
plot(x)
title('xn')

subplot 313
plot(y)
title('yn')


%% Task 06 postlab

clc 
clear all 
close all
hm = [1, 2, -1];
m=3;
xn = [4,1,2,5];
n = 4;

yn = discrete_convo(xn,hm,n,m)

