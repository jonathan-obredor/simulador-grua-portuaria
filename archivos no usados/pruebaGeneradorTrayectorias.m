clc
close all
x0=45;
xf=35;
xp0=0;
xpf=-4;
xpp0=-1;
xppf=0;
p1=[x0 xf xp0  xpf xpp0 xppf];
p2=[35 5 -4   0   0    -1  ]; %seria mas eficiente si el algoritmo puede determinar las condiciones intermedias de aceleracion y velocidad
%p3=[20 15 -4    0   0    1  ];

p=[p1 p2];
dt=0.01;

[tiempos,trayectoria]=trayectoriaUnEje(p,2,dt);
figure
plot(0:dt:size(trayectoria,2)*dt-dt,trayectoria)
grid on