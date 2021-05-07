fs = 300;
fc = 80;
fcf=fc/fs;
L=100;

[b_i,a_i] = butter(12,2*fc/fs,'high');

k = -floor(L/2):-1;
b_f = -sin(2*pi*fcf*k)./(pi*k);
b_f = [b_f 1-2*fcf, fliplr(b_f)];
b_f = b_f.*blackmanharris(L+1)';

[h_i,f_i] = freqz(b_i,a_i,512,fs);
[h_f,f_f] = freqz(b_f,1,512,fs);

plot(f_i,abs(h_i));hold on;
plot(f_f,abs(h_f));hold off;
xlabel('freq(Hz)');ylabel('mag');
legend('IIR','FIR');