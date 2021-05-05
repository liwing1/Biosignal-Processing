fs = 200;               % Sampling frequency              

b = [.2 .2 .2 .2 .2]/5;
B = fft(b,256);         % Find filter system spectrum
B_mag = abs(B);         % Compute magnitude spectrum

N = round(length(B_mag)/2);        % Number of frequency points to plot
f = (1:N)*fs/(2*N);         % Frequency vector for plotting spectrum

y = conv(b, randn(20000,1));
Y_psd = pwelch(y,128,64);

Y_mag = sqrt(Y_psd);

subplot(2,1,1);
plot(f,B_mag(1:length(f)));
title('Espectro de magnitude do filtro por FFT');
subplot(2,1,2);
plot(f,Y_mag(1:length(f)));
title('Espectro de magnitude do filtro por convolução');
xlabel('Frequecy(Hz)')