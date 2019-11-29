function vars = thresholdSS(r,delta,sigma,vars0,Q,C,II,E)
%--------------------------------------------------------------------------
% Purpose : Gives the value of A1,B2,pl,ph that solve the system of
%           equations 
%--------------------------------------------------------------------------
% Inputs  : vars0 : 1x4 guess for the vector of variables, the order is of 
%                       of the form [A1, ph, B2, pl] where
%                       A1 is a constant in the equation of idle firm
%                       ph is the upper threshold of price
%                       B2 is a constant in the equation of active firm
%                       pl is the lower threshold of price
%           Q     : 1x1 Level of production
%           delt  : 1x1 delta value, r-alpha 
%           C     : 1x1 variable cost of production
%           r     : 1x1 Interes rate 
%           II    : 1x1 Initial level of investment
%           E     : 1x1 lump sum cost of abandon 
%           sigma : 1xN Variance of the level of prices
%--------------------------------------------------------------------------
% Output  : vars  : 1x4 guess for the vector of variables, the order is of 
%                       of the form [A1, ph, B2, pl] where
%                       A1 : is a constant in the equation of idle firm
%                       ph : is the upper threshold of price
%                       B2 : is a constant in the equation of active firm
%                       pl : is the lower threshold of price
%--------------------------------------------------------------------------

%sigma  = 0.1:0.01:0.4;
N      = size(sigma,2);
Beta1  = NaN(N,1);
Beta2  = NaN(N,1);
vars   = NaN(N,4);
for i = 1:N
   Beta1(i,:)  = 0.5 -(r-delta)/sigma(i)^2 + sqrt(((r-delta)/sigma(i)^2 - 0.5)^2+2*r/(sigma(i)^2));
   Beta2(i,:)  = 0.5 -(r-delta)/sigma(i)^2 - sqrt(((r-delta)/sigma(i)^2 - 0.5)^2+2*r/(sigma(i)^2));
   opts        = optimset('fsolve');
   opts        = optimset(opts,'Maxiter',900,'Tolx',1e-4,'tolfun',1e-4);
   vars(i,:)   = fsolve(@fff,vars0,opts,Q,Beta1(i,:),Beta2(i,:),delta,C,r,II,E)
end

return 