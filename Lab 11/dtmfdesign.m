function result = dtmfdesign(fb, L, fs)
result = [];
n = 0:L-1;
for i = fb
 hn = cos(2*pi*i*n/fs);
 B = maxbeta(L,i,fs); 
 t = 0:(pi/L):pi;
 hn = hn*B; 
 fz = freqz(hn, 1, t);
 result = [result; hn];
end
result = transpose(result);
end