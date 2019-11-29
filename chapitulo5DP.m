% Capitulo 5 Inversion
cd('/home/octavio/Dropbox/tesis/ProgramacionDP/Cap5')
% Dia 29 de junio 2018
rho    = 0.05;
alpha  = 0.02;
sigma  = 0.19;
I      = 1;

macdonaldsiegel(rho, alpha, sigma, I)

% Para hacer el grafico 5.1 
[Vd F_V] = FVMS(rho, alpha, I)
 V       = (0:0.1:2*Vd)'
plot(V,F_V), title({'Value of Investment Opportunity, F(V), for \sigma=0, \rho=0.05'}), xlabel({'V'}), ylabel({'F(V)'})
 
 
% here I will use other 2 kind of drift alpha=0 and alpha=0.03
alpha3     = [0 ; 0.03; 0.06];
[Vd1 F_V1] = FVMS(rho, alpha3(1,1), I)
 V1        = (0:0.1:2*Vd1)'


[Vd2 F_V2] = FVMS(rho, alpha3(2,1), I)
 V2        = (0:0.1:2*Vd2)'
 
% This is just a plot with the three kind of drifts
 subplot(3,1,1);
 plot(V1,F_V1), title({'Value of Investment Opportunity, F(V), for \alpha=0, \sigma=0, \rho=0.05'}), xlabel({'V'}), ylabel({'F(V)'})
 subplot(3,1,2)
 plot(V,F_V), title({'Value of Investment Opportunity, F(V), for \alpha=0.02, \sigma=0, \rho=0.05'}), xlabel({'V'}), ylabel({'F(V)'})
 subplot(3,1,3)
  plot(V2,F_V2), title({'Value of Investment Opportunity, F(V), for \alpha=0.03, \sigma=0, \rho=0.05'}), xlabel({'V'}), ylabel({'F(V)'})
 
 
 %% Now lets see the stochastic case 
 rho    = 0.05;
 alpha  = 0.02;
 sigma  = 0.19;
 I      = 1;
 [Vd F_V] = FVMSS(rho, alpha, sigma, I)
 V       = (0:0.1:2*Vd)'
 plot(V,F_V), title({'Value of Investment Opportunity, F(V), for \sigma=0.19, \rho=0.05'}), xlabel({'V'}), ylabel({'F(V)'})
 
 
  alpha3     = [0 ; 0.03; 0.06];
  [Vd1 F_V1] = FVMSS(rho, alpha3(1,1),sigma, I)
 V1        = (0:0.1:2*Vd1)
  [Vd2 F_V2] = FVMSS(rho, alpha3(2,1),sigma, I)
 V2        = (0:0.1:2*Vd2)'

  plot(V1,F_V1), xlabel({'V'}), ylabel({'F(V)'}), xlim([0 4])
  hold on
  plot(V,F_V), xlabel({'V'}), ylabel({'F(V)'}), xlim([0 4])
  hold on
  plot(V2,F_V2), title({'Value of Investment Opportunity, F(V), for \alpha=0.0, 0.03, 0.06, \sigma=0.19, \rho=0.05'}), xlabel({'V'}), ylabel({'F(V)'}), xlim([0 4]), legend('\alpha=0','\alpha=0.03', '\alpha=0.06')
  hold off
 
 
%% Now let do the graph 5.3 in page 154

 rho    = 0.04;
 alpha  = 0.0;
 I      = 1;
 sigma  =[0, 0.2, 0.3];
 
 % ---(1)
 [Vd F_V] = FVMSS(rho, alpha, sigma(1,1), I)
 V       = (0:0.1:2*Vd)'
 plot(V,F_V), title({'Value of Investment Opportunity, F(V), for \sigma=0.19, \rho=0.05'}), xlabel({'V'}), ylabel({'F(V)'})
 % ---(2)
  [Vd1 F_V1] = FVMSS(rho, alpha,sigma(1,2), I)
 V1        = (0:0.1:2*Vd1)
 % ---(3)
  [Vd2 F_V2] = FVMSS(rho, alpha,sigma(1,3), I)
 V2        = (0:0.1:2*Vd2)'
 % Graph
  plot(V,F_V), xlabel({'V'}), ylabel({'F(V)'}), xlim([0 3]), xlim([0 2])
  hold on
  plot(V1,F_V1), xlabel({'V'}), ylabel({'F(V)'}), xlim([0 3]), ylim([0 2])
  hold on
  plot(V2,F_V2), title({'Value of Investment Opportunity, F(V), for \alpha=0.0, \sigma=[0,0.2,0.3], \rho=0.04'}), xlabel({'V'}), ylabel({'F(V)'}), xlim([0 3]), ylim([0 2]), legend('\sigma=0','\sigma=0.2', '\sigma=0.3')
  hold off
 

 
%% Now let do the graph 5.4 in page 155

 rho    = [0.02, 0.04, 0.08];
 alpha  = 0.0;
 I      = 1;

 V1   = graph54(rho(1,1),alpha,I);
 V2   = graph54(rho(1,2),alpha,I);
 V3   = graph54(rho(1,3),alpha,I);
 
 sigma = [0:0.01:1]';
 % Graph
  plot(sigma,V1), xlabel({'V'}), ylabel({'F(V)'}), xlim([0 1]), ylim([0 16])
  hold on
  plot(sigma,V2), xlabel({'V'}), ylabel({'F(V)'}), xlim([0 1]), ylim([0 16])
  hold on
  plot(sigma,V3), title({'Critical Value, V^* as a function of \sigma, for \delta=[0.02,0.04,0.08], I=1'}), xlabel({'\sigma'}), ylabel({'V^*'}), xlim([0 1]), ylim([0 16]), legend('\delta=0.02','\sigma=0.04', '\sigma=0.08')
  hold off

 
%% Now let do the graph 5.5 in page 156

 rho    = [0.04, 0.08, 100];
 alpha  = 0.0;
 I      = 1;
 sigma  =0.2;
 
 % ---(1)
 [Vd F_V] = FVMSS(rho(1,1), alpha, sigma, I)
 V       = (0:0.1:2*Vd)'
 % ---(2)
  [Vd1 F_V1] = FVMSS(rho(1,2), alpha,sigma, I)
 V1        = (0:0.1:2*Vd1)
 % ---(3)
  [Vd2 F_V2] = FVMSS(rho(1,3), alpha,sigma, I)
 V2        = (0:0.1:2*Vd2)'
 % Graph
  plot(V,F_V), xlabel({'V'}), ylabel({'F(V)'}), xlim([0 2.2]), ylim([0 1.2])
  hold on
  plot(V1,F_V1), xlabel({'V'}), ylabel({'F(V)'}), xlim([0 2.2]), ylim([0 1.2])
  hold on
  plot(V2,F_V2), title({'Value of Investment Opportunity, F(V), for \delta=[0.04,0.08,100], \sigma=0.02'}), xlabel({'V'}), ylabel({'F(V)'}), xlim([0 2.2]), ylim([0 1.2]), legend('\delta=0.04','\delta=0.08', '\delta=100')
  hold off
 
 
%% Now let do the graph 5.6 in page 157

sigma  = [0.2, 0.4];
I      = 1;
[delta1 Vstar1] = graph56(sigma(1,1), I)
[delta2 Vstar2] = graph56(sigma(1,2), I)


plot(delta1,Vstar1), xlabel({'V^*'}), ylabel({'\delta'}), xlim([0 0.2]), ylim([0 14])
 hold on
plot(delta2,Vstar2), title({'Critical Value V^* as a Function of \delta, for \sigma=[0.2,0.4]'}), xlabel({'\delta'}), ylabel({'V^*'}),xlim([0 0.2]), ylim([0 14]), legend('\sigma=0.2','\sigma=0.4')
 hold off

 
%% Now let do the graph 5.7 in page 158

delta = [0.04, 0.08];
sigma = 0.2;
I     = 1;
[Vd1 rho] = graph57(delta(1,1),sigma,I)
[Vd2 rho] = graph57(delta(1,2),sigma,I)

plot(rho,Vd1), xlabel({'r'}), ylabel({'V^*'}), xlim([0 0.14]), ylim([0 4.5])
 hold on
plot(rho,Vd2), title({'Critical Value V^* as a Function of r, for \delta=[0.04,0.08]'}), xlabel({'r'}), ylabel({'V^*'}),xlim([0 0.14]), ylim([0 4.5]), legend('\delta=0.04','\delta=0.08')
 hold off

 
%% Now let do the graph 5.8 in page 159

delta = 0.2;
qstar = [1.2, 1.33, 1.5, 2, 4];
sigma = 0.2;
[rs1 ds1] = graph58(delta, qstar(1,1),sigma);
[rs2 ds2] = graph58(delta, qstar(1,2),sigma);
[rs3 ds3] = graph58(delta, qstar(1,3),sigma);
[rs4 ds4] = graph58(delta, qstar(1,4),sigma);
[rs5 ds5] = graph58(delta, qstar(1,5),sigma);

 plot(ds1,rs1), xlabel({'2r/\sigma^2'}), ylabel({'2\delta/\sigma^2'}), xlim([0 10]), ylim([0 10])
 hold on
 plot(ds2,rs2), xlabel({'2r/\sigma^2'}), ylabel({'2\delta/\sigma^2'}), xlim([0 10]), ylim([0 10])
 hold on
 plot(ds3,rs3), xlabel({'2r/\sigma^2'}), ylabel({'2\delta/\sigma^2'}), xlim([0 10]), ylim([0 10])
 hold on
 plot(ds4,rs4), xlabel({'2r/\sigma^2'}), ylabel({'2\delta/\sigma^2'}), xlim([0 10]), ylim([0 10])
 hold on
 plot(ds5,rs5), title({'Curve of Constant q^*= \beta_1/(\beta_1-1)'}), xlabel({'2\delta/\sigma^2'}), ylabel({'2r/\sigma^2'}),xlim([0 10]), ylim([0 10]), legend('q^*=1.2','q^*=1.33','q^*=1.5','q^*=2','q^*=4')
 hold off


%% Now let do the graph 5.9 and 9.10 in page 160

N     = 250;
rho   = 0.04;
alpha = 0;
I     = 1;
sigma = 0.2;
V0    = I;

[F_V, VI] = graph59(N,rho,alpha,I,sigma,V0)
 plot(F_V), xlabel({'Time'}), ylabel({'F(V), V-I'})
 hold on
 plot(VI), title({'Sample Path of F(V) and V-I'}), xlabel({'Time'}), ylabel({'F(V), V-I'}), legend('F(V)','V-I')
 hold off
 
 
clc
clear all
I      = 1;
r      = 0.04;
mu     = 0.08;
sigma  = 0.2;
eta    = 0.05;
V_var  = [0.5, 1.0, 1.5];
Vlast  = 2;


 [F_V V A Vstar H]     = graph511_2(r,mu,eta,V_var(1,1),sigma,Vlast,I)
 [F_V2 V2 A Vstar2 H2] = graph511_2(r,mu,eta,V_var(1,2),sigma,Vlast,I)
 [F_V3 V3 A Vstar3 H3] = graph511_2(r,mu,eta,V_var(1,3),sigma,Vlast,I)
 
 plot(V, F_V), xlabel({'V'}), ylabel({'F(V)'})
 hold on
 plot(V2, F_V2), xlabel({'V'}), ylabel({'F(V)'})
 hold on
 plot(V3, F_V3), title({'Mean Reverting F(V) for \eta=0.05 and \overline{V}=0.5,10 and 1.5 '}), xlabel({'V'}), ylabel({'F(V)'}), legend('\overline{V}=0.5','\overline{V}=0.5','\overline{V}=1.5')
 hold off
  

 % proving if my kemmer function is OK
 plot(V, H), xlabel({'V'}), ylabel({'F(V)'})
 hold on
 plot(V2, H2), xlabel({'V'}), ylabel({'F(V)'})
 hold on
 plot(V3, H3), title({'Mean Reverting F(V) for \eta=0.05 and \overline{V}=0.5,10 and 1.5 '}), xlabel({'V'}), ylabel({'F(V)'}), legend('\overline{V}=0.5','\overline{V}=0.5','\overline{V}=1.5')
 hold off
  















 
 
