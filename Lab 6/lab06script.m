%%TASK 01
clc
clear all
close all
%Read image, visualize it, and display its size and class.

I = imread("flower.jpg");
% Convert to double precision
I = im2double(I);
% Display
figure,
imshow(I)
whos I

% Split the image into the 3 component color intensity planes or matrices.
[R, G, B] = imsplit(I);
whos R

% Create a 2-D convolution filter or kernel for averaging or smoothing
W = 5;
h = ones(W)./W.^2

%Convolve R with h to blur the image
Ravg = conv2(R,h,"same");
% Convolve G with h to blur the image
Gavg =  conv2(G,h,"same");
% Convolve B with h to blur the image
Bavg = conv2(B,h,"same");

% Concatenate the three matrices to put together the color image
Iavg = cat(3,Ravg,Gavg,Bavg);
whos Iavg
figure
imshow(Iavg,[])

%% Task02

clc
clear all

%generating impulse response by sutracting two impulses
n=0:0.1:50;
unitstep1 = n==0;
unitstep2 = n==1;
hn = unitstep1 - unitstep2; %impulse response

%input signal
xn = double((sin(0.5*n)+0.2)< 0);

%covolving the input with impulse response
yn = conv(hn,xn);
%plotting the input and output
subplot 211
stem(xn)
xlabel('n')
ylabel('xn')
subplot 212
stem(yn)
xlabel('n')
ylabel('yn')

%% TASK03

clc
close all
clear all

%generating impulse response of first difference by sutracting two impulses
n=0:1:5;
unitstep1 = n==0;
unitstep2 = n==1;
hn = unitstep1 - unitstep2; %impulse response
%load the image
load("echart.mat");
%display all the columns of rows 1 till 65
imshow(echart(1:65,:))


%extract row 65
xn = echart(65,:);

%convolution
yn = conv(hn,xn);
size(yn)

%plotting the input and output
subplot 211
stem(yn)
xlabel('n')
ylabel('xn')
subplot 212
stem(yn)
xlabel('n')
ylabel('yn')

%% TASK04

clc 
clear all
close all

%generating impulse response of first difference by sutracting two impulses
n=0:1:5;
unitstep1 = n==0;
unitstep2 = n==1;
hn = unitstep1 - unitstep2; %impulse response


%read the barcode image
I = imread("HP110v3.png");
% figure
% imshow(I);


%extract one row
xn = I(65,:);

%convolution
yn = conv(hn,xn);

%plot of xn and yn together in continuous
% subplot 211
% plot(yn)
% ylabel('yn')
% subplot 212
% plot(xn)
% ylabel('yn')

%plotting the xn and yn in discrete
% figure,
% subplot 211
% stem(xn)
% xlabel('n')
% ylabel('xn')
% subplot 212
% stem(yn)
% xlabel('n')
% ylabel('yn')

thresh = 150; %threshold value
dn = (abs(yn) >= thresh); 

%plot of dn and yn together
figure,
subplot 211
stem(dn)
xlabel('n')
title('dn')
subplot 212
stem(yn)
xlabel('n')
title('yn')

location = find(dn); %locations of nonzeros
delta = diff(location);

%% task 5


clc

%width estimation
exp_bars = 59;
width = 95*exp_bars;
theta = width/sum(delta)

fixed_delta = round(delta / theta);

% obtaining 59 bars
start_index = 4 % Adjust this value based on observation
end_index = start_index + exp_bars - 1

% Check if the indices are within the valid range
if end_index > length(fixed_delta)
 end_index = length(fixed_delta);
end

% appropriate section of fixed_delta
delta_section = fixed_delta(start_index:end_index);

% using UPC function
decoded_barcode = decodeUPC(delta_section);
disp(decoded_barcode);

