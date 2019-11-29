function [rs ds] = graph58(delta, qstar,sigma)
%--------------------------------------------------------------------------
% Purpose :   This function gives a serie of Vstar values that are need to 
%             do the graph in page 159 of Dixit & Pindick (1994) for values 
%--------------------------------------------------------------------------
% Inputs  : qstar    : 1x1  Value of q tobin as expresed in pag 156
%           delta    : 1x1  
%           sigma    : 1x1 
%--------------------------------------------------------------------------
% Output  : 2r/q     : Nx1 
%           2delta/2 : Nx1
%--------------------------------------------------------------------------

delta2 = [0:0.001:2*delta]';
N      = size(delta2,1);
r      = NaN(N,1);
rs     = NaN(N,1);
ds     = NaN(N,1);

for i=1:N
    r(i,:)   = sigma^2*qstar*(2*delta2(i,:)/sigma^2)-(qstar*sigma^2)/(qstar-1);
    rs(i,:)  = 2*r(i,:)/sigma^2;
    ds(i,:)  = 2*delta2(i,:)/sigma^2;
end
