    %% dados do sinal
f = 5;%Freq entrada Hz
fs = 9;% Frequencia de amostragem Hz

    %% gerar sinal
tempo = linspace(0, 1, 1000); %t amostragem
sinal = sin(2*pi*f*tempo); % Sinal senoidal
    %% plotar sinal
subplot(2,1,1)
plot(tempo,sinal,'g-')
hold;

    %% sinal amostrado
Ts = 1/fs;
n = [0:0.001:1];
t_sample = [0 : Ts : 1];
sinal_sample = sin(2*pi*f*t_sample);

plot(t_sample, sinal_sample,'r*');
xlabel('Tempo (s)')
ylabel('Sinal (t)')
legend('Sinal 5Hz','Amostragem 9Hz')

    %% Alising
subplot(2,1,2);
        %seno defasado em 180º
Sinal_Ali = cos(2*pi*4*tempo); 
plot(tempo,Sinal_Ali);
hold;
        %seno defasado em 180º
sinal_sample = cos(2*pi*f*t_sample);
plot(t_sample, sinal_sample,'r*');   
xlabel('Tempo (s)')
ylabel('Sinal (t)')
legend('Sinal 4Hz','Amostragem 9Hz')