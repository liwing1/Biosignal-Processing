fs = 1000;
N = 512;

signal = sig_noise([200 300], -4, N);

w0 = ones(N)';
w1 = hamming(N)';
w2 = blackmanharris(N)';

PS1 = pwelch(signal, w0, )
