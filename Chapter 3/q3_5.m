clear all;
fs = 1024; %N = Ts/Tt
N = 1024;
t = (0:N-1)/fs;

y = 0.5*sawtooth(2*2*pi*t);
yf = fft(y);

a_0 = mean(y);
for j = 1:26
    y_mag(j) = 2*abs(yf(j+1)/N);
    y_ph(j) = angle(yf(j+1));
end

Y = zeros(1, N);
for j = 1:26
    f(j) = 2*j;
    Y = Y + y_mag(j)*cos(2*pi*j*t + y_ph(j));
end
Y = a_0 + Y;

plot(t,y);hold on;
plot(t,Y);
xlabel('Time(s)');ylabel('x(t)')
title('Sinal Original x Sinal Reconstruido')