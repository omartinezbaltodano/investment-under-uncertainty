function [F_V, VI] = graph59(N,rho,alpha,I,sigma,V0)
%--------------------------------------------------------------------------
% Purpose :   This function gives a serie of Vstar values that are need to 
%             do the graph in page 155 of Dixit & Pindick (1994) for values 
%             of sigma in [0,1]
%--------------------------------------------------------------------------
% Inputs  : rho   : 1x1  Discount rate
%           alpha : 1x1  GBM Drift
%           I     : 1x1  Initial Investment
%           sigma : 1x1  The annual standard error
%           N     : 1x1  Length of the time serie 
%           V0    : 1x1  Initial value of the stochastic process
%--------------------------------------------------------------------------
% Output  : Vstar : Nx1  is the value of the project for which is optimum 
%                        invest, one value for each sigma
%--------------------------------------------------------------------------

delta     = rho-alpha;
beta1     = 0.5 - (rho-delta)/(sigma.^2) + sqrt( ((rho-delta)/sigma.^2 -0.5)^2 +2*(rho/sigma.^2));
Vd        = (beta1/(beta1-1))*I;
A         = ((beta1-1)^(beta1-1))/((beta1^beta1)*I^(beta1-1));


% Generating the Browniano motion Serie 
epsilon_t = normrnd(0,1,[N,1]);
V_t       = NaN(N,1);
V_t(1,1)  = V0;
F_V       = NaN(N,1);
VI        = NaN(N,1);

for i=1:N
    V_t(i+1,:) = (1+(alpha/12))*V_t(i,:)+(sigma/sqrt(12))*V_t(i,:)*epsilon_t(i,:);
    VI(i,:)    = V_t(i,:)-I;
end 


idx = find(V_t > Vd)

for i=1:N
    if i < idx(1,1)
        F_V(i,:) = A*V_t(i,:)^beta1;
    else 
        F_V(i,:) = V_t(i,:)-I;
    end
end 

return 








