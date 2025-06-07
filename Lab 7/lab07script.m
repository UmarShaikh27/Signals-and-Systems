% TASK 01

clc
clear all
close all

% Set the dc term "a0"
a0 = 1/3;
% Define number of terms
N = 10;
% Set TFS coefficients.
k = 1:N;
ak = 2*sin(pi*k/3)./(pi*k);

% Create a vector of time instants
t = -2: 1/N/10 :6;

% Set the fundamental frequency.
T0 = 3;
omega = 2*pi/T0;

% Compute an approximation to signal using up to 10-th harmonic.
xtTEN = a0;
for i=1:10
    xtTEN = xtTEN + ak(i)*cos(i*omega*t);
end

% Compute an approximation to signal using up to 20-th harmonic.
k = 1:20;
ak = 2*sin(pi*k/3)./(pi*k);
xtTWENTY = a0;
for i=1:20
    xtTWENTY = xtTWENTY + ak(i)*cos(i*omega*t);
end

% Compute an approximation to signal using up to 50-th harmonic.
k = 1:50;
ak = 2*sin(pi*k/3)./(pi*k);
xtFIFTY = a0;
for i=1:50
    xtFIFTY = xtFIFTY + ak(i)*cos(i*omega*t);
end

% Compute an approximation to signal using up to 100-th harmonic.
k = 1:100;
ak = 2*sin(pi*k/3)./(pi*k);
xtHUNDRED = a0;
for i=1:100
    xtHUNDRED = xtHUNDRED + ak(i)*cos(i*omega*t);
end

% Compute an approximation to signal using up to 150-th harmonic.
k = 1:150;
ak = 2*sin(pi*k/3)./(pi*k);
xtONEFIFTY = a0;
for i=1:100
    xtONEFIFTY = xtONEFIFTY + ak(i)*cos(i*omega*t);
end


% Compute an approximation to signal using up to 200-th harmonic.
k = 1:200;
ak = 2*sin(pi*k/3)./(pi*k);
xtTWOHUNDRED = a0;
for i=1:200
    xtTWOHUNDRED = xtTWOHUNDRED + ak(i)*cos(i*omega*t);
end


% Plot the harmonic approximations
figure;
subplot 321
plot(t, xtTEN, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x10(t)','Fontsize',13)
title([num2str(10) ...
'-harmonic approximation to x(t)']);

subplot 322
plot(t, xtTWENTY, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x20(t)','Fontsize',13)
title([num2str(20) ...
'-harmonic approximation to x(t)']);

subplot 323
plot(t, xtFIFTY, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x50(t)','Fontsize',13)
title([num2str(50) ...
'-harmonic approximation to x(t)']);

subplot 324
plot(t, xtHUNDRED, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x100(t)','Fontsize',13)
title([num2str(100) ...
'-harmonic approximation to x(t)']);

subplot 325
plot(t, xtONEFIFTY, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x150(t)','Fontsize',13)
title([num2str(150) ...
'-harmonic approximation to x(t)']);

subplot 326
plot(t, xtTWOHUNDRED, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x200(t)','Fontsize',13)
title([num2str(200) ...
'-harmonic approximation to x(t)']);

%% TASK 02

clc 
clear all
close all

% Set the dc term "a0"
a0 = 1/3;
% Define number of terms
N = 10;
% Set TFS coefficients.
k = 1:N;
ak = 2*sin(pi*k/3)./(pi*k);

% Create a vector of time instants
t = -2: 1/N/10 :6 ;

% Set the fundamental frequency.
T0 = 3;
omega = 2*pi/T0;


% Compute an approximation to signal using up to 10-th harmonic.
xtTEN = a0;
for i=1:10
    if ak(i) >0
        theta=0;
    else
        theta = pi;
    end
    xtTEN = xtTEN + abs(ak(i))*cos(i*omega*t - theta);
end

% Compute an approximation to signal using up to 200-th harmonic
k = 1:200;
ak = 2*sin(pi*k/3)./(pi*k);
xtTWOHUNDRED = a0;
for i=1:200
    if ak(i) >0
        theta=0;
    else
        theta = pi;
    end
    xtTWOHUNDRED = xtTWOHUNDRED + abs(ak(i))*cos(i*omega*t - theta);
end

%obtaining plots
figure
subplot 211
plot(t, xtTEN, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x10(t)','Fontsize',13)
title([num2str(10) ...
'-harmonic approximation to x(t)']);

subplot 212
plot(t, xtTWOHUNDRED, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x200(t)','Fontsize',13)
title([num2str(200) ...
'-harmonic approximation to x(t)']);

%% TASK 03

clc 
clear all
close all

% Set the dc term "a0"
a =1 ;
a0 = a/2;
% Define number of terms
N = 5;
% Set TFS coefficients.
k = 1:N;
ak = 2*a*( sin(2*pi*k)./(2*pi*k) + (cos(2*pi*k)-1)./(4*pi^2*k.^2));
bk = 2*a*( sin(2*pi*k)./(4*pi^2*k.^2) - cos(2*pi*k)./(2*pi*k) );

% Create a vector of time instants
t = -2: 1/N/10 :6 ;

% Set the fundamental frequency.
T0 = 3;
omega = 2*pi/T0;

% Compute an approximation to signal using up to 5-th harmonic.
xtFIVE = a0;
for i=1:5
    xtFIVE = xtFIVE + ak(i)*cos(i*omega*t) + bk(i)*sin(i*omega*t);
end

% Compute an approximation to signal using up to 10-th harmonic.
k = 1:10;
ak = 2*a*( sin(2*pi*k)./(2*pi*k) + (cos(2*pi*k)-1)./(4*pi^2*k.^2));
bk = 2*a*( sin(2*pi*k)./(4*pi^2*k.^2) - cos(2*pi*k)./(2*pi*k) );
xtTEN = a0;
for i=1:10
    xtTEN = xtTEN + ak(i)*cos(i*omega*t) + bk(i)*sin(i*omega*t);
end

% Compute an approximation to signal using up to 20-th harmonic.
k = 1:20;
ak = 2*a*( sin(2*pi*k)./(2*pi*k) + (cos(2*pi*k)-1)./(4*pi^2*k.^2));
bk = 2*a*( sin(2*pi*k)./(4*pi^2*k.^2) - cos(2*pi*k)./(2*pi*k) );
xtTWENTY = a0;
for i=1:10
    xtTWENTY = xtTWENTY + ak(i)*cos(i*omega*t) + bk(i)*sin(i*omega*t);
end

% Compute an approximation to signal using up to 30-th harmonic.
k = 1:30;
ak = 2*a*( sin(2*pi*k)./(2*pi*k) + (cos(2*pi*k)-1)./(4*pi^2*k.^2));
bk = 2*a*( sin(2*pi*k)./(4*pi^2*k.^2) - cos(2*pi*k)./(2*pi*k) );
xtTHIRTY = a0;
for i=1:10
    xtTHIRTY = xtTHIRTY + ak(i)*cos(i*omega*t) + bk(i)*sin(i*omega*t);
end


% Compute an approximation to signal using up to 40-th harmonic.
k = 1:40;
ak = 2*a*( sin(2*pi*k)./(2*pi*k) + (cos(2*pi*k)-1)./(4*pi^2*k.^2));
bk = 2*a*( sin(2*pi*k)./(4*pi^2*k.^2) - cos(2*pi*k)./(2*pi*k) );
xtFORTY = a0;
for i=1:10
    xtFORTY = xtFORTY + ak(i)*cos(i*omega*t) + bk(i)*sin(i*omega*t);
end

% Compute an approximation to signal using up to 50-th harmonic.
k = 1:50;
ak = 2*a*( sin(2*pi*k)./(2*pi*k) + (cos(2*pi*k)-1)./(4*pi^2*k.^2));
bk = 2*a*( sin(2*pi*k)./(4*pi^2*k.^2) - cos(2*pi*k)./(2*pi*k) );
xtFIFTY = a0;
for i=1:10
    xtFIFTY = xtFIFTY + ak(i)*cos(i*omega*t) + bk(i)*sin(i*omega*t);
end


%obtaining plots
figure
subplot 321
plot(t, xtFIVE, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x5(t)','Fontsize',13)
title([num2str(5) ...
'-harmonic approximation to x(t)']);

subplot 322
plot(t, xtTEN, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x10(t)','Fontsize',13)
title([num2str(10) ...
'-harmonic approximation to x(t)']);

subplot 323
plot(t, xtTWENTY, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x20(t)','Fontsize',13)
title([num2str(20) ...
'-harmonic approximation to x(t)']);

subplot 324
plot(t, xtTHIRTY, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x30(t)','Fontsize',13)
title([num2str(30) ...
'-harmonic approximation to x(t)']);

subplot 325
plot(t, xtFORTY, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x40(t)','Fontsize',13)
title([num2str(40) ...
'-harmonic approximation to x(t)']);

subplot 326
plot(t, xtFIFTY, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x50(t)','Fontsize',13)
title([num2str(50) ...
'-harmonic approximation to x(t)']);


%% TASK 04

clc 
clear all
close all

% Set the dc term "a0"
a0 = 1/pi;
% Define number of terms
N = 10;
% Set TFS coefficients.
k = 1:5;    


% Create a vector of time instants
t = -2: 1/N/10 :6 ;

% Set the fundamental frequency.
T0 = 1;
omega = 2*pi/T0;

% Compute an approximation to signal using up to 5-th harmonic.
xtFIVE = a0;
for i=1:5
 
    if mod(k(i),2)==0
        ak = -2/(pi*(k(i)^2-1));
    else
        ak=0;
    end
    if k(i)==1
        bk = 1/2;
    else
        bk=0;
    end
    xtFIVE = xtFIVE + ak*cos(i*omega*t) + bk*sin(i*omega*t);
end

% Compute an approximation to signal using up to 10-th harmonic.
xtTEN = a0;
k = 1:10;
for i=1:10
 
    if mod(k(i),2)==0
        ak = -2/(pi*(k(i)^2-1));
    else
        ak=0;
    end
    if k(i)==1
        bk = 1/2;
    else
        bk=0;
    end
    xtTEN = xtTEN + ak*cos(i*omega*t) + bk*sin(i*omega*t);
end

% Compute an approximation to signal using up to 15-th harmonic.
xtFIFTEEN = a0;
k = 1:15;
for i=1:15
 
    if mod(k(i),2)==0
        ak = -2/(pi*(k(i)^2-1));
    else
        ak=0;
    end
    if k(i)==1
        bk = 1/2;
    else
        bk=0;
    end
    xtFIFTEEN = xtFIFTEEN + ak*cos(i*omega*t) + bk*sin(i*omega*t);
end

% Compute an approximation to signal using up to 20-th harmonic.
xtTWENTY = a0;
k = 1:20;
for i=1:20
 
    if mod(k(i),2)==0
        ak = -2/(pi*(k(i)^2-1));
    else
        ak=0;
    end
    if k(i)==1
        bk = 1/2;
    else
        bk=0;
    end
    xtTWENTY = xtTWENTY + ak*cos(i*omega*t) + bk*sin(i*omega*t);
end

% Compute an approximation to signal using up to 25-th harmonic.
xtTWENTYFIVE = a0;
k = 1:25;
for i=1:25
 
    if mod(k(i),2)==0
        ak = -2/(pi*(k(i)^2-1));
    else
        ak=0;
    end
    if k(i)==1
        bk = 1/2;
    else
        bk=0;
    end
    xtTWENTYFIVE = xtTWENTYFIVE + ak*cos(i*omega*t) + bk*sin(i*omega*t);
end

% Compute an approximation to signal using up to 50-th harmonic.
xtFIFTY = a0;
k = 1:50;
for i=1:50
 
    if mod(k(i),2)==0
        ak = -2/(pi*(k(i)^2-1));
    else
        ak=0;
    end
    if k(i)==1
        bk = 1/2;
    else
        bk=0;
    end
    xtFIFTY = xtFIFTY + ak*cos(i*omega*t) + bk*sin(i*omega*t);
end



figure
subplot 321
plot(t, xtFIVE, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x5(t)','Fontsize',13)
title([num2str(5) ...
'-harmonic approximation to x(t)']);

subplot 322
plot(t, xtTEN, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x10(t)','Fontsize',13)
title([num2str(10) ...
'-harmonic approximation to x(t)']);

subplot 323
plot(t, xtFIFTEEN, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x15(t)','Fontsize',13)
title([num2str(15) ...
'-harmonic approximation to x(t)']);

subplot 324
plot(t, xtTWENTY, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x20(t)','Fontsize',13)
title([num2str(20) ...
'-harmonic approximation to x(t)']);

subplot 325
plot(t, xtTWENTYFIVE, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x25(t)','Fontsize',13)
title([num2str(25) ...
'-harmonic approximation to x(t)']);

subplot 326
plot(t, xtFIFTY, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x50(t)','Fontsize',13)
title([num2str(50) ...
'-harmonic approximation to x(t)']);

%% TASK 05 BONUS

clc 
clear all
close all

% Set the dc term "a0"
m=1;
a0 = m/2;
% Define number of terms
N = 10;

% Set TFS coefficients.
k = 1:N;    
ak= zeros(1,N);
i=2;

while true
    % ak(i) = (4*m/k(i)^2*pi^2)*(2*cos(k(i)*pi/2)-cos(k(i)*pi)-1);
    ak(i)=(-16*m)/(i^2*pi^2);
    i = i+4;
    if i>N
        break
    end
end

% Create a vector of time instants
t = -2: 1/N/10 :6 ;

% Set the fundamental frequency.
T0 = 2;
omega = 2*pi/T0;

% Compute an approximation to signal using up to 10-th harmonic.
xtTEN = a0;
for i=1:10
    xtTEN = xtTEN + ak(i)*cos(i*omega*t);
end

% Compute an approximation to signal using up to 50-th harmonic.
k = 1:50;
ak= zeros(1,50);
i=2;

while true
    ak(i)=(-16*m)/(i^2*pi^2);
    i = i+4;
    if i>50
        break
    end
end

xtFIFTY = a0;
for i=1:50
    xtFIFTY = xtFIFTY + ak(i)*cos(i*omega*t);
end

% Compute an approximation to signal using up to 100-th harmonic.
k = 1:100;
ak= zeros(1,100);
i=2;

while true
    ak(i)=(-16*m)/(i^2*pi^2);
    i = i+4;
    if i>100
        break
    end
end

xtHUNDRED = a0;
for i=1:100
    xtHUNDRED = xtHUNDRED + ak(i)*cos(i*omega*t);
end


figure
subplot 311
plot(t, xtTEN, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x10(t)','Fontsize',13)
title([num2str(10) ...
'-harmonic approximation to x(t)']);

subplot 312
plot(t, xtFIFTY, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x20(t)','Fontsize',13)
title([num2str(20) ...
'-harmonic approximation to x(t)']);

subplot 313
plot(t, xtHUNDRED, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('x100(t)','Fontsize',13)
title([num2str(100) ...
'-harmonic approximation to x(t)']);
%% POSTLAB 6
