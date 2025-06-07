function[B] = maxbeta(L,fb,fs)

n = 0:L-1;
yn = cos(2*pi*fb*n/fs);
t = 0:(pi/L):pi;
H = freqz(yn,1,t);
maxH = max(abs(H));
B = 1 / maxH;
