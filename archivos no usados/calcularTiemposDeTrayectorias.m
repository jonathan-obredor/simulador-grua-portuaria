%%
%calculo de trayectorias

% %calcularTiemposDeTrayectorias
% 
% %las trayectorias tienen una rampa de aceleracion, velocidad maxima, y
% %maxima desaceleracion hasta el punto de destino con velocidad cero.
% 
% %tiempo necesario para llevar del reposo a la maxima velocidad
% tiempoAceleracionCarroVacio=4.1; %segundos
% distanciaRecorridaEnAceleracionYDesaceleracionCarroVacio=16; %metros
% 
% tiempoAceleracionIzajeVacio=3.1;
% distanciaRecorridaEnAceleracionYDesaceleracionIzajeVacio=9;
% 
% tiempoAceleracionIzajeCargado=1.6;
% distanciaRecorridaEnAceleracionYDesaceleracionIzajeCargado=2.25;
% 
% 
% %para el carro
% x_origen=30;
% x_destino=2;
% 
% distanciaTotalX=abs(x_destino-x_origen);
% distVelocidadConstante=distanciaTotalX-distanciaRecorridaEnAceleracionYDesaceleracionCarroVacio;
% tiempoVelocidadConstante=distVelocidadConstante/vmaxt; %MRU movimiento rectilineo uniforme
% tiempoTotalCarroVacio=tiempoVelocidadConstante+2*tiempoAceleracionCarroVacio;


% %para el izaje vacio
% y_origen=-15; %esta definido mas abajo, corregir!!!!
% y_destino=3;
% y_minimaSegura=30;
% %ascenso
% distanciaTotalY=abs(y_minimaSegura-y_origen);
% distVelocidadConstanteY=distanciaTotalY-distanciaRecorridaEnAceleracionYDesaceleracionIzajeVacio;
% tiempoVelocidadConstanteY=distVelocidadConstanteY/vmaxh;
% tiempoTotalIzajeVacio=tiempoVelocidadConstanteY+2*tiempoAceleracionIzajeVacio
% %descenso
% distanciaTotalYdescenso=abs(y_destino-y_minimaSegura);
% distVelocidadConstanteYdescenso=distanciaTotalYdescenso-distanciaRecorridaEnAceleracionYDesaceleracionIzajeVacio;
% tiempoVelocidadConstanteYdescenso=distVelocidadConstanteYdescenso/vmaxh;
% tiempoTotalIzajeVaciodescenso=tiempoVelocidadConstanteYdescenso+2*tiempoAceleracionIzajeVacio
