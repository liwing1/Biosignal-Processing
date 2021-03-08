f = 4;
Ts = 0.002;
N = 1000;
t = (0:N-1)*Ts;

signal_in = sin(2*pi*f*t);
signal_out = quantization(signal_in, 6);

noise = signal_in - signal_out;

erro = max(noise)-min(noise)
out = sprintf('Erro obtido: %5e', erro);
disp(out);

for bits = [4, 8, 12, 16]
    q = 1/(2^bits -1 );
    out = sprintf('Erro esperado(%2d bits) = %5e', bits, q);
    disp(out);
end
