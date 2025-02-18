function [fx,fxp,fy,fyp,fypyp,fypy,fypxp,fypx,fyyp,fyy,fyxp,fyx,fxpyp,fxpy,fxpxp,fxpx,fxyp,fxy,fxxp,fxx,f] = bWOcapital_model

%(c) Stephanie Schmitt-Grohe and Martin Uribe
%Date July 17, 2001, revised 22-Oct-2004

%Define parameters
syms eeta  bbeta  aalpha  ssp  ssigmaparam  xiparam ...
ssigmaTFP rrhoTFP  zz  ...
theta_hf  theta_hn  theta_lf  theta_ln   ...
phi_hf  phi_hn  phi_lf  phi_ln  ...
varrho  upsilon  varepsilon  zetaparam   ...
rs  omegay  omegam ...
oy_hf_init  oy_hn_init  oy_lf_init  oy_ln_init  ...
om_hf_init  om_hn_init  om_lf_init  om_ln_init  ...
LY  LM ...
yss  margcost  ...
lambdac  cm  cy  cold   ddeltaCov ...
oy_hf_init_real  oy_hn_init_real  oy_lf_init_real  oy_ln_init_real ...
om_hf_init_real  om_hn_init_real  om_lf_init_real  om_ln_init_real ...
oy_hf_init_pi  oy_hn_init_pi  oy_lf_init_pi  oy_ln_init_pi ...
om_hf_init_pi  om_hn_init_pi  om_lf_init_pi  om_ln_init_pi ...
l_hftm  l_hntm  l_lftm  l_lntm ...
l_hfty  l_hnty  l_lfty  l_lnty ...
y_pi  ...
N_Force  ...
alp  ms  kappa   thigtness  Vs ...
e_m  u_m  qqj  Sfe  de ...
kk  alpha_cob  rks ...
ddelta_K  Inves ...
oy_init_pi   om_init_pi  om_init_real  oy_init_real...
c_hfty c_hnty c_lfty c_lnty c_hftm c_hntm c_lftm c_lntm



%Define variables 
syms zzV...
rsV  ...
oy_hf_initV  oy_hn_initV  oy_lf_initV  oy_ln_initV  ...
om_hf_initV  om_hn_initV  om_lf_initV  om_ln_initV ...
LYV  LMV  ...
l_hftmV  l_hntmV  l_lftmV  l_lntmV ...
l_hftyV  l_hntyV  l_lftyV  l_lntyV ...
yV  margcostV  ...
lambdacV  cmV  cyV  coldV ...
oy_hf_init_realV  oy_hn_init_realV  oy_lf_init_realV  oy_ln_init_realV ...
om_hf_init_realV  om_hn_init_realV  om_lf_init_realV  om_ln_init_realV ...
oy_hf_init_piV  oy_hn_init_piV  oy_lf_init_piV  oy_ln_init_piV ...
om_hf_init_piV  om_hn_init_piV  om_lf_init_piV  om_ln_init_piV ...
y_piV ...
omegayV  omegamV ...
N_ForceV ...
e_mV  u_mV qqjV  SV  ...  
mV  thigtnessV  VsV ...
kkV  rksV ...
oy_init_piV  om_init_piV  om_init_realV  oy_init_realV ...
c_hftyV c_hntyV c_lftyV c_lntyV c_hftmV c_hntmV c_lftmV c_lntmV...
zzVV  ...
rsVV  ...
oy_hf_initVV  oy_hn_initVV  oy_lf_initVV  oy_ln_initVV  ...
om_hf_initVV  om_hn_initVV  om_lf_initVV  om_ln_initVV ...
LYVV  LMVV  ...
l_hftmVV  l_hntmVV  l_lftmVV  l_lntmVV ...
l_hftyVV  l_hntyVV  l_lftyVV  l_lntyVV ...
yVV  margcostVV  ...
lambdacVV  cmVV  cyVV  coldVV ...
oy_hf_init_realVV  oy_hn_init_realVV  oy_lf_init_realVV  oy_ln_init_realVV ...
om_hf_init_realVV  om_hn_init_realVV  om_lf_init_realVV  om_ln_init_realVV ...
oy_hf_init_piVV  oy_hn_init_piVV  oy_lf_init_piVV  oy_ln_init_piVV ...
om_hf_init_piVV  om_hn_init_piVV  om_lf_init_piVV  om_ln_init_piVV ...
y_piVV ...
omegayVV  omegamVV ...
N_ForceVV ...
e_mVV  u_mVV  qqjVV  SVV  ...  
mVV  thigtnessVV  VsVV ...
kkVV  rksVV ...
oy_init_piVV  om_init_piVV  om_init_realVV  oy_init_realVV...
c_hftyVV c_hntyVV c_lftyVV c_lntyVV c_hfmVV c_hntmVV c_lftmVV c_lntmVV 
 


% exogenous 
% zz
f1 =  - 1/zz * zzVV + 1/zz * 0.85 * zzV  - ddeltaCov ;  % rrhoTFP - ddeltaCov * 1   e1 ; % ssigmaTFP

%f2 = - (kkVV -(1-ddelta_K)* kkV ) +   yV -  cmV-  cyV -  coldV;
f2 = -y_piV + bbeta*  y_piVV - kappa  * margcostV;

f3 = -SVV +  0.95* SV   ; % + e3% S N KK
f4 = - lambdacV + lambdacVV *bbeta*(1+rsV) ; % lambda 

% f35 = - u_mV + (1 -   e_mV);
% f35 = 

f5 = - N_ForceVV   +  (1-de) * N_ForceV +  qqjV * VsV ;  %+ej * SV     % -x(18) + (1-de)* x(18)  + qqjV * VsV ;

f6 = - u_mV + (1 -   e_mV);

% - 1/e_m * e_mVV +   1/e_m * 0.95 *  e_mV ; %  + e4   % e_m    %f2 = - e_mVV +  (1- 0.95 )*  e_mV ; %  + e4






% philips curve
%f2 = -y_piV + bbeta*  y_piVV - kappa  * margcostV; % philips curve


f7 = - mV + SV^(alp) *  (VsV)^(1-alp) ;
f8 = - qqjV  +   mV / VsV ; %  job finding rate   qq = ms/Vs
f9 = - mV / SV  +    (thigtnessV)^(1-alp)  ;   % ms / Sfe  = tihhtness^(1-alp)
f10 = -VsV + thigtnessV * SV;  % thightness = Vs / S




 % Consumer Euler equation 
 % Consumer Bloc
 % F.O.C. wrt cy

f11=  -bbeta/cyV + bbeta/cyVV *bbeta * (1+rsV) ; %   bbeta/cyV - lambdacV;

 % F.O.C. wrt cm
f12 =   -bbeta/cmV + bbeta/cmVV  * bbeta * (1+rsV)  ; % bbeta/cmV - lambdacV;

 % F.O.C. wrt co
f13 = -bbeta/coldV  + bbeta/coldVV *bbeta * (1+rsV)   ; %   bbeta/coldV - lambdacV;


 % F.O.C. wrt to lm 
f14 = -LMV + ((lambdacV * e_mV * omegamV)/(bbeta*y_piV) )^(1/eeta); 

f15 = -l_hftmV + ((lambdacV * e_mV * om_hf_initV )/(bbeta*y_piV) )^(1/eeta); 
f16 = -l_hntmV + ((lambdacV * e_mV * om_hn_initV )/(bbeta*y_piV) )^(1/eeta); 
f17 = -l_lftmV + ((lambdacV * e_mV * om_lf_initV )/(bbeta*y_piV) )^(1/eeta); 
f18 = -l_lntmV + ((lambdacV * e_mV * om_ln_initV )/(bbeta*y_piV) )^(1/eeta); 


 % F.O.C. wrt to ly


f19 = -LYV + ((lambdacV * e_mV * omegayV)/(bbeta*y_piV) )^(1/eeta) ;  %  

f20 = -l_hftyV  + ((lambdacV * e_mV * oy_hf_initV)/(bbeta*y_piV) )^(1/eeta) ;  %  
f21 = -l_hntyV  + ((lambdacV * e_mV * oy_hn_initV)/(bbeta*y_piV) )^(1/eeta) ;  %  
f22 = -l_lftyV  + ((lambdacV * e_mV * oy_lf_initV)/(bbeta*y_piV) )^(1/eeta) ;  %  
f23 = -l_lntyV  + ((lambdacV * e_mV * oy_ln_initV)/(bbeta*y_piV) )^(1/eeta) ;  %  


%f19 = 1/cmV + (LMV^(eeta) * y_piV)/ (e_mV * omegamV );  % ok optimality condition 

%f24 =  -e_mV + ( LYV + LMV )/N_ForceV    ;
%f24 = - u_mVV  +  de *  e_mV - 0.45 *  u_mV  ;  %+ej * SV     % -x(18) + (1-de)* x(18)  + qqjV * VsV ;
%f24 = - e_mV  +  (1-0.55) *  ( l_hftyV + l_hntyV + l_lftyV + l_lntyV + l_hftmV + l_hntmV + l_lftmV + l_lntmV)/N_ForceV + 0.45 *  u_mV  ;  %+ej * SV     % -x(18) + (1-de)* x(18)  + qqjV * VsV ;
%f24 = - e_mV  +  (1-0.525) *  ( l_hftyV + l_hntyV + l_lftyV + l_lntyV + l_hftmV + l_hntmV + l_lftmV + l_lntmV)/N_ForceV + 0.45 *  u_m  ;  %+ej * SV     % -x(18) + (1-de)* x(18)  + qqjV * VsV ;
f24 = - e_mV  +  (1-0.55) *  ( l_hftyV + l_hntyV + l_lftyV + l_lntyV + l_hftmV + l_hntmV + l_lftmV + l_lntmV)/N_ForceV + 0.45 *  u_mV  ;

f25 = - aalpha +  LYV /(  LYV + LMV ); 

%f20 =  1/cyV + (LYV^(eeta) * y_piV)/ (e_mV * omegayV )  ;  %  ok optimality condition 


% rk
%f26 = - margcostV +  rksV  *  kkV  /((1-alpha_cob)  * yV);
% return on capital condition
%f27 = - rksV + rsV ;
%f27 = - rks   + rsV; 
 % producer Bloc

 % production function
f28 = - yV + (zzV * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)) ) ;
 






% labore demand 
f29 = - omegayV + margcostV *aalpha *zzV * (LYV )^(1/ssp-1) * ( aalpha * (LYV)^(1/ssp) + (1-aalpha)* (LMV)^(1/ssp) )^(ssp-1)   ;



f30 = - omegamV + margcostV *(1-aalpha) *zzV * (LMV )^(1/ssp-1)  * ( aalpha * (LYV)^(1/ssp) + (1-aalpha)* (LMV)^(1/ssp) )^(ssp-1) ;


 % F.O.C. wrt labor (same order of equations in the appendix) 
f31 = -oy_hf_initV + margcostV * aalpha *zzV * ( l_hftyV * phi_hf)^(1/varrho-1) *  (( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam-1) * ((( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam) + ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam))^(ssigmaparam-1) *(LYV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f32 = -oy_hn_initV + margcostV  * aalpha *zzV * (l_hntyV  * phi_hn )^(1/varrho-1) * (( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam-1)  * ((( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam) + ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam))^(ssigmaparam-1) *(LYV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f33 = -oy_lf_initV + margcostV * aalpha *zzV * (l_lftyV * phi_lf)^(1/upsilon-1) * ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam-1) * ((( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam) + ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam))^(ssigmaparam-1) *(LYV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f34 = -oy_ln_initV + margcostV * aalpha *zzV * (l_lntyV * phi_ln)^(1/upsilon-1) * ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam-1) * ((( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam) + ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam))^(ssigmaparam-1) *(LYV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f35 = -om_hf_initV + margcostV *  (1-aalpha) *zzV * ( l_hftmV * theta_hf)^(1/varepsilon-1) * (( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam-1) * ((( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam) + ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam))^(xiparam-1) *(LMV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f36 = -om_hn_initV +  margcostV *  (1-aalpha) *zzV * (l_hntmV  * theta_hn)^(1/varepsilon-1) * (( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam-1) * ((( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam) + ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam))^(xiparam-1) *(LMV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f37 = -om_lf_initV +  margcostV * (1-aalpha) *zzV * (l_lftmV * theta_lf)^(1/zetaparam-1) * ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam-1) * ((( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam) + ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam))^(xiparam-1) *(LMV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f38 = -om_ln_initV +  margcostV * (1-aalpha) *zzV * (l_lntmV * theta_ln)^(1/zetaparam-1)  * ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam-1) * ((( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam) + ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam))^(xiparam-1) *(LMV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);



 





% real wages (accounting for inlfation )and wage inflation (nominal wage growth)

f39 = -oy_hf_init_realV  *  (y_piV) +  oy_hf_initV;
f40 = -oy_hf_init_piV +   oy_hf_initVV / oy_hf_initV;

f41 = -oy_hn_init_realV  *  (y_piV)  + oy_hn_initV;
f42 = -oy_hn_init_piV  +  oy_hn_initVV /  oy_hn_initV;

f43 =  -oy_lf_init_realV *   (y_piV)  +  oy_lf_initV; 
f44 =  -oy_lf_init_piV  +  oy_lf_initVV /  oy_lf_initV ;

f45 = -oy_ln_init_realV *   (y_piV)  +  oy_ln_initV;
f46 = -oy_ln_init_piV  +  oy_ln_initVV /  oy_ln_initV;

f47 =  -om_hf_init_realV *   (y_piV)  +  om_hf_initV;
f48 =  -om_hf_init_piV  +  om_hf_initVV /  om_hf_initV ;

f49 = -om_hn_init_realV *   (y_piV)  +  om_hn_initV;
f50 = -om_hn_init_piV  +  om_hn_initVV /  om_hn_initV ; 

f51 = -om_lf_init_realV *   (y_piV)  +  om_lf_initV;
f52 = -om_lf_init_piV  +  om_lf_initVV /  om_lf_initV;

f53 =  -om_ln_init_realV *   (y_piV) +  om_ln_initV;
f54 =  -om_ln_init_piV  +  om_ln_initVV /  om_ln_initV;

f55 = -om_init_realV *   (y_piV)  +  omegamV;
f56 = -om_init_piV  + omegamVV / omegamV;

f57 = -oy_init_realV *  (y_piV) +  omegayV;
f58 = -oy_init_piV  +  omegayVV /  omegayV;
f59 = - (kk -(1-ddelta_K)* kk ) +   yV -  cmV-  cyV -  coldV;




 % negative productivity shock 

%Create function f

f = [f1;f2;
    %f3;
    f4;
    %f5;
    f6;
    %f7;f8;f9;f10;
    f11;f12;f13;f14;f15;f16;f17;f18;f19;f20;
    f21;f22;f23;f24;f25;    %f26;f27;
    f28;f29;f30;
    f31;f32;f33;f34;f35;f36;f37;f38;f39;f40;
    f41;f42;f43;f44;f45;f46;f47;f48;f49;f50;
    f51;f52;f53;f54;f55;f56;f57;f58    ;f59
    ];

%;f4;f7;f8;f9;f10;
%    f11;f12;f13;f14;f15;f16;f17;f18;f19;f20;
%    f21;f22;f23;f24;f25;f26;f27;f28;f29;f30;
%    f31;f32;f33;f35;f36;f37;f38;f39;f40;
%    f41;f42;f43;f44;f45;f46;f47;f48;f49;f50;
%    f51;f52;f53;f54;f55;f56;f57;f58


%;f59rksV
% c cp ik ikp la lap y yp k kp b bp r rp a ap tau_l tau_lp tau_k tau_kp tau_b tau_bp 

% Define the vector of controls, y, and states, x  kkV
 x = [cyV cmV   lambdacV  zzV      ];
 % N_ForceV SV  mV VsV qqjV thigtnessV
y = [  coldV...
y_piV  u_mV e_mV    rsV   margcostV  ...  
LYV  LMV   ...
yV    ...
omegayV  omegamV   oy_hf_initV  oy_hn_initV  oy_lf_initV  oy_ln_initV  ...
om_hf_initV  om_hn_initV  om_lf_initV  om_ln_initV   ...      
l_hftmV  l_hntmV  l_lftmV  l_lntmV ...
l_hftyV  l_hntyV  l_lftyV  l_lntyV ...   
oy_hf_init_realV  oy_hn_init_realV  oy_lf_init_realV  oy_ln_init_realV ...
om_hf_init_realV  om_hn_init_realV  om_lf_init_realV  om_ln_init_realV ...
oy_init_piV  om_init_piV  om_init_realV  oy_init_realV ...
oy_hf_init_piV  oy_hn_init_piV  oy_lf_init_piV  oy_ln_init_piV ...
om_hf_init_piV  om_hn_init_piV  om_lf_init_piV  om_ln_init_piV ...
];



%  rksVV kkVV


xp = [cyVV cmVV    lambdacVV  zzVV  ];
% N_ForceVV SVV  mVV VsVV qqjVV thigtnessVV 
yp = [ coldVV ...
y_piVV u_mVV e_mVV  rsVV   margcostVV      ...
LYVV  LMVV ... 
yVV   ...
omegayVV omegamVV oy_hf_initVV  oy_hn_initVV  oy_lf_initVV  oy_ln_initVV ...
om_hf_initVV  om_hn_initVV  om_lf_initVV  om_ln_initVV  ...
l_hftmVV  l_hntmVV  l_lftmVV  l_lntmVV ...
l_hftyVV  l_hntyVV  l_lftyVV  l_lntyVV   ...   
oy_hf_init_realVV  oy_hn_init_realVV  oy_lf_init_realVV  oy_ln_init_realVV ...
om_hf_init_realVV  om_hn_init_realVV  om_lf_init_realVV  om_ln_init_realVV  ...
oy_init_piVV  om_init_piVV  om_init_realVV  oy_init_realVV...
oy_hf_init_piVV  oy_hn_init_piVV  oy_lf_init_piVV  oy_ln_init_piVV ...
om_hf_init_piVV  om_hn_init_piVV  om_lf_init_piVV  om_ln_init_piVV...
]; %..
%

%Make f a function of the logarithm of the state and control vector
f = subs(f, [x,y,xp,yp], exp([x,y,xp,yp]));

%Compute analytical derivatives of f
[fx,fxp,fy,fyp,fypyp,fypy,fypxp,fypx,fyyp,fyy,fyxp,fyx,fxpyp,fxpy,fxpxp,fxpx,fxyp,fxy,fxxp,fxx]=anal_deriv(f,x,y,xp,yp);