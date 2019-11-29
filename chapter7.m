%% Chapter 7
% First we are going to create graph 7.2, in that way we can find the 
% thresholds of prices that trigger the firm actions

clc
clear all 
%% Parameters 
r          = 0.04;
alpha      = 0
delta      = r-alpha;
II         = 20;
C          = 0.8;
Q          = 10;
E          = 2.0;
r          = 0.04; 
vars0      = [10 1.2  6  0.55 ];  % vars0 is your initial guess
interplot  = zeros(1,4);
sigma      = [0.18:0.001:0.4] 

tic
N    = size(sigma,2);
Vars = NaN(N,4)
for i=1:N
    vars(i,:) = thresholdSS(r,delta,sigma(:,i),vars0,Q,C,II,E)
end 
toc

% Solutions of the system
A1 = vars(:,1);
ph = vars(:,2);
B2 = vars(:,3);
pl = vars(:,4);

%% Graphs 7.2
%%
C = C*ones(N,1);

plot(sigma,pl, sigma, ph, sigma, C),xlim([sigma(1,1) sigma(end)]), ylim([0 1.8]),
xlabel ('\sigma')
ylabel ('Price( dollars per pound)')
title('Dixit & Pindyck, Fig 7.2, Copper Entry & Exit Thresholds','Fontweight', 'Bold')
legend('P_l','P_H','C')


%% Graph 7.3
%%
clc
clear all
r          = 0.04;
delta      = 0.04;
II         = 20;
C          = [0.1:0.01:1];
Q          = 10;
E          = 2.0;
r          = 0.04; 
delt       = 0.04;
vars0      = [10 1.2  6  0.55 ];  % vars0 is your initial guess
interplot  = zeros(1,4);
sigma      = 0.2


N    = size(C,2);
Vars = NaN(N,4)
for i=1:N
    vars(i,:) = thresholdSS(r,delta,sigma,vars0,Q,C(:,i),II,E)
end 

% Solutions of the system
A1 = vars(:,1);
ph = vars(:,2);
B2 = vars(:,3);
pl = vars(:,4);

plot(C,pl, C, ph),xlim([C(1,1) C(end)]), ylim([0 1.6]),
xlabel ('C')
ylabel ('Price( dollars per pound)')
title('Dixit & Pindyck, Fig 7.3, Copper Entry & Exit Thresholds','Fontweight', 'Bold')
legend('P_l','P_H')



%% Graph 7.4
%%
clc
clear all
r          = 0.04;
delta      = 0.04;
II         = 20;
C          = 0.8;
Q          = 10;
E          = [-5:1:15];
r          = 0.04; 
delt       = 0.04;
vars0      = [10 1.2  6  0.55 ];  % vars0 is your initial guess
interplot  = zeros(1,4);
sigma      = 0.2


N    = size(E,2);
Vars = NaN(N,4)
for i=1:N
    vars(i,:) = thresholdSS(r,delta,sigma,vars0,Q,C,II,E(:,i))
end 

% Solutions of the system
A1 = vars(:,1);
ph = vars(:,2);
B2 = vars(:,3);
pl = vars(:,4);

plot(E,pl, E, ph),xlim([E(1,1) E(end)]), ylim([0 1.6]),
xlabel ('E (million dollars')
ylabel ('Price( dollars per pound)')
title('Dixit & Pindyck, Fig 7.4, Copper Entry & Exit Thresholds','Fontweight', 'Bold')
legend('P_l','P_H')




%% Graph 7.5
%%
clc
clear all
r          = 0.04;
delta      = 0.04;
II         = 20;
C          = 0.8;
Q          = 10;
E          = 2;
r          = 0.04; 
delt       = 0.04;
vars0      = [10 1.2  6  0.55 ];  % vars0 is your initial guess
interplot  = zeros(1,4);
sigma      = 0.2;

Vars = NaN(1,4)

vars = thresholdSS(r,delta,sigma,vars0,Q,C,II,E)

% Solutions of the system
A1   = vars(:,1);
ph   = vars(:,2);
B2   = vars(:,3);
pl   = vars(:,4);
p0   = 0;
pend = 1.6;

[p VzeroP VoneP] = valuefun(A1,ph,B2,pl,p0,pend,Q,sigma,r,delta,C)


plot(p,VzeroP, p, VoneP),xlim([p(1,1) p(end)]), ylim([0 250]), line([pl pl], [0 250],'Color','k','LineWidth',0.5), line([ph ph], [0 250],'Color','k','LineWidth',0.5),
xlabel ('P (Dollars per pound)')
ylabel ('V(P)')
title('Dixit & Pindyck, Fig 7.5, Copper Entry & Exit Thresholds','Fontweight', 'Bold')
legend('V_0(p)','V_1(P)')



%% Graph 7.6
%%

G = VoneP-VzeroP;
plot(p,G), ylim([-5 25]),xlim([0 1.6]), line([pl pl], [-5 25],'Color','k','LineWidth',0.5), line([ph ph], [-5 25],'Color','k','LineWidth',0.5),
xlabel ('P (Dollars per pound)')
ylabel ('G(P)')
title('G(P)=V_1(P)-V_0(P)','Fontweight', 'Bold')
legend('V_0(p)','V_1(P)')

% plot 7.5 is wrong, this is the real form 
plot(p,G), ylim([-25 25]),xlim([0 1.6]), line([pl pl], [-25 25],'Color','k','LineWidth',0.5), line([ph ph], [-25 25],'Color','k','LineWidth',0.5),
xlabel ('P (Dollars per pound)')
ylabel ('G(P)')
title('G(P)=V_1(P)-V_0(P)','Fontweight', 'Bold')
legend('V_0(p)','V_1(P)')

