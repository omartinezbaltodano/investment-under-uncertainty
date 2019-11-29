function [F_V V A Vstar H] = graph511_2(r,mu,eta,V_var,sigma,Vlast,I)
%--------------------------------------------------------------------------
% Purpose  : Gives values of V and F(V) to make the graph in page 164 in
%            Dixit and Pindyck (1994).
%--------------------------------------------------------------------------
% Inputs  : r     : 1x1 Risk-free interes rate 
%           mu    : 1x1 Risk adjusted return 
%           eta   : 1x1 Speed of reversion
%           V_var : 1x1 The "normal" level of V
%           sigma : 1x1 Standard error
%           Vlast : 1x1 Max level of V on the graph we want
%--------------------------------------------------------------------------
% Output  : V     : Nx1
%           F(V)  : Nx1
%--------------------------------------------------------------------------
theta = (1/2) +(mu-r-eta*V_var)/(sigma.^2) +sqrt(((r-mu+eta*V_var)/(sigma.^2)-1/2).^2+ 2*r/(sigma.^2));

%%

V         = (0:0.01:Vlast)';
N         =  size(V,1);
F_V       =  NaN(N,1);
A         =  NaN(1,1);
Vstar     =  NaN(1,1);
H         =  NaN(N,1)
x         =  NaN(N,3);
for i=1:N
    x0                          = [1,1,1];
    x                           = fsolve(@(x)ConstraE2(x,I,theta,r,mu,eta,V_var,sigma),x0);
    A                           = x(1,1);
    Vstar                       = x(1,2);
    if V(i,:)< Vstar 
    H(i,:)                      = kummerMeanReverting(r,mu,eta,V_var,sigma,V(i,:)) 
    F_V(i,:)                    = A*Vstar^theta*H(i,:);
    else 
    F_V(i,:)                    = V(i,:)-I
    end
end

return 



