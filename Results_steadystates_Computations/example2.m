% Model with capital : baseline


e2V = 1;
e2VV = 1;


eeta       = 1.5;          % 1.5the curvature on the disutility of labor  1-4
bbeta      = 0.95;       % disocunt factor 
ssigmaTFP  = 0.08 ;        % standard deviation of TFP shock
rrhoTFP    = 0.98;       % quarterly autocorrelation of TFP shock
zz         = 1;
zzV         = 1;
zzVV         = 1;

inzz = 1;
ddeltaCov = -0.0017;
%ssp_elas          =  0.076580  ;               % CPS estimated  (robust and with County and year FE)
%ssp_elas          =   0.087  ;               % CPS estimated  (robust and with County and year FE)
ssp_elas          =   0.119  ;               % CPS estimated  (robust and with County and year FE)
ssp               = (1/(1+ssp_elas))        % CPS

%sigmaparam_elas   = 0.03924;                 % CPS estimated  (!!!! not robust and with County and year FE)
%sigmaparam_elas   = 0.026;                 % CPS estimated  (!!!! not robust and with County and year FE)
sigmaparam_elas   = 0.047;                 % CPS estimated  (!!!! not robust and with County and year FE)
ssigmaparam       = (1/(sigmaparam_elas +1)) % CPS

%xiparam_elas  = 0.07146;                       % CPS estimated  (robust and with County and year FE)
%xiparam_elas  = 0.097;                       % CPS estimated  (robust and with County and year FE)
xiparam_elas  = 0.133;                       % CPS estimated  (robust and with County and year FE)
xiparam =(1/(xiparam_elas+1))               % CPS

%varrho_elas      = 0.14092;                     % CPS estimated (robust  with and without County and year FE)
%varrho_elas      = 0.115;                     % CPS estimated (robust  with and without County and year FE)
varrho_elas      = 0.118;                     % CPS estimated (robust  with and without County and year FE)
varrho           = 1/(varrho_elas +1)         % CPS 

%upsilon_elas     = 0.11723 ;                    % CPS estimated (!!!!!not robust and with County and year FE)
%upsilon_elas     = 0.134 ;                    % CPS estimated (!!!!!not robust and with County and year FE)
upsilon_elas     = 0.167 ;                    % CPS estimated (!!!!!not robust and with County and year FE)
upsilon          = 1/(upsilon_elas +1)        % CPS 

%varepsilon_elas  = 0.05898;                      % CPS estimated (!!!!!not robust and with County and year FE)
%varepsilon_elas  = 0.109;                      % CPS estimated (!!!!!not robust and with County and year FE)
varepsilon_elas  = 0.126;                      % CPS estimated (!!!!!not robust and with County and year FE)
varepsilon       = 1/(varepsilon_elas +1)      % CPS 

%zetaparam_elas   = 0.11216;                      % CPS estimated (not robust (significant only) without County and year FE)
%zetaparam_elas   = 0.167;                      % CPS estimated (not robust (significant only) without County and year FE)
zetaparam_elas   = 0.187;                      % CPS estimated (not robust (significant only) without County and year FE)
zetaparam        = 1/(zetaparam_elas +1)       % CPS

rs               = (1/bbeta)-1;
rsV               = (1/bbeta)-1;
rsVV               = (1/bbeta)-1;

zma = 0.5;
zya = 0.5;

e_m = 0.95;   % employmnent rate
e_mV = 0.95; 
e_mVV = 0.95; 

u_m = 1 - e_m;   %%  before covid between 3-4 % , during covid reaches 14%
u_mV = 1 - e_m;
u_mVV = 1 - e_m;


alp = 0.5;
de = 0.025;



aalpha      = 0.25;       % CPS youth labor share  0.232/(0.232+0.692)= 0.25
% middle aged
theta_hf  = 0.07;    % CPS high skill foreign labor share
theta_hn  = 0.35;    % CPS high skill native labor share
theta_lf  = 0.11;    % CPS low skill foreign labor share
theta_ln  = 0.47;    % CPS low skill native labor share

% Youth Labor supply

phi_hf    = 0.04;      % CPS high skill foreign labor share
phi_hn    = 0.25;      % CPS high skill native labor share
phi_lf    = 0.07;      % CPS low skill foreign labor share
phi_ln    = 0.64;      % CPS low skill native labor share


N_Forcef =1.428100000000000;

lambdacf = 0.040120000000000;

alpha_cob =0.30;  % 0.62-0.58  harrison2024disentangling 0.3

%bbeta3 = 0.95;

%theta = 0.75;
kappa = 0.0958 ; % (1-theta)*(1-bbeta3*theta)/theta;

ddelta_K = 0.025;


options=optimset('disp','iter','LargeScale','off','TolX',1e-8,'TolFun',1e-10,'MaxIter',100000000,'MaxFunEvals',10000000000);

x0=[0.04012; 23.68; 23.68; 23.68; 0.66; 0.697;0.675;  % lambdac cm cy cold LM LY y
    13.36;14.50; % omegam omegay
    0.146157494084671;0.085494173398034;0.106623676420258;0.096746472530447;
    0.197735634311154;0.089005814140518;0.193558539824186;0.095785729181255;
    1.428100000000000;1;
    0.222998835948778;0.139374272467986;0.167249126961583;0.153311699714785;
    0.224348845348667;0.105575927222902;0.211151854445804;0.112174422674333;   
    0.121700000000000;0.173799770000000; 2.039469610000000; 0.248203451537000; 1; 3; 1;
    23.68; 23.68;23.68; 23.68;23.68; 23.68;23.68; 23.68];

lb = zeros(size(x0));  % All variables must be non-negative
ub = [];  % Leave empty if there are no specific upper bounds

rex = lsqnonlin(@(x) solve2(x, ddelta_K, kappa, eeta, bbeta,aalpha ,ssigmaTFP,rrhoTFP ,zz ,inzz,ddeltaCov, ssp, ssigmaparam, xiparam, varrho, upsilon,varepsilon,zetaparam,rs,zma,zya,e_m,alp, de, theta_hf,theta_hn,theta_lf,theta_ln,phi_hf,phi_hn,phi_lf,phi_ln,N_Forcef,lambdacf,alpha_cob),x0,lb,ub,options);
rex = real(rex);
% x(1) = lambdac
% x(2)  = cm 
% x(3)  = cy
% x(4)  = cold;
% x(5)  = LM
% x(6)  = LY
% x(7)  =  y
% x(8)  = omegam
% x(9)  = omegay
% oy_hf_init= x(10);
% oy_hn_init = x(11);
% oy_lf_init = x(12);
% oy_ln_init= x(13); 
% om_hf_init= x(14);
% om_hn_init= x(15);
% om_lf_init= x(16);
% om_ln_init= x(17);
% N_ForceV = x(18)   
% margcostV = x(19)
% l_hfty x(20)
% l_hnty x(21)
% l_lfty x(22)
% l_lnty x(23)
% l_hftm x(24)
% l_hntm x(25)
% l_lftm x(26)
% l_lntm x(27)

%Sfe = 0.1217; % 0.34  
% x(28)  Sfe
% x(29)  ms
% x(30)  thigtness
% x(31)  Vs
% x(32)  ej 



lambdac = rex(1)
cm = rex(2) 
cy = rex(3)  
cold = rex(4)   
LM = rex(5)  
LY = rex(6)  
y = rex(7)  
omegam = rex(8)   
omegay = rex(9)   
oy_hf_init= rex(10)
oy_hn_init = rex(11)
oy_lf_init = rex(12)
oy_ln_init= rex(13) 
om_hf_init= rex(14)
om_hn_init= rex(15)
om_lf_init= rex(16)
om_ln_init= rex(17)
N_Force = rex(18)
margcost = rex(19)
l_hfty =rex(20)
l_hnty =rex(21)
l_lfty =rex(22)
l_lnty =rex(23)
l_hftm =rex(24)
l_hntm =rex(25)
l_lftm =rex(26)
l_lntm = rex(27)
Sfe = rex(28) 
ms = rex(29)  
thigtness = rex(30)  
Vs = rex(31)  
qqj = rex(32) 
kk = rex(33)

y_pi = rex(34)


c_hfty =rex(35)
c_hnty =rex(36)
c_lfty =rex(37)
c_lnty =rex(38)
c_hftm =rex(39)
c_hntm =rex(40)
c_lftm =rex(41)
c_lntm =rex(42)


lambdacVV = rex(1);
cmVV = rex(2) ;
cyVV = rex(3)  ;
coldVV = rex(4)  ; 
LMVV = rex(5)  ;
LYVV = rex(6)  ;
yVV = rex(7)  ;
omegamVV = rex(8)  ; 
omegayVV = rex(9)  ; 
oy_hf_initVV = rex(10);
oy_hn_initVV = rex(11);
oy_lf_initVV = rex(12);
oy_ln_initVV = rex(13); 
om_hf_initVV = rex(14);
om_hn_initVV = rex(15);
om_lf_initVV = rex(16);
om_ln_initVV = rex(17);
N_ForceVV = rex(18);
margcostVV = rex(19);
l_hftyVV =rex(20);
l_hntyVV =rex(21);
l_lftyVV =rex(22);
l_lntyVV =rex(23);
l_hftmVV =rex(24);
l_hntmVV =rex(25);
l_lftmVV =rex(26);
l_lntmVV = rex(27);
SVV = rex(28) ;
mVV = rex(29)  ;
thigtnessVV = rex(30);  
VsVV = rex(31)  ;
qqjVV = rex(32) ;

kkVV = rex(33) ;


c_hftyVV =rex(35)
c_hntyVV =rex(36)
c_lftyVV =rex(37)
c_lntyVV =rex(38)
c_hftmVV =rex(39)
c_hntmVV =rex(40)
c_lftmVV =rex(41)
c_lntmVV =rex(42)



lambdacV = rex(1);
cmV = rex(2) ;
cyV = rex(3)  ;
coldV = rex(4)  ; 
LMV = rex(5)  ;
LYV = rex(6)  ;
yV = rex(7)  ;
omegamV = rex(8)  ; 
omegayV = rex(9)  ; 
oy_hf_initV= rex(10);
oy_hn_initV = rex(11);
oy_lf_initV = rex(12);
oy_ln_initV = rex(13); 
om_hf_initV = rex(14);
om_hn_initV = rex(15);
om_lf_initV = rex(16);
om_ln_initV = rex(17);
N_ForceV = rex(18);
margcostV = rex(19);
l_hftyV =rex(20);
l_hntyV =rex(21);
l_lftyV =rex(22);
l_lntyV =rex(23);
l_hftmV =rex(24);
l_hntmV =rex(25);
l_lftmV =rex(26);
l_lntmV = rex(27);
SV = rex(28) ;
mV = rex(29)  ;
thigtnessV = rex(30);  
VsV = rex(31)  ;
qqjV = rex(32)  ;

kkV = rex(33)  ;

c_hftyV =rex(35)
c_hntyV =rex(36)
c_lftyV =rex(37)
c_lntyV =rex(38)
c_hftmV =rex(39)
c_hntmV =rex(40)
c_lftmV =rex(41)
c_lntmV =rex(42)


%y_pi =   (kappa/(1-bbeta))*margcostV

y_piV =   y_pi ;
y_piVv =  y_pi ;

%save ss_model_steadyStateF rex

%%  report model properties

rq1 = 1- ( LM + LY )/ N_Force;
rq11z = (l_hfty +l_hnty + l_lfty + l_lnty  + l_hftm +l_hntm +l_lftm +l_lntm)/ N_Force;
rq2 = thigtness;
rq3 = u_m ;
rq4 = l_hfty /(l_hfty +l_hnty + l_lfty + l_lnty ) ;
rq5 = l_lfty /(l_hfty +l_hnty + l_lfty + l_lnty ) ;
rq6 = l_hnty /(l_hfty +l_hnty + l_lfty + l_lnty ) ;
rq7 = l_lnty /(l_hfty +l_hnty + l_lfty + l_lnty ) ;
rq8 =l_hftm / (l_hftm +l_hntm +l_lftm +l_lntm );
rq9 =l_hntm / (l_hftm +l_hntm +l_lftm +l_lntm );
rq10 =l_lftm / (l_hftm +l_hntm +l_lftm +l_lntm );
rq11 =l_lntm / (l_hftm +l_hntm +l_lftm +l_lntm );






rq12= yV/ (l_hfty +l_hnty + l_lfty + l_lnty  + l_hftm +l_hntm +l_lftm +l_lntm);


rq13 = Sfe
rq14 = ms
rq15 = Vs
rq16 = qqj



rq17 = kkV/yV;
rq18 = (cyV +cmV +coldV) /yV


% model wage premuim 
rq19 =  oy_hf_init/oy_hn_init 
rq20 = oy_lf_init / oy_ln_init
rq21 = om_hf_init / om_hn_init
rq22 = om_lf_init / om_ln_init

% model labor ratios

rlaborratios_model_19 = l_hfty/l_hnty
rlaborratios_model_20 = l_lfty/l_lnty
rlaborratios_model_21 = l_hftm/l_hntm
rlaborratios_model_22 = l_lftm/l_lntm


%%

%% see table 1 hourly wage and hours worked CPS data 2018-2021
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

% 
rdata_19 =  Imig_Young_hig_hourwage /Nati_Young_hig_hourwage  
rdata_20 =  Imig_Young_low_hourwage /Nati_Young_low_hourwage 
rdata_21 =  Imig_midd_hig_hourwage / Nati_midd_hig_hourwage
rdata_22 =  Imig_midd_low_hourwage / Nati_midd_low_hourwage



% hours 

Imig_Young_low_hour = 	35.55347727		
Nati_Young_low_hour  =  34.56632145	
Imig_Young_hig_hour  =  39.15297473
Nati_Young_hig_hour  =  39.43919426

			
Imig_midd_low_hour = 	38.82264432			
Nati_midd_low_hour  = 	40.02892046			
Imig_midd_hig_hour  =   40.06641816	
Nati_midd_hig_hour  =   41.07065357




% data
rlaborratios19 =  Imig_Young_hig_hour/Nati_Young_hig_hour
rlaborratios20 =  Imig_Young_low_hour/Nati_Young_low_hour
rlaborratios21 =  Imig_midd_hig_hour/Nati_midd_hig_hour
rlaborratios22 =  Imig_midd_low_hour/Nati_midd_low_hour



ryouthlaborshare =  LY/( LM + LY )


%%
    %'rq3', rq3, ...

% Create a LaTeX-formatted string
latex_string = sprintf('%s & %.2f \\\\ \n', ...
    'Unemployemt rate', rq1, ...
    'rq11z', rq11z, ...
    'Labor market tightness', rq2, ...
    'high skill foreign labor share', rq4, ...
    'low skill foreign labor share', rq5, ...
    'high skill native labor share', rq6, ...
    'low skill native labor share', rq7, ...
    'high skill foreign labor share', rq8, ...
    'high skill native labor share', rq9, ...
    'low skill foreign labor share', rq10, ...
    'low skill native labor share', rq11, ...
    'GDP per hour', rq12, ...
    'Sfe', rq13, ...
    'ms', rq14, ...
    'Vs' , rq15, ...
    'qqj', rq16, ...
    'capital to output', rq17, ...
    'consump to output', rq18, ...
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
    'laborsupply ratios data', rlaborratios22 ,...
    'youth labor share',ryouthlaborshare);


% Save the LaTeX-formatted string to a file
filename = 'results_table.tex';
fid = fopen(filename, 'w');
fprintf(fid, latex_string);
fclose(fid);
disp(['Results table saved to ' filename]);



