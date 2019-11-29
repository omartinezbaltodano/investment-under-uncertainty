function [Vd rho] = graph57(delta,sigma,I)
%--------------------------------------------------------------------------
% Purpose :   This function gives a serie of Vstar values that are need to 
%             do the graph in page 158 of Dixit & Pindick (1994) for values 
%             of r in [0,0.14],
%             delta = rho - alpha, but here is treated as fixed and only r
%             is letting vary
%--------------------------------------------------------------------------
% Inputs  : rho   : 1x1  Tasa de descuento
%           alpha : 1x1  Drift del GBM
%           I     : 1x1  Monto de la inversion Inicial
%           delta : 1x1  
%--------------------------------------------------------------------------
% Output  : Vstar : Nx1  is the value of the project for which is optimum 
%                        invest, one value for each sigma

rho = [0:0.01:0.14]';
N   = size(rho,1);
Vd  = NaN(N,1);

for i=1:N
    if sigma < 0.000000000001
 Vd(i,:) = I;
    else
 beta1   = 0.5 - (rho(i,:)-delta)/(sigma.^2) + sqrt( ((rho(i,:)-delta)/sigma.^2 -0.5)^2 +2*(rho(i,:)/sigma.^2));
 Vd(i,:) = (beta1/(beta1-1))*I;
    end 
end