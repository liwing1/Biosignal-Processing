
    clear all; close all;
    fs = 500;                   % Sample frequency
    N = 1000;                   % Construct 5 seconds worth of data
    t = (0:N-1)/fs;              % Time vector 0 to 5 
    d = 0.04;                    % Damping Factor
    f = 10;                      % Undamped nat. feq
    h1 = (d/(sqrt(1-d*2)))*(exp(-t.*(d*2*pi*f)) .* sin(t.*(2*pi*f*sqrt(1-d*2))));           
    h2 = (d/(sqrt(1-d*2)))*(exp(-t.*(d*2*pi*f)) .* cos(t.*(2*pi*f*sqrt(1-d*2))));           
    
    f = 20;
    h3 = (d/(sqrt(1-d*2)))*(exp(-t.*(d*2*pi*f)) .* sin(t.*(2*pi*f*sqrt(1-d*2))));           
    h4 = (d/(sqrt(1-d*2)))*(exp(-t.*(d*2*pi*f)) .* cos(t.*(2*pi*f*sqrt(1-d*2))));           
    
    F = [h1; h2; h3; h4];
    
    disp(corrcoef(F));
    
    subplot(2,2,1);
    plot(t,h1,'k');              % Plot impulse response
    xlabel('Time (sec)','FontSize',14); ylabel('h1(t)','FontSize',14);
    title('fn = 10, sem defasagem','FontSize',12);
    subplot(2,2,2);
    plot(t,h2,'k');         % Plot the step response
    xlabel('Time (sec)','FontSize',14); ylabel('h2(t)','FontSize',14);
    title('fn = 10, com defasagem','FontSize',12);
    subplot(2,2,3);
    plot(t,h3,'k');              % Plot impulse response
    xlabel('Time (sec)','FontSize',14); ylabel('h3(t)','FontSize',14);
    title('fn = 20, sem defasagem','FontSize',12);
    subplot(2,2,4);
    plot(t,h4,'k');              % Plot impulse response
    xlabel('Time (sec)','FontSize',14); ylabel('h4(t)','FontSize',14);
    title('fn = 20, com defasagem','FontSize',12);