function y_destino = verificarChoquesLaterales(y_destino,nroColDestino,nroMaxCont,alturasContenedores)
%verificar si a cada lado del destino la pila de contenedores es mas
%alta, de ser asi, modificar el valor de la y_destino para evitar choques
%laterales debido a las oscilaciones
if nroColDestino==1
    if alturasContenedores(2) > y_destino %al lado es mas alto
        y_destino=alturasContenedores(2);
    end
elseif nroColDestino==nroMaxCont %esta en la ultima columna
    if alturasContenedores(nroMaxCont-1) > y_destino %al lado es mas alto
        y_destino=alturasContenedores(nroMaxCont-1);
    end
else %esta en cualquier posicion intermedia
    if alturasContenedores(nroColDestino-1) > y_destino %a la izquierda es mas alto
        y_destino=alturasContenedores(nroColDestino-1);
    end
    if alturasContenedores(nroColDestino+1) > y_destino %a la derecha es mas alto
        y_destino=alturasContenedores(nroColDestino+1);
    end
end