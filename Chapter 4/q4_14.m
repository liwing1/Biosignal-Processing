load ECG_9.mat;
fs = 250;
N = length(x);
t = (1:N)/fs;
L = 65;
fc = 8/fs;
k = -floor(L/2):-1;

g = sin(2*pi*fc*k)./(pi*k);
g = [g 2*fc, fliplr(g)];

N_w = length(g);
n = -floor(L/2):floor(L/2);
w_B = 0.35875 + 0.48829*cos(2*pi*n/N_w) + 0.14128*cos(4*pi*n/N_w)+ 0.01168*cos(6*pi*n/N_w); 
b = g .* w_B;

H_mag = abs(fft(b,2^nextpow2(length(b))));


y = conv(x,b,'same');

f = (1:N_w/2)*fs/N_w;
plot(f, H_mag(1:floor(N_w/2)));
xlabel('Frequency(Hz)');ylabel('Magnitude');
figure(2);
plot(t,y,'r');hold on;
plot(t,x,'b');
xlabel('Time(s)');ylabel('ECG(mV)');legend('Filtered','Raw');