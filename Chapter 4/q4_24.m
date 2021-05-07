load Resp_noise1.mat
fs = 125;
N = length(resp_noise1);
t = (1:N)/fs;

[b, a] = butter(14, 0.15);

y_ca = filter(b,a,resp_noise1);
y_nc = filtfilt(b,a,resp_noise1);

plot(t,resp);hold on;
plot(t,y_ca);
plot(t,y_nc);hold off;
xlabel('Time(s)');ylabel('Resp');
legend('raw','causal','nao causal');