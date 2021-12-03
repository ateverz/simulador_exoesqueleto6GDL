%-- Decodificación de los códigos de movimiento para
%   obtener los vectores directores de rotación de
%   acuerdo a la asigmación de referenciales mediante
%   GRyMA.
% Parámetros:
%       - Código de movimiento.
%       - Valor de alpha (Elevación).
%       - Valor de beta (Desviación). 

function lambdas = rotation_vectors(code)
    a = code(end-1);
    b = code(end);
    lambdas = zeros(3,length(code)-2);
    %lambdas = cell(1,length(code));
    for i = 1:length(code)-2
        switch code(i)
            case 0
                lambda = [0 0 0]';
            case 4
                lambda = [1 0 0]';
            case 5
                lambda = [0 1 0]';
            case 6 
                lambda = [0 0 1]';
            otherwise
                lambda = [cos(a)*sin(b) sin(a)*sin(b) cos(b)]';
        end
        lambdas(:,i) = lambda; 
    end
end

