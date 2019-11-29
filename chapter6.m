%% Chapter 6
%% Graph 6.1
clc
clear all 
 r     = 0.04;
 mu    = 0.08;
 alpha = 0.04;
 sigma = [0, 0.2, 0.4];
 C     = 10;
 pmax  = 20;

 [p1 V1] = graph61(r,mu,alpha,sigma(1,1),C,pmax)
 [p2 V2] = graph61(r,mu,alpha,sigma(1,2),C,pmax)
 [p3 V3] = graph61(r,mu,alpha,sigma(1,3),C,pmax)
 
 
 plot(p1, V1), xlabel({'P'}), ylabel({'V(P)'}), xlim([0 20]), ylim([0 400])
 hold on
 plot(p2, V2), xlabel({'P'}), ylabel({'V(P)'}), xlim([0 20]), ylim([0 400])
 hold on
 plot(p3, V3), title({'Value of Project V(P)'}), xlabel({'P'}), ylabel({'V(P)'}),xlim([0 20]), ylim([0 400]), legend('\sigma=0','\sigma=0.2','\sigma=0.4')
 hold off
 
 
 %% Graph 6.2
 
 clc
 clear all 
 r     = 0.04;
 mu    = [0.06, 0.08, 0.12];
 alpha = 0.04;
 sigma = 0.2;
 C     = 10;
 pmax  = 20;

 [p1 V1] = graph61(r,mu(1,1),alpha,sigma,C,pmax)
 [p2 V2] = graph61(r,mu(1,2),alpha,sigma,C,pmax)
 [p3 V3] = graph61(r,mu(1,3),alpha,sigma,C,pmax)
 
 
 plot(p1, V1), xlabel({'P'}), ylabel({'V(P)'}), xlim([0 20]), ylim([0 400])
 hold on
 plot(p2, V2), xlabel({'P'}), ylabel({'V(P)'}), xlim([0 20]), ylim([0 400])
 hold on
 plot(p3, V3), title({'Value of Project V(P)'}), xlabel({'P'}), ylabel({'V(P)'}),xlim([0 20]), ylim([0 400]), legend('\delta=0.02','\delta=0.04','\delta=0.08')
 hold off
 
 %% Calculating the value for the option to invest
 
 %  This is done in the m-file dpfigure63
 
 %% Graph 6.4
 
 clc
 clear all 
 r     = 0.04;
 mu    = 0.08;
 alpha = 0.04;
 sigma = [0.1, 0.2, 0.4];
 C     = 10;
 pmax  = 36;
 I     = 100;
 
 P     = [0:0.01:pmax]';
 N     = size(P,1);
 Pstar = NaN(size(sigma,2),1);
 VP    = NaN(N,size(sigma,2));
 
 
 for k=1:size(sigma,2);
 [Pstar(k,1)]             = OptimalIR(r,mu,alpha,sigma(1,k),C,I);
 [P VP(:,k) FP(:,k)]      = OptionVandProjectV(Pstar(k,1),r,mu,alpha,sigma(1,k),C,I,pmax);
 end 
 
 % Value of the project - Investment
 for k=1:size(sigma,2);
 plot(P, VP(:,k)), title({'Value of Project V(P)-I'}), xlabel({'P'}), ylabel({'V(P)-I'}),xlim([0 36]), ylim([0 650]), legend('\sigma=0.01','\sigma=0.2','\sigma=0.4')
 hold on
 end 

% Value of the option to invest  
 for k=1:size(sigma,2);
 plot(P, FP(:,k)), title({'Value of Option to Invest F(P)'}), xlabel({'P'}), ylabel({'V(P)'}),xlim([0 36]), ylim([0 650]), legend('\sigma=0.01','\sigma=0.2','\sigma=0.4')
 hold on
 end 

 
 %% Graph 6.5
 
  clc
 clear all 
 r     = 0.04;
 mu    = [0.08, 0.12];
 alpha = 0.04;
 sigma = [0.2];
 C     = 10;
 pmax  = 30;
 I     = 100;
 P     = [0:0.01:pmax]';
 N     = size(P,1);
 Pstar = NaN(size(mu,2),1);
 VP    = NaN(N,size(mu,2));
 
 
 for k=1:size(mu,2);
 [Pstar(k,1)]             = OptimalIR(r,mu(1,k),alpha,sigma,C,I);
 [P VP(:,k) FP(:,k)]      = OptionVandProjectV(Pstar(k,1),r,mu(1,k),alpha,sigma,C,I,pmax);
 end 
 
 % Value of the project - Investment
 for k=1:size(mu,2);
 plot(P, VP(:,k)), title({'Value of Project V(P)-I'}), xlabel({'P'}), ylabel({'V(P)-I'}),xlim([0 pmax]), ylim([-100 500]), legend('\delta=0.04','\delta=0.08')
 hold on
 end 

% Value of the option to invest  
 for k=1:size(mu,2);
 plot(P, FP(:,k)), title({'Value of Option to Invest F(P)'}), xlabel({'P'}), ylabel({'V(P)'}),xlim([0 pmax]), ylim([-100 500]), legend('\delta=0.04','\delta=0.08')
 hold on
 end 

 
  % Value of the project - Investment
 for k=1:size(mu,2);
 plot(P, VP(:,k)), title({'Value of Project V(P)-I'}), xlabel({'P'}), ylabel({'V(P)-I'}),xlim([0 pmax]), ylim([-100 500]), legend('\delta=0.04','\delta=0.08')
 hold on
  plot(P, FP(:,k)), title({'Value of Investment Opportunity, F(P), and V(P)-I'}), xlabel({'P'}), ylabel({'V(P)'}),xlim([0 pmax]), ylim([-100 500]), legend('\delta=0.04','\delta=0.08')
 hold on
 end 
 
 %% Graph 6.6
 
 clc
 clear all 
 r     = 0.04;
 mu    = [0.08, 0.12];
 alpha = 0.04;
 sigma = [0.01:0.01:0.5];
 C     = 10;
 pmax  = 30;
 I     = 100;
 Pstar = NaN(size(sigma,2),size(mu,2));

 
 for i=1:size(mu,2);
     for k=1:size(sigma,2);
         [Pstar(k,i)] = OptimalIR(r,mu(1,i),alpha,sigma(1,k),C,I);
     end 
 end 
 
 % Value of the option to invest  
 for k=1:size(mu,2);
 plot(sigma,  Pstar(:,k)), title({'Critical Price \P^\star as a function of \sigma'}), xlabel({'P'}), ylabel({'V(P)'}),xlim([0 sigma(end)]), ylim([0, Pstar(end,end)]), legend('\delta=0.04','\delta=0.08')
 hold on
 end 

 
 
 %% Graph 6.7
 
 clc
 clear all 
 r          = 0.04;
 mu         = [0.08, 0.12];
 alpha      = 0.04;
 sigma      = [0.01:0.01:0.5];
 C          = 10;
 I          = 100;
 Pstar      = NaN(size(sigma,2),size(mu,2));
 VP         = NaN(size(sigma,2),size(mu,2));
 FP         = NaN(size(sigma,2),size(mu,2));
 
 % we are asking for V() evaluated at P^*
 for i=1:size(mu,2);
     for k=1:size(sigma,2);
         [Pstar(k,i)]        = OptimalIR(r,mu(1,i),alpha,sigma(1,k),C,I);
         [P VP(k,i) FP(k,i)] = OptionVandProjectV2(Pstar(k,i),r,mu(1,i),alpha,sigma(1,k),C,I); %this program is doinf to return a vector no a singleton, and in this case we are asking for a singleton for each sigma
     end 
 end 
 
 
 % Value of the option to invest  
 for k=1:size(mu,2);
 plot(sigma, (VP(:,k)+100)), title({'Value of Option to Invest F(P)'}), xlabel({'P'}), ylabel({'V(P)'}),xlim([0 sigma(end)]), ylim([0 1000]), legend('\delta=0.04','\delta=0.08')
 hold on
 end 

 
 
 
 
 