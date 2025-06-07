clc
close all
clear all

syms A t fo pi
xt = A*sin(2*pi*fo*t);
yt = int(xt,'t',[0,t])
%% -taskc

clc
close all
clear all

A=1;
fo=1;
t=0:0.01:3;
xt = A*sin(2*pi*fo.*t);
yt = (A*sin(fo*pi*t).^2)/(fo*pi);

hold on
plot(t,xt)
grid on
xlabel('Time');
ylabel('xt')
title('Plotting xt and yt')

plot(t,yt)
grid on
xlabel('Time');
ylabel('yt')

legend('xt','yt')

%% -task d

a= [1 2 3 4 5];
b = cumsum(a)

%% -task e
clc
close all
clear all
A=1;
fo=1;
t=0:0.01:3;
xt = A*sin(2*pi*fo.*t);
yt = 0.01*cumsum(xt);
hold on
plot(t,xt)
grid on
xlabel('Time');
ylabel('xt')
title('Plotting xt and yt')

plot(t,yt)
grid on
xlabel('Time');
ylabel('yt')

legend('xt','yt')

%% -task h
t = 0:0.01:12;
xt = sinc(t-6);
yt = 0.01*cumsum(xt);

hold on
plot(t,xt)
grid on
xlabel('Time');
ylabel('xt')
title('Plotting xt and yt')

plot(t,yt)
grid on
xlabel('Time');
ylabel('yt')

legend('xt','yt')
%% PART 2 -task i
clc
clear all
close all
a = [1 2 3 4 5];
b = diff(a)

%% -task k
clc
clear all
close all
t = 0:0.01:10;
yt = 2.*t.*exp(-t);
xt = 2*exp(-t) - 2.*t.*exp(-t);

hold on
plot(t,xt)
grid on
xlabel('Time');
ylabel('xt')
title('Plotting xt and yt')

plot(t,yt)
grid on
xlabel('Time');
ylabel('yt')

legend('xt','yt')
%% -task L
clc 
clear all
close all
t = 0:0.01:10;
yt = 2.*t.*exp(-t);

hold on

plot(t,yt)
grid on
xlabel('Time');
ylabel('yt')
title('Plotting xt and yt')

yt = [0 yt];
xt = diff(yt)/0.01;

plot(t,xt)
grid on
xlabel('Time');
ylabel('xt')

legend('yt','xt')

%% -task m
clc 
clear all
close all
t = 0:0.01:12;
yt = sinc(t-6);
xt = diff(yt)/0.01;
xt = [0 xt];

hold on

plot(t,yt)
grid on
xlabel('Time');
ylabel('yt')
title('Plotting xt and yt')


plot(t,xt)
grid on
xlabel('Time');
ylabel('xt')

legend('yt','xt')
%% -POST LAB
%task(n) and (o)
clc
clear al
close all

subplot(2,1,1)
dt = 0.001;
to=-5
tmax=5;
t = to:dt:tmax;
a=0.001;
impOne = (a./(pi.*t).^2).*(sin((pi.*t)./a)).^2;
subplot(2,1,1)
plot(t,impOne)
xlabel('Time');
ylabel('Impulse Using sin');


impTwo = (1./(a*sqrt(pi))).*exp((-1.*(t.^2))./(a ^ 2));
subplot(2,1,2)
plot(t,impTwo)
xlabel('Time');
ylabel('Impulse Using exp');

integrand = sum(impTwo)*dt

%% task(p)

clc
clear al
close all

subplot(2,1,1)
dt = 0.001;
to=-5
tmax=5;
t = to:dt:tmax;
a=0.001;
impOne = (1./(a*sqrt(pi))).*exp((-1.*(t.^2))./(a^2));
unitStep = cumsum(impOne)*dt;
plot(t,unitStep,'LineWidth',2.5)
grid on;
xlabel('Time');
ylabel('Unit Step Function');

%% task(q)
clc
clear al
close all

subplot(2,1,1)
dt = 0.001;
to=-5;
tmax=5;
t = to:dt:tmax;
a=0.001;
impOne = (1./(a*sqrt(pi))).*exp((-1.*(t.^2))./(a^2));
unitStep = cumsum(impOne)*dt;
unitImpulse = diff(unitStep)./dt;
unitImpulse = [0  unitImpulse];
plot(t,unitImpulse,'LineWidth',2.5)
grid on;
xlabel('Time');
ylabel('Unit Step Function');

