function x= spline6cond(t0,tf,x0,xp0,xpp0,xf,xpf,xppf,dt)
%calcular un spline entre 2 puntos dados, con 6 condiciones
a= coefSpline6cond(t0,tf,x0,xp0,xpp0,xf,xpf,xppf);

tt=t0:dt:tf;
x=zeros(size(tt));
i=1;
for t=t0:dt:tf
    x(i)=a(1)+a(2)*t+a(3)*t^2+a(4)*t^3+a(5)*t^4+a(6)*t^5;
    i=i+1;
end


%mostrar posicion velocidad y aceleracion
% figure
% plot (tt,x)
% grid on
% figure
% xp = diff(x);
% plot(t0:dt:tf-dt,xp)
% grid on
% figure
% xpp = diff(xp);
% plot(t0:dt:tf-2*dt,xpp)
% grid on

end

