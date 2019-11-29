function [p VzeroP VoneP] = valuefun(A1,ph,B2,pl,p0,pend,Q,sigma,r,delta,C)
%--------------------------------------------------------------------------
% Purpose : Obtain the value function of the idle and active firm
%--------------------------------------------------------------------------
% Inputs  : Q      : 1x1 Level of production
%           delta  : 1x1 delta value, r-alpha 
%           C      : 1x1 variable cost of production
%           r      : 1x1 Interes rate 
%           II     : 1x1 Initial level of investment
%           E      : 1x1 lump sum cost of abandon 
%           p0     : 1x1
%           pend   : 1x1 such that p\in[p0,0end]
%           A1     : is a constant in the equation of idle firm
%           ph     : is the upper threshold of price
%           B2     : is a constant in the equation of active firm
%           pl     : is the lower threshold of price
%--------------------------------------------------------------------------
% Output  : p      : Nx1 Vector of prices
%           VzeroP : Nx1 value of the idle firm
%           VoneP  : Nx1 value of the idle firm
%--------------------------------------------------------------------------

Beta1  = 0.5 -(r-delta)/sigma^2 + sqrt(((r-delta)/sigma^2 - 0.5)^2+2*r/(sigma^2));
Beta2  = 0.5 -(r-delta)/sigma^2 - sqrt(((r-delta)/sigma^2 - 0.5)^2+2*r/(sigma^2));

p      = [p0:0.001:pend]';
N      = size(p,1);
VzeroP = NaN(N,1);
VoneP  = NaN(N,1);

for i = 1:N; 
    if p(i) <= ph
        VzeroP(i,:) = Q*A1*p(i)^Beta1; 
    else
        VzeroP(i,:) = 0;
    end
    if p(i)>=pl
        VoneP(i,:)  = Q*(B2*p(i)^Beta2 + p(i)/delta - C/r);
    else
        VoneP(i,:)  = 0;
    end
end

return 
