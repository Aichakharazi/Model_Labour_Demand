function[eeta, bbeta, aalpha, ssp, ssigmaparam, xiparam,...
ssigmaTFP, rrhoTFP, zz, ...
theta_hf, theta_hn, theta_lf, theta_ln,  ...
phi_hf, phi_hn, phi_lf, phi_ln, ...
varrho, upsilon, varepsilon, zetaparam,  ...
rs, omegay, omegam,...
oy_hf_init, oy_hn_init, oy_lf_init, oy_ln_init, ...
om_hf_init, om_hn_init, om_lf_init, om_ln_init, ...
LY, LM,...
yss, margcost, ...
lambdac, cm, cy, cold,  ddeltaCov,...
oy_hf_init_real, oy_hn_init_real, oy_lf_init_real, oy_ln_init_real,...
om_hf_init_real, om_hn_init_real, om_lf_init_real, om_ln_init_real,...
oy_hf_init_pi, oy_hn_init_pi, oy_lf_init_pi, oy_ln_init_pi,...
om_hf_init_pi, om_hn_init_pi, om_lf_init_pi, om_ln_init_pi,...
l_hftm, l_hntm, l_lftm, l_lntm,...
l_hfty, l_hnty, l_lfty, l_lnty,...
y_pi, ...
N_Force, ...
alp, ms, kappa,  thigtness, Vs,...
e_m, u_m, qqj, Sfe, de,...
kk, alpha_cob, rks, Tax, ...
ddelta_K, Inves,...
oy_init_pi  , om_init_pi, om_init_real, oy_init_real,...
 zzV, ...
rsV, ...
oy_hf_initV, oy_hn_initV, oy_lf_initV, oy_ln_initV, ...
om_hf_initV, om_hn_initV, om_lf_initV, om_ln_initV,...
LYV, LMV, ...
l_hftmV, l_hntmV, l_lftmV, l_lntmV,...
l_hftyV, l_hntyV, l_lftyV, l_lntyV,...
yV, margcostV, ...
lambdacV, cmV, cyV, coldV,...
oy_hf_init_realV, oy_hn_init_realV, oy_lf_init_realV, oy_ln_init_realV,...
om_hf_init_realV, om_hn_init_realV, om_lf_init_realV, om_ln_init_realV,...
oy_hf_init_piV, oy_hn_init_piV, oy_lf_init_piV, oy_ln_init_piV,...
om_hf_init_piV, om_hn_init_piV, om_lf_init_piV, om_ln_init_piV,...
y_piV,...
omegayV, omegamV,...
N_ForceV,...
e_mV, u_mV, qqjV, SV, ...  
mV, thigtnessV, VsV,...
kkV, rksV,...
oy_init_piV, om_init_piV, om_init_realV, oy_init_realV,...
zzVV, ...
rsVV, ...
oy_hf_initVV, oy_hn_initVV, oy_lf_initVV, oy_ln_initVV, ...
om_hf_initVV, om_hn_initVV, om_lf_initVV, om_ln_initVV,...
LYVV, LMVV, ...
l_hftmVV, l_hntmVV, l_lftmVV, l_lntmVV,...
l_hftyVV, l_hntyVV, l_lftyVV, l_lntyVV,...
yVV, margcostVV, ...
lambdacVV, cmVV, cyVV, coldVV,...
oy_hf_init_realVV, oy_hn_init_realVV, oy_lf_init_realVV, oy_ln_init_realVV,...
om_hf_init_realVV, om_hn_init_realVV, om_lf_init_realVV, om_ln_init_realVV,...
oy_hf_init_piVV, oy_hn_init_piVV, oy_lf_init_piVV, oy_ln_init_piVV,...
om_hf_init_piVV, om_hn_init_piVV, om_lf_init_piVV, om_ln_init_piVV,...
y_piVV,...
omegayVV, omegamVV,...
N_ForceVV,...
e_mVV, u_mVV, qqjVV, SVV, ...  
mVV, thigtnessVV, VsVV,...
kkVV, rksVV,...
oy_init_piVV, om_init_piVV, om_init_realVV, oy_init_realVV,...
c_hfty,c_hnty,c_lfty,c_lnty,c_hftm,c_hntm,c_lftm,c_lntm,...
c_hftyV,c_hntyV,c_lftyV,c_lntyV,c_hftmV,c_hntmV,c_lftmV,c_lntmV,...
c_hftyVV,c_hntyVV,c_lftyVV,c_lntyVV,c_hftmVV,c_hntmVV,c_lftmVV,c_lntmVV,...
deltk1,k1, Chi_m, Chi_y,...
Uy_hf_initV, Uy_hn_initV, Uy_lf_initV, Uy_ln_initV, Um_hf_initV, Um_hn_initV, Um_lf_initV, Um_ln_initV,... 
Chi_m_hf_initV, Chi_m_hn_initV, Chi_m_lf_initV, Chi_m_ln_initV, Chi_y_hf_initV, Chi_y_hn_initV, Chi_y_lf_initV, Chi_y_ln_initV,... 
Uy_hf_initVV, Uy_hn_initVV, Uy_lf_initVV, Uy_ln_initVV, Um_hf_initVV, Um_hn_initVV, Um_lf_initVV, Um_ln_initVV,... 
Chi_m_hf_initVV, Chi_m_hn_initVV, Chi_m_lf_initVV, Chi_m_ln_initVV, Chi_y_hf_initVV, Chi_y_hn_initVV, Chi_y_lf_initVV, Chi_y_ln_initVV ] = bcapitalGOVUB_ss;





k1 = 0.5  % Zhifeng Cai and Jonathan Heathcote September11,2023
deltk1 = 0.05  % Zhifeng Cai and Jonathan Heathcote September11,2023



eeta       = 1.5;          % 1.5the curvature on the disutility of labor  1-4
bbeta      = 0.95;       % disocunt factor 
ssigmaTFP  = 0.08 ;        % standard deviation of TFP shock
rrhoTFP    = 0.95;       % quarterly autocorrelation of TFP shock
zz         = 1;
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

e_m = 0.95;   % employmnent rate
u_m = 1 - e_m;
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










Tax = 0.3 ; %tax on income



%bbeta3 = 0.95;


%theta = 0.75;
kappa = 0.0958 ; % (1-theta)*(1-bbeta3*theta)/theta;



lambdac =    0.9336


cm =    1.0175


cy =    1.0175


cold =    1.0175


LM =    1.0175


LY =    0.3392


yss =    3.1930


omegam =    0.0011


omegay =   2.0453e-04


oy_hf_init =   4.0103e-05


oy_hn_init =   9.6311e-05


oy_lf_init =   4.8306e-05


oy_ln_init =   2.2231e-04


om_hf_init =   8.5933e-05


om_hn_init =   3.4462e-04


om_lf_init =   1.2110e-04


om_ln_init =   4.8923e-04


N_Force =    1.4281


margcost =   3.8057e-04


l_hfty =    0.1145


l_hnty =    0.2053


l_lfty =    0.1296


l_lnty =    0.3585


l_hftm =   0.1903


l_hntm =    0.4803


l_lftm =    0.2391


l_lntm =    0.6066


Sfe =    0.0270


ms =    0.0357


thigtness =    1.7500


Vs =   0.0472


qqj =    0.7559


kk =    5.6159


y_pi =   6.7672e-04


c_hfty =    1.0175


c_hnty =    1.0175


c_lfty =    1.0175


c_lnty =   1.0175


c_hftm =    1.0175


c_hntm =    1.0175


c_lftm =    1.0175


c_lntm =    1.0175


c_hftyVV =    1.0175


c_hntyVV =    1.0175


c_lftyVV =    1.0175


c_lntyVV =    1.0175


c_hftmVV =    1.0175


c_hntmVV =    1.0175


c_lftmVV =    1.0175


c_lntmVV =   1.0175


c_hftyV =    1.0175


c_hntyV =   1.0175


c_lftyV =   1.0175


c_lntyV =    1.0175


c_hftmV =    1.0175


c_hntmV =    1.0175


c_lftmV =   1.0175


c_lntmV =   1.0175


k1 =    0.5000


deltk1 =    0.0500


Chi_m =    0.0503


Chi_y =    0.0501


























k1 = 0.5  % Zhifeng Cai and Jonathan Heathcote September11,2023
deltk1 = 0.05  % Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_m =  deltk1 + k1 * ( l_hftm * om_hf_init +  l_hntm * om_hn_init + l_lftm  * om_lf_init  + l_lntm * om_ln_init)     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_y =  deltk1 + k1 * ( l_hfty * oy_hf_init +  l_hnty * oy_hn_init + l_lfty  * oy_lf_init  + l_lnty * oy_ln_init)     %  Zhifeng Cai and Jonathan Heathcote September11,2023






qqjV = qqj; 
qqjVV = qqj;





%y_pi = 0;

oy_hf_init_real = oy_hf_init -  y_pi;
oy_hn_init_real = oy_hn_init -  y_pi;
oy_lf_init_real = oy_lf_init -  y_pi;
oy_ln_init_real = oy_ln_init -  y_pi;
om_hf_init_real = om_hf_init -  y_pi;
om_hn_init_real = om_hn_init -  y_pi;
om_lf_init_real = om_lf_init -  y_pi;
om_ln_init_real = om_ln_init -  y_pi;
om_init_real =  omegam  - y_pi;
oy_init_real =  omegay - y_pi;

oy_hf_init_pi =1;
oy_hn_init_pi =1;
oy_lf_init_pi = 1;
oy_ln_init_pi = 1;
om_hf_init_pi = 1;
om_hn_init_pi = 1;
om_lf_init_pi = 1;
om_ln_init_pi = 1;

oy_init_pi = 1;
om_init_pi = 1;



%bbeta3 = 0.95;
%theta = 0.75;
kappa = 0.0958 ; % (1-theta)*(1-bbeta3*theta)/theta;





ddelta_K = 0.025;
alpha_cob =0.30;  % 0.62-0.58
%xx1 =0.698913284594963;
Inves =  ddelta_K* kk ;
%margcostcap = rs/((1-alpha_cob)*kk^(-alpha_cob) * xx1^(alpha_cob)) ;
rks= rs ;



zzV = zz;
rsV= rs;
oy_hf_initV= oy_hf_init;
oy_hn_initV= oy_hn_init;
oy_lf_initV= oy_lf_init;
oy_ln_initV= oy_lf_init;
om_hf_initV= om_hf_init;
om_hn_initV= om_hn_init;
om_lf_initV= om_lf_init;
om_ln_initV=om_ln_init;
LYV= LY;
LMV= LM;
l_hftmV= l_hftm;
l_hntmV= l_hntm;
l_lftmV= l_lftm;
l_lntmV=l_lntm;
l_hftyV= l_hfty;
l_hntyV= l_hnty;
l_lftyV= l_lfty;
l_lntyV=l_lnty;
yV= yss;
margcostV=margcost; 
lambdacV= lambdac;
cmV= cm;
cyV= cy;
coldV=cold;
oy_hf_init_realV= oy_hf_init_real ;
oy_hn_init_realV= oy_hn_init_real;
oy_lf_init_realV= oy_lf_init_real;
oy_ln_init_realV= oy_ln_init_real;
om_hf_init_realV= om_hf_init_real;
om_hn_init_realV= om_hn_init_real;
om_lf_init_realV= om_lf_init_real;
om_ln_init_realV= om_ln_init_real;
oy_hf_init_piV= oy_hf_init_pi;
oy_hn_init_piV= oy_hn_init_pi;
oy_lf_init_piV= oy_lf_init_pi;
oy_ln_init_piV= oy_ln_init_pi;
om_hf_init_piV= om_hf_init_pi;
om_hn_init_piV= om_hn_init_pi;
om_lf_init_piV= om_lf_init_pi;
om_ln_init_piV= om_ln_init_pi;
y_piV=y_pi;
omegayV= omegay; 
omegamV= omegam;
N_ForceV= N_Force;
e_mV= e_m;
u_mV= u_m;
SV= Sfe ;
mV= ms;
thigtnessV= thigtness; 
VsV= Vs;
kkV= kk;
rksV= rks;
oy_init_piV= oy_init_pi; 
om_init_piV= om_init_pi ;
om_init_realV=  om_init_real;
oy_init_realV =  oy_init_real;















zzVV = zz;
rsVV= rs;
oy_hf_initVV= oy_hf_init;
oy_hn_initVV= oy_hn_init;
oy_lf_initVV= oy_lf_init;
oy_ln_initVV= oy_lf_init;
om_hf_initVV= om_hf_init;
om_hn_initVV= om_hn_init;
om_lf_initVV= om_lf_init;
om_ln_initVV=om_ln_init;
LYVV= LY;
LMVV= LM;
l_hftmVV= l_hftm;
l_hntmVV= l_hntm;
l_lftmVV= l_lftm;
l_lntmVV=l_lntm;
l_hftyVV= l_hfty;
l_hntyVV= l_hnty;
l_lftyVV= l_lfty;
l_lntyVV=l_lnty;
yVV= yss;
margcostVV=margcost; 
lambdacVV= lambdac;
cmVV= cm;
cyVV= cy;
coldVV=cold;
oy_hf_init_realVV= oy_hf_init_real ;
oy_hn_init_realVV= oy_hn_init_real;
oy_lf_init_realVV= oy_lf_init_real;
oy_ln_init_realVV= oy_ln_init_real;
om_hf_init_realVV= om_hf_init_real;
om_hn_init_realVV= om_hn_init_real;
om_lf_init_realVV= om_lf_init_real;
om_ln_init_realVV= om_ln_init_real;
oy_hf_init_piVV= oy_hf_init_pi;
oy_hn_init_piVV= oy_hn_init_pi;
oy_lf_init_piVV= oy_lf_init_pi;
oy_ln_init_piVV= oy_ln_init_pi;
om_hf_init_piVV= om_hf_init_pi;
om_hn_init_piVV= om_hn_init_pi;
om_lf_init_piVV= om_lf_init_pi;
om_ln_init_piVV= om_ln_init_pi;
y_piVV=y_pi;
omegayVV= omegay; 
omegamVV= omegam;
N_ForceVV= N_Force;
e_mVV= e_m;
u_mVV= u_m;
SVV= Sfe ;
mVV= ms;
thigtnessVV= thigtness; 
VsVV= Vs;
kkVV= kk;
rksVV= rks;
oy_init_piVV= oy_init_pi; 
om_init_piVV= om_init_pi ;
om_init_realVV=  om_init_real;
oy_init_realVV =  oy_init_real;

Chi_m_hf_initV =  deltk1 + k1 * ( l_hftm * om_hf_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_m_hn_initV =  deltk1 + k1 * ( l_hntm * om_hn_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_m_lf_initV =  deltk1 + k1 * ( l_lftm * om_lf_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_m_ln_initV =  deltk1 + k1 * ( l_lntm * om_ln_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023


Chi_y_hf_initV =  deltk1 + k1 * ( l_hfty * oy_hf_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_y_hn_initV =  deltk1 + k1 * ( l_hnty * oy_hn_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_y_lf_initV =  deltk1 + k1 * ( l_lfty * oy_lf_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_y_ln_initV =  deltk1 + k1 * ( l_lnty * oy_ln_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023


Chi_m_hf_initVV =  deltk1 + k1 * ( l_hftm * om_hf_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_m_hn_initVV =  deltk1 + k1 * ( l_hntm * om_hn_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_m_lf_initVV =  deltk1 + k1 * ( l_lftm * om_lf_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_m_ln_initVV =  deltk1 + k1 * ( l_lntm * om_ln_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023


Chi_y_hf_initVV =  deltk1 + k1 * ( l_hfty * oy_hf_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_y_hn_initVV =  deltk1 + k1 * ( l_hnty * oy_hn_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_y_lf_initVV =  deltk1 + k1 * ( l_lfty * oy_lf_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023
Chi_y_ln_initVV =  deltk1 + k1 * ( l_lnty * oy_ln_init )     %  Zhifeng Cai and Jonathan Heathcote September11,2023


Uy_hf_initV = bbeta *( log(  (1-Tax)* e_mV * oy_hf_initV/y_piV * l_hftyV + u_mV *  (deltk1 + k1 * ( l_hftyV * oy_hf_initV ) )+ kkV*(1+rsV) - kkVV ) - l_hftyV^(1+eeta) /(1+eeta) )
Uy_hn_initV = bbeta *(  log(  (1-Tax)* e_mV * oy_hn_initV/y_piV * l_hntyV + u_mV *  (deltk1 + k1 * ( l_hntyV * oy_hn_initV ) ) + kkV*(1+rsV) - kkVV ) - l_hntyV^(1+eeta) /(1+eeta) )
Uy_lf_initV = bbeta *( log(  (1-Tax)* e_mV * oy_lf_initV/y_piV * l_lftyV + u_mV *  (deltk1 + k1 * ( l_lftyV * oy_lf_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lftyV^(1+eeta) /(1+eeta) ) 
Uy_ln_initV =  bbeta *( log(  (1-Tax)* e_mV * oy_ln_initV/y_piV * l_lntyV + u_mV *  (deltk1 + k1 * ( l_lntyV * oy_ln_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lntyV^(1+eeta) /(1+eeta) ) 

Um_hf_initV = bbeta *(  log(  (1-Tax)* e_mV * om_hf_initV/y_piV * l_hftmV + u_mV * (deltk1 + k1 * ( l_hftmV * om_hf_initV ) ) + kkV*(1+rsV) - kkVV ) - l_hftmV^(1+eeta) /(1+eeta)  )
Um_hn_initV = bbeta *(  log(  (1-Tax)* e_mV * om_hn_initV/y_piV * l_hntmV + u_mV * (deltk1 + k1 * ( l_hntmV * om_hn_initV ) ) + kkV*(1+rsV) - kkVV ) - l_hntmV^(1+eeta) /(1+eeta)  )
Um_lf_initV = bbeta *(  log(  (1-Tax)* e_mV * om_lf_initV/y_piV * l_lftmV + u_mV * (deltk1 + k1 * ( l_lftmV * om_lf_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lftmV^(1+eeta) /(1+eeta) ) 
Um_ln_initV = bbeta *(  log(  (1-Tax)* e_mV * om_ln_initV/y_piV * l_lntmV + u_mV * (deltk1 + k1 * ( l_lntmV * om_ln_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lntmV^(1+eeta) /(1+eeta)  ) 


Uy_hf_initVV = bbeta *(  log(  (1-Tax)* e_mV * oy_hf_initV/y_piV * l_hftyV + u_mV *  (deltk1 + k1 * ( l_hftyV * oy_hf_initV ) )+ kkV*(1+rsV) - kkVV ) - l_hftyV^(1+eeta) /(1+eeta)  ) ;
Uy_hn_initVV = bbeta *(  log(  (1-Tax)* e_mV * oy_hn_initV/y_piV * l_hntyV + u_mV *  (deltk1 + k1 * ( l_hntyV * oy_hn_initV ) ) + kkV*(1+rsV) - kkVV ) - l_hntyV^(1+eeta) /(1+eeta)  );
Uy_lf_initVV = bbeta *(  log(  (1-Tax)* e_mV * oy_lf_initV/y_piV * l_lftyV + u_mV *  (deltk1 + k1 * ( l_lftyV * oy_lf_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lftyV^(1+eeta) /(1+eeta)  ); 
Uy_ln_initVV = bbeta *(  log(  (1-Tax)* e_mV * oy_ln_initV/y_piV * l_lntyV + u_mV *  (deltk1 + k1 * ( l_lntyV * oy_ln_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lntyV^(1+eeta) /(1+eeta)  );

Um_hf_initVV = bbeta *(  log(  (1-Tax)* e_mV * om_hf_initV/y_piV * l_hftmV + u_mV * (deltk1 + k1 * ( l_hftmV * om_hf_initV ) ) + kkV*(1+rsV) - kkVV ) - l_hftmV^(1+eeta) /(1+eeta)  );
Um_hn_initVV = bbeta *(  log(  (1-Tax)* e_mV * om_hn_initV/y_piV * l_hntmV + u_mV * (deltk1 + k1 * ( l_hntmV * om_hn_initV ) ) + kkV*(1+rsV) - kkVV ) - l_hntmV^(1+eeta) /(1+eeta)  );
Um_lf_initVV = bbeta *(  log(  (1-Tax)* e_mV * om_lf_initV/y_piV * l_lftmV + u_mV * (deltk1 + k1 * ( l_lftmV * om_lf_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lftmV^(1+eeta) /(1+eeta)  ); 
Um_ln_initVV = bbeta *(  log(  (1-Tax)* e_mV * om_ln_initV/y_piV * l_lntmV + u_mV * (deltk1 + k1 * ( l_lntmV * om_ln_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lntmV^(1+eeta) /(1+eeta)  ); 




%Uy_hf_initV =  log(c_hftyV) - l_hftyV^(1+eeta) /(1+eeta);
%Uy_hn_initV =  log(c_hntyV) - l_hntyV^(1+eeta) /(1+eeta);
%Uy_lf_initV =  log(c_lftyV) - l_lftyV^(1+eeta) /(1+eeta); 
%Uy_ln_initV =  log(c_lntyV) - l_lntyV^(1+eeta) /(1+eeta);
%Um_hf_initV =  log(c_hftmV) - l_hftmV^(1+eeta) /(1+eeta);
%%Um_hn_initV =  log(c_hntmV) - l_hntmV^(1+eeta) /(1+eeta);
%Um_lf_initV =  log(c_lftmV) - l_lftmV^(1+eeta) /(1+eeta); 
%Um_ln_initV =  log(c_lntmV) - l_lntmV^(1+eeta) /(1+eeta); 



%Uy_hf_initVV =  log(c_hftyV) - l_hftyV^(1+eeta) /(1+eeta);
%Uy_hn_initVV =  log(c_hntyV) - l_hntyV^(1+eeta) /(1+eeta);
%Uy_lf_initVV =  log(c_lftyV) - l_lftyV^(1+eeta) /(1+eeta); 
%Uy_ln_initVV =  log(c_lntyV) - l_lntyV^(1+eeta) /(1+eeta);
%Um_hf_initVV =  log(c_hftmV) - l_hftmV^(1+eeta) /(1+eeta);
%Um_hn_initVV =  log(c_hntmV) - l_hntmV^(1+eeta) /(1+eeta);
%Um_lf_initVV =  log(c_lftmV) - l_lftmV^(1+eeta) /(1+eeta); 
%Um_ln_initVV =  log(c_lntmV) - l_lntmV^(1+eeta) /(1+eeta); 









%



;