function x= spline4cond(t0,tf,x0,xp0,xf,xpf,dt)
%calcular un spline entre 2 puntos dados
a= coefSpline4cond(t0,tf,x0,xp0,xf,xpf);

tt=t0:dt:tf;
x=zeros(size(tt));
i=1;
for t=t0:dt:tf
    x(i)=a(1)+a(2)*t+a(3)*t^2+a(4)*t^3;
    i=i+1;
end


%mostrar posicion velocidad y aceleracion
figure
plot (tt,x)
grid on
figure
xp = diff(x);
plot(t0:dt:tf-dt,xp)
grid on
figure
xpp = diff(xp);
plot(t0:dt:tf-2*dt,xpp)
grid on

end