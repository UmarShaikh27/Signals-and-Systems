function sc = dtmfscore(xx, hh)
% DTMFSCORE

xx = xx * (2 / max(abs(xx))); %normalization
filteredOutput = conv(xx,hh); %filteration
max_amplitude = max(abs(filteredOutput));
if max_amplitude >= 0.59
    sc = 1; % Score = 1 if max amplitude >=  0.59 (59% level)
else
 % else score =0
    sc = 0; 
end
% Plotting
plot(filteredOutput(1:300)); 
end
