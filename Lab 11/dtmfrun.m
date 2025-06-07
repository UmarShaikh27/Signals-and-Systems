function keys = dtmfrun(xx, L, fs)
% DTMFRUN
% keys = dtmfrun(xx, L, fs)
% returns the list of key names found in xx.
% keys = array of characters, i.e., the decoded key names
% xx = DTMF waveform
% L = filter length
% fs = sampling freq
% DTMF tone matrix
dtmf.keys = ['1','2','3','A';
 '4','5','6','B';
 '7','8','9','C';
 '*','0','#','D'];
dtmf.colTones = ones(4,1)*[1209, 1336, 1477, 1633];
dtmf.rowTones = [697; 770; 852; 941] * ones(1,4);

center_freqs = [697, 770, 852, 941, 1209, 1336, 1477, 1633]; % Center frequencies for the bandpass filters

des = dtmfdesign([697 770 852 941 1209 1336 1477 1633], L, fs); % Generating the filter coefficients using dtmfdesign function

[nstart, nstop] = dtmfcut(xx, fs); % Finding the start and stop indices of DTMF signals in the waveform

keyList = [];

for kk = 1:length(nstart)
     x_seg = xx(nstart(kk):nstop(kk)); % Extracting a segment of the DTMF waveform
     scores = zeros(8, 1); % Initializing an array to hold the scores of each filter response
     % Calculating the score for each filter response
     for ii = 1:8
         arr=des(:,ii);
        scores(ii) = dtmfscore(x_seg, arr);
     end
     
     row_indices = find(scores(1:4) == 1); % Finding the row indices corresponding to detected row tones
     col_indices = find(scores(5:8) == 1); % Finding the column indices corresponding to detected column tones
 
    if length(row_indices) == 1 && length(col_indices) == 1 % If both row and column tones are detected uniquely
        row_index = row_indices; % Assigning the detected row index
        col_index = col_indices; % Assigning the detected column index
        
        key = dtmf.keys(row_index, col_index); % Finding the key corresponding to the detected row and column
        keyList = [keyList, key] % Appending the detected key to the list of keys
    end
end
end