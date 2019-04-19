%GeneratrayectoriaCarro
%probar una trayectoria del carro

clc
clear all
close all
%4 puntos son necesarios para definir la trayectoria
%el carro se mueve hacia la izquierda
puntosTrayectoria=4;
dt=0.01; %resolucion buscada del spline

p1=[45 -10];
p2=[35  35];
p3=[0   30];
p4=[-15  6];

vMaxX=4;
aMax=1;
vMaxY=1.5;

%%
%usando polinomios de grado 5, splines de grado 5

% %seria mas eficiente si el algoritmo puede 
% %determinar las condiciones intermedias de aceleracion y velocidad
% 
%          %x0    xf    xp0     xpf     xpp0     xppf
% splineX1=[p1(1) p2(1) 0       -vMaxX  -aMax    0   ];
% splineX2=[p2(1) p3(1) -vMaxX  -vMaxX   0       0   ];
% splineX3=[p3(1) p4(1) -vMaxX   0       0       aMax]; %con estos valores el carro no puede desacelerar y llegar al destino a tiempo
% pX=[splineX1 splineX2 splineX3];
%           %x0    xf    xp0     xpf     xpp0     xppf
% splineY1=[p1(2) p2(2)  0        0      aMax     -aMax  ];
% splineY2=[p2(1) p3(1)  0       -vMaxY  -aMax    0      ]; %sacar las restricciones de la aceleracion???
% splineY3=[p3(1) p4(1)  -vMaxY   0      0        aMax  ]; %con estos valores el carro no puede desacelerar y llegar al destino a tiempo
% pY=[splineY1 splineY2 splineY3];
% 
% tiemposX=[];tiemposY=[];
% disp('x')
% [tiemposX,trayectoriaX]=trayectoriaUnEje(pX,3,dt);
% disp('y')
% [tiemposY,trayectoriaY]=trayectoriaUnEje(pY,3,dt);
% 
% 
% 
% 
% figure
% %plot(trayectoria)
% plot(0:dt:size(trayectoriaX,2)*dt-dt,trayectoriaX)
% grid on
% figure
% %plot(trayectoria)
% plot(0:dt:size(trayectoriaY,2)*dt-dt,trayectoriaY)
% grid on

%%

t0=0;
x= spline4cond(t0,tf,x0,xp0,xf,xpf,dt)



