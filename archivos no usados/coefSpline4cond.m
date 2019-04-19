function a= coefSpline4cond(t0,tf,x0,xp0,xf,xpf)
a=[];
a(1)=x0;
a(2)=xp0;
a(3)=  (3/tf^2)*(xf-x0)-(2/tf)*xp0-xpf/tf;
a(4)= -(2/tf^3)*(xf-x0)+      (xp0+xpf)/tf^2;
end