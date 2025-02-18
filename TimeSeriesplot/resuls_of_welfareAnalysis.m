%%  welfare analysis
%% Report results with ub 
% Specify the full path to your data file
%fullPath = 'C:/Users/ak922/Dropbox/Al_Bz/MATLAB/laborMicroMacroP/quality/Results_modelwithgovernmnetandwelfareanalysis/wealfareanalysis/WithUB.mat'

fullPath = 'C:/Users/ak922/Dropbox/Unemployment_Micro_Macro_Project/raw_data/US/Code_Summary_Statistics_Plots_USQCEW/Static_version_ModelCounterfactual/Results_modelwithgovernmnetandwelfareanalysis/wealfareanalysis/StaticLaborIneq_modelWithCapGOVUB.mat'

% Use the load function to load data from the specified path
data = load(fullPath);

%21 Uy_hf_initV 
%22 Uy_hn_initV 
%23 Uy_lf_initV 
%24 Uy_ln_initV 
%25 Um_hf_initV 
%26 Um_hn_initV 
%27 Um_lf_initV 
%28 Um_ln_initV...

% steady state value:


% with transfer
Uy_hf_initV_W =   -1.1373
Uy_hn_initV_W =   -1.0972
Uy_lf_initV_W =   -1.1328
Uy_ln_initV_W =   -1.1264

Um_hf_initV_W =   -1.1060
Um_hn_initV_W =   -0.7969
Um_lf_initV_W =   -1.0739
Um_ln_initV_W =   -0.6106


% without trasnfer
Uy_hf_initV_WO =   -1.1452
Uy_hn_initV_WO =   -1.1047
Uy_lf_initV_WO =   -1.1406
Uy_ln_initV_WO =   -1.1340

Um_hf_initV_WO =   -1.1136
Um_hn_initV_WO =   -0.8021
Um_lf_initV_WO =   -1.0812
Um_ln_initV_WO =   -0.6147




%% with ub  horizon of 4q 8q 
Uy_hf_initV_response_W =   sum(Uy_hf_initV_W+(data.IRF(1:20,17))); % 
Uy_hn_initV_response_W=    sum(Uy_hn_initV_W+(data.IRF(1:20,18))); % 
Uy_lf_initV_response_W =   sum(Uy_lf_initV_W+(data.IRF(1:20,19))); % 
Uy_ln_initV_response_W =   sum(Uy_ln_initV_W+(data.IRF(1:20,20))); % 
Um_hf_initV_response_W =   sum(Um_hf_initV_W+(data.IRF(1:20,21))); % 
Um_hn_initV_response_W =   sum(Um_hn_initV_W+(data.IRF(1:20,22))); % 
Um_lf_initV_response_W =   sum(Um_lf_initV_W+(data.IRF(1:20,23))); % 
Um_ln_initV_response_W =   sum(Um_ln_initV_W+(data.IRF(1:20,24))); % 




%% REPORT RESULTS WO ub
% Specify the full path to your data file
fullPath2 = 'C:/Users/ak922/Dropbox/Unemployment_Micro_Macro_Project/raw_data/US/Code_Summary_Statistics_Plots_USQCEW/Static_version_ModelCounterfactual/Results_modelwithgovernmnetandwelfareanalysis/wealfareanalysis/StaticLaborIneq_modelWithCapWOTransfer.mat'
% Use the load function to load data from the specified path
data2 = load(fullPath2);


%% with ub  horizon of 4q 8q 
Uy_hf_initV_response_WO =   sum(Uy_hf_initV_WO+(data2.IRF(1:20,17))); % 
Uy_hn_initV_response_WO =   sum(Uy_hn_initV_WO+(data2.IRF(1:20,18))); % 
Uy_lf_initV_response_WO =   sum(Uy_lf_initV_WO+(data2.IRF(1:20,19))); % 
Uy_ln_initV_response_WO =   sum(Uy_ln_initV_WO+(data2.IRF(1:20,20))); % 
Um_hf_initV_response_WO =   sum(Um_hf_initV_WO+(data2.IRF(1:20,21))); % 
Um_hn_initV_response_WO =   sum(Um_hn_initV_WO+(data2.IRF(1:20,22))); % 
Um_lf_initV_response_WO =   sum(Um_lf_initV_WO+(data2.IRF(1:20,23))); % 
Um_ln_initV_response_WO =   sum(Um_ln_initV_WO+(data2.IRF(1:20,24))); % 





%%  Difference in U



Uy_hf_initV_response_Diff  =  Uy_hf_initV_response_W - Uy_hf_initV_response_WO ;
Uy_hn_initV_response_Diff  =  Uy_hn_initV_response_W - Uy_hn_initV_response_WO  ;
Uy_lf_initV_response_Diff  =  Uy_lf_initV_response_W - Uy_lf_initV_response_WO   ;
Uy_ln_initV_response_Diff  =  Uy_ln_initV_response_W - Uy_ln_initV_response_WO ;
Um_hf_initV_response_Diff  =  Um_hf_initV_response_W - Um_hf_initV_response_WO;
Um_hn_initV_response_Diff  =  Um_hn_initV_response_W - Um_hn_initV_response_WO  ;
Um_lf_initV_response_Diff  =  Um_lf_initV_response_W  -Um_lf_initV_response_WO ;
Um_ln_initV_response_Diff  =  Um_ln_initV_response_W - Um_ln_initV_response_WO;


%% report to latex



% Generate LaTeX table
latexTable = sprintf('\\begin{table}[htbp]\n');
latexTable = strcat(latexTable, '\t\\centering\n');
latexTable = strcat(latexTable, '\t\\caption{Results Comparison}\n');
latexTable = strcat(latexTable, '\t\\begin{tabular}{lccc}\n');
latexTable = strcat(latexTable, '\t\t\\toprule\n');
latexTable = strcat(latexTable, '\t\t\\textbf{Variable} & \\textbf{Response\\_WO (\\%%)} & \\textbf{Response\\_W (\\%%)} & \\textbf{Response\\_Diff (\\%%)} \\\\\n');
latexTable = strcat(latexTable, '\t\t\\midrule\n');
latexTable = sprintf('%s\t\tUy\\_hf\\_initV & %.2f & %.2f & %.2f \\\\\n', latexTable, Uy_hf_initV_response_WO, Uy_hf_initV_response_W, Uy_hf_initV_response_Diff);
latexTable = sprintf('%s\t\tUy\\_hn\\_initV & %.2f & %.2f & %.2f \\\\\n', latexTable, Uy_hn_initV_response_WO, Uy_hn_initV_response_W, Uy_hn_initV_response_Diff);
latexTable = sprintf('%s\t\tUy\\_lf\\_initV & %.2f & %.2f & %.2f \\\\\n', latexTable, Uy_lf_initV_response_WO, Uy_lf_initV_response_W, Uy_lf_initV_response_Diff);
latexTable = sprintf('%s\t\tUy\\_ln\\_initV & %.2f & %.2f & %.2f \\\\\n', latexTable, Uy_ln_initV_response_WO, Uy_ln_initV_response_W, Uy_ln_initV_response_Diff);
latexTable = sprintf('%s\t\tUm\\_hf\\_initV & %.2f & %.2f & %.2f \\\\\n', latexTable, Um_hf_initV_response_WO, Um_hf_initV_response_W, Um_hf_initV_response_Diff);
latexTable = sprintf('%s\t\tUm\\_hn\\_initV & %.2f & %.2f & %.2f \\\\\n', latexTable, Um_hn_initV_response_WO, Um_hn_initV_response_W, Um_hn_initV_response_Diff);
latexTable = sprintf('%s\t\tUm\\_lf\\_initV & %.2f & %.2f & %.2f \\\\\n', latexTable, Um_lf_initV_response_WO, Um_lf_initV_response_W, Um_lf_initV_response_Diff);
latexTable = sprintf('%s\t\tUm\\_ln\\_initV & %.2f & %.2f & %.2f \\\\\n', latexTable, Um_ln_initV_response_WO, Um_ln_initV_response_W, Um_ln_initV_response_Diff);
latexTable = strcat(latexTable, '\t\t\\bottomrule\n');
latexTable = strcat(latexTable, '\t\\end{tabular}\n');
latexTable = strcat(latexTable, '\\end{table}\n');

% Display the LaTeX table
disp(latexTable);

% Save LaTeX table to a file (optional)
latexFilename = 'results_table.tex';
fid = fopen(latexFilename, 'w');
fprintf(fid, '%s', latexTable);
fclose(fid);
