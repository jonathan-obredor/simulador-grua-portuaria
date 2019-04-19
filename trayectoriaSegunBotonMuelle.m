function [alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro, x_origen, x_destino,y_destino] = trayectoriaSegunBotonMuelle(nroBoton, ~)
global geometria
global vmaxh vmaxhfull vmaxt 
%obtener posicion actual del carro
datosBloquePosicion=get_param('ProyectoAutomatasSimulink_jona/Grua Portuaria1/Carro/x_t','RuntimeObject');
x_origen=datosBloquePosicion.OutputPort(1).Data;
datosBloqueAutomata=get_param('ProyectoAutomatasSimulink_jona/Controlador/automata','RuntimeObject');
Gcierre=datosBloqueAutomata.OutputPort(1).Data;
if Gcierre
    vIzaje=vmaxhfull;
else
    vIzaje=vmaxh;
end
%definir destino del carro segun el boton presionado
x_destino=geometria.xt_min+geometria.divHoriz*nroBoton;
%generar trayectoria y mostrar
[alturaInicioDesplazamientoCarro, PosicionCarroInicioDescensoIzaje,ySeguridadCarro,y_destino]=generacionDeTrayectoria1(x_origen,x_destino,vIzaje,vmaxt,geometria);
