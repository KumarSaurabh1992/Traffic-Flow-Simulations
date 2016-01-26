clc;
clear;
close all;

delta_t = 0.01;
delta_x = 0.01;
gama = delta_t/(delta_x*2);
x = 3;
partitions = (x/delta_x) + 1;
U = zeros(partitions,1);
for i = 1:partitions
    if (((i - 1)*delta_x) - 1 < 0)
        U(i,1) = 1;
    elseif (((i - 1)*delta_x) - 1 < 1)
        U(i,1) = 1 - ((i - 1)*delta_x - 1);
    else
        U(i,1) = 0;
    end
end
Uinitial = U;
dx = -1:delta_x:2;
%hold on;
for time = 0:delta_t:5
    U_prime = U;
    U(1,1) = U_prime(1,1) - gama*(U_prime(1,1)^2 - 1);
    for i = 2: partitions
        U(i,1) = U_prime(i,1) - gama*((U_prime(i)^2 - U_prime(i - 1)^2))/2;
    end
    %subplot(2,1,1);
    plot(dx,Uinitial,'b',dx,U,'r');
    axis tight;
    pause(0.02);
    suptitle(['time = ' num2str(time)]);
    
end
    