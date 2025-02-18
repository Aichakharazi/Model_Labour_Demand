% model without capital (with employment risk

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
phi_lf    = 0.08;      % CPS low skill foreign labor share
phi_ln    = 0.64;      % CPS low skill native labor share

N_Forcef =1.428100000000000;

lambdacf = 0.040120000000000;

%bbeta3 = 0.95;

%theta = 0.75;
kappa = 0.0958 ; % (1-theta)*(1-bbeta3*theta)/theta;


options=optimset('disp','iter','LargeScale','off','TolX',1e-8,'TolFun',1e-10,'MaxIter',100000000,'MaxFunEvals',10000000000);



x0=[0.04012; 23.68; 23.68; 23.68; 0.66; 0.697;0.675;  % lambdac cm cy cold LM LY y
    13.36;14.50; % omegam omegay
    0.146157494084671;0.085494173398034;0.106623676420258;0.096746472530447;
    0.197735634311154;0.089005814140518;0.193558539824186;0.095785729181255;
    1.428100000000000;1;
    0.222998835948778;0.139374272467986;0.167249126961583;0.153311699714785;
    0.224348845348667;0.105575927222902;0.211151854445804;0.112174422674333;   
    0.121700000000000;0.173799770000000; 2.039469610000000; 0.248203451537000; 1; 1];
lb = zeros(size(x0));  % All variables must be non-negative
ub = [];  % Leave empty if there are no specific upper bounds


rex = lsqnonlin(@(x) solveEquations(x, kappa , eeta, bbeta,aalpha ,ssigmaTFP,rrhoTFP ,zz ,inzz,ddeltaCov, ssp, ssigmaparam, xiparam, varrho, upsilon,varepsilon,zetaparam,rs,zma,zya,e_m,alp, de, theta_hf,theta_hn,theta_lf,theta_ln,phi_hf,phi_hn,phi_lf,phi_ln,N_Forcef,lambdacf),x0,lb,ub,options);

% x(1) = lambdac
% x(2)  = cm 
% x(3)  = cy
% x(4)  = cold
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
y_pi = rex(33) 


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
qqjV = rex(32) ;


%bbeta3 = 0.95;

%theta = 0.75;
kappa = 0.0958 ; % (1-theta)*(1-bbeta3*theta)/theta;


%y_pi =   (kappa/(1-bbeta))*margcostV

y_piV =   y_pi ;
y_piVV =  y_pi ;

%save ss_model_steadyStateF rex