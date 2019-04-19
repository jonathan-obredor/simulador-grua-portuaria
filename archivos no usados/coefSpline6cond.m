function a= coefSpline6cond(t0,tf,x0,xp0,xpp0,xf,xpf,xppf)
% coeficientes de un spline de 5 constantes, que tiene 6 condiciones
a=zeros(1,5);
%pdf
% a(1)=x0;
% a(2)=xp0;
% a(3)=xpp0/2;
% a(4)= ( 20*xf-20*x0-(8*xpf+12*xp0)*tf-(3*xppf-xpp0)*tf^2 ) / (2*tf^3);
% a(5)= ( 30*x0-30*xf+(14*xpf+16*xp0)*tf+(3*xppf-2*xpp0)*tf^2 ) / (2*tf^4);
% a(6)= ( 12*xf-12*x0-(6*xpf+6*xp0)*tf-(xppf-xpp0)*tf^2 ) / (2*tf^5);

%craig , robotics
a(1)=x0;
a(2)=xp0;
a(3)=xpp0/2;
a(4)= ( 20*xf-20*x0-(8*xpf+12*xp0)*tf-(3*xpp0-xppf)*tf^2 ) / (2*tf^3);
a(5)= ( 30*x0-30*xf+(14*xpf+16*xp0)*tf+(3*xpp0-2*xppf)*tf^2 ) / (2*tf^4);
a(6)= ( 12*xf-12*x0-(6*xpf+6*xp0)*tf-(xpp0-xppf)*tf^2 ) / (2*tf^5);
end

