%generacionDeTrayectorias

figure
dibujarSituacionInicial1(xt_min,xt_min_min,xt_max_max,y_min_min,y_max_max,altoVigaTestera,nroHorizContBarco,nroVertContBarco,nroHorizContMuelle,nroVertContMuelle,contBarco,contMuelle,divHoriz,altoCont,anchoCont)

%calculo del triangulo de velocidades para las trayectorias
%en el caso del izaje vacio
aTriangulo=vmaxh; %cateto horizontal
% bTriangulo=vmaxhfull; %izaje con contenedor
bTriangulo=vmaxt; %cateto vertical , izaje vacio
cTriangulo=sqrt((aTriangulo^2)+(bTriangulo^2)); %hipotenusa
betaTriangulo=asin(bTriangulo/cTriangulo); %angulo de la hipotenusa de velocidades con la vertical

x_origen=divHoriz*3;
x_destino=xt_min+divHoriz*6;

% x_destino=divHoriz*16;
% x_origen=xt_min+divHoriz*1;

[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje]=calcularPuntosInicioMovimiento(betaTriangulo,x_origen,x_destino)

