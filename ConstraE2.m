function [F]  = ConstraE2(x,I,theta,r,mu,eta,V_var,sigma)
%--------------------------------------------------------------------------
% Purpose : be used as nonlinear restriction in the problem to find H
%           optimally
%--------------------------------------------------------------------------
% Inputs  : I     : 1x1 Level of initial investment
%           theta : 1x1 parameter in the solution
%           H     : 1x1 result from the Kemmer function
%           H2    : 1x1 Derivative of the Kemmer function
%--------------------------------------------------------------------------
% Output  : A     : 1x1
%           Vstar : 1x1
%--------------------------------------------------------------------------
% Sistem of equations Smooth Pasting and Value Matching

F(1) = x(1)*x(2)^theta*x(3)-x(2)+I;
F(2) = (theta*(x(2)-I)/x(2))+ ((x(2)-I)/x(3))*diff(kummerMeanReverting(r,mu,eta,V_var,sigma,[x(2)-0.1 , x(2)+0.1]))-1;
F(3) = kummerMeanReverting(r,mu,eta,V_var,sigma,x(2))-x(3);

return 


