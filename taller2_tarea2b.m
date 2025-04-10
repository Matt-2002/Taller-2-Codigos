num = 3;
den = [1 2 3];
G = tf(num, den);

ts = 0.1;
t = (0:ts:30)';
N = length(t);

% Señal escalonada: 0 por 10s, luego 5 por 10s, luego 10 por 10s
s1 = zeros(1, sum(t < 10));
s2 = ones(1, sum(t >= 10 & t < 20)) * 5;
s3 = ones(1, sum(t >= 20)) * 10;

arbsig = [s1 s2 s3]';  % señal de entrada
t = t(1:length(arbsig));  % asegurar tamaños compatibles

% Graficar
figure

subplot(1, 2, 1)
stairs(t, arbsig, 'b--', 'LineWidth', 1.5)
grid on
xlabel('Time (seconds)')
ylabel('Amplitude')
title('(a) Señal arbitraria')

subplot(1, 2, 2)
lsim(G, arbsig, t)
title('(b) Respuesta del sistema')
