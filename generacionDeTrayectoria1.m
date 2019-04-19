function [alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro,y_destino]=generacionDeTrayectoria1(x_origen,x_destino,vIzaje,vCarro,geometria)

global linea1 linea2 linea3 linea4 lineaSeguridad
delete(linea1)
delete(linea2)
delete(linea3)
delete(linea4)
delete(lineaSeguridad)

%calculo del triangulo de velocidades para las trayectorias
aTriangulo=vCarro;
bTriangulo=vIzaje;
cTriangulo=sqrt((aTriangulo^2)+(bTriangulo^2)); %hipotenusa
betaTriangulo=asin(bTriangulo/cTriangulo); %angulo de la hipotenusa de velocidades con la vertical

[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro,y_destino]=calcularPuntosInicioMovimiento(betaTriangulo,x_origen,x_destino,geometria);
end