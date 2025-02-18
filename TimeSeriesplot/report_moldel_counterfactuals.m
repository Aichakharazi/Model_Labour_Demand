%% Report results with ub   checked
% Specify the full path to your data file
fullPath = 'C:/Users/ak922/Dropbox/Unemployment_Micro_Macro_Project/raw_data/US/Code_Summary_Statistics_Plots_USQCEW/Static_version_ModelCounterfactual/Results_modelwithgovernmnetandwelfareanalysis/wealfareanalysis/StaticLaborIneq_modelWithCapGOVUB.mat'

% fullPath = 'C:/Users/ak922/Dropbox/Al_Bz/MATLAB/laborMicroMacroP/quality/Results_modelwithgovernmnetandwelfareanalysis/WithUBnutnotutility.mat'

% Use the load function to load data from the specified 
data1= load(fullPath);

%% REPORT RESULTS WO ub
% Specify the full path to your data file
%fullPath2 = 'C:/Users/ak922/Dropbox/Al_Bz/MATLAB/laborMicroMacroP/quality/Results_modelwithgovernmnetandwelfareanalysis/wealfareanalysis/WithoutUB.mat'
% Use the load function to load data from the specified path
% data3 = load(fullPath2);



%% REPORT RESULTS benchmark   checked


% Specify the full path to your data file
fullPath3 = 'C:/Users/ak922/Dropbox/Unemployment_Micro_Macro_Project/raw_data/US/Code_Summary_Statistics_Plots_USQCEW/Static_version_ModelCounterfactual/Results_modelwithcapital/StaticLaborIneq_modelWithCap.mat';
% Use the load function to load data from the specified path
data3 = load(fullPath3);
%% REPORT RESULTS moldel without capital  checked

% Specify the full path to your data file
fullPath4 =  'C:/Users/ak922/Dropbox/Unemployment_Micro_Macro_Project/raw_data/US/Code_Summary_Statistics_Plots_USQCEW/Static_version_ModelCounterfactual/Results_modelwithoutcapital/StaticLaborIneq_modelWithouCap.mat';
% Use the load function to load data from the specified path
data4 = load(fullPath4);

%% REPORT RESULTS moldel   %%  with capital and inelastic labor supply  checked

% Specify the full path to your data file
fullPath7 =  'C:/Users/ak922/Dropbox/Unemployment_Micro_Macro_Project/raw_data/US/Code_Summary_Statistics_Plots_USQCEW/Static_version_ModelCounterfactual/Results_modelwithinelasticlabor/StaticLaborIneq_modelWithCap_Inelasticlabor.mat';
% Use the load function to load data from the specified path
data7 = load(fullPath7);

% 
%% report results without covid shock checked

fullPath5 =  'C:/Users/ak922/Dropbox/Unemployment_Micro_Macro_Project/raw_data/US/Code_Summary_Statistics_Plots_USQCEW/Static_version_ModelCounterfactual/Results_modelwithcapital/StaticLaborIneq_modelWithCapWCovid.mat';
% Use the load function to load data from the specified path
data5 = load(fullPath5);



%% based on ottaviano perri estimates  checked
fullPath6 = 'C:/Users/ak922/Dropbox/Unemployment_Micro_Macro_Project/raw_data/US/Code_Summary_Statistics_Plots_USQCEW/Static_version_ModelCounterfactual/Results_modelwithcapital/StaticLaborIneq_modelWithCapOttavPeri.mat';
data6 = load(fullPath6);



%% order of varibale in basein emodel;

% 1 kkV  ..
% 2 y_piV  
% 3 u_mV 
% 4 e_mV  
% 5 rsV   
% 6 margcostV 
% 7 LYV  
% 8 LMV   ..
% 9 yV 
% 10 rksV  ..
% 11 omegayV  
% 12 omegamV   

%--------------
% 13 oy_hf_initV  
% 14 oy_hn_initV  
% 15 oy_lf_initV  
% 16 oy_ln_initV  ..
% 17 om_hf_initV  
% 18 om_hn_initV  
% 19 om_lf_initV  
% 20 om_ln_initV   ..  
%--------------
% 21 l_hftmV  
% 22 l_hntmV  
% 23 l_lftmV  
% 24 l_lntmV ..
% 25 l_hftyV  
% 26 l_hntyV  
% 27 l_lftyV  
% 28 l_lntyV ..   
%--------------




%% inelastic labor order

% 1 kkV  ..
% 2 y_piV  
% 3 u_mV 
% 4 e_mV  
% 5 rsV   
% 6 margcostV 
% 7 LYV  
% 8 LMV   ..
% 9 yV 
% 10 rksV  ..
% 11 omegayV  
% 12 omegamV   

%--------------
% 13 oy_hf_initV  
% 14 oy_hn_initV  
% 15 oy_lf_initV  
% 16 oy_ln_initV  ..
% 17 om_hf_initV  
% 18 om_hn_initV  
% 19 om_lf_initV  
% 20 om_ln_initV   ..  
%--------------
% 21 l_hftmV  
% 22 l_hntmV  
% 23 l_lftmV  
% 24 l_lntmV ..
% 25 l_hftyV  
% 26 l_hntyV  
% 27 l_lftyV  
% 28 l_lntyV ..   
%--------------

%% without capital order
%1  coldV ...
% 2 y_piV  
% 3 u_mV 
% 4 e_mV  
% 5 rsV   
% 6 margcostV 
% 7 LYV  
% 8 LMV   ..
% 9 yV 
% 11 omegayV  
% 12 omegamV   

%--------------
% 12 oy_hf_initV  
% 13 oy_hn_initV  
% 14 oy_lf_initV  
% 15 oy_ln_initV  ..
% 16 om_hf_initV  
% 17 om_hn_initV  
% 18 om_lf_initV  
% 19 om_ln_initV   ..  
%--------------
% 20 l_hftmV  
% 21 l_hntmV  
% 22 l_lftmV  
% 23 l_lntmV ..
% 24 l_hftyV  
% 25 l_hntyV  
% 26 l_lftyV  
% 27 l_lntyV ..   
%--------------

%% with transfers order

% 1 kkV  ..
% 2 y_piV  
% 3 omegayV  
% 4 omegamV   
%--------------
% 5 oy_hf_initV  
% 6 oy_hn_initV  
% 7 oy_lf_initV  
% 8 oy_ln_initV  ..
% 9 om_hf_initV  
% 10 om_hn_initV  
% 11 om_lf_initV  
% 12 om_ln_initV   ..  
%--------------
% 13 u_mV 
% 14 e_mV  
% 15 rsV   
% 16 margcostV 
%--------------
% 17 Uy_hf_initV 
% 18 Uy_hn_initV 
% 19 Uy_lf_initV 
% 20 Uy_ln_initV 
% 21 Um_hf_initV 
% 22 Um_hn_initV 
% 23 Um_lf_initV 
% 24 Um_ln_initV... 
%--------------
% 25 l_hftmV  
% 26 l_hntmV  
% 27 l_lftmV  
% 28 l_lntmV ..
% 29 l_hftyV  
% 30 l_hntyV  
% 31 l_lftyV  
% 32 l_lntyV ..   
%--------------
% 33 LYV  
% 34 LMV   ..
% 35 yV 
% 36 rksV  ..









%% plot results (benchmark results only)

T=20;

figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 




subplot(2,2,1)
%plot(1:T,data3.IRF(1:T,25)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on;
plot(1:T,data3.IRF(1:T,21)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on;
%plot(1:T,data3.IRF(1:T,29)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data3.IRF(1:T,25)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);

t = ' A. Labor - Foreign - High skill ';
title(t,'interpreter','latex')

axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 
ylim([-3.5 0.1])
legend({'Middle aged','Young'},'FontSize',20,'Location','best')





subplot(2,2,2)
%plot(1:T,data3.IRF(1:T,26)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on;
plot(1:T,data3.IRF(1:T,22)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on;

%plot(1:T,data3.IRF(1:T,30)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data3.IRF(1:T,26)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' B. Labor - Native - High skill  ';
title(t,'interpreter','latex')

axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 
ylim([-3.5 0.1])
legend({'Middle aged','Young'},'FontSize',20,'Location','best')

subplot(2,2,3)
%plot(1:T,data3.IRF(1:T,27)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on;
%plot(1:T,data3.IRF(1:T,31)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,data3.IRF(1:T,23)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on;
plot(1:T,data3.IRF(1:T,27)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Labor - Foreign - Low skill','FontSize',20)
t = ' C. Labor - Foreign - Low skill  ';
title(t,'interpreter','latex')

axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 
ylim([-3.5 0.1])
legend({'Middle aged','Young'},'FontSize',20,'Location','best')

subplot(2,2,4)
%plot(1:T,data3.IRF(1:T,28)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on
%plot(1:T,data3.IRF(1:T,32)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data3.IRF(1:T,24)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on
plot(1:T,data3.IRF(1:T,28)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Labor - Native - Low skill ','FontSize',20)
t = ' D. Labor - Native - Low skill  ';
title(t,'interpreter','latex')


axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 
ylim([-3.5 0.1])
legend({'Middle aged','Young'},'FontSize',20,'Location','best')

% the shock: affect negatively wages and hours decreases


%exportgraphics(figure, 'irfhours.pdf') %  -m2.5 -painters
exportgraphics(figure_handle, 'irfhours.pdf', 'ContentType', 'vector');



%% new plot report only the benchmark model (better results)



figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,4,1)  
plot(1:T,data3.IRF(1:T,21)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,21)*10);
text(6.5, data3.IRF(1,21)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' A. Middle aged - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-3.5 0.1])


subplot(2,4,2)

plot(1:T,data3.IRF(1:T,25)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f',data3.IRF(1,25)*10);
text(6.5, data3.IRF(1,25)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' B. Young - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-3.5 0.1])



subplot(2,4,3)
plot(1:T,data3.IRF(1:T,22)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,22)*10);
text(6.5, data3.IRF(1,22)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' C. Middle aged - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-3.5 0.1])


subplot(2,4,4)

plot(1:T,data3.IRF(1:T,26)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,26)*10);
text(6.5, data3.IRF(1,26)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' D. Young - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-3.5 0.1])

subplot(2,4,5)
plot(1:T,data3.IRF(1:T,23)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,23)*10);
text(6.5, data3.IRF(1,23)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' E. Middle aged - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-3.5 0.1])



subplot(2,4,6)

plot(1:T,data3.IRF(1:T,27)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,27)*10);
text(6.5, data3.IRF(1,27)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' F. Young - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-3.5 0.1])



subplot(2,4,7)
plot(1:T,data3.IRF(1:T,24)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,24)*10);
text(6.5, data3.IRF(1,24)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' G. Middle aged - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-3.5 0.1])


subplot(2,4,8)

plot(1:T,data3.IRF(1:T,28)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,28)*10);
text(6.5, data3.IRF(1,28)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' H. Young - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-3.5 0.1])



exportgraphics(figure_handle, 'New_irfhours.pdf', 'ContentType', 'vector');


%% plot IRF for wages
figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,2,1)
plot(1:T,data3.IRF(1:T,17)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on;
plot(1:T,data3.IRF(1:T,13)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - High skill','FontSize',20)
t = ' A. Wages - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 
ylim([-5.5 0.1])

legend({'Middle aged','Young'},'FontSize',20,'Location','best')


subplot(2,2,2)
plot(1:T,data3.IRF(1:T,18)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on;
plot(1:T,data3.IRF(1:T,14)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' B. Wages - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 
ylim([-5.5 0.1])
legend({'Middle aged','Young'},'FontSize',20,'Location','best')

subplot(2,2,3)
plot(1:T,data3.IRF(1:T,19)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on;
plot(1:T,data3.IRF(1:T,15)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' C. Wages - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 
ylim([-5.5 0.1])

legend({'Middle aged','Young'},'FontSize',20,'Location','best')

subplot(2,2,4)
plot(1:T,data3.IRF(1:T,20)*10,"-.",'LineWidth',3,'Color', '#0F95D7'); hold on
plot(1:T,data3.IRF(1:T,16)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' D. Wages - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 16; 
ylim([-5.5 0.1])

legend({'Middle aged','Young'},'FontSize',20,'Location','best')

exportgraphics(figure_handle, 'irfwages.pdf', 'ContentType', 'vector');

%% better plot wages : only becnhmark 



figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,4,1)
plot(1:T,data3.IRF(1:T,17)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,17)*10);
text(6.5, data3.IRF(1,17)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');


ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - High skill','FontSize',20)
t = ' A. Middle aged - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])


subplot(2,4,2)

plot(1:T,data3.IRF(1:T,13)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,13)*10);
text(6.5, data3.IRF(1,13)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - High skill','FontSize',20)
t = ' B. Young - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])



subplot(2,4,3)
plot(1:T,data3.IRF(1:T,18)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,18)*10);
text(6.5, data3.IRF(1,18)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' C. Middle aged - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])


subplot(2,4,4)

plot(1:T,data3.IRF(1:T,14)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 );

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,14)*10);
text(6.5, data3.IRF(1,14)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' D. Young - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])

subplot(2,4,5)
plot(1:T,data3.IRF(1:T,19)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,19)*10);
text(6.5, data3.IRF(1,19)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' E. Middle aged - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])



subplot(2,4,6)

plot(1:T,data3.IRF(1:T,15)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,15)*10);
text(6.5, data3.IRF(1,15)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' F. Young - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])



subplot(2,4,7)
plot(1:T,data3.IRF(1:T,20)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,20)*10);
text(6.5, data3.IRF(1,20)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' G. Middle aged - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])


subplot(2,4,8)

plot(1:T,data3.IRF(1:T,16)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on


plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,16)*10);
text(6.5, data3.IRF(1,16)*10, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' H. Young - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])



exportgraphics(figure_handle, 'New_irfwages.pdf', 'ContentType', 'vector');



%% model without and with UB








%% plot labor


figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,4,1)  
plot(1:T,data3.IRF(1:T,21)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,25)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,25)*10,'LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' A. Middle aged - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])

%legend({'wo UB','with UB'},'FontSize',10,'Location','best')

subplot(2,4,2)

plot(1:T,data3.IRF(1:T,25)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,29)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,29)*10,'LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' B. Young - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])

%legend({'wo UB','with UB'},'FontSize',10,'Location','best')


subplot(2,4,3)
plot(1:T,data3.IRF(1:T,22)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,26)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,26)*10,'LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' C. Middle aged - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])
legend({'wo UB','with UB'},'FontSize',10,'Location','best')


subplot(2,4,4)

plot(1:T,data3.IRF(1:T,26)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,30)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,30)*10,'LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' D. Young - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])
%legend({'wo UB','with UB'},'FontSize',10,'Location','best')

subplot(2,4,5)
plot(1:T,data3.IRF(1:T,23)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,27)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,27)*10,'LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' E. Middle aged - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])


%legend({'wo UB','with UB'},'FontSize',10,'Location','best')


subplot(2,4,6)

plot(1:T,data3.IRF(1:T,27)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,31)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,31)*10,'LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' F. Young - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])
%legend({'wo UB','with UB'},'FontSize',10,'Location','best')



subplot(2,4,7)
plot(1:T,data3.IRF(1:T,24)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
%plot(1:T,data4.IRF(1:T,28)*10,'LineWidth',3,'Color', '#D92344'); hold on
plot(1:T,data1.IRF(1:T,28)*10,'LineWidth',3,'Color', '#0F95D7'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' G. Middle aged - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])
%legend({'wo UB','with UB'},'FontSize',10,'Location','best')


subplot(2,4,8)

plot(1:T,data3.IRF(1:T,28)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
%plot(1:T,data4.IRF(1:T,32)*10,'LineWidth',3,'Color', '#D92344'); hold on
plot(1:T,data1.IRF(1:T,32)*10,'LineWidth',3,'Color', '#0F95D7'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' H. Young - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])

legend({'wo UB','with UB'},'FontSize',10,'Location','best')

exportgraphics(figure_handle, 'Counterfactual_irfhours.pdf', 'ContentType', 'vector');



%% plot IRF for wages
figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,4,1)
plot(1:T,data3.IRF(1:T,17)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,21)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,9)*10,'-.','LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - High skill','FontSize',20)
t = ' A. Middle aged - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])

%legend({'wo UB','with UB'},'FontSize',10,'Location','best')

subplot(2,4,2)

plot(1:T,data3.IRF(1:T,13)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,17)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,5)*10,'-.','LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - High skill','FontSize',20)
t = ' B. Young - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])
%legend({'wo UB','with UB'},'FontSize',10,'Location','best')


subplot(2,4,3)
plot(1:T,data3.IRF(1:T,18)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,22)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,10)*10,'-.','LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' C. Middle aged - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])
%legend({'wo UB','with UB'},'FontSize',10,'Location','best')


subplot(2,4,4)

plot(1:T,data3.IRF(1:T,14)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,18)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,6)*10,'-.','LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' D. Young - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])
%legend({'wo UB','with UB'},'FontSize',10,'Location','best')

subplot(2,4,5)
plot(1:T,data3.IRF(1:T,19)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,23)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,11)*10,'-.','LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' E. Middle aged - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])

%legend({'wo UB','with UB'},'FontSize',10,'Location','best')


subplot(2,4,6)

plot(1:T,data3.IRF(1:T,15)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
%plot(1:T,data4.IRF(1:T,19)*10,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,data1.IRF(1:T,7)*10,'-.','LineWidth',3,'Color', '#0F95D7'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' F. Young - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])

%legend({'wo UB','with UB'},'FontSize',10,'Location','best')


subplot(2,4,7)
plot(1:T,data3.IRF(1:T,20)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
%plot(1:T,data4.IRF(1:T,24)*10,'LineWidth',3,'Color', '#D92344'); hold on
plot(1:T,data1.IRF(1:T,12)*10,'-.','LineWidth',3,'Color', '#0F95D7'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' G. Middle aged - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])
%legend({'wo UB','with UB'},'FontSize',10,'Location','best')


subplot(2,4,8)

plot(1:T,data3.IRF(1:T,16)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
%plot(1:T,data4.IRF(1:T,20)*10,'LineWidth',3,'Color', '#D92344'); hold on
plot(1:T,data1.IRF(1:T,8)*10,'-.','LineWidth',3,'Color', '#0F95D7'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' H. Young - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])

legend({'wo UB','with UB'},'FontSize',10,'Location','best')

exportgraphics(figure_handle, 'Counterfactual_irfwages.pdf', 'ContentType', 'vector');




%%


%% report results  with Ottaviano estimates


figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,4,1)  
plot(1:T,data3.IRF(1:T,21)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,21)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,21)*10);
text(6.5, data3.IRF(1,21), annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,21)*10);
text(3.5, data6.IRF(1,21)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' A. Middle aged - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])

%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','northwest')

subplot(2,4,2)

plot(1:T,data3.IRF(1:T,25)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,25)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,25)*10);
text(6.5, data3.IRF(1,25)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,25)*10);
text(3.5, data6.IRF(1,25)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' B. Young - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])
%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','best')



subplot(2,4,3)
plot(1:T,data3.IRF(1:T,22)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,22)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,22)*10);
text(6.5, data3.IRF(1,22)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,22)*10);
text(3.5, data6.IRF(1,22)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' C. Middle aged - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])
%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','northwest')


subplot(2,4,4)

plot(1:T,data3.IRF(1:T,26)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,26)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,26)*10);
text(6.5, data3.IRF(1,26)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,26)*10);
text(3.5, data6.IRF(1,26)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' D. Young - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])
%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','best')

subplot(2,4,5)
plot(1:T,data3.IRF(1:T,23)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,23)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,23)*10);
text(6.5, data3.IRF(1,23)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,23)*10);
text(3.5, data6.IRF(1,23)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' E. Middle aged - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])

%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','northwest')


subplot(2,4,6)

plot(1:T,data3.IRF(1:T,27)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,27)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,27)*10);
text(6.5, data3.IRF(1,27)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,27)*10);
text(3.5, data6.IRF(1,27)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' F. Young - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])
%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','best')



subplot(2,4,7)
plot(1:T,data3.IRF(1:T,24)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data6.IRF(1:T,24)*10,'LineWidth',3,'Color', '#D92344'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,24)*10);
text(6.5, data3.IRF(1,24)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,24)*10);
text(3.5, data6.IRF(1,24)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' G. Middle aged - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])

%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','northwest')



subplot(2,4,8)

plot(1:T,data3.IRF(1:T,28)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data6.IRF(1:T,28)*10,'LineWidth',3,'Color', '#D92344'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,28)*10);
text(6.5, data3.IRF(1,28)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,28)*10);
text(3.5, data6.IRF(1,28)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' H. Young - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 0.1])

legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','southeast')


exportgraphics(figure_handle, 'Counterfactual_irfhoursB.pdf', 'ContentType', 'vector');



%% plot IRF for wages
figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,4,1)
plot(1:T,data3.IRF(1:T,17)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,17)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,17)*10);
text(7.5, data3.IRF(1,17)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,17)*10);
text(2.5, data6.IRF(1,17)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - High skill','FontSize',20)
t = ' A. Middle aged - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])
%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','southeast')


subplot(2,4,2)

plot(1:T,data3.IRF(1:T,13)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,13)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,13)*10);
text(5.5, data3.IRF(1,13)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,13)*10);
text(5.5, data6.IRF(1,13)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - High skill','FontSize',20)
t = ' B. Young - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])
%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','best')



subplot(2,4,3)
plot(1:T,data3.IRF(1:T,18)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,18)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,18)*10);
text(7.5, data3.IRF(1,18)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,18)*10);
text(2.5, data6.IRF(1,18)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' C. Middle aged - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])
%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','southeast')



subplot(2,4,4)

plot(1:T,data3.IRF(1:T,14)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,14)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,14)*10);
text(5.5, data3.IRF(1,14)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,14)*10);
text(5.5, data6.IRF(1,14) *10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' D. Young - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])
%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','best')


subplot(2,4,5)
plot(1:T,data3.IRF(1:T,19)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,19)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,19)*10);
text(7.5, data3.IRF(1,19)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,19)*10);
text(2.5, data6.IRF(1,19)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' E. Middle aged - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])
%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','southeast')



subplot(2,4,6)

plot(1:T,data3.IRF(1:T,15)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data6.IRF(1:T,15)*10,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,15)*10);
text(5.5, data3.IRF(1,15)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,15)*10 );
text(5.5, data6.IRF(1,15)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' F. Young - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])
%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','best')



subplot(2,4,7)
plot(1:T,data3.IRF(1:T,20)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data6.IRF(1:T,20)*10,'LineWidth',3,'Color', '#D92344'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,20)*10);
text(7.5, data3.IRF(1,20)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,20)*10);
text(2.5, data6.IRF(1,20)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' G. Middle aged - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])
%legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','southeast')



subplot(2,4,8)

plot(1:T,data3.IRF(1:T,16)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data6.IRF(1:T,16)*10,'LineWidth',3,'Color', '#D92344'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,16)*10);
text(5.5, data3.IRF(1,16)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data6.IRF(1,16)*10);
text(5.5, data6.IRF(1,16)*10, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' H. Young - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5.5 0.1])

legend({'Benchmark','OP 2012 estimates'},'FontSize',10,'Location','northeast')

exportgraphics(figure_handle, 'Counterfactual_irfwagesB.pdf', 'ContentType', 'vector');

%%  Plots



figure_handle = figure('color','w') 

set(gcf,'Units', 'Normalized','OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]); 

set(gca, 'TickLabelInterpreter', 'latex');
set(gcf, 'defaulttextinterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');  
set(groot, 'defaultLegendInterpreter', 'latex');


%subplot(1,3,1)
plot(1:T,data3.IRF(1:T,3)*10,'LineWidth',4,'Color', '#0F5C8C'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',4,'Color',[255, 0, 1]/255 ); 

ylabel('% points','FontSize',30,'Interpreter','latex')
xlabel('Quarters','FontSize',40,'Interpreter','latex');
t = ' A. unemployment rate  ';
title(t,'Interpreter','latex')
axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 40; 
ylim([-0.6 5])
exportgraphics(figure_handle, 'Additional_Counterfactual_irfBenchmark1.pdf', 'ContentType', 'vector');




figure_handle = figure('color','w') 

set(gcf,'Units', 'Normalized','OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 

set(gca,'TickLabelInterpreter','latex')
set(gcf,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

%subplot(1,3,2)
plot(1:T,data3.IRF(1:T,9)*10,'LineWidth',4,'Color', '#0F5C8C'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',4,'Color',[255, 0, 1]/255 ); 
ylabel('% deviation from ss','FontSize',30,'Interpreter','latex')
xlabel('Quarters','FontSize',40,'Interpreter','latex');
t = ' B. Ouput  ';
title(t,'Interpreter','latex')
axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 40; 
ylim([-0.3 0.05])
exportgraphics(figure_handle, 'Additional_Counterfactual_irfBenchmark2.pdf', 'ContentType', 'vector');


figure_handle = figure('color','w') 

 
set(gcf,'Units', 'Normalized','OuterPosition', [0 0 1 1]); % OR figure('Position', [100, 100, 1024, 1200]);
set(0,'defaultfigurecolor',[1 1 1]) 

set(gca,'TickLabelInterpreter','latex')
set(gcf,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaultLegendInterpreter','latex');

plot(1:T,data3.IRF(1:T,2)*10,'LineWidth',4,'Color', '#0F5C8C'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',4,'Color',[255, 0, 1]/255 ); hold on;
ylabel('% points','FontSize',30,'Interpreter','latex'); hold on;
xlabel('Quarters','FontSize',40,'Interpreter','latex'); hold on;
t = ' C. Inflation  ';
title(t,'Interpreter','latex')
axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 40; 
ylim([-5 0.3])


exportgraphics(figure_handle, 'Additional_Counterfactual_irfBenchmark3.pdf', 'ContentType', 'vector');


%% REPORT model Untargeted moments vs data

% wage differential 
% GDP/Hour
% employment rate
% labor market tightness
% hours worked 


% run file example2.m


%% report the results on wage volatility



% check the code dynare LaborIneqWithCap.mod it contains the resulst for
% high and low delta




%% plot labor  inelatic labor supply  + benchmark 
% not reporting this results











figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,4,1)  
plot(1:T,data3.IRF(1:T,21)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data7.IRF(1:T,21)*1.0e+14,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f ', data3.IRF(1,21)*10);
text(2.5, data3.IRF(10,21)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,21)*1.0e+14);
text(4, -4.5, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');


ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' A. Middle aged - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6.5 0.1])


subplot(2,4,2)

plot(1:T,data3.IRF(1:T,25)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data7.IRF(1:T,25)*1.0e+14 ,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,25)*10 );
text(2.5, data3.IRF(10,25)*10 , annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,25)*1.0e+14  );
text(3, -3.5, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' B. Young - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6.5 0.1])



subplot(2,4,3)
plot(1:T,data3.IRF(1:T,22)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data7.IRF(1:T,22)*1.0e+14,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,22)*10);
text(1.5, data3.IRF(10,22)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
 % Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,22)*1.0e+14 );
text(1.5, -4.5, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' C. Middle aged - Native - High skill  ';
title(t,'interpreter','latex')
axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6.5 0.1])




subplot(2,4,4)
plot(1:T,data3.IRF(1:T,26)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data7.IRF(1:T,26)*1.0e+14,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,26)*10);
text(5, -2, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,26)*1.0e+14 );
text(5, -4, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' D. Young - Native - High skill  ';
title(t,'interpreter','latex')
axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6.5 0.1])

subplot(2,4,5)
plot(1:T,data3.IRF(1:T,23)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data7.IRF(1:T,23)*1.0e+14,'LineWidth',3,'Color','#D92344'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,23)*10);
text(2.5, -2, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,23)*1.0e+14 );
text(5, -4.5, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' E. Middle aged - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6.5 0.1])



subplot(2,4,6)

plot(1:T,data3.IRF(1:T,27)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data7.IRF(1:T,27)*1.0e+14  ,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,27)*10);
text(2.5, -1.5, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,27)*1.0e+14 );
text(4, -3.5 , annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' F. Young - Foreign - Low skill  ';
title(t,'interpreter','latex')
axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6.5 0.1])



subplot(2,4,7)
plot(1:T,data3.IRF(1:T,24)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data7.IRF(1:T,24)*1.0e+14 ,'LineWidth',3,'Color', '#D92344'); hold on
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,24)*10);
text(2.5, -2, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,24)*1.0e+14  );
text(1.5, -5 , annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' G. Middle aged - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6.5 0.1])




subplot(2,4,8)

subplot(2,4,8)
plot(1:T,data3.IRF(1:T,28)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data7.IRF(1:T,28)*1.0e+14 ,'LineWidth',3,'Color', '#D92344'); hold on
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,28)*10);
text(2.5, -1.5, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,28)*1.0e+14 );
text(2, -3.5, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' H. Young - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6.5 0.1])

legend({'Benchmark','Inelastic labor'},'FontSize',10,'Location','best')


exportgraphics(figure_handle, 'AddLabor_Inelastic.pdf', 'ContentType', 'vector');


%% wages




figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,4,1)

plot(1:T,data3.IRF(1:T,17)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data7.IRF(1:T,17)*1.0e-01,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,17)*10);
text(6.5, data3.IRF(1,17)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');


% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,17)*1.0e-01);
text(3, data7.IRF(1,17)*1.0e-01, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');







ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - High skill','FontSize',20)
t = ' A. Middle aged - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6 5])


subplot(2,4,2)
plot(1:T,data3.IRF(1:T,13)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data7.IRF(1:T,13)*1.0e-01,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,13)*10);
text(6.5, data3.IRF(1,13)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,13)*1.0e-01);
text(3, data7.IRF(1,13)*1.0e-01, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - High skill','FontSize',20)
t = ' B. Young - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6 5])



subplot(2,4,3)
plot(1:T,data3.IRF(1:T,18)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data7.IRF(1:T,18)*1.0e-01,'LineWidth',3,'Color', '#D92344'); hold on;




plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,18)*10);
text(6.5, data3.IRF(1,18)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,18)*1.0e-01);
text(3, 3.5, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');


%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' C. Middle aged - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6 5])


subplot(2,4,4)
plot(1:T,data3.IRF(1:T,14)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data7.IRF(1:T,14)*1.0e-01,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 );

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,14)*10);
text(6.5, data3.IRF(1,14)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,14)*1.0e-01 );
text(3, data7.IRF(1,14)*1.0e-01 , annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');


%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' D. Young - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6 5])



subplot(2,4,5)
plot(1:T,data3.IRF(1:T,19)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data7.IRF(1:T,19)*1.0e-01,'LineWidth',3,'Color', '#D92344'); hold on;
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,19)*10);
text(6.5, data3.IRF(1,19)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,19)*1.0e-01);
text(3.5, data7.IRF(1,19)*1.0e-01, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' E. Middle aged - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6 5])



subplot(2,4,6)
plot(1:T,data3.IRF(1:T,15)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data7.IRF(1:T,15)*1.0e-01,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,15)*10);
text(6.5, data3.IRF(1,15)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,15)*1.0e-01);
text(3.5, data7.IRF(1,15)*1.0e-01, annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');


%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' F. Young - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6 5])



subplot(2,4,7)
plot(1:T,data3.IRF(1:T,20)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data7.IRF(1:T,20)*1.0e-01,'LineWidth',3,'Color', '#D92344'); hold on
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,20)*10);
text(6.5, data3.IRF(1,20)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,20)*1.0e-01 );
text(3.5, 2.5 , annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' G. Middle aged - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6 5])


subplot(2,4,8)

plot(1:T,data3.IRF(1:T,16)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data7.IRF(1:T,16)*1.0e-01,'LineWidth',3,'Color', '#D92344'); hold on
plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,16)*10);
text(6.5, -2.5, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
% Annotation
annotation_text = sprintf('%.2f', data7.IRF(1,16)*1.0e-01);
text(3.5, data7.IRF(1,16)*1.0e-01 , annotation_text, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

%ylabel('% points','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' H. Young - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-6 5])

legend({'Benchmark','Inelastic labor'},'FontSize',10,'Location','southeast')

exportgraphics(figure_handle, 'AddWages_Inelastic.pdf', 'ContentType', 'vector');


%% 


%% without capital vs benchamrk 



figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,4,1)  
plot(1:T,data3.IRF(1:T,21)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,20),'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f ', data3.IRF(1,21)*10);
text(11.5, data3.IRF(10,21)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,20));
text(2.5, -0.5, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' A. Middle aged - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])

%legend({'Benchmark','wo capital'},'FontSize',10,'Location','northwest')

subplot(2,4,2)

plot(1:T,data3.IRF(1:T,25)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,24),'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,25) *10);
text(11.5, data3.IRF(10,25) *10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,24));
text(2.5, data4.IRF(1,24) , annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' B. Young - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])
%legend({'Benchmark','wo capital '},'FontSize',10,'Location','best')



subplot(2,4,3)
plot(1:T,data3.IRF(1:T,22)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,21),'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,22)*10);
text(11.5, data3.IRF(10,22)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,21));
text(2.5, -0.5, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' C. Middle aged - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])
%legend({'Benchmark','wo capital'},'FontSize',10,'Location','northwest')


subplot(2,4,4)

plot(1:T,data3.IRF(1:T,26)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,25),'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,26)*10);
text(10, -0.9, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,25));
text(2.5, data4.IRF(1,25), annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' D. Young - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])
%legend({'Benchmark','wo capital '},'FontSize',10,'Location','best')

subplot(2,4,5)
plot(1:T,data3.IRF(1:T,23)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,22),'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,23)*10);
text(11.5, data3.IRF(10,23)*10, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,22));
text(2.5, -0.5, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' E. Middle aged - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])

%legend({'Benchmark','wo capital'},'FontSize',10,'Location','northwest')


subplot(2,4,6)

plot(1:T,data3.IRF(1:T,27)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,26),'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,27)*10);
text(10, -0.9, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,26));
text(2.5, data4.IRF(1,26), annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' F. Young - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])
%legend({'Benchmark','wo capital '},'FontSize',10,'Location','best')



subplot(2,4,7)
plot(1:T,data3.IRF(1:T,24)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data4.IRF(1:T,23),'LineWidth',3,'Color', '#D92344'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,24)*10);
text(10, -0.9, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,23));
text(1.5, -0.5, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' G. Middle aged - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])

%legend({'Benchmark','wo capital'},'FontSize',10,'Location','northwest')



subplot(2,4,8)

plot(1:T,data3.IRF(1:T,28)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data4.IRF(1:T,27),'LineWidth',3,'Color', '#D92344'); hold on






plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,28)*10);
text(2.5, -0.7, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,27));
text(1, -0.2, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');


ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' H. Young - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-2.5 1])

legend({'Benchmark','wo capital '},'FontSize',10,'Location','best')



exportgraphics(figure_handle, 'withoutcap_labor_irf.pdf', 'ContentType', 'vector');



%%  plot wages



figure_handle = figure('color','w') 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
set(0,'defaultfigurecolor',[1 1 1]) 
set(0,'defaultaxesfontname','cambria math') 

subplot(2,4,1)  
plot(1:T,data3.IRF(1:T,17)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,16)*1.0e+03,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f ', data3.IRF(1,17)*10);
text(2.5, -4, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,16)*1.0e+03);
text(2.5, -0.5, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');

ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' A. Middle aged - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 1.5])

%legend({'Benchmark','wo capital'},'FontSize',10,'Location','northwest')

subplot(2,4,2)

plot(1:T,data3.IRF(1:T,13)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,12)*1.0e+03,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,13)*10 );
text(2.5, -4 , annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,12)*1.0e+03 );
text(2.5, -0.5 , annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' B. Young - Foreign - High skill  ';
title(t,'interpreter','latex')



axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 1.5])
%legend({'Benchmark','wo capital '},'FontSize',10,'Location','best')



subplot(2,4,3)
plot(1:T,data3.IRF(1:T,18)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,17)*1.0e+03,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 

% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,18)*10);
text(2.5, -4, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,17)*1.0e+03);
text(2.5, -0.5, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' C. Middle aged - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 1.5])
%legend({'Benchmark','wo capital'},'FontSize',10,'Location','northwest')


subplot(2,4,4)

plot(1:T,data3.IRF(1:T,14)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,13)*1.0e+03,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,14)*10);
text(2.5, -4, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,13)*1.0e+03);
text(2.5, -0.5, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - High skill','FontSize',20)
t = ' D. Young - Native - High skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 1.5])
%legend({'Benchmark','wo capital '},'FontSize',10,'Location','best')

subplot(2,4,5)
plot(1:T,data3.IRF(1:T,19)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,18)*1.0e+03,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,19)*10);
text(2.5, -4, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,18)*1.0e+03);
text(2.5, -0.5, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Foreign - Low skill','FontSize',20)
t = ' E. Middle aged - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 1.5])

%legend({'Benchmark','wo capital'},'FontSize',10,'Location','northwest')


subplot(2,4,6)

plot(1:T,data3.IRF(1:T,15)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on;
plot(1:T,data4.IRF(1:T,14)*1.0e+03,'LineWidth',3,'Color', '#D92344'); hold on;

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,15)*10);
text(2.5, -4, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,14)*1.0e+03);
text(2.5, -0.5, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' F. Young - Foreign - Low skill  ';
title(t,'interpreter','latex')


axis tight;  
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 1.5])
%legend({'Benchmark','wo capital '},'FontSize',10,'Location','best')



subplot(2,4,7)
plot(1:T,data3.IRF(1:T,20)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data4.IRF(1:T,19)*1.0e+03,'LineWidth',3,'Color', '#D92344'); hold on

plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,20)*10);
text(2.5, -4, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,19)*1.0e+03);
text(5.5, -0.5, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');
 
ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
t = ' G. Middle aged - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0;
ax.FontSize = 10; 
ylim([-5 1.5])

%legend({'Benchmark','wo capital'},'FontSize',10,'Location','northwest')



subplot(2,4,8)

plot(1:T,data3.IRF(1:T,16)*10,'LineWidth',3,'Color', '#0F5C8C'); hold on
plot(1:T,data4.IRF(1:T,15)*1.0e+03,'LineWidth',3,'Color', '#D92344'); hold on






plot(1:T,zeros(size(1:T)),'--' ,'LineWidth',3,'Color',[255, 0, 1]/255 ); 
% Annotation
annotation_text = sprintf('%.2f', data3.IRF(1,16)*10);
text(2.5, -4, annotation_text, 'FontSize', 12, 'Color', '#0F5C8C', 'Interpreter', 'latex');
annotation_text2 = sprintf('%.2f', data4.IRF(1,15)*1.0e+03);
text(2.5, -0.5, annotation_text2, 'FontSize', 12, 'Color', '#D92344', 'Interpreter', 'latex');


ylabel('% deviation from ss','FontSize',20)
xlabel('Quarters','FontSize',20);
%title('Wages - Native - Low skill ','FontSize',20)
t = ' H. Young - Native - Low skill  ';
title(t,'interpreter','latex')

axis tight; 
ax = gca;
ax.YAxis.Exponent = 0
ax.FontSize = 10; 
ylim([-5 1.5])

legend({'Benchmark','wo capital '},'FontSize',10,'Location','southeast')



exportgraphics(figure_handle, 'withoutcap_wages_irf.pdf', 'ContentType', 'vector');


%% report model implied  (moments)

% hours 







Imig_Young_low_hour = 	35.55347727		
Nati_Young_low_hour  =  34.56632145	
Imig_Young_hig_hour  =  39.15297473
Nati_Young_hig_hour  =  39.43919426

			
Imig_midd_low_hour = 	38.82264432			
Nati_midd_low_hour  = 	40.02892046			
Imig_midd_hig_hour  =   40.06641816	
Nati_midd_hig_hour  =   41.07065357

% see table 1 hourly wage and hours worked CPS data 2018-2021
% ref year =2018

% hourly wage

Imig_Young_low_hourwage =  14.2960145	
Nati_Young_low_hourwage =  15.76538956	
Imig_Young_hig_hourwage =  36.30471937	
Nati_Young_hig_hourwage =  25.57777797
			
Imig_midd_low_hourwage =  17.64846951						
Nati_midd_low_hourwage =  21.96732943	
Imig_midd_hig_hourwage =  37.8418679	
Nati_midd_hig_hourwage =  38.36682084





l_hftm = data3.IRF(1:T,21)*10 % t = ' A. Middle aged - Foreign - High skill  ';

l_hfty = data3.IRF(1:T,25)*10 % t = ' B. Young - Foreign - High skill  ';

l_hntm = data3.IRF(1:T,22)*10 % t = ' C. Middle aged - Native - High skill  ';

l_hnty = data3.IRF(1:T,26)*10 % t = ' D. Young - Native - High skill  ';

l_lftm = data3.IRF(1:T,23)*10 % t = ' E. Middle aged - Foreign - Low skill  ';

l_lfty = data3.IRF(1:T,27)*10 %t = ' F. Young - Foreign - Low skill  ';

l_lntm = data3.IRF(1:T,24)*10 % t = ' G. Middle aged - Native - Low skill  ';

l_lnty = data3.IRF(1:T,28)*10 %t = ' H. Young - Native - Low skill  ';

% model labor ratios

rlaborratios_model_19 = mean(  Imig_Young_hig_hour *( 1+ l_hfty/100) ./(Nati_Young_hig_hour *( 1+  l_hnty/100 ) ) )
rlaborratios_model_20 = mean(  Imig_Young_low_hour *( 1+ l_lfty/100) ./(Nati_Young_low_hour *( 1+  l_lnty/100 ) ) )
rlaborratios_model_21 = mean(  Imig_midd_hig_hour *( 1+  l_hftm/100) ./(Nati_midd_hig_hour *( 1+  l_hntm/100  ) ) )
rlaborratios_model_22 = mean(  Imig_midd_low_hour *( 1+ l_lftm/100) ./(Nati_midd_low_hour *( 1+  l_lntm/100  ) ) )




om_hf_init = data3.IRF(1:T,17)*10  % t = ' A. Middle aged - Foreign - High skill  ';
oy_hf_init = data3.IRF(1:T,13)*10  %t = ' B. Young - Foreign - High skill  ';
om_hn_init = data3.IRF(1:T,18)*10  %t = ' C. Middle aged - Native - High skill  ';
oy_hn_init  = data3.IRF(1:T,14)*10 % t = ' D. Young - Native - High skill  ';
om_lf_init  = data3.IRF(1:T,19)*10   % t = ' E. Middle aged - Foreign - Low skill  ';
oy_lf_init = data3.IRF(1:T,15)*10    % F. Young - Foreign - Low skill 
om_ln_init = data3.IRF(1:T,20)*10 % t = ' G. Middle aged - Native - Low skill  ';
oy_ln_init = data3.IRF(1:T,16)*10     % t = ' H. Young - Native - Low skill  ';






% model wage premuim 
rq19 = mean( Imig_Young_hig_hourwage  *( 1+ oy_hf_init /100) ./(Nati_Young_hig_hourwage *( 1+   oy_hn_init  /100 ) ) )
rq20 = mean( Imig_Young_low_hourwage  *( 1+  oy_lf_init /100) ./(Nati_Young_low_hourwage *( 1+   oy_ln_init /100 ) ) )
rq21 = mean( Imig_midd_hig_hourwage   *( 1+  om_hf_init /100) ./(Nati_midd_hig_hourwage  *( 1+   om_hn_init  /100 ) ) )
rq22 = mean( Imig_midd_low_hourwage   *( 1+  om_lf_init /100) ./(Nati_midd_low_hourwage  *( 1+   om_ln_init  /100 ) ) )






% 
rdata_19 =  Imig_Young_hig_hourwage /Nati_Young_hig_hourwage  
rdata_20 =  Imig_Young_low_hourwage /Nati_Young_low_hourwage 
rdata_21 =  Imig_midd_hig_hourwage / Nati_midd_hig_hourwage
rdata_22 =  Imig_midd_low_hourwage / Nati_midd_low_hourwage


% data
rlaborratios19 =  Imig_Young_hig_hour/Nati_Young_hig_hour
rlaborratios20 =  Imig_Young_low_hour/Nati_Young_low_hour
rlaborratios21 =  Imig_midd_hig_hour/Nati_midd_hig_hour
rlaborratios22 =  Imig_midd_low_hour/Nati_midd_low_hour

%%

%ryouthlaborshare =  LY/( LM + LY )
%%
 % 'Unemployemt rate', rq1, ...
   % 'rq11z', rq11z, ...
   % 'Labor market tightness', rq2, ...
   % 'high skill foreign labor share', rq4, ...
   % 'low skill foreign labor share', rq5, ...
   % 'high skill native labor share', rq6, ...
   % 'low skill native labor share', rq7, ...
   % 'high skill foreign labor share', rq8, ...
   % 'high skill native labor share', rq9, ...
   % 'low skill foreign labor share', rq10, ...
   % 'low skill native labor share', rq11, ...
   % 'GDP per hour', rq12, ...
   % 'Sfe', rq13, ...
   % 'ms', rq14, ...
   % 'Vs' , rq15, ...
   % 'qqj', rq16, ...
   % 'capital to output', rq17, ...
   % 'consump to output', rq18, ...
% Create a LaTeX-formatted string
latex_string = sprintf('%s & %.2f \\\\ \n', ... 
    'wage premuim', rq19, ...
    'wage premuim data', rdata_19,...
    'wage premuim', rq20, ...
    'wage premuim data', rdata_20,...
    'wage premuim', rq21, ...
    'wage premuim data', rdata_21,...
    'wage premuim', rq22, ...
    'wage premuim data', rdata_22,...
    'laborsupply ratios', rlaborratios_model_19 , ...
    'laborsupply ratios data', rlaborratios19 ,...
    'laborsupply ratios', rlaborratios_model_20 , ...
    'laborsupply ratios data', rlaborratios20 ,...
    'laborsupply ratios', rlaborratios_model_21 , ...
    'laborsupply ratios data', rlaborratios21 ,...
    'laborsupply ratios', rlaborratios_model_22 , ...
    'laborsupply ratios data', rlaborratios22 );
%,...
%    'youth labor share',ryouthlaborshare


% Save the LaTeX-formatted string to a file
filename = 'results_tableFinal.tex';
fid = fopen(filename, 'w');
fprintf(fid, latex_string);
fclose(fid);
disp(['Results table saved to ' filename]);

