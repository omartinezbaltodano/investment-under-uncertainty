function [P VP FP] = OptionVandProjectV(Pstar,r,mu,alpha,sigma,C,I,pmax)
%--------------------------------------------------------------------------
% Purpose  : Gives the value of a project-I and the value of an option to
%            invest
%--------------------------------------------------------------------------
% Inputs   :Pstar  : 1x1 Prices level that define the Optimal Invetment 
%                        rule, optained from function "OptimalIR" 
%           r      : 1x1 real interes rate 
%           mu     : 1x1 risk atjusted interes rate 
%           alpha  : 1x1 Drift of the brownian motion 
%           sigma  : 1x1 Standard desviation of the brownian motion 
%           I      : 1x1 Initial irreversible investment
%--------------------------------------------------------------------------
% Output   : VP    : Nx1 The value of the Project - Initial Investment
%            FP    : Nx1 The value of the option to Invest
%            P     : Nx1 Vector of prices 
%--------------------------------------------------------------------------

delta   = mu - alpha;
beta1   = 0.5 - (r-delta)/(sigma.^2) + sqrt( ((r-delta)/sigma.^2 -0.5)^2 +2*(r/sigma^2));
beta2   = 0.5 - (r-delta)/(sigma.^2) - sqrt( ((r-delta)/sigma.^2 -0.5)^2 +2*(r/sigma^2));
K1      = (C^(1-beta1))/(beta1-beta2)*[ (beta2/r)-(beta2-1)/delta];
B2      = (C^(1-beta2))/(beta1-beta2)*[ (beta1/r)-(beta1-1)/delta];
% Finding the value for A1 from equation 15 in page 191
rtside = B2*Pstar^beta2 + Pstar/delta - C/r - I; %right hand side eq. 15
A1     = rtside/Pstar^beta1;

P      = (0:0.01:pmax)';
N      = size(P,1);
FP     = NaN(N,1);
VP     = NaN(N,1);

for i = 1:N;
    if P(i) > C;
       VP(i,1) = B2*P(i)^beta2 + P(i)/delta - C/r - I; %For P>C 
       FP(i,1) = A1*P(i)^beta1;
    else
       VP(i,1) = K1*P(i)^beta1 - I;
       FP(i,1) = A1*P(i)^beta1;
    end
    if P(i,1) >= Pstar; % once P* is reached the option cannot be greater than 
                   % the underlying asset. in this case the project value 
    FP(i,1) = VP(i,1);
    end
end

return 
