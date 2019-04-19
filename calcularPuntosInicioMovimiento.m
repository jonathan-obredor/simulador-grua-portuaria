function [alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro,y_destino]=calcularPuntosInicioMovimiento(betaTriangulo,x_origen,x_destino,geometria)
hold on

%inicialiar las variables
alturaInicioDesplazamientoCarro=-999;
PosicionCarroInicioDescensoIzaje=-999;
y_destino=999;
ySeguridadCarro=geometria.altoVigaTestera;
global lineaSeguridad

[nroContMuelle,nroContBarco,alturasContMuelle,alturasContBarco] = determinarAlturasContenedores(geometria);



%determinar si es una operacion de ida desde el barco hasta el muelle o
%viceversa
if x_origen>=0 && x_destino<0 %barco hasta el muelle
    title('ida del barco al muelle')
    %determinar las coordenadas "Y" de las trayectorias y graficar
    nroColOrigen=round(abs(x_origen)/geometria.divHoriz);
    if nroColOrigen<1
        nroColOrigen=1;
    end
    %         y_origen=alturasContBarco(nroColOrigen);
    %     rectangle('Position',[x_origen,y_origen-geometria.altoCont,geometria.altoCont,anchoCont],'FaceColor','green')
    nroColDestino=round(abs( (geometria.xt_min-x_destino)/geometria.divHoriz)); %revisar modificando la x_destino
    y_destino=alturasContMuelle(nroColDestino);
    %     rectangle('Position',[x_destino,y_destino-geometria.altoCont,geometria.altoCont,anchoCont],'FaceColor','green')

    y_destino=verificarChoquesLaterales(y_destino,nroColDestino,geometria.nroHorizContMuelle,alturasContMuelle);
    
    %establecer la altura minima a la que debe elevarse el izaje para no chocar
    %este bloque de codigo nunca baja la linea de seguridad!!!!!!!!!
    for i=1: nroColOrigen
        if ySeguridadCarro<alturasContBarco(i)
            ySeguridadCarro=alturasContBarco(i);
        end
    end
    for i=nroColDestino:1:geometria.nroHorizContMuelle
        if ySeguridadCarro<alturasContMuelle(i)
            ySeguridadCarro=alturasContMuelle(i);
        end
    end
    if ySeguridadCarro<=geometria.altoVigaTestera %evitar que los contenedores choquen con la viga testera
        ySeguridadCarro=geometria.altoVigaTestera;
    end
    ySeguridadCarro=ySeguridadCarro+2*geometria.altoCont; %el sistema pasara siempre a una altura equivalente a dos contenedores cuando se desplace
    lineaSeguridad=line([-30, 50], [ySeguridadCarro, ySeguridadCarro],'LineStyle','--');
%     set(lineaSeguridad,'visible','on')
    
    [alturaInicioDesplazamientoCarro,catetoHoriz]=trianguloAceleracion(ySeguridadCarro,x_origen,betaTriangulo,nroColOrigen,alturasContBarco,geometria);
    PosicionCarroInicioDescensoIzaje=trianguloDesaceleracion(ySeguridadCarro,x_destino,betaTriangulo,nroColDestino,alturasContMuelle,geometria);
    
    
    
elseif x_origen<0 && x_destino>=0 %muelle al barco
    title('ida del muelle al barco')
    nroColOrigen=round(abs( (geometria.xt_min-x_origen)/geometria.divHoriz));
    if nroColOrigen<1 %si la resta geometria.xt_min-x_origen es = a cero, significa que estoy en la primera columna
        nroColOrigen=1;
    end
    %         y_origen=alturasContMuelle(nroColOrigen);
    nroColDestino=floor(abs(x_destino)/geometria.divHoriz);
    y_destino=alturasContBarco(nroColDestino);
    
    y_destino=verificarChoquesLaterales(y_destino,nroColDestino,geometria.nroHorizContBarco,alturasContBarco);
    
    %establecer la altura minima a la que debe elevarse el izaje para no chocar
    for i=1:1: nroColDestino
        if ySeguridadCarro<alturasContBarco(i)
            ySeguridadCarro=alturasContBarco(i);
        end
    end
    for i=nroColOrigen:1:geometria.nroHorizContMuelle
        if ySeguridadCarro<alturasContMuelle(i)
            ySeguridadCarro=alturasContMuelle(i);
        end
    end
    ySeguridadCarro=ySeguridadCarro+2*geometria.altoCont;
    plot([-30, 50], [ySeguridadCarro, ySeguridadCarro],'--')
    
    [alturaInicioDesplazamientoCarro,catetoHoriz]=trianguloAceleracion(ySeguridadCarro,x_origen,betaTriangulo,nroColOrigen,alturasContMuelle,geometria);
    PosicionCarroInicioDescensoIzaje=trianguloDesaceleracion(ySeguridadCarro,x_destino,betaTriangulo,nroColDestino,alturasContBarco,geometria);
elseif x_origen<0 && x_destino<0
    title('movimiento de origen y destino en el muelle, implementar!!!')
%     alturaInicioDesplazamientoCarro=-999;
%     PosicionCarroInicioDescensoIzaje=-999;
    
elseif x_origen>=0 && x_destino>=0
    title('movimiento de origen y destino en el barco, implementar!!!')
%     alturaInicioDesplazamientoCarro=-999;
%     PosicionCarroInicioDescensoIzaje=-999;
    
end




end %fin de la funcion




