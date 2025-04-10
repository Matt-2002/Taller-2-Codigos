num = 3;
den = [1 2 3];
G = tf(num, den);

ts = 0.1;
t = (0:ts:50)';  % ahora hasta 50 segundos
N = length(t);

% Construir la señal arbitraria por tramos
s0 = zeros(1, sum(t < 5));  % 0 de 0 a 5 s
s1 = linspace(0, 5, sum(t >= 5 & t < 10));  % rampa 0 a 5 de 5 a 10 s
s2 = ones(1, sum(t >= 10 & t < 20)) * 5;   % constante 10 de 10 a 20 s
s3 = ones(1, sum(t >= 20 & t < 30)) * 10; % constante 15 de 20 a 30 s
s4 = linspace(25, 15, sum(t >= 40));      % rampa descendente 25 a 15 de 40 a 50 s
s5 = ones(1, sum(t >= 30 & t < 40)) * 5;   % constante 25 de 30 a 40 s


arbsig = [s0 s1 s2 s3 s4 s5]';  % concatenar y convertir a columna

% Graficar
figure

subplot(1, 2, 1)
plot(t, arbsig, 'LineWidth', 1.5)
grid on
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('Señal aleatoria')
legend('Señal variante en el tiempo')

subplot(1, 2, 2)
lsim(G, arbsig, t)
grid on
title('Linear Simulation Results')
xlabel('Time (seconds)')
ylabel('Amplitude')
