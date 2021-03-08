Tt = 1;
N = 1000;
Ts = Tt / N;
t = (0:Ts:(N-1)*Ts);

y_5 = sin(2*pi*5*t);
subplot(2, 1, 1);
plot(t, y, '.k');


Ts_7 = 1/7;
t_7 = (0:Ts_7:1);

y_7 = sin(2*pi*7*t_7);
subplot(2,1,2);
plot(t_7, y_7, '.k');