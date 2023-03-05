clc
close all
clear all

df=0.01;
fs=10;
ts=1/fs;
t=[-5:ts:5];
x1=zeros(size(t));
x1(41:51)=t(41:51)+1;
x1(52:61)=-t(52:61)+1;
x1(71:81)=-sin((pi/2).*t(71:81));
x1(82:91)=-sin((pi/2).*t(82:91));
x1=2*x1;
figure
subplot(3,1,1)
plot(t,x1)
xlim([-2 5])
title("Señal dominio del tiempo - x(t)")
xlabel("t")
ylabel("A")

[X1,x11,df1]=Fftseq(x1,ts,df);
X11=X1/fs;
h_t=[0:df1:df1*(length(x11)-1)]-fs/2;
subplot(3,1,2)
plot(h_t,fftshift(abs(X11)))
xlim([-2 2])
title("Espectro de magnitud la señal x(t)")
xlabel("\omega")
ylabel("|X(\omega)|")
subplot(3,1,3)
plot(h_t(500:525),fftshift(angle(X11(500:525))))
title("Espectro de fase de la señal x(t)")
xlabel("\omega")
ylabel("\theta")

sgtitle("Mario A. Gallardo Cervantes")
 
% parte B
% obtener la señal de salida y(t) si la señal de entrada es x(t) y se le aplica un filtro con respuestal al impulso h(t)

h_t = ((0<=t)&(t<1)).*(t)+((1<=t)&(t<=2)).*1;
y = filter(h_t, 1, x1);

% figure
% Visualizar la respuesta en frecuencia del filtro
% freqz(x1, 1);
 
figure
plot(t,y)
xlim([0 5])
title("Señal x(t) filtrada con h(t)")
