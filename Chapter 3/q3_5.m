clear all;
fs = 1024; %N = Ts/Tt
N = 1024;
t = (0:N-1)/fs;

y = 0.5*sawtooth(2*2*pi*t);
yf = fft(y);

Y = zeros(1, N);
for j = 1:260
    y_mag(j) = 2*abs(yf(j)/N);
    y_ph(j) = angle(yf(j));
    
    f(j) = 1*(j-1);
    Y = Y + y_mag(j)*cos(2*pi*f(j)*t + y_ph(j));
end


plot(t,y);hold on;
plot(t,Y);
xlabel('Time(s)');ylabel('x(t)')
title('Sinal Original x Sinal Reconstruido')