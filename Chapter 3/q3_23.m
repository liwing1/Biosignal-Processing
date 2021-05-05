fs=200;

sig = wgn(1,512,1);
h = [1/3 1/3 1/3];

y = conv(sig, h);

N = length(y);
f = (1:N/2+1)*fs/N;

SIG = fft(sig); SIG = SIG(1:N/2+1);
pSIG = (abs(SIG).^2);

Y = fft(y); Y = Y(1:N/2+1);
ps = (abs(Y).^2);


subplot(212);
plot(f, ps);
xlabel('Frquency');ylabel('Power Spectrum')
title('Com filtro Média Móvel')

N = length(y);
f = (1:N/2+1)*fs/N;

subplot(211);
plot(f, pSIG);
xlabel('Frquency');ylabel('Power Spectrum')
title('Sem filtro')