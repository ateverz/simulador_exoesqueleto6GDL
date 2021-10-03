%-- Construcción de la matriz de inercia considerando la iteración de i=1:N
% Parámetros:
%       - Vector de masas de cada eslabón.
%       - Jacobiano Geométrico de los centros de masa.
%       - Cinemática Directa de cada centro de masa [Lista].
%       - Tensor de inercia de cada centro de masa [Lista].

function H = inertia_matrix(mass,J_cm, FK, IT)
    N = length(mass);
    H = zeros(N);
    for i  = 1:N
        J_cm_i = reshape(J_cm(i,:), 6, N);
        Jv_cm_i = J_cm_i(1:3,:);
        Jw_cm_i = J_cm_i(4:6,:);
        
        FK_i = reshape(FK(i,:), 4, 4);
        IT_i = reshape(IT(i,:), 3, 3);
        
        rotmatrix0_i = FK_i(1:3,1:3);
        linear = mass(i)*(Jv_cm_i)'*Jv_cm_i;
        angular = (Jw_cm_i')*(rotmatrix0_i)*(IT_i)*(rotmatrix0_i')*(Jw_cm_i);
        H = H + linear + angular;
    end
        H = (1/2)*H;
end