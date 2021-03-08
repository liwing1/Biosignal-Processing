%1000 pontos
N = 1000;
%Vetor de tempo para período de 0.5 com 100 pontos
t = ((0:N-1)/N)*0.5;
%Gerar onda dente de serra
x = 3 * sawtooth(2*2*pi*t + pi);
%Gerar gráfico para testar resultado
plot(t,x);
%Calculo do RMS
RMS = sqrt( sum( x.^2 )/(N - 1) );
%Calculo desvio padrão
STD = std(x);
%Imprimir resultado de RMS e STD
display(RMS);
display(STD);