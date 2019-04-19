%algunas constantes

%limites del carro - trolley
xt_max=49.5;
xt_max_max=50;
xt_min=-29.5;
xt_min_min=-30;

%la altura del carro que se debe verificar es l
% lh es la que puede medir el encoder, pero el cable se puede estirar si
% tiene peso
y_max=39.5;
y_max_max=40;
y_min=-19.5;
y_min_min=-20;

l_max_cable=65; %maxima extension del cable en el fondo del barco
l_min_cable=5; %el cable queda extendido 5 metros minimo



%%
%distribucion de contenedores

altoCont=2.591;   %metros
anchoCont=2.438;
%largoCont=6.058;

separacionEntreCont=0.5;

%en el barco
yDistrBarco=(y_max-1)-(y_min+1);   % va desde -20 hasta 40m
nroVertContBarco=floor(yDistrBarco/altoCont)
xDistrBarco=(xt_max-1);             % va desde el origen hasta los 50m
divHoriz=anchoCont+separacionEntreCont;
nroHorizContBarco=floor((xDistrBarco-anchoCont)/divHoriz)

contBarco=zeros(nroVertContBarco,nroHorizContBarco);

%en el muelle
yDistrMuelle=(y_max-1);
nroVertContMuelle=floor(yDistrMuelle/altoCont)
xDistrMuelle=abs(xt_min+1);

nroHorizContMuelle=floor((xDistrMuelle-anchoCont)/divHoriz)


contMuelle=zeros(nroVertContMuelle,nroHorizContMuelle);


%generar una distribucion inicial de contenedores

for i=1: nroHorizContBarco
    cantidadCont=1+floor( (nroVertContBarco-0).*rand(1,1) ); %genera el maximo valor en algun momento?!?!?!?!
    for j=nroVertContBarco:-1:cantidadCont
        contBarco(j,i)=1;
    end
end
%contBarco

for i=1: nroHorizContMuelle
    cantidadCont=1+floor( (nroVertContMuelle-0).*rand(1,1) ); %genera el maximo valor en algun momento?!?!?!?!
    for j=nroVertContMuelle:-1:cantidadCont
        contMuelle(j,i)=1;
    end
end
%contMuelle


