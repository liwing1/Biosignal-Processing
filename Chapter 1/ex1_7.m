f = 4;
Ts = 0.002;
N = 1000;
t = (0:N-1)*Ts;

signal_in = sin(2*pi*f*t);

for bits = [4, 8, 10, 12, 16]
    fprintf('\tCONVERSÁO DE %2d bits\n', bits)
    q = 1/(2^bits -1 );
    fprintf('Erro esperado = %5e\n', q);
    
    
    signal_out = quantization(signal_in, bits);
    noise = signal_in - signal_out;
    erro = max(noise)-min(noise);
    fprintf('Erro obtido = %5e\n', erro);
end
