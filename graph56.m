function [delta Vstar] = graph56(sigma, I)
%--------------------------------------------------------------------------
% Purpose :   This function gives a serie of Vstar values that are need to 
%             do the graph in page 157 of Dixit & Pindick (1994) for values 
%--------------------------------------------------------------------------
% Inputs  : sigma : 1x1  Standar error
%           I     : 1x1  Initial investment
%--------------------------------------------------------------------------
% Output  : Vstar : Nx1  is the value of the project for which is optimum 
%                        invest, one value for each sigma
%--------------------------------------------------------------------------

alpha   = 0.02;
rho     = [0.02:0.001:0.3]';
N       = size(rho,1);

delta   = NaN(N,1);
beta1   = NaN(N,1);
Vstar     = NaN(N,1);
for i=1:N
delta(i,:)   = rho(i,:)-alpha;
beta1(i,:)   = 0.5 - (rho(i,:)-delta(i,:))/(sigma.^2) + sqrt( ((rho(i,:)-delta(i,:))/sigma.^2 -0.5)^2 +2*(rho(i,:)/sigma^2));
Vstar (i,:)     = (beta1(i,:)/(beta1(i,:)-1))*I;
end

return 