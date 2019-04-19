function [tiempos,trayectoria]=trayectoriaUnEje(p,nroSplines,dt)
trayectoria=[];
tiempos=[];

for i=0:6:6*(nroSplines-1)   %ejecutar 3 veces
    x0=p(1+i);
    xf=p(2+i);
    xp0=p(3+i);
    xpf=p(4+i);
    xpp0=p(5+i);
    xppf=p(6+i);

    if xpp0 ~= xppf %MRUV
        %se va a determinar el tiempo maximo que se necesita para llevar el carro
        %desde el reposo hasta la velocidad maxima
        %siendo la ecuacion de movimiento xf=x0+xp0*t+(1/2)*xpp0*t^2   ----> 0=x0-xf+xp0*t+(1/2)*xpp0*t^2
        %para la ecuación de segundo grado: a(t)^2+bt+c=0
        c=x0-xf;
        if xpp0~=0
            a=(1/2)*xpp0;
        else
            a=(1/2)*xppf;
        end
        b=xp0;
        d=b^2-4*a*c;
        if d>0
            x1=(-b+sqrt(d))/(2*a);
            x2=(-b-sqrt(d))/(2*a);
            disp('valor positivo de la raiz')
        elseif d==0
            x1=-b/(2*a);
            x2=-b/(2*a);
            disp('la raiz vale 0')
        else 
            x1=(-b+1i*sqrt(-d))/(2*a);
            x2=(-b-1i*sqrt(-d))/(2*a);
            disp('la raiz es negativa, la solucion no es posible con las condiciones dadas')
        end
        
        %TODO: es necesario determinar el tiempo de desaceleracion cuando el
        %carro esta cerca del destino!!!!
        if x1>0 && isreal(x1)
            tf=x1%tf=ceil(x1)
        elseif x2>0 && isreal(x2)
            tf=x2%tf=ceil(x2)
        else
            disp('error: no se puede determinar el tiempo de aceleracion/desaceleracion')
            return
        end
    else % MRU: movimiento rectilineo uniforme
        tf=(xf-x0)/xp0
    end
    
    
    t0=0;
    trayectoria=[trayectoria spline4cond(t0,tf,x0,xp0,xf,xpf,dt)];

    tiempos=[tiempos tf];


end


end


