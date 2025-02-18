function [fx,fxp,fy,fyp,fypyp,fypy,fypxp,fypx,fyyp,fyy,fyxp,fyx,fxpyp,fxpy,fxpxp,fxpx,fxyp,fxy,fxxp,fxx,f] = bcapital_modelGOVUB

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
kk alpha_cob rks Tax ...
ddelta_K  Inves ...
oy_init_pi   om_init_pi  om_init_real  oy_init_real...
c_hfty c_hnty c_lfty c_lnty c_hftm c_hntm c_lftm c_lntm...
k1 deltk1 Chi_m Chi_y





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
Uy_hf_initV Uy_hn_initV Uy_lf_initV Uy_ln_initV Um_hf_initV Um_hn_initV Um_lf_initV Um_ln_initV... 
Chi_m_hf_initV Chi_m_hn_initV Chi_m_lf_initV Chi_m_ln_initV Chi_y_hf_initV Chi_y_hn_initV Chi_y_lf_initV Chi_y_ln_initV... 
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
c_hftyVV c_hntyVV c_lftyVV c_lntyVV c_hfmVV c_hntmVV c_lftmVV c_lntmVV...
Uy_hf_initVV Uy_hn_initVV Uy_lf_initVV Uy_ln_initVV Um_hf_initVV Um_hn_initVV Um_lf_initVV Um_ln_initVV... 
Chi_m_hf_initVV Chi_m_hn_initVV Chi_m_lf_initVV Chi_m_ln_initVV Chi_y_hf_initVV Chi_y_hn_initVV Chi_y_lf_initVV Chi_y_ln_initVV

 
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
f14 = -LMV + ((lambdacV *(1-Tax)* e_mV * omegamV)/(bbeta*y_piV) )^(1/eeta); 

f15 = -l_hftmV + ((lambdacV *(1-Tax)* e_mV * om_hf_initV )/(bbeta*y_piV) )^(1/eeta); 
f16 = -l_hntmV + ((lambdacV *(1-Tax)* e_mV * om_hn_initV )/(bbeta*y_piV) )^(1/eeta); 
f17 = -l_lftmV + ((lambdacV *(1-Tax)* e_mV * om_lf_initV )/(bbeta*y_piV) )^(1/eeta); 
f18 = -l_lntmV + ((lambdacV *(1-Tax)* e_mV * om_ln_initV )/(bbeta*y_piV) )^(1/eeta); 


 % F.O.C. wrt to ly


f19 = -LYV + ((lambdacV *(1-Tax)* e_mV * omegayV)/(bbeta*y_piV) )^(1/eeta) ;  %  

f20 = -l_hftyV  + ((lambdacV *(1-Tax)* e_mV * oy_hf_initV)/(bbeta*y_piV) )^(1/eeta) ;  %  
f21 = -l_hntyV  + ((lambdacV *(1-Tax)* e_mV * oy_hn_initV)/(bbeta*y_piV) )^(1/eeta) ;  %  
f22 = -l_lftyV  + ((lambdacV *(1-Tax)* e_mV * oy_lf_initV)/(bbeta*y_piV) )^(1/eeta) ;  %  
f23 = -l_lntyV  + ((lambdacV *(1-Tax)* e_mV * oy_ln_initV)/(bbeta*y_piV) )^(1/eeta) ;  %  


%f19 = 1/cmV + (LMV^(eeta) * y_piV)/ (e_mV * omegamV );  % ok optimality condition 

%f24 =  -e_mV + ( LYV + LMV )/N_ForceV    ; 
%f24 = - u_mVV  +  de *  e_mV - 0.45 *  u_mV  ;  %+ej * SV     % -x(18) + (1-de)* x(18)  + qqjV * VsV ;
%f24 = - e_mV  +  (1-0.525) *  ( l_hftyV + l_hntyV + l_lftyV + l_lntyV + l_hftmV + l_hntmV + l_lftmV + l_lntmV)/N_ForceV + 0.45 *  u_mV  ;  %+ej * SV     % -x(18) + (1-de)* x(18)  + qqjV * VsV ;
f24 = - e_mV  +  (1-0.55) *  ( l_hftyV + l_hntyV + l_lftyV + l_lntyV + l_hftmV + l_hntmV + l_lftmV + l_lntmV)/N_ForceV + 0.45 *  u_mV  ;


f25 = - aalpha +  LYV /(  LYV + LMV ); 

%f20 =  1/cyV + (LYV^(eeta) * y_piV)/ (e_mV * omegayV )  ;  %  ok optimality condition 


% rk
f26 = - margcostV +  rksV  *  kkV  /((1-alpha_cob)  * yV);
% return on capital condition
f27 = - rksV + rsV ;
%f27 = - rks   + rsV; 
 % producer Bloc

 % production function
f28 = - yV + (zzV * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)) )^(alpha_cob) * (kkV)^(1-alpha_cob) ;
 






% labore demand 
f29 = - omegayV + margcostV *   kkV^(1-alpha_cob) *aalpha *zzV * (LYV )^(1/ssp-1) * ( aalpha * (LYV)^(1/ssp) + (1-aalpha)* (LMV)^(1/ssp) )^(ssp-1) *   (  zzV  * ( aalpha * (LYV)^(1/ssp) + (1-aalpha)* (LMV)^(1/ssp) )^(ssp) )^(alpha_cob-1);



f30 = - omegamV + margcostV *   kkV^(1-alpha_cob) *(1-aalpha) *zzV * (LMV )^(1/ssp-1)  * ( aalpha * (LYV)^(1/ssp) + (1-aalpha)* (LMV)^(1/ssp) )^(ssp-1) *  (  zzV  * ( aalpha * (LYV)^(1/ssp) + (1-aalpha)* (LMV)^(1/ssp) )^(ssp) )^(alpha_cob-1);


 % F.O.C. wrt labor (same order of equations in the appendix) 
f31 = -oy_hf_initV + margcostV * alpha_cob* (kkV)^(1-alpha_cob)  * aalpha *zzV * ( l_hftyV * phi_hf)^(1/varrho-1) *  (( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam-1) * ((( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam) + ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam))^(ssigmaparam-1) *(LYV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f32 = -oy_hn_initV + margcostV * alpha_cob* (kkV)^(1-alpha_cob) * aalpha *zzV * (l_hntyV  * phi_hn )^(1/varrho-1) * (( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam-1)  * ((( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam) + ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam))^(ssigmaparam-1) *(LYV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f33 = -oy_lf_initV + margcostV * alpha_cob* (kkV)^(1-alpha_cob)  * aalpha *zzV * (l_lftyV * phi_lf)^(1/upsilon-1) * ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam-1) * ((( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam) + ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam))^(ssigmaparam-1) *(LYV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f34 = -oy_ln_initV + margcostV * alpha_cob* (kkV)^(1-alpha_cob)  * aalpha *zzV * (l_lntyV * phi_ln)^(1/upsilon-1) * ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam-1) * ((( l_hftyV * phi_hf)^(1/varrho) + (l_hntyV  * phi_hn )^(1/varrho))^(varrho/ssigmaparam) + ((l_lftyV * phi_lf)^(1/upsilon) + (l_lntyV * phi_ln)^(1/upsilon))^(upsilon/ssigmaparam))^(ssigmaparam-1) *(LYV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f35 = -om_hf_initV + margcostV * alpha_cob* (kkV)^(1-alpha_cob)  * (1-aalpha) *zzV * ( l_hftmV * theta_hf)^(1/varepsilon-1) * (( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam-1) * ((( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam) + ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam))^(xiparam-1) *(LMV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f36 = -om_hn_initV +  margcostV * alpha_cob* (kkV)^(1-alpha_cob)  * (1-aalpha) *zzV * (l_hntmV  * theta_hn)^(1/varepsilon-1) * (( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam-1) * ((( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam) + ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam))^(xiparam-1) *(LMV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f37 = -om_lf_initV +  margcostV * alpha_cob* (kkV)^(1-alpha_cob)  * (1-aalpha) *zzV * (l_lftmV * theta_lf)^(1/zetaparam-1) * ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam-1) * ((( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam) + ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam))^(xiparam-1) *(LMV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);


f38 = -om_ln_initV +  margcostV * alpha_cob* (kkV)^(1-alpha_cob)  * (1-aalpha) *zzV * (l_lntmV * theta_ln)^(1/zetaparam-1)  * ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam-1) * ((( l_hftmV * theta_hf)^(1/varepsilon) + (l_hntmV  * theta_hn)^(1/varepsilon))^(varepsilon/xiparam) + ((l_lftmV * theta_lf)^(1/zetaparam) + (l_lntmV * theta_ln)^(1/zetaparam))^(zetaparam/xiparam))^(xiparam-1) *(LMV)^((ssp-1)/ssp-1) * ( aalpha * (LYV)^((ssp-1)/ssp) + (1-aalpha)* (LMV)^((ssp-1)/ssp) )^(ssp/(ssp-1)-1);



 





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
f59 = - (kkVV -(1-ddelta_K)* kkV ) +   yV -  cmV-  cyV -  coldV;



%f60 = -Uy_hf_initV +  log(  (1-Tax)* e_mV * oy_hf_initV/y_piV * l_hftyV + u_mV *  (deltk1 + k1 * ( l_hftmV * om_hf_initV ) ) + kkV*(1+rsV) - kkVV ) - l_hftyV^(1+eeta) /(1+eeta);
%f61 = -Uy_hn_initV +  log(  (1-Tax)* e_mV * oy_hn_initV/y_piV * l_hntyV + u_mV *  (deltk1 + k1 * ( l_hntmV * om_hn_initV ) ) + kkV*(1+rsV) - kkVV ) - l_hntyV^(1+eeta) /(1+eeta);
%f62 = -Uy_lf_initV +  log(  (1-Tax)* e_mV * oy_lf_initV/y_piV * l_lftyV + u_mV *  (deltk1 + k1 * ( l_lftmV * om_lf_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lftyV^(1+eeta) /(1+eeta); 
%f63 = -Uy_ln_initV +  log(  (1-Tax)* e_mV * oy_ln_initV/y_piV * l_lntyV + u_mV *  (deltk1 + k1 * ( l_lntmV * om_ln_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lntyV^(1+eeta) /(1+eeta);

%f64 = -Um_hf_initV +  log(  (1-Tax)* e_mV * om_hf_initV/y_piV * l_hftmV + u_mV * Chi_m_hf_initV + kkV*(1+rsV) - kkVV  ) - l_hftmV^(1+eeta) /(1+eeta);
%f65 = -Um_hn_initV +  log(  (1-Tax)* e_mV * om_hn_initV/y_piV * l_hntmV + u_mV * Chi_m_hn_initV + kkV*(1+rsV) - kkVV  ) - l_hntmV^(1+eeta) /(1+eeta);
%f66 = -Um_lf_initV +  log(  (1-Tax)* e_mV * om_lf_initV/y_piV * l_lftmV + u_mV * Chi_m_lf_initV + kkV*(1+rsV) - kkVV  ) - l_lftmV^(1+eeta) /(1+eeta); 
%f67 = -Um_ln_initV +  log( bbeta/lambdacV ) - l_lntmV^(1+eeta) /(1+eeta); 





f60 = -Uy_hf_initV + bbeta *( log(  (1-Tax)* e_mV * oy_hf_initV/y_piV * l_hftyV + u_mV *  (deltk1 + k1 * ( l_hftyV * oy_hf_initV ) )+ kkV*(1+rsV) - kkVV ) - l_hftyV^(1+eeta) /(1+eeta)  );
f61 = -Uy_hn_initV + bbeta *( log(  (1-Tax)* e_mV * oy_hn_initV/y_piV * l_hntyV + u_mV *  (deltk1 + k1 * ( l_hntyV * oy_hn_initV ) ) + kkV*(1+rsV) - kkVV ) - l_hntyV^(1+eeta) /(1+eeta)  );
f62 = -Uy_lf_initV + bbeta *( log(  (1-Tax)* e_mV * oy_lf_initV/y_piV * l_lftyV + u_mV *  (deltk1 + k1 * ( l_lftyV * oy_lf_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lftyV^(1+eeta) /(1+eeta)  ); 
f63 = -Uy_ln_initV + bbeta *( log(  (1-Tax)* e_mV * oy_ln_initV/y_piV * l_lntyV + u_mV *  (deltk1 + k1 * ( l_lntyV * oy_ln_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lntyV^(1+eeta) /(1+eeta)  );

f64 = -Um_hf_initV + bbeta *( log(  (1-Tax)* e_mV * om_hf_initV/y_piV * l_hftmV + u_mV * (deltk1 + k1 * ( l_hftmV * om_hf_initV ) ) + kkV*(1+rsV) - kkVV ) - l_hftmV^(1+eeta) /(1+eeta)  );
f65 = -Um_hn_initV + bbeta *( log(  (1-Tax)* e_mV * om_hn_initV/y_piV * l_hntmV + u_mV * (deltk1 + k1 * ( l_hntmV * om_hn_initV ) ) + kkV*(1+rsV) - kkVV ) - l_hntmV^(1+eeta) /(1+eeta)  );
f66 = -Um_lf_initV + bbeta *( log(  (1-Tax)* e_mV * om_lf_initV/y_piV * l_lftmV + u_mV * (deltk1 + k1 * ( l_lftmV * om_lf_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lftmV^(1+eeta) /(1+eeta)  ); 
f67 = -Um_ln_initV + bbeta *( log(  (1-Tax)* e_mV * om_ln_initV/y_piV * l_lntmV + u_mV * (deltk1 + k1 * ( l_lntmV * om_ln_initV ) ) + kkV*(1+rsV) - kkVV ) - l_lntmV^(1+eeta) /(1+eeta)  ); 








%f68 =  -Chi_m_hf_initV +  deltk1 + k1 * ( l_hftmV * om_hf_initV )  ;   %  Zhifeng Cai and Jonathan Heathcote September11,2023
%f69 =  -Chi_m_hn_initV +  deltk1 + k1 * ( l_hntmV * om_hn_initV )  ;   %  Zhifeng Cai and Jonathan Heathcote September11,2023
%f70 =  -Chi_m_lf_initV +  deltk1 + k1 * ( l_lftmV * om_lf_initV )  ;   %  Zhifeng Cai and Jonathan Heathcote September11,2023
%f71 =  -Chi_m_ln_initV +  deltk1 + k1 * ( l_lntmV * om_ln_initV )  ;   %  Zhifeng Cai and Jonathan Heathcote September11,2023


%f72 = -Chi_y_hf_initV +  deltk1 + k1 * ( l_hftyV * oy_hf_initV ) ;    %  Zhifeng Cai and Jonathan Heathcote September11,2023
%f73 = -Chi_y_hn_initV +  deltk1 + k1 * ( l_hntyV * oy_hn_initV ) ;    %  Zhifeng Cai and Jonathan Heathcote September11,2023
%f74 = -Chi_y_lf_initV +  deltk1 + k1 * ( l_lftyV * oy_lf_initV ) ;    %  Zhifeng Cai and Jonathan Heathcote September11,2023
%f75 = -Chi_y_ln_initV +  deltk1 + k1 * ( l_lntyV * oy_ln_initV ) ;    %  Zhifeng Cai and Jonathan Heathcote September11,2023






 % negative productivity shock 

%Create function f

f = [f1;f2;
    %f3;
    f4;
    %f5;
    f6;
    %f7;f8;f9;f10;
    f11;f12;f13;f14;f15;f16;f17;f18;f19;f20;
    f21;f22;f23;f24;f25;f26;f27;f28;f29;f30;
    f31;f32;f33;f34;f35;f36;f37;f38;f39;f40;
    f41;f42;f43;f44;f45;f46;f47;f48;f49;f50;
    f51;f52;f53;f54;f55;f56;f57;f58;f59;f60;
    f61;f62;f63;f64;f65;f66;f67];
    %;f68;f69;f70;
    %f71;f72;f73;f74;f75


%;f4;f7;f8;f9;f10;
%    f11;f12;f13;f14;f15;f16;f17;f18;f19;f20;
%    f21;f22;f23;f24;f25;f26;f27;f28;f29;f30;
%    f31;f32;f33;f35;f36;f37;f38;f39;f40;
%    f41;f42;f43;f44;f45;f46;f47;f48;f49;f50;
%    f51;f52;f53;f54;f55;f56;f57;f58


%;f59
% c cp ik ikp la lap y yp k kp b bp r rp a ap tau_l tau_lp tau_k tau_kp tau_b tau_bp 

% Define the vector of controls, y, and states, x
x = [ zzV lambdacV  cyV cmV  coldV ];    
%SV...
 %N_ForceV ...
 %mV VsV qqjV thigtnessV ...

y = [kkV y_piV omegayV  omegamV   oy_hf_initV  oy_hn_initV  oy_lf_initV  oy_ln_initV...
om_hf_initV  om_hn_initV  om_lf_initV  om_ln_initV...       
u_mV e_mV  ... 
rsV   margcostV...  
Uy_hf_initV Uy_hn_initV Uy_lf_initV Uy_ln_initV Um_hf_initV Um_hn_initV Um_lf_initV Um_ln_initV... 
l_hftmV  l_hntmV  l_lftmV  l_lntmV...
l_hftyV  l_hntyV  l_lftyV  l_lntyV...   
LYV  LMV...
yV rksV...
oy_hf_init_realV  oy_hn_init_realV  oy_lf_init_realV  oy_ln_init_realV...
om_hf_init_realV  om_hn_init_realV  om_lf_init_realV  om_ln_init_realV...
oy_init_piV  om_init_piV  om_init_realV  oy_init_realV...
oy_hf_init_piV  oy_hn_init_piV  oy_lf_init_piV  oy_ln_init_piV...
om_hf_init_piV  om_hn_init_piV  om_lf_init_piV  om_ln_init_piV];

%Chi_m_hf_initV Chi_m_hn_initV Chi_m_lf_initV Chi_m_ln_initV Chi_y_hf_initV Chi_y_hn_initV Chi_y_lf_initV Chi_y_ln_initV...     


%


xp = [zzVV lambdacVV  cyVV cmVV coldVV];
%SVV...
    %N_ForceVV...
%mVV VsVV qqjVV thigtnessVV...

yp = [ kkVV y_piVV omegayVV omegamVV oy_hf_initVV  oy_hn_initVV  oy_lf_initVV  oy_ln_initVV...
om_hf_initVV  om_hn_initVV  om_lf_initVV  om_ln_initVV...
u_mVV e_mVV  ...
rsVV   margcostVV...
Uy_hf_initVV Uy_hn_initVV Uy_lf_initVV Uy_ln_initVV Um_hf_initVV Um_hn_initVV Um_lf_initVV Um_ln_initVV... 
l_hftmVV  l_hntmVV  l_lftmVV  l_lntmVV...
l_hftyVV  l_hntyVV  l_lftyVV  l_lntyVV...   
LYVV  LMVV... 
yVV rksVV...
oy_hf_init_realVV  oy_hn_init_realVV  oy_lf_init_realVV  oy_ln_init_realVV...
om_hf_init_realVV  om_hn_init_realVV  om_lf_init_realVV  om_ln_init_realVV...
oy_init_piVV  om_init_piVV  om_init_realVV  oy_init_realVV...
oy_hf_init_piVV  oy_hn_init_piVV  oy_lf_init_piVV  oy_ln_init_piVV...
om_hf_init_piVV  om_hn_init_piVV  om_lf_init_piVV  om_ln_init_piVV...
]; %..
%
%Chi_m_hf_initVV Chi_m_hn_initVV Chi_m_lf_initVV Chi_m_ln_initVV Chi_y_hf_initVV Chi_y_hn_initVV Chi_y_lf_initVV Chi_y_ln_initVV...    

%Make f a function of the logarithm of the state and control vector
f = subs(f, [x,y,xp,yp], exp([x,y,xp,yp]));

%Compute analytical derivatives of f
[fx,fxp,fy,fyp,fypyp,fypy,fypxp,fypx,fyyp,fyy,fyxp,fyx,fxpyp,fxpy,fxpxp,fxpx,fxyp,fxy,fxxp,fxx]=anal_deriv(f,x,y,xp,yp);