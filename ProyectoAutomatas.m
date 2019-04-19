% clear all;
clear variables
close all; %cierra la interfaz grafica!
clc
global vmaxh vmaxhfull vmaxt %corregir para pasar como argumentos
% global PosicionCarroInicioDescensoIzaje alturaInicioDesplazamientoCarro ySeguridadCarro x_destino
%%
%Condiciones iniciales
g=9.80665;
dt=0.001;        %%Paso de tiempo sistema discreto
xl0=-30;
vlx0=0;
alx0=0;
xt0=-30;
vt0=0;
at0=0;
vly0=0;
aly0=0;
lh0=5;
vh0=0;
ah0=0;
%%
%Datos del carro y accionamiento
mc=50000;
Jmc=10;
Jwc=2;
rc=15;
Rw=0.5;
beqc=30;
amaxt=1;
vmaxt=4;
%%
%Datos del izaje y accionamiento
ml0=15000;          %Peso gancho vacio
mlempty=17000;      %Peso gancho con contenedor vacio
mlfull=65000;       %Peso Gancho con contenedor lleno
Jdh=8;
Jmh=30;
rh=30; %relacion de transmision?
Rd=0.75; %Radio primitivo de tambor
amaxh=1;
vmaxh=3;
vmaxhfull=1.5;      %Velocidad de izaje con carga maxima
vmaxhSobrepeso=0.1; %velocidad del izaje cuando el contenedor peso demasiado
beqh=18;
%%
%Calculos del carro y accionamiento
bt=beqc/Rw^2;
Mt=mc+(Jwc+Jmc*rc^2)/Rw^2;
Ttmax=((Mt+mlfull)*amaxt+bt*vmaxt)*Rw/rc;
%%
%Calculos del izaje y accionamiento
bh=beqh/Rd^2;
Mh=(Jdh+Jmh*rh^2)/Rd^2;
Thmax=((Mh+mlfull)*(amaxh+g)+bh*vmaxh)*Rd/rh;
%%
%Datos del Cable elastico amortiguado
Kw=1800*10^3;
bw=30*10^3;
yt0=45;
yl0=yt0-lh0-ml0*g/Kw;
l0=yt0-yl0;
%%
%%PID Izaje considerar 1kHz de ancho de banda
wposh=500;
nh=2;
Jh=Mh*Rd/rh;
bah=Jh*nh*wposh;
Ksah=bah*wposh;
Kisah=Ksah*wposh/nh;
%%
%%PID Carro
wpost=500;
nt=2;
Jt=Mt*Rw/rc;
bat=Jt*nt*wpost;
Ksat=bat*wpost;
Kisat=Ksat*wpost/nt;
%%
%%PID Pendulo
%T=2*pi*(l/g)^0.5
na=3;

%ganancia que pondera la accion del PID del carro con el PID del angulo
ponderaPIDangulo=-1/1.3e19;




%%

% %limites del carro - trolley - se dejan para usarse en stateflow
xt_max=50;
% xt_max_max=51;
xt_min=-30;


%%
%guardar los datos de la geometria de la situacion en una estructura de
%datos
global geometria
%limites del carro - trolley
geometria.xt_max=50;
geometria.xt_max_max=51;
xt_max_max=51;
geometria.xt_min=-30;
geometria.xt_min_min=-31;
%limites del izaje
geometria.y_max=40;
geometria.y_max_max=41;
geometria.y_min=-20;
geometria.y_min_min=-21;
%parametros de los contenedores
geometria.altoCont=2.591;   %metros
geometria.anchoCont=2.438;
%largoCont=6.058;
geometria.separacionEntreCont=0.5;

%distribucion de contenedores en el barco
geometria.yDistrBarco=(geometria.y_max-geometria.y_min)-2*geometria.altoCont;   % va desde -20 hasta 40m
geometria.nroVertContBarco=floor(geometria.yDistrBarco/geometria.altoCont);
geometria.xDistrBarco=geometria.xt_max;             % va desde el origen hasta los 50m
geometria.divHoriz=geometria.anchoCont+geometria.separacionEntreCont;
geometria.nroHorizContBarco=floor((geometria.xDistrBarco-geometria.anchoCont)/geometria.divHoriz);
geometria.contBarco=zeros(geometria.nroVertContBarco,geometria.nroHorizContBarco);

%distribucion de contenedores en el muelle
% yDistrMuelle=(y_max-altoCont)/2;%llenar muelle hasta la mitad de la altura para mayor comodidad en la operacion
geometria.nroVertContMuelle=2;                    %floor(yDistrMuelle/altoCont);
geometria.xDistrMuelle=abs(geometria.xt_min+geometria.anchoCont);
geometria.nroHorizContMuelle=floor((geometria.xDistrMuelle-geometria.anchoCont)/geometria.divHoriz);
geometria.contMuelle=zeros(geometria.nroVertContMuelle,geometria.nroHorizContMuelle);
geometria.altoVigaTestera=15;

%generar una distribucion inicial de contenedores en el barco
for i=1: geometria.nroHorizContBarco
    cantidadCont=1+floor( (geometria.nroVertContBarco).*rand(1,1) ); %TODO: revisar si se genera el maximo valor en algun momento?!?!?!?!
    for j=geometria.nroVertContBarco:-1:cantidadCont
        geometria.contBarco(j,i)=1;
    end
end
%generar una distribucion inicial de contenedores
cantidadCont=0;
for i=1: geometria.nroHorizContMuelle
    cantidadCont=1+floor( (geometria.nroVertContMuelle).*rand(1,1) );
    for j=geometria.nroVertContMuelle:-1:cantidadCont
        geometria.contMuelle(j,i)=1;
    end
end

%holder para graficar y mantener rectangulos en la memoria
global holderBarco holderMuelle
% geometria.holderBarco = gobjects(size(geometria.contBarco)); %es incompatible con simulink?!?!?!?!?!?!?!?!?!
holderBarco = gobjects(size(geometria.contBarco));
holderMuelle = gobjects(size(geometria.contMuelle));



%%
% uiopen('ProyectoAutomatasSimulink_jona.slx',1)
load_system('ProyectoAutomatasSimulink_jona.slx')
% disp('el modelo esta cargdo en la memoria, no es necesario abrir el modelo en simulink')


constSegCarro=12;
distanciaSegMaxCarro=geometria.xt_max-constSegCarro; %TODO: calcular distancia para iniciar la desaceleracion cerca de los limites
distanciaSegMinCarro=geometria.xt_min+constSegCarro; %TODO: calcular distancia para iniciar la desaceleracion cerca de los limites

tiempoTransicionAutMan=1; %Segundos

l_max_cable=65; %maxima extension del cable en el fondo del barco
l_min_cable=5; %el cable queda extendido 5 metros minimo

constSegCable=5;
longitudSegMaxCable=l_max_cable-constSegCable;
longitudSegMinCable=l_min_cable+constSegCable;

%algoritmo prueba de operacion automatica
% PosicionCarroInicioDescensoIzaje=-999;
% alturaInicioDesplazamientoCarro=-999;
% x_destino=-30;
% ySeguridadCarro=40;
%establecer parametros para evitar la operacion automatica en el inicio
setParamTrayectoria(-999, -999,40, xt0, xt0,40);


%%
interfazPrueba

%%opcregister