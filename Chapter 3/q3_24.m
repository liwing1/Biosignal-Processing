fs = 200;
window1 = 256;
window2 = 32;

%[PS,f] = pwelch(x,window,noverlap,nfft,fs); % Apply the Welch method

sig = wgn(1,512,1);

[PS1,f1] = pwelch(sig,window1,window1-1,[],fs);
[PS2,f2] = pwelch(sig,window2,window2-1,[],fs);

subplot(211);
plot(f1,PS1);
ylabel('PS');xlabel('Frquency');
title('Segmento 256');

subplot(212);
plot(f2,PS2);
ylabel('PS');xlabel('Frquency');
title('Segmento 32');