load short.mat
N = 32;
t = (1:N);

f = (1:N/2+1);
X = 2*abs(fft(x))/N;
X = X(1:N/2+1);

xz = [x zeros(1,224)];
Nz = length(xz);
fz = (1:Nz/2+1);
Xz = 2*abs(fft(xz))/Nz;
Xz = Xz(1:Nz/2+1);

subplot(211);
plot(f,X,'*');title('Sem Zero Padding');
subplot(212);
plot(fz,Xz,'*');title('Com Zero Padding');

