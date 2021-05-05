load ECG_noise.mat
N = length(ecg);
fs = N/10;
L = 65;
t = (1:N)/fs;

fh = (24)/fs;
fl = (12)/fs;

k = -floor(L/2):-1;
b = sin(2*pi*fh*k)./(pi*k) - sin(2*pi*fl*k)./(pi*k);
b = [b 2*(fh-fl), fliplr(b)];

N_w = length(b);
n = -floor(L/2):floor(L/2);
w_B = 0.35875 + 0.48829*cos(2*pi*n/N_w) + 0.14128*cos(4*pi*n/N_w)+ 0.01168*cos(6*pi*n/N_w); 

b = b .* w_B;

y = conv(ecg,b,'same'); 

plot(t,y);
xlabel('Tempo(s)');ylabel('mV');
