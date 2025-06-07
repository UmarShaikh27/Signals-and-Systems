%practice

P = 64;
w = 2*pi/P;
n = 0:P-1;
x = cos(10*w*n); %Finite-time signal
hx = fft(x); %Compute the DFT of x
shx = fftshift(hx); %shift on x-axis
stem([-P/2:P/2-1],abs(shx)/P,'k','LineWidth',2); %Compute and plot magnitude of coefficients
%abs(shx) is divided by P not to compute fourier series coefficients but
%because this function increases the amplitude and we have to divide by P
%to normalize it. To compute DTFS, we'll divide by P again

ylabel('Magnitude of DFT');
xlabel('Frequency as multiples of \omega_0');
axis([-P/2 P/2-1 0 inf]);
grid;

%% task01(b)

clc
clear
P = 64;
w = 2*pi/P;
n = 0:P-1;
x = cos(10*w*n) + 0.5*cos(14*w*n); %Finite-time signal
hx = fft(x); %Compute the DFT of x
shiftedx = fftshift(hx); %shift on x-axis
stem([-P/2:P/2-1],abs(shiftedx)/P,'k','LineWidth',2);
ylabel('Magnitude of DFT');
xlabel('Frequency as multiples of \omega_0');
axis([-P/2 P/2-1 0 inf]);
grid;

%% task02

clc
clear all
close all


n = 1000;
fs = 8000;
t = 0:1/fs:n/fs; %t is from 0 to 1/8 since T = n/fs
xn = sin(2*pi*400*t);

hx = fft(xn,n); %Compute the DFT of x but the samples are n=1000 and not 8000
shx = fftshift(hx); %shift on x-axis
fHz = find(shx);
figure
subplot 221
stem([-n/2:n/2-1],abs(shx)/n,'k','LineWidth',2)
ylabel('Magnitude of DFT');
xlabel('Frequency as multiples of \omega_0');
title('frequency 400')
grid;

%frequency = 401
n = 1000;
fs = 8000;
t = 0:1/fs:n/fs; %t is from 0 to 1/8 since T = n/fs
xn = sin(2*pi*401*t);

hx = fft(xn,n); %Compute the DFT of x but the samples are n=1000 and not 8000
shx = fftshift(hx); %shift on x-axis
subplot 222
stem([-n/2:n/2-1],abs(shx)/n,'k','LineWidth',2)
ylabel('Magnitude of DFT');
xlabel('Frequency as multiples of \omega_0');
title('frequency 401')
grid;

%frequency = 402
n = 1000;
fs = 8000;
t = 0:1/fs:n/fs; %t is from 0 to 1/8 since T = n/fs
xn = sin(2*pi*402*t);

hx = fft(xn,n); %Compute the DFT of x 
shx = fftshift(hx); %shift on x-axis
subplot 223
stem([-n/2:n/2-1],abs(shx)/n,'k','LineWidth',2)
ylabel('Magnitude of DFT');
xlabel('Frequency as multiples of \omega_0');
title('frequency 402')
grid;

%frequency = 440
n = 1000;
fs = 8000;
t = 0:1/fs:n/fs; %t is from 0 to 1/8 since T = n/fs
xn = sin(2*pi*440*t);

hx = fft(xn,n); %Compute the DFT of x 
shx = fftshift(hx); %shift on x-axis
subplot 224
stem([-n/2:n/2-1],abs(shx)/n,'k','LineWidth',2)
ylabel('Magnitude of DFT');
xlabel('Frequency as multiples of \omega_0');
title('frequency 440')
grid;
%% task02(f)

close all
clc
clear all
%frequency = 401
figure
for i=1:i+1:4
    n = 1000 + i*1000;
    fs = 8000;
    t = 0:1/fs:n/fs; %t is from 0 to 1/8 since T = n/fs
    xn = sin(2*pi*401*t);
    hx = fft(xn,n); %Compute the DFT of x 
    shx = fftshift(hx); %shift on x-axis
    subplot(2,2,i)
    stem([-n/2:n/2-1],abs(shx)/n,'k','LineWidth',2)
    ylabel('Magnitude of DFT');
    xlabel('Frequency as multiples of \omega_0');
    title('frequency 401 and n =',n)
    grid;
end



%% task02(g)

close all
clc
%frequency = 402 and n=1000
n = 1000;
fs = 8000;
t = 0:1/fs:n/fs; %t is from 0 to 1/8 since T = n/fs
xn = sin(2*pi*402*t);

hx = fft(xn,n); %Compute the DFT of x 
shx = fftshift(hx); %shift on x-axis
figure
subplot 211
stem([-n/2:n/2-1],abs(shx)/n,'k','LineWidth',2)
ylabel('Magnitude of DFT');
xlabel('Frequency as multiples of \omega_0');
title('frequency 401 and n=1000')
grid;

%frequency = 402 and n=4000
n = 5000;
fs = 8000;
t = 0:1/fs:n/fs; %t is from 0 to 1/8 since T = n/fs
xn = sin(2*pi*401*t);

hx = fft(xn,n); %Compute the DFT of x 
shx = fftshift(hx); %shift on x-axis
subplot 212
stem([-n/2:n/2-1],abs(shx)/n,'k','LineWidth',2)
ylabel('Magnitude of DFT');
xlabel('Frequency as multiples of \omega_0');
title('frequency 401 and n=4000')
grid;

%% task03

clc
clear all
close all
n=8000;
fs=8000; 
xn = cos(3000*pi*(0:1/fs:n/fs)); %calculating time period by n/fs = 8k/8k
hx = fft(xn,n); %Compute the DFT of x
shx = fftshift(hx); %shift on x-axis
figure
stem([-n/2:n/2-1],abs(shx)/n,'k','LineWidth',2)
ylabel('Magnitude of DFT');
xlabel('Frequency as multiples of \omega_0');
figure
spectrogram(xn,1024,[],1024,fs,'yaxis');
colorbar
figure
spectrogram(xn,512,[],1024,fs,'yaxis');
colorbar

pn = xn(end:-1:1);
hx = fft(pn,n); %Compute the DFT of x
shx = fftshift(hx); %shift on x-axis
figure
spectrogram(pn,512,[],1024,fs,'yaxis');
colorbar