function WW = solve2(x, ddelta_K, kappa, eeta, bbeta,aalpha ,ssigmaTFP,rrhoTFP ,zz ,inzz,ddeltaCov, ssp, ssigmaparam, xiparam, varrho, upsilon,varepsilon,zetaparam, rs, zma, zya, e_m, alp, de, theta_hf,theta_hn,theta_lf,theta_ln,phi_hf,phi_hn,phi_lf,phi_ln,N_forcef,lambdacf,alpha_cob)
WW = [
% variables;
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
% N_forceV = x(18)
% margcostV = x(19)
% l_hfty x(20)
% l_hnty x(21)
% l_lfty x(22)
% l_lnty x(23)
% l_hftm x(24)
% l_hntm x(25)
% l_lftm x(26)
% l_lntm x(27)
% x(28)  Sfe
% x(29)  ms
% x(30)  thigtness
% x(31)  Vs
% x(32)  qq
% x(33) kk
% x(34) y_pi 
% c_hfty x(35)
% c_hnty x(36)
% c_lfty x(37)
% c_lnty x(38)
% c_hftm x(39)
% c_hntm x(40)
% c_lftm x(41)
% c_lntm x(42)

% household
%x(1) - lambdacf; 
- (x(33)  -(1-ddelta_K)* x(33)  ) +  x(7)  -  x(2) -  x(3) -  x(4);
x(1) - x(1) *bbeta*(1+rs) ; 
x(2) -  bbeta/x(1);  
x(3) -  bbeta/x(1);
x(4) -  bbeta/x(1);
-x(5) + ((x(1)  *e_m * x(8))/(bbeta*x(34) ) )^(1/eeta); 
-x(6) + ((x(1)  *e_m * x(9))/(bbeta*x(34) ) )^(1/eeta) ;
 - x(24) + (( x(1) * e_m * x(14) )/(bbeta* x(34) ) )^(1/eeta); 
 - x(25) + (( x(1) * e_m * x(15) )/(bbeta* x(34) ) )^(1/eeta); 
 - x(26) + (( x(1) * e_m * x(16) )/(bbeta* x(34) ) )^(1/eeta); 
 - x(27) + (( x(1) * e_m * x(17) )/(bbeta* x(34) ) )^(1/eeta); 
 - x(20)  + (( x(1) * e_m  * x(10) )/(bbeta* x(34) ) )^(1/eeta) ;  %  
 - x(21)  + (( x(1) * e_m * x(11) )/(bbeta* x(34) ) )^(1/eeta) ;  %  
 - x(22)  + (( x(1) * e_m * x(12) )/(bbeta* x(34) ) )^(1/eeta) ;  %  
 - x(23)  + (( x(1) * e_m * x(13) )/(bbeta* x(34) ) )^(1/eeta) ;  %  
  - aalpha + x(6)/(x(6)+x(5));
 x(18) - N_forcef; 
- x(34) +   (kappa/(1-bbeta)) * x(19);
-x(18) + (1-de)* x(18)  + x(32) * x(31) ;
-e_m + (x(6)+x(5))/x(18) ;
%-x(29) + x(18) *x(28);
%-x(30) + x(18)^(1/(1-alp));
% ms / Sfe  = tihhtness^(1-alp)
-x(29)/x(28) + x(30)^(1-alp);
% thightness = Vs / S
- x(30) +  1.75 ;
-x(31) + x(28) * x(30);
% nneta = ms/S    ; job finding rate
% qq = ms/Vs
- x(32) +   x(29) / x(31) ;
% producer
- x(9) + x(19) * x(33)^(1-alpha_cob) * aalpha *zz * (x(6) )^(1/ssp-1) * ( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1);
- x(8) + x(19) * x(33)^(1-alpha_cob) * (1-aalpha) *zz * (x(5) )^(1/ssp-1)  * ( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1);
%-x(20) + phi_hf *x(6);
%-x(21) + phi_hn *x(6);
%-x(22) + phi_lf *x(6);
%-x(23) + phi_ln *x(6);
%-x(24) + theta_hf *x(5);
%-x(25) + theta_hn *x(5);
%-x(26) + theta_lf *x(5);
%-x(27) + theta_ln *x(5);
- x(19) +  (x(9)*((x(9)/x(8))*((1-aalpha)/aalpha))^(ssp/(1-ssp)) + x(8) )/(zz*(aalpha*((x(9)/x(8)*(1-aalpha)/aalpha)^(ssp/(1-ssp)))^(((ssp-1)/(ssp))) + (1-aalpha)* (1)^((ssp-1)/ssp)  )^(ssp/(1-ssp)));
-x(7) +  x(33)^(1-alpha_cob) * ( zz * ( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp)  )^(alpha_cob) ;
-x(10) + x(19) * aalpha *zz* phi_hf * ( x(20))^(1/varrho-1) *  ( (x(20))^(1/varrho) * phi_hf + (x(21))^(1/varrho) * phi_hn )^(varrho/ssigmaparam-1) * ((( x(20))^(1/varrho) * phi_hf + (x(21))^(1/varrho) * phi_hn )^(varrho/ssigmaparam) + ((x(22))^(1/upsilon)  * phi_lf+ (x(23))^(1/upsilon) * phi_ln)^(upsilon/ssigmaparam))^(ssigmaparam-1)*(x(6))^(1/ssp-1) * ( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1) * x(33)^(1-alpha_cob) *  (zz*( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1))^(alpha_cob-1);
-x(11) + x(19) * aalpha *zz * phi_hn  * (x(21))^(1/varrho-1) * (( x(20))^(1/varrho)* phi_hf + (x(21))^(1/varrho) * phi_hn )^(varrho/ssigmaparam-1) * ((( x(20))^(1/varrho) * phi_hf + (x(21))^(1/varrho) * phi_hn )^(varrho/ssigmaparam) + ((x(22))^(1/upsilon) * phi_lf + (x(23))^(1/upsilon) * phi_ln)^(upsilon/ssigmaparam))^(ssigmaparam-1)*(x(6))^(1/ssp-1) * ( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1) * x(33)^(1-alpha_cob) *  (zz*( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1))^(alpha_cob-1);
-x(12) + x(19) * aalpha *zz * phi_lf* (x(22))^(1/upsilon-1)  *  ((x(22))^(1/upsilon) * phi_lf + (x(23))^(1/upsilon) * phi_ln)^(upsilon/ssigmaparam-1)* ((( x(20))^(1/varrho) * phi_hf + (x(21))^(1/varrho) * phi_hn )^(varrho/ssigmaparam) + ((x(22))^(1/upsilon)  * phi_lf+ (x(23))^(1/upsilon) * phi_ln)^(upsilon/ssigmaparam))^(ssigmaparam-1)*(x(6))^(1/ssp-1) * ( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1)  * x(33)^(1-alpha_cob) *  (zz*( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1))^(alpha_cob-1);
-x(13) + x(19) * aalpha *zz  * phi_ln * (x(23) )^(1/upsilon-1) * ((x(22))^(1/upsilon) * phi_lf + (x(23))^(1/upsilon) * phi_ln)^(upsilon/ssigmaparam-1)* ((( x(20))^(1/varrho) * phi_hf + (x(21))^(1/varrho) * phi_hn)^(varrho/ssigmaparam) + ((x(22))^(1/upsilon) * phi_lf + (x(23))^(1/upsilon) * phi_ln)^(upsilon/ssigmaparam))^(ssigmaparam-1)*(x(6))^(1/ssp-1) * ( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1)   * x(33)^(1-alpha_cob) *  (zz*( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1))^(alpha_cob-1);
-x(14) + x(19) * (1-aalpha) *zz * theta_hf * ( x(24) )^(1/varepsilon-1) * (( x(24))^(1/varepsilon) * theta_hf + (x(25))^(1/varepsilon) * theta_hn)^(varepsilon/xiparam-1)* ((( x(24))^(1/varepsilon)  * theta_hf+ (x(25))^(1/varepsilon) * theta_hn)^(varepsilon/xiparam) + ((x(26))^(1/zetaparam) * theta_lf + (x(27))^(1/zetaparam) * theta_ln)^(zetaparam/xiparam))^(xiparam-1)*(x(5))^(1/ssp-1) * ( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1) * x(33)^(1-alpha_cob) *  (zz*( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1))^(alpha_cob-1);
-x(15) +  x(19) * (1-aalpha) *zz * theta_hn * (x(25) )^(1/varepsilon-1) * (( x(24))^(1/varepsilon)  * theta_hf+ (x(25))^(1/varepsilon) * theta_hn)^(varepsilon/xiparam-1)* ((( x(24))^(1/varepsilon) * theta_hf + (x(25))^(1/varepsilon) * theta_hn)^(varepsilon/xiparam) + ((x(26))^(1/zetaparam) * theta_lf + (x(27))^(1/zetaparam) * theta_ln)^(zetaparam/xiparam))^(xiparam-1)*(x(5))^(1/ssp-1) * ( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1) * x(33)^(1-alpha_cob) *  (zz*( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1))^(alpha_cob-1);
-x(16) +  x(19) * (1-aalpha) *zz * theta_lf * (x(26) )^(1/zetaparam-1) * ((x(26))^(1/zetaparam) * theta_lf + (x(27))^(1/zetaparam) * theta_ln)^(zetaparam/xiparam-1)* ((( x(24))^(1/varepsilon)  * theta_hf+ (x(25))^(1/varepsilon) * theta_hn)^(varepsilon/xiparam) + ((x(26))^(1/zetaparam)  * theta_lf + (x(27))^(1/zetaparam) * theta_ln)^(zetaparam/xiparam))^(xiparam-1)*(x(5))^(1/ssp-1) * ( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1) * x(33)^(1-alpha_cob) *  (zz*( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1))^(alpha_cob-1);
-x(17) +  x(19) * (1-aalpha) *zz * theta_ln * (x(27) )^(1/zetaparam-1)  * ((x(26))^(1/zetaparam) * theta_lf + (x(27))^(1/zetaparam) * theta_ln)^(zetaparam/xiparam-1)* ((( x(24))^(1/varepsilon)  * theta_hf+ (x(25))^(1/varepsilon) * theta_hn)^(varepsilon/xiparam) + ((x(26))^(1/zetaparam)  * theta_lf + (x(27))^(1/zetaparam) * theta_ln )^(zetaparam/xiparam))^(xiparam-1)*(x(5))^(1/ssp-1) * ( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1) * x(33)^(1-alpha_cob) *  (zz*( aalpha * (x(6))^(1/ssp) + (1-aalpha)* (x(5))^(1/ssp) )^(ssp-1))^(alpha_cob-1);
-x(5) + (((bbeta/x(5))   *e_m * x(8))/(bbeta*x(34) ) )^(1/eeta); 
-x(6) + (((bbeta/x(3))   *e_m * x(9))/(bbeta*x(34) ) )^(1/eeta) ;
 - x(24) + (( (bbeta/x(35))  * e_m * x(14) )/(bbeta* x(34) ) )^(1/eeta); 
 - x(25) + (( (bbeta/x(36))  * e_m * x(15) )/(bbeta* x(34) ) )^(1/eeta); 
 - x(26) + (( (bbeta/x(37))  * e_m * x(16) )/(bbeta* x(34) ) )^(1/eeta); 
 - x(27) + (( (bbeta/x(38))  * e_m * x(17) )/(bbeta* x(34) ) )^(1/eeta); 
 - x(20)  + (( (bbeta/x(39))  * e_m  * x(10) )/(bbeta* x(34) ) )^(1/eeta) ;  %  
 - x(21)  + (( (bbeta/x(40))  * e_m * x(11) )/(bbeta* x(34) ) )^(1/eeta) ;  %  
 - x(22)  + (( (bbeta/x(41))  * e_m * x(12) )/(bbeta* x(34) ) )^(1/eeta) ;  %  
 - x(23)  + (( (bbeta/x(42))  * e_m * x(13) )/(bbeta* x(34) ) )^(1/eeta) ;  %  
];    