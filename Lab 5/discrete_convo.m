function [yn]=discrete_convo(xn,hm,n,m)



% hm = [1, 2, -1];
% m=3;
% xn = [4,1,2,5];
% n = 4;


%flip hm and make size of the arrays same
hm = flip(hm);
while n<m 
    xn = [xn 0];
    n=n+1;
end

while m<n 
    hm = [hm 0];
    m=m+1;
end




yn = [];  %resultant matrix
sizeyn = 0; %size of resultant(initially set to 0)

%copy matrices to be later used in left loop
lxn = xn
ln = n
lhm=hm
lm=m

% right loop
for i = 0:n
    %sum of the inner product of the two matrices
    val = sum(xn.*hm); 
    yn = [yn val]; %append the resultant
    sizeyn = sizeyn+1;
    hm = [0 hm];
    m= m+1;
    xn = [xn 0];
    n=n+1;
end


% left loop
for i = 0: lm-2
    %append 0s too shift left hm
    lhm = [lhm 0]
    lm= lm+1;
    lxn = [0 lxn]
    ln=ln+1;

    %sum of the inner product of the two matrices
    val = sum(lxn.*lhm);
    yn = [val yn]; %append the resultant
    sizeyn = sizeyn+1; %increase the size
    
end
yn
