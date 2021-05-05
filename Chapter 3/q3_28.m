fs = 1000;
N = 64;

signal = sig_noise([200 300], -4, 64);

s0 = signal;
s1 = signal.*hamming(N)';
s2 = signal.*blackmanharris(N)';

S0 = fft(s0);S0 = S0(1:N/2+1);
S0_mag = 2*abs(S0)/N;

S1 = fft(s1);S1 = S1(1:N/2+1);
S1_mag = 2*abs(S1)/N;

S2 = fft(s2);S2 = S2(1:N/2+1);
S2_mag = 2*abs(S2)/N;

f = (1:N/2+1)*fs/N;

subplot(311);
plot(f,S0_mag);
xlabel('Frequency');ylabel('Magnitude');
title('Retangular');

subplot(312);
plot(f,S1_mag);
xlabel('Frequency');ylabel('Magnitude');
title('Hamming');

subplot(313);
plot(f,S2_mag);
xlabel('Frequency');ylabel('Magnitude');
title('Blackman-Harris');