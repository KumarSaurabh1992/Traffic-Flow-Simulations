clear all;
close all;
clc;

f = @(x) sin(2*pi*x);

delta_t = 0.001;
delta_x = 0.01;
gama = delta_t/(delta_x);
x = 1;
partitions = (x/delta_x) + 1;
U = zeros(partitions,1);
for i = 1:partitions
    U(i,1) = f((i - 1)*delta_x);
end
plot(U);
Uinitial = U;
dx = 0:delta_x:1;
for time = 0:delta_t:0.25
    U_prime = U;
    U(1,1) = U_prime(1,1) - gama*(U_prime(1,1) - U_prime(partitions - 1,1));
    for i = 2: partitions
        U(i,1) = U_prime(i,1) - gama*(U_prime(i) - U_prime(i - 1));
    end
    
    plot(dx,Uinitial,'r',dx,U,'b');
    
    axis tight;
    suptitle(['time = ', num2str(time)]);
    pause(0.02);
end
    