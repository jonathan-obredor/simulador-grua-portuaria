
%dibujar la situacion inicial
% figure
hold on
x = [-30 50]; y = [45 45]; plot(x,y,'g', 'LineWidth',2) %carro
x = [-30 50]; y = [40 40]; plot(x,y,'g', 'LineWidth',2) %carro
rectangle('Position',[-30,-20,30,20],'FaceColor', [0.25, 0.25, 0.25]); %rectangulo muelle
x = [xt_min_min-10 xt_min_min-10 xt_max_max+10 xt_max_max+10 xt_min_min-10]; y = [y_min_min-20 y_max_max+20 y_max_max+20 y_min_min-20 y_min_min-20]; plot(x,y, 'LineWidth',3) %cuadro exterior
x = [0 0 50 50]; y = [altoVigaTestera -20 -20 15]; plot(x,y, 'LineWidth',2) %barco y viga testera
xlim([-40 60]); ylim([-40 60]);
grid on

%generar una distribucion inicial de contenedores en el barco
for i=1: nroHorizContBarco
    cantidadCont=1+floor( (nroVertContBarco-0).*rand(1,1) ); %TODO: revisar si se genera el maximo valor en algun momento?!?!?!?!
    %for j=nroVertContBarco:-1:cantidadCont
    for j=1:nroVertContBarco
%         %crear un contenedor
%         contBarco(j,i)=1;
        if contBarco(j,i)
            %graficar un rectangulo correspondiente
            coordXcontenedor=i*divHoriz;
            coordYcontenedor=-j*altoCont+ 60.57-2*altoCont+y_min_min; %TODO: de donde sale el valor 54.4?
            rectangle('Position',[coordXcontenedor,coordYcontenedor,altoCont,anchoCont]) %x, y, alto, ancho
        end
    end
end

%generar una distribucion inicial de contenedores
for i=1: nroHorizContMuelle
    cantidadCont=1+floor( (nroVertContMuelle).*rand(1,1) ); %genera el maximo valor en algun momento?!?!?!?!
    
    %for j=nroVertContMuelle:-1:cantidadCont
    for j=1:nroVertContMuelle
        %crear un contenedor
        %contMuelle(j,i)=1;
        if contMuelle(j,i)
            %graficar un rectangulo correspondiente
            coordXcontenedor=i*divHoriz+xt_min;
            coordYcontenedor=-j*altoCont+18; %+36.274 ; %+18;  %TODO: de donde sale el valor 18?
            rectangle('Position',[coordXcontenedor,coordYcontenedor,altoCont,anchoCont]) %x, y, alto, ancho
        end
    end
end