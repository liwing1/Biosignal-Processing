load pulses.mat

Tt = 1;
fs = 500;
N = Tt * fs;

t = (0:N-1)/fs;
f = (1:N/2+1)/fs;

x = [x1; x2; x3];

plot(t,x(1,:));hold on;
plot(t,x(2,:));hold on;
plot(t,x(3,:));hold off;

legend('Pulso x1', 'Pulso x2', 'Pulso x3');

for j = 1:3
    xf(j,:) = fft(x(j,:));
    
    
    x_mag(j,:) = 2*abs(xf(j,:)/N);
    x_pha(j,:) = angle(xf(j,:));
    
    x_pha(j,:) = unwrap(x_pha(j,:));
    x_pha(j,:) = x_pha(j,:) * 360/2*pi;
end
subplot(2,1,1);
stem(f, x_mag(1,1:N/2+1),'r');hold on;
stem(f, x_mag(2,1:N/2+1),'g');hold on;
stem(f, x_mag(3,1:N/2+1),'b');hold off;
ylabel('|x(t)|');xlabel('freq(hz)');
legend('x1','x2','x3');title('Modulo e Fase - Pulso');

subplot(2,1,2);
plot(f,x_pha(1,1:N/2+1),'r-*');hold on;
plot(f,x_pha(2,1:N/2+1),'g-*');hold on;
plot(f,x_pha(3,1:N/2+1),'b-*');hold off;
ylabel('\theta(t)');xlabel('freq(hz)');
legend('x1','x2','x3');