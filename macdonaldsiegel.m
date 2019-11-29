function [Vd F_Vd1 F_Vd2 beta1 Vs A F_V2] = macdonaldsiegel(rho, alpha, sigma, I)
%--------------------------------------------------------------------------
%Proposito: Calcula la funcion valor del modelo de macdonald and siegel
%           (1986), tanto para el caso deterministico como para el caso 
%           estocastico 
%--------------------------------------------------------------------------
% (1) Para que el problema tenga sentido es necesario que alpha < rho.
% (2) Recordar que en este caso el GBM tiene la forma 
%                          dV=alpha V dt + sigma V dz
%--------------------------------------------------------------------------
% Output  : V*   : Para que valor del proyecto es optimo invertir 
%           F_V1 : Valor de la investment oportunity si V<=V^*
%           F_V2 : Valor de la investment oportunity si V>V^*
%           La solucion del problema estocastico tiene la forma AV^beta1
%           Aqui se da el A, el Vs y el beta1
%           F_Vs : Es el valor de la investment oportunity en el modelo
%           estocasico 
%--------------------------------------------------------------------------
% Input   : rho   : 1x1  Tasa de descuento
%           alpha : 1x1  Drift del GBM
%           I     : 1x1  Monto de la inversion Inicial
%           sigma : 1x1 Varianza del movimiento browniano geometrico
%--------------------------------------------------------------------------

% Caso deterministico

% V^*
Vd   = (rho/(rho-alpha))*I

% investment oportunity 
F_Vd1 = (alpha*I/(rho-alpha))*((rho-alpha)*Vd/(rho*I))^(rho/alpha) 
F_Vd2 = Vd-I

% Caso estocasico
delta = rho - alpha;

beta1 = -(rho-delta)/sigma^2  + 0.5 + sqrt( (rho-delta)^2/sigma^4 + delta/sigma^2 + 0.25 + 2*rho/sigma^2  )

Vs    = (beta1/(beta1-1))*I 
A     = (Vs -I)/Vs^beta1
F_Vs  = A*Vs^beta1

return


