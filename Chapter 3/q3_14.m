N = 512;
fs = 1000;
t = (0:N-1)/fs;

x1 = sin(2*pi*200*t) + sin(2*pi*400*t);
x2 = sin(2*pi*200*t) + sin(2*pi*900*t);

X1 = fft(x1);
X2 = fft(x2);

X1 = 2*abs(X1(1:N/2+1))/N;
X2 = 2*abs(X2(1:N/2+1))/N;

f = (1:N/2+1)*fs/N;
plot(f, X1, '--r');hold on;
plot(f, X2, '-b');hold on;
legend('x1','x2')
title('Aliasing depois da frequência de Nyquist(N/2)')