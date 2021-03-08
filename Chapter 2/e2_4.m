N = 500;
t = (0:N-1)*(1/N);
x = square(2*pi*t);
plot(x);

F1 = sqrt((sum(x.^2))/N)
