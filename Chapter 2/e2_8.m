load data_c1.mat

for k = 1:4
    m = 250*(k-1)+1;    %m assume valores 1,251,501,751
    segment = x(m:m+249);
    avg(k) = mean(segment);
    variance(k) = var(segment);
end
disp('Mean Segment 1 Segment 2 Segment 3 Segment 4');
disp(avg);
disp('Variance Segment 1 Segment 2 Segment 3 Segment 4');
disp(variance);

y = [detrend(x); 0];   %subtrai x(m) com x(m-1)
for k = 1:4
    m = 250*(k-1)+1;    %m assume valores 1,251,501,751
    segment = y(m:m+249);
    avg(k) = mean(segment);
    variance(k) = var(segment);
end
disp('Mean Segment 1 Segment 2 Segment 3 Segment 4');
disp(avg);
disp('Variance Segment 1 Segment 2 Segment 3 Segment 4');
disp(variance);

%Aplica operador DETREND, comparar com média e variância, assim como
%exemplo 2.2

%O sinal modificado, agora é estacionário?

