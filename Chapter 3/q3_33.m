load eeg_data.mat
fs = 50;
N = length(eeg);


X = abs(fft(eeg).^2);
X = X(1:N/2+1);
f = (1:N/2+1)*fs/N;

[Xd, fd] = pwelch(eeg,256,255,[],50);
subplot(211);
plot(f,X);

subplot(212);
plot(fd,Xd);
