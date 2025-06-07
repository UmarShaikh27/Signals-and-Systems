%% TASK2
clc
clear all
close all

%Time period and Amplitude
T0 =0.16;
T = 0.88;
a = 0.35;
%DC term
a0 = (4*a*T0)/(pi*T);
%Number of terms
N = 50;
%TFS coeffiecients
k = 1:N;
ak = (4*a*T0).*( (sin( (pi.*T -2.*k.*pi*T0)./(2*T) )./(pi.*T -2.*k.*pi.*T0)) + (sin( (pi*T +2.*k.*pi.*T0)./(2*T) )./(pi*T +2.*k.*pi.*T0))  );
% Create a vector of time instants
t = -0.2: 1/N/10 :1.2;
% Set the fundamental frequency.
omega = 2*pi/T;
xtP = a0;
for i=1:N
   xtP = xtP + ak(i)*cos(i*omega*t);
end
% Plot the harmonic approximations
figure;
subplot 511
plot(t, xtP, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('Amplitude','Fontsize',13)
title('P-wave component of ECG signal');


% TASK03


%Time period and Amplitude
T0 =0.08;
T = 0.88;
a = 1.2;
t0=0.2;

%DC term
a0 = (4*a*T0)/(pi*T);

%Number of terms
N = 50;
%TFS coeffiecients

k = 1:N;
ak = (4*a*T0).*( (sin( (pi.*T -2.*k.*pi*T0)./(2*T) )./(pi.*T -2.*k.*pi.*T0)) + (sin( (pi*T +2.*k.*pi.*T0)./(2*T) )./(pi*T +2.*k.*pi.*T0))  );

% Create a vector of time instants
t = -0.2: 1/N/10 :1.2;

% Set the fundamental frequency.
omega = 2*pi/T;
xtQRS = a0;

for i=1:N
   xtQRS = xtQRS + ak(i)*cos(i*omega*(t-t0));
end
% Plot the component
subplot 512
plot(t, xtQRS, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('Amplitude','Fontsize',13)
title('QRS-wave component of ECG signal');


% TASK04
%-------------S-WAVe-----------


%Time period and Amplitude
T0 =0.08;
T = 0.88;
a = -0.2;
t0=0.28;

%DC term
a0 = (4*a*T0)/(pi*T);

%Number of terms
N = 50;
%TFS coeffiecients

k = 1:N;
ak = (4*a*T0).*( (sin( (pi.*T -2.*k.*pi*T0)./(2*T) )./(pi.*T -2.*k.*pi.*T0)) + (sin( (pi*T +2.*k.*pi.*T0)./(2*T) )./(pi*T +2.*k.*pi.*T0))  );

% Create a vector of time instants
t = -0.2: 1/N/10 :1.2;

% Set the fundamental frequency.
omega = 2*pi/T;
xtS = a0;

for i=1:N
   xtS = xtS + ak(i)*cos(i*omega*(t-t0));
end
% Plot the component
subplot 513
plot(t, xtS, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('Amplitude','Fontsize',13)
title('S-wave component of ECG signal');

%-------------T-WAVe-----------


%Time period and Amplitude
T0 =0.08;
T = 0.88;
a = 0.3;
t0=0.48;

%DC term
a0 = (4*a*T0)/(pi*T);

%Number of terms
N = 50;
%TFS coeffiecients

k = 1:N;
ak = (4*a*T0).*( (sin( (pi.*T -2.*k.*pi*T0)./(2*T) )./(pi.*T -2.*k.*pi.*T0)) + (sin( (pi*T +2.*k.*pi.*T0)./(2*T) )./(pi*T +2.*k.*pi.*T0))  );

% Create a vector of time instants
t = -0.2: 1/N/10 :1.2;

% Set the fundamental frequency.
omega = 2*pi/T;
xtT = a0;

for i=1:N
   xtT = xtT + ak(i)*cos(i*omega*(t-t0));
end
% Plot the component
subplot 514
plot(t, xtT, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('Amplitude','Fontsize',13)
title('T-wave component of ECG signal');

%-------------U-WAVe-----------


%Time period and Amplitude
T0 =0.06;
T = 0.88;
a = 0.055;
t0=0.68;

%DC term
a0 = (4*a*T0)/(pi*T);

%Number of terms
N = 50;
%TFS coeffiecients

k = 1:N;
ak = (4*a*T0).*( (sin( (pi.*T -2.*k.*pi*T0)./(2*T) )./(pi.*T -2.*k.*pi.*T0)) + (sin( (pi*T +2.*k.*pi.*T0)./(2*T) )./(pi*T +2.*k.*pi.*T0))  );

% Create a vector of time instants
t = -0.2: 1/N/10 :1.2;

% Set the fundamental frequency.
omega = 2*pi/T;
xtU = a0;

for i=1:N
   xtU = xtU + ak(i)*cos(i*omega*(t-t0));
end
% Plot the component
subplot 515
plot(t, xtU, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('Amplitude','Fontsize',13)
title('U-wave component of ECG signal');

% TASK 05
ECG = xtP + xtQRS +xtS + xtT + xtU;

figure
plot(t, ECG, 'linewidth',1);
grid on;
xlabel('time','Fontsize',13);
ylabel('Amplitude','Fontsize',13)
title('ECG signal');


%% TASK 06

