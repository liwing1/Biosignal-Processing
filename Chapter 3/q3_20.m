N = 64;
fs = 1000;
f = (1:N/2+1)*fs/N;
x = sig_noise([200 300],-3, N);

X_mag = abs(fft(x));
subplot(211);plot(f,X_mag(1:N/2+1));title('Janela Retangular');

xb = x .*blackmanharris(N)';
scaleFactor = sum(ones(64))/sum(blackmanharris(N));
xb = xb .*scaleFactor;
X_mag = abs(fft(xb));
subplot(212);plot(f,X_mag(1:N/2+1));title('Janela Blackman-Harris');