load ECG_60Hz_data.mat
fs = 250;
N = length(x);
L = 127;
t = (1:N)/fs;

fh = 65/fs;
fl = 55/fs;

k = -floor(L/2):-1;
b = sin(2*pi*fl*k)./(pi*k) - sin(2*pi*fh*k)./(pi*k);
b = [b 1-2*(fh-fl), fliplr(b)];

N_w = length(b);
n = -floor(L/2):floor(L/2);
w_B = 0.35875 + 0.48829*cos(2*pi*n/N_w) + 0.14128*cos(4*pi*n/N_w)+ 0.01168*cos(6*pi*n/N_w); 

b = b .* w_B;

y = conv(x,b,'same');

plot(t,x);hold on;
plot(t,y);hold off;
xlabel('Tempo(s)');ylabel('mV');
legend('raw','filtered');

B = abs(fft(b));B = B(1:floor(N_w/2));
f =(1:floor(N_w/2))*fs/N_w;
figure(2);
plot(f,B);
xlabel('Freq(Hz)');ylabel('Magnitude');