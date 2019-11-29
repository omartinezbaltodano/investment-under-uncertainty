function f=fff(vars,Q,Beta1,Beta2,delt,C,r,II,E)
%--------------------------------------------------------------------------
% Purpose : this is the nonlinear system showed in eq. 9 to 12 in page 218
%           in Dixit and Pindyck (1994)
%--------------------------------------------------------------------------
% Inputs  : vars  : 1x4 guess for the vector of variables, the order is of 
%                       of the form [A1, ph, B2, pl] where
%                       A1 is a constant in the equation of idle firm
%                       ph is the upper threshold of price
%                       B2 is a constant in the equation of active firm
%                       pl is the lower threshold of price
%           Q     : 1x1 Level of production
%           Beta1 : 1x1 The exponent of P in the solution to the 
%                       differential equation of inactive firm
%           Beta2 : 1x1 The exponent of P in the solution to the 
%                       differential equation of active firm
%           delt  : 1x1 delta value, r-alpha 
%           C     : 1x1 variable cost of production
%           r     : 1x1 Interes rate 
%           II    : 1x1 Initial level of investment
%           E     : 1x1 lump sum cost of abandon 
%--------------------------------------------------------------------------
% Output  : vars  : 1x4 guess for the vector of variables, the order is of 
%                       of the form [A1, ph, B2, pl] where
%                       A1 : is a constant in the equation of idle firm
%                       ph : is the upper threshold of price
%                       B2 : is a constant in the equation of active firm
%                       pl : is the lower threshold of price
%--------------------------------------------------------------------------
 f    = zeros(4,1);
 A1   = vars(1);
 ph   = vars(2);
 B2   = vars(3);
 pl   = vars(4);
 f(1) = -Q*A1*ph^Beta1 + B2*Q*ph^Beta2 + Q*ph/delt -Q*C/r - II;
 f(2) = -Beta1*A1*Q*ph^(Beta1-1) + B2*Q*Beta2*ph^(Beta2-1) + Q/delt;
 f(3) = -A1*Q*pl^Beta1 + B2*Q*pl^Beta2 + Q*pl/delt -Q*C/r + E;
 f(4) = -Beta1*A1*Q*pl^(Beta1-1) + B2*Q*Beta2*pl^(Beta2-1) + Q/delt;
 
return 