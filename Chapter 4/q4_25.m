L = 8;
fc = 100;
fs = 1000;


[b, a] = butter(L, 2*fc/fs,'high');
%i = [1 zeros(1,255)];
i = [zeros(1,20) 1 zeros(1,235)];


y_ca = filter(b,a,i);
y_nc = filtfilt(b,a,i);

subplot(2,1,1);
plot(y_ca);
ylabel('Resp ao Impulso');
title('Causal');
xlim([0 50]);

subplot(2,1,2);
plot(y_nc);
xlim([0 50]);
xlabel('Time(ms)');ylabel('Resp ao Impulso');
title('Nao causal');

figure(2);
subplot(2,1,1);
[h,f] = freqz(b,a,512,fs);
plot(f,abs(h));
ylabel('Magnitude');

subplot(2,1,2);
plot(f,unwrap(angle(h)));
xlabel('Freq(Hz)');ylabel('Phase');