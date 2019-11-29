function [L n] = difflim(f,x,toler)
%--------------------------------------------------------------------------
% Purpose  : Make a numerical derivative of the function f at the point x
%--------------------------------------------------------------------------
% Inputs   : f : Is a function 
%            x : 1x1 is the point at which the function is derived
%--------------------------------------------------------------------------
% Output   : 
%--------------------------------------------------------------------------

max1  = 15;
h     = 1;
D(1)  = (feval(f,x+h)-feval(f,x-h))/(2*h);
E(1)  = 0;
R(1)  = 0;

for n=1:2
    h      = h/10;
    H(n+1) = h;
    D(n+1) = (feval(f,x+h)-feval(f,x-h))/(2*h);
    E(n+1) = abs(D(n+1)-D(n));
    R(n+1) = 2*E(n+1)*(abs(D(n+1))+abs(D(n))+eps);
end 

n = 2;
while((E(n)>E(n+1))&(R(n)>toler))&n<max1
    h      = h/10;
    H(n+2) = h;
    D(n+2) = (feval(f,x+h)-feval(f,x-h))/(2*h);
    E(n+2) = abs(D(n+2)-D(n+1));
    R(n+2) = 2*E(n+2)-(abs(D(n+2))+abs(D(n+1))+eps);
    n      = n+1;
end

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    