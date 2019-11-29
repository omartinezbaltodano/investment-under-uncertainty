function [Pstar] = OptimalIR(r,mu,alpha,sigma,C,I)
%--------------------------------------------------------------------------
% Purpose  : Gives the value of P that define the Optimal Investment Rule
%            solving the equation 17 in page 191 in Dixit & Pindyck (1994)
%--------------------------------------------------------------------------
% Inputs   : r      : 1x1 real interes rate 
%           mu     : 1x1 risk atjusted interes rate 
%           alpha  : 1x1 Drift of the brownian motion 
%           sigma  : 1x1 Standard desviation of the brownian motion 
%           I      : 1x1 Initial irreversible investment
%--------------------------------------------------------------------------
% Output   : Pstar : 1x1 P value that define the optimal investment rule.
%                        if p_t> Pstar is optimal invest otherwise is
%                        optimal to hold the option 
%--------------------------------------------------------------------------

%% Drfininf parameters in base to equation 13 and 14 in page 189
delta   = mu - alpha;
beta1   = 0.5 - (r-delta)/(sigma.^2) + sqrt( ((r-delta)/sigma.^2 -0.5)^2 +2*(r/sigma^2));
beta2   = 0.5 - (r-delta)/(sigma.^2) - sqrt( ((r-delta)/sigma.^2 -0.5)^2 +2*(r/sigma^2));
K1      = (C^(1-beta1))/(beta1-beta2)*[ (beta2/r)-(beta2-1)/delta];
B2      = (C^(1-beta2))/(beta1-beta2)*[ (beta1/r)-(beta1-1)/delta];


% Solving equation 17 numerically
firstcon  = (beta1 - beta2)*B2;
secondcon = (beta1 - 1)/delta;
thirdcon  =  beta1*(C/r + I);
nufunct   = strcat(num2str(firstcon),'*','x','^',num2str(beta2), ...
            '+',num2str(secondcon),'*','x','-',num2str(thirdcon) );
Pstar     = fzero(nufunct,[10 50] )

return 


