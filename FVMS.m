function [Vd F_V] = FVMS(rho, alpha, I)
%--------------------------------------------------------------------------
%Proposito: Calcula la funcion valor del modelo de macdonald and siegel
%           (1986) para el caso deterministico, esto para un rango de
%           valores que van desde cero hasta 2*Vd, donde Vd es el calor
%           donde empieza a ser optimo invertir
%--------------------------------------------------------------------------
% (1) Para que el problema tenga sentido es necesario que alpha < rho.
% (2) Recordar que en este caso el GBM tiene la forma 
%                          dV=alpha V dt 
%--------------------------------------------------------------------------
% Output  : V*   : 1x1, es el valor del proyecto para el que es optimo invertir 
%           F_V  : Nx1, Valor de la investment oportunity 
%--------------------------------------------------------------------------
% Input   : rho   : 1x1  Tasa de descuento
%           alpha : 1x1  Drift del GBM
%           I     : 1x1  Monto de la inversion Inicial
%--------------------------------------------------------------------------

if rho < alpha 
    fprintf('rho debe ser > que alpha para que el problema tenga sentido')
else 
     fprintf('Los parametros parecen estar bien')
end 
% Caso deterministico

% V^*
Vd   = (rho/(rho-alpha))*I

V    = (0:0.1:2*Vd)';

F_V = NaN(size(V,1),1);
N   = size(V,1)

for i= 1:N;    
 if V(i,1) < Vd
    F_V(i,1) = (alpha*I/(rho-alpha))*((rho-alpha)*V(i,1)/(rho*I))^(rho/alpha);
 else
    F_V(i,1) = V(i,1)-I;
 end
end 


