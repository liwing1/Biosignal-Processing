clear all; close all;
fs = 500;                   % Sample frequency
N = 1000;                   % Construct 5 seconds worth of data
t = (0:N-1)/fs;              % Time vector 0 to 5 
d = 0.1;                    % Damping Factor
f = 2;                      % Undamped nat. feq
h = (d/(sqrt(1-d*2)))*(exp(-t.*(d*2*pi*f)) .* sin(t.*(2*pi*f*sqrt(1-d*2))));           
x = rand(1,N);              % Construct r
y = conv(x,h);              % Get output (convolution)
subplot(1,2,1);
plot(t,h,'k');              % Plot impulse response
xlabel('Time (sec)','FontSize',14); ylabel('y(t)','FontSize',14);
title('Impulse Response','FontSize',12);
subplot(1,2,2);
plot(t,y(1:N),'k');         % Plot the step response
xlabel('Time (sec)','FontSize',14); ylabel('y(t)','FontSize',14);
title('Step Response','FontSize',12);

