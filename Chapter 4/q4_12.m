N = 256;                    
fs = 1000;                  
f = (1:N)*fs/N;             
fc = 200/fs;                
L = 33;                 
k  = -floor(L/2):-1;        
n = -floor(L/2):floor(L/2);         

g = sin(2*pi*fc*k)./(pi*k); 
g =  [g 2*fc, fliplr(g)];   

N_w = length(g);            

w_B = 0.35875 + 0.48829*cos(2*pi*n/N_w) + 0.14128*cos(4*pi*n/N_w)+ 0.01168*cos(6*pi*n/N_w); 
b = g .* w_B;           

n = (1:L); 
w_h = 0.54 - 0.46*cos(2*pi*n/N_w);
h = g .* w_h;           

H1 = fft(b,N);    
H2 = fft(h,N);  
      
plot(f(1:N/2),abs(H1(1:N/2)),'r'); hold on;
plot(f(1:N/2),abs(H2(1:N/2)),'b');
xlabel('Frequency (Hz)');ylabel('H(f)');
legend('Blackmann', 'Hamming');