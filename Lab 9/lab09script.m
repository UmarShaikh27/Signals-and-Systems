%TASK 01
clc
clear all
close all

yn = [0.25,0.25,0.25,0.25];
t = -pi:(pi/100):pi; %frequency vector
H = freqz(yn,1,t);
subplot(2,1,1);
plot(t,abs(H)), grid on
ylabel('Magnitude')
subplot(2,1,2);
plot(t,angle(H)), grid on
ylabel('Phase')
xlabel('Normalized Radian Frequency')


%TASK 01(b)
figure
for i=4 :+4 : 16
    yn = ones(i,1);
    yn = yn.*(1/i);
    H = freqz(yn,1,t);
    subplot(4,1,i/4);
    plot(t,abs(H)), grid on
    title('N = ',i);
end
 xlabel('Normalized Radian Frequency')


 %% TASK 02(a)

clc
clear all
close all

W = 0.44*pi;
L=10;
n=0:L-1;
yn = (2/L).*(cos(W.*n));
t = -pi:(pi/100):pi;

H = freqz(yn,1,t);
figure
subplot(2,1,1);
plot(t,abs(H)), grid on
title('Band Pass filter L= 10')
ylabel('Magnitude')
subplot(2,1,2);
plot(t,angle(H)), grid on
xlabel('Normalized Radian Frequency')
ylabel('Phase')


%% TASK 02(b)
clc
clear all
close all

W = 0.44*pi;
t = -pi:(pi/100):pi; %frequency vector

for L=20 :+20 : 40
    %plotting freq response for L=20 and 40
    n=0:L-1;
    yn = (2/L).*(cos(W.*n));
    H = freqz(yn,1,t);
    figure
    subplot(2,1,1);
    plot(t,abs(H)), grid on
    title(['Magnitude response L=' num2str(L)])
    subplot(2,1,2);
    plot(t,angle(H)), grid on
    title(['Phase Response L=' num2str(L)])
    xlabel('Normalized Radian Frequency')

    %determining width of passband filters
    Hmax = max(abs(H));
    pbwVector = find(abs(H)./Hmax > 0.707); %vector satisfying given conditions
    L
    passBandWidth = t(pbwVector(end)) - t(pbwVector(1)) %passband width

end

%% TASK 02(c)
clc
clear all
close all

Wlow = 0.3*pi; %lowest frequency
Whigh = 0.7*pi; %highest frequency
w = 0.44*pi ;
t = -pi:(pi/100):pi; %frequency vector
L=1; %initially
n = 0:L-1;
yn = (2/L).*(cos(w.*n)); %frequency response
H= freqz(yn,1,t);

Hmax = max(abs(H));
vect = find( abs(t)<= Wlow | (abs(t) >= Whigh & abs(w) <= pi) ); %vector of indexes satisfying the given condition for allowed frequencies

%increasing value of L and checking the given condition until it is met
while true
    if( all(abs(10*H(vect))<=Hmax) ) %stop when the condition is met
        break
    end
    %repeating all above steps for the next value of N
    L=L+1;
    n = 0:L-1;
    yn = (2/L).*(cos(w.*n)); %frequency response
    H = freqz(yn,1,t);
    Hmax = max(abs(H));
    vect = find( abs(t)<= Wlow | (abs(t) >= Whigh & abs(w) <= pi) ); 
end
L


% TASK 02(d)


w= 0.44*pi;
L=37;
n=0:L-1;
t = -pi:(pi/100):pi; %frequency vector

h = (2/L).*(cos(w.*n)); %frequency response
xn = 10*cos(0.3*pi*n) + 40*cos(0.44*pi*n - pi/3) + 20*cos(0.7*pi*n - pi/4); %input signal

yn= conv(xn,h); %output

figure
subplot 211
plot(xn)
title('Original Signal')
grid on

subplot 212
plot(yn)
title('Filtered')
xlabel('Samples')
grid on
   
%FFT
fs = 2*pi; % sampling frequency
t = 0:(1/fs):(10-1/fs); % time vector
S= yn; %output acquired in step 1
n = length(S);
X = fft(S) ;
Y = fftshift(X);
fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
figure
plot(fshift,abs(Y)/n)
title('FFT of output signal yn')
ylabel('Magnitude')
xlabel('Frequency')