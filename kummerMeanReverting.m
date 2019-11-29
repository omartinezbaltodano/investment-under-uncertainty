function H = kummerMeanReverting(r,mu,eta,V_var,sigma,V)
%--------------------------------------------------------------------------
% Purpose : This function estimates the Kummer function with the specified
%           tolerance the generalized hypergeometric series, noted below. 
%           This solves Kummer's differential equation:
%               x*g''(x) + (b - x)*g'(x) - a*g(x) = 0
%--------------------------------------------------------------------------
% Inputs  : r     : 1x1 Risk-free interes rate 
%           mu    : 1x1 Risk adjusted return 
%           eta   : 1x1 Speed of reversion
%           V_var : 1x1 The "normal" level of V
%           sigma : 1x1 Standard error
%           V     : 1x1 Level of V
%--------------------------------------------------------------------------
% Output  : H     : 1x1 value of the confluent hypergeometric function
%--------------------------------------------------------------------------

% See page 163 Dixit and Pindyck 
theta = (1/2) +(mu-r-eta*V_var)/(sigma.^2) +sqrt(((r-mu+eta*V_var)/(sigma.^2)-1/2).^2+ 2*r/(sigma.^2));
b     = 2*theta+2*(r-mu+eta*V_var)/(sigma^2);
x     = 2*eta*V/(sigma^2);

% Default tolerance is tol = 1e-10.
tol = 1e-1000;

term = x*theta/b;
H    = 1 + term;
n    = 1;
an   = theta;
bn   = b;
nmin = 100;
while(n < nmin)||max(abs(term) > tol)
  n    = n + 1;
  an   = an + 1;
  bn   = bn + 1;
  term = x.*term*an/(bn*n);
  H    = H + term;
end


end