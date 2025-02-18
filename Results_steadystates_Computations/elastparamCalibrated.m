% $1/\varrho-1$ & $1/\upsilon-1$ & $1/\varepsilon-1$ & $1/\zeta-1$ & $1/s-1$ & $1/\sigma-1$ & $1/\xi-1$  \\ [1ex] 
% 0.115$^{***}$ & 0.134$^{***}$ & 0.109$^{***}$&  0.167$^{***}$ & 0.087$^{***}$ & 0.026$^{***}$  & 0.097$^{***}$  \\
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