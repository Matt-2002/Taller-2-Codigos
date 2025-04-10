num = 3;
den = [1 2 3];

Gs = tf(num,den, 'InputDelay', 2);
[y1,t1]=step(Gs);
[y2,t2]=impulse(Gs);

[max1, idx1] = max(y1);
maxTime1 = t1(idx1);

[max2, idx2] = max(y2);
maxTime2 = t2(idx2);

figure

subplot(2,1,1);
plot(t1,y1);
hold on;
plot(maxTime1,max1,'rx');
title('Respuesta ante la señal impulse');


subplot(2,1,2);
plot(t2,y2);
hold on;
plot(maxTime2,max2,'rx');
title('Respuesta ante la señal step');
