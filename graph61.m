function [p V ] = graph61(r,mu,alpha,sigma,C,pmax)
%--------------------------------------------------------------------------
% Purpose : Gives the vector of the project value V(P)
%--------------------------------------------------------------------------
% Inputs  : r      : 1x1 real interes rate 
%           mu     : 1x1 risk atjusted interes rate 
%           alpha  : 1x1 Drift of the brownian motion 
%           sigma  : 1x1 Standard desviation of the brownian motion 
%           pmax   : 1x1 Gives the value for the domain of the graph
%--------------------------------------------------------------------------
% Output  : V      : Nx1 the value for the project, where N is the lenght
%                        of the vector P=(0:0.01:pmax)
%--------------------------------------------------------------------------

delta   = mu - alpha;
p       = [0:0.05:pmax]';
N       = size(p,1);
beta1   = 0.5 - (r-delta)/(sigma.^2) + sqrt( ((r-delta)/sigma.^2 -0.5)^2 +2*(r/sigma^2));
beta2   = 0.5 - (r-delta)/(sigma.^2) - sqrt( ((r-delta)/sigma.^2 -0.5)^2 +2*(r/sigma^2));
K1      = (C^(1-beta1))/(beta1-beta2)*[ (beta2/r)-(beta2-1)/delta];
B2      = (C^(1-beta2))/(beta1-beta2)*[ (beta1/r)-(beta1-1)/delta];

V = NaN(N,1);
for i=1:N
    if sigma < 0.000000000001
       if p(i,:) < C
        V(i,:) = 0;
       else 
        V(i,:) =  p(i,:)/delta - C/r
       end 
    else
       if p(i,:) < C
        V(i,:) = K1*p(i,:)^beta1;
       else 
        V(i,:) = B2*p(i,:)^beta2 + p(i,:)/delta - C/r
     end 
    end 
end 

return 


