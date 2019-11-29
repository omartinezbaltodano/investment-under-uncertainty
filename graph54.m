function [Vd] = graph54(rho, alpha,I)
%--------------------------------------------------------------------------
% Purpose :   This function gives a serie of Vstar values that are need to 
%             do the graph in page 155 of Dixit & Pindick (1994) for values 
%             of sigma in [0,1]
%--------------------------------------------------------------------------
% Inputs  : rho   : 1x1  Tasa de descuento
%           alpha : 1x1  Drift del GBM
%           I     : 1x1  Monto de la inversion Inicial
%--------------------------------------------------------------------------
% Output  : Vstar : Nx1  is the value of the project for which is optimum 
%                        invest, one value for each sigma
%--------------------------------------------------------------------------

delta   = rho-alpha;

sigma = [0:0.01:1]';
N     = size(sigma,1);
Vd    = NaN(N,1);

%--------------------------------------------------------------------------
for i=1:N
    
    if sigma(i,:) < 0.000000000001
 Vd(i,:) = I;
    else
 beta1   = 0.5 - (rho-delta)/(sigma(i,:).^2) + sqrt( ((rho-delta)/sigma(i,:).^2 -0.5)^2 +2*(rho/sigma(i,:).^2));
 Vd(i,:) = (beta1/(beta1-1))*I;
    end 
end


return