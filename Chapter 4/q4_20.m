load sawth.mat;
fs = 1000;
N = length(x);
t = (1:N)/fs;
L = 65;
fc = 40/fs;
k = -floor(L/2):-1;

b = sin(2*pi*fc*k)./(pi*k);
b = [b 2*fc, fliplr(b)];

b = b.*blackmanharris(L)';

y_c = conv(x, b, 'same');
y_f = filter(b,1,x);

plot(t,x);hold on;
plot(t,y_c);
plot(t,y_f);hold off;
legend('raw','conv','filter');
xlabel('time(s)');ylabel('signal')