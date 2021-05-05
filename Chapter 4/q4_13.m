N = 256;
fs = 1000;
f = (1:N)*fs/N;
fc = 100/fs;
L = 129;
t = (1:N)/fs;
k  = -floor(L/2):-1;
n = -floor(L/2):floor(L/2);

x = [1 zeros(1,255)];
g = sin(2*pi*fc*k)./(pi*k);
g =  [g 2*fc, fliplr(g)];

N_w = length(g);   

w_B = 0.35875 + 0.48829*cos(2*pi*n/N_w) + 0.14128*cos(4*pi*n/N_w)+ 0.01168*cos(6*pi*n/N_w);
b = g .* w_B;

n = (1:L);
w_h = 0.54 - 0.46*cos(2*pi*n/N_w);
h = g .* w_h;

y_b = conv(x,b,'same');
y_h = conv(x,h,'same');

y_s = y_b-y_h;

plot(t,y_b,'r'); hold on;
plot(t,y_h,'b');
xlim([-inf 0.1]);
xlabel('Time(s)');ylabel('Resposta ao Impulso');
legend('Blackmann', 'Hamming');