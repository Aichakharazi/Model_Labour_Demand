# -*- coding: utf-8 -*-
"""
Created on Sun Jan 30 16:20:14 2022

@author: Utente
"""

import numpy 
import numpy as np
import pandas
import pandas as pd
import addfips
import seaborn 
import matplotlib
import matplotlib.pyplot as plt
from pandas import DataFrame
import seaborn 
import seaborn as sns
import matplotlib
import matplotlib.pyplot as plt
from pandas import DataFrame
import regex as re
import spacy
import csv
import statistics
import numpy as np
import pandas as pd
from linearmodels import PanelOLS
from linearmodels import RandomEffects
from linearmodels.panel import PooledOLS
import statsmodels
from statsmodels.sandbox.regression import gmm
import statsmodels.api as sm

#%% year	industry_code	county	immigrant	age_cat	skill_lev	incwage	uhrsworkt	
# wkswork1	hourly_wage	month	ahrswork1	ahrsworkt	monthly_wage	indnaics	
# ind_desc	idm	ind_code_3dig	teamwork_share	customer_share	presence_share	
# communication_share	affected_share	ces_employment


#%% Compute the distribution parameters and the elasticties 

#%% load the data
datalabor = pd.read_csv('dataset_final.csv', sep=',')#,error_bad_lines=False)
#%%


# Define a mapping from month to quarter
month_to_quarter = {
    'January': 'Q1', 'February': 'Q1', 'March': 'Q1',
    'April': 'Q2', 'May': 'Q2', 'June': 'Q2',
    'July': 'Q3', 'August': 'Q3', 'September': 'Q3',
    'October': 'Q4', 'November': 'Q4', 'December': 'Q4'
}

# Create the 'quarter' column using the mapping
datalabor['quarter'] = datalabor['month'].map(month_to_quarter)




#%% unweighted averge (group by the data by year, quarter, industry_code, age_cat, skill_lev, immigrant


# Group by the specified columns and compute the average of 
grouped = datalabor.groupby(['year','industry_code','immigrant','age_cat','skill_lev','quarter','fipsstate',
'indnaics','ind_desc',
'ind_code_3dig','state','countyname',
'country_code','country_name','region_code','jurisdiction']).agg(
teamwork_share=  ( 'teamwork_share','mean') ,
customer_share=  (  'customer_share','mean'), 
presence_share= (  'presence_share','mean') ,
communication_share= ('communication_share','mean') ,
affected_share=    ('affected_share','mean') ,
ces_employment=    ('ces_employment','mean') ,
hourly_wage= ('hourly_wage','mean') ,
ahrswork1= ('ahrswork1','mean') ,
ahrsworkt= ('ahrsworkt','mean') ,
monthly_wage=   ('monthly_wage','mean'), 
Feb2020= ('Feb2020','mean') ,
Mar2020= ('Mar2020','mean') ,
Apr2020= ('Apr2020','mean') ,
May2020=   ('May2020','mean') ,
Jun2020=    ('Jun2020','mean') ,
Jul2020=   ('Jul2020','mean') ,
Aug2020= ('Aug2020','mean') ,
Sep2020= ('Sep2020','mean') ,
Oct2020=   ('Oct2020', 'mean') ,
Nov2020=   ('Nov2020','mean') ,
Dec2020=   ('Dec2020','mean') ,
Jan2021=    ('Jan2021','mean') ,
Feb2021=    ('Feb2021','mean') ,
Mar2021=    ('Mar2021', 'mean') ,
Apr2021= ('Apr2021', 'mean')   ,
).reset_index()

    
 #%%   
datalabor  =    grouped 






#%% without fillna(0) we get 
#datalabor.isnull().sum()

#%%  missing data in the new dataset
#datalabor.isnull().sum()
#Out[5]: 
#year                        0
#industry_code               0
#immigrant                   0
#age_cat                     0
#skill_lev                   0
#month                       0
#fipsstate                   0
#hourly_wage            203174
#ahrswork1                   0
#ahrsworkt                   0
#monthly_wage           203174
#indnaics                26522
#ind_desc                51589
#idm                     51589
#ind_code_3dig           50986
#teamwork_share          91107
#customer_share          91107
#presence_share          91107
#communication_share     91107
#affected_share          91107
#ces_employment          92005
#state                       0
#countyname                  0
#country_code                0
#country_name                0
#region_code                 0
#jurisdiction                0
#Feb2020                     0 this is probaly a specific covid shock
#Mar2020                     0
#Apr2020                     0
#May2020                     0
#Jun2020                     0
#Jul2020                     0
#Aug2020                     0
#Sep2020                     0
#Oct2020                     0
#Nov2020                     0
#Dec2020                     0
#Jan2021                     0
#Feb2021                     0
#Mar2021                     0
#Apr2021                     0

#%%
#%%


#teamwork_share       
#customer_share        
#presence_share         
#communication_share     
#affected_share       
#ces_employment      

#%% we check how many missing data by  columns we do have
zz111= datalabor.isnull().sum()
#%%  A : split by labor supplied by immigrants== drop immigrant=0
imigrantlabor = datalabor.drop(datalabor[(datalabor.immigrant == 0)].index)


#%%  1) to obtain old worker first : drop middle age
imigrantlabord = imigrantlabor.drop(imigrantlabor[(imigrantlabor['age_cat'] == 2 ) ].index)
#%%  then : drop young 
imigrantlabord1 = imigrantlabord.drop(imigrantlabord[(imigrantlabord['age_cat'] == 1 ) ].index)
#%%  ==> old labor (low skill): drop skill 1   
imigrantlabor132 = imigrantlabord1.drop(imigrantlabord1[(imigrantlabord1['skill_lev'] == 1 ) ].index)
#%%  ==> old labor (high skill): drop skill 2
imigrantlabor131 = imigrantlabord1.drop(imigrantlabord1[(imigrantlabord1['skill_lev'] == 2 ) ].index)


#%%  2) to obtain midlle age worker first : drop  young
imigrantlabord = imigrantlabor.drop(imigrantlabor[(imigrantlabor['age_cat'] == 1 ) ].index)
#%%  then : drop old 
imigrantlabord1 = imigrantlabord.drop(imigrantlabord[(imigrantlabord['age_cat'] == 3 ) ].index)
#%%  ==> middle age labor (low skill): drop skill 1   
imigrantlabor122 = imigrantlabord1.drop(imigrantlabord1[(imigrantlabord1['skill_lev'] == 1 ) ].index)
#%%  ==> middle age labor (high skill): drop skill 2
imigrantlabor121 = imigrantlabord1.drop(imigrantlabord1[(imigrantlabord1['skill_lev'] == 2 ) ].index)


#%%  3) to obtain young worker first : drop middle age
imigrantlabord = imigrantlabor.drop(imigrantlabor[(imigrantlabor['age_cat'] == 2 ) ].index)
#%%  then : drop old 
imigrantlabord1 = imigrantlabord.drop(imigrantlabord[(imigrantlabord['age_cat'] == 3 ) ].index)
#%%  ==> young labor (low skill): drop skill 1   
imigrantlabor112 = imigrantlabord1.drop(imigrantlabord1[(imigrantlabord1['skill_lev'] == 1 ) ].index)
#%%  ==> young labor (high skill): drop skill 2
imigrantlabor111 = imigrantlabord1.drop(imigrantlabord1[(imigrantlabord1['skill_lev'] == 2 ) ].index)


#%%  B :  split by labor supplied by  natives 
nativelabor = datalabor.drop(datalabor[(datalabor.immigrant == 1)].index)


#%%  1) to obtain old worker first : drop middle age
nativelabord = nativelabor.drop(nativelabor[(nativelabor['age_cat'] == 2 ) ].index)
#%%  then : drop young 
nativelabord1 = nativelabord.drop(nativelabord[(nativelabord['age_cat'] == 1 ) ].index)
#%%  ==> old labor (low skill): drop skill 1   
nativelabor132 = nativelabord1.drop(nativelabord1[(nativelabord1['skill_lev'] == 1 ) ].index)
#%%  ==> old labor (high skill): drop skill 2
nativelabor131 = nativelabord1.drop(nativelabord1[(nativelabord1['skill_lev'] == 2 ) ].index)


#%%  2) to obtain midlle age worker first : drop  young
nativelabord = nativelabor.drop(nativelabor[(nativelabor['age_cat'] == 1 ) ].index)
#%%  then : drop old 
nativelabord1 = nativelabord.drop(nativelabord[(nativelabor['age_cat'] == 3 ) ].index)
#%%  ==> middle age labor (low skill): drop skill 1   
nativelabor122 = nativelabord1.drop(nativelabord1[(nativelabord1['skill_lev'] == 1 ) ].index)
#%%  ==> middle age labor (high skill): drop skill 2
nativelabor121 = nativelabord1.drop(nativelabord1[(nativelabord1['skill_lev'] == 2 ) ].index)


#%%  3) to obtain young worker first : drop middle age
nativelabord = nativelabor.drop(nativelabor[(nativelabor['age_cat'] == 2 ) ].index)
#%%  then : drop old 
nativelabord1 = nativelabord.drop(nativelabord[(nativelabor['age_cat'] == 3 ) ].index)
#%% ==>  young labor (low skill): drop skill 1   
nativelabor112 = nativelabord1.drop(nativelabord1[(nativelabord1['skill_lev'] == 1 ) ].index)
#%% ==>  young labor (high skill): drop skill 2
nativelabor111 = nativelabord1.drop(nativelabord1[(nativelabord1['skill_lev'] == 2 ) ].index)



#%%  LIST of variables:

#year industry_code immigrant age_cat skill_lev month fipsstate hourly_wage   
#ahrswork1 ahrsworkt monthly_wage 
# indnaics ind_desc idm  ind_code_3dig   
#teamwork_share customer_share presence_share communication_share 
#affected_share ces_employment 
#state countyname  country_code country_name region_code jurisdiction      
#Feb2020 Mar2020 Apr2020 May2020 Jun2020 Jul2020 Aug2020               
#Sep2020 Oct2020 Nov2020 Dec2020 Jan2021 Feb2021 Mar2021 Apr2021          

#%% rename variables before merging the data

nativelabor111 = nativelabor111.rename(columns={"hourly_wage": "hourly_wage111n"})
nativelabor111 = nativelabor111.rename(columns={"ahrswork1": "ahrswork1111n"})
nativelabor111 = nativelabor111.rename(columns={"ahrsworkt": "ahrsworkt111n"})
nativelabor111 = nativelabor111.rename(columns={"monthly_wage": "monthly_wage111n"})
nativelabor111 = nativelabor111.rename(columns={"teamwork_share": "teamwork_share111n"})
nativelabor111 = nativelabor111.rename(columns={"customer_share": "customer_share111n"})
nativelabor111 = nativelabor111.rename(columns={"presence_share": "presence_share111n"})
nativelabor111 = nativelabor111.rename(columns={"communication_share": "communication_share111n"})
nativelabor111 = nativelabor111.rename(columns={"affected_share": "affected_share111n"})
nativelabor111 = nativelabor111.rename(columns={"ces_employment": "ces_employment111n"})


#%% drop variables:: not necessary anymore   
nativelabor111  = nativelabor111.drop(columns=['immigrant', 'age_cat','skill_lev'])

#%%   rename variables before merging the data


nativelabor112 = nativelabor112.rename(columns={"hourly_wage": "hourly_wage112n"})
nativelabor112 = nativelabor112.rename(columns={"ahrswork1": "ahrswork1112n"})
nativelabor112 = nativelabor112.rename(columns={"ahrsworkt": "ahrsworkt112n"})
nativelabor112 = nativelabor112.rename(columns={"monthly_wage": "monthly_wage112n"})
nativelabor112 = nativelabor112.rename(columns={"teamwork_share": "teamwork_share112n"})
nativelabor112 = nativelabor112.rename(columns={"customer_share": "customer_share112n"})
nativelabor112 = nativelabor112.rename(columns={"presence_share": "presence_share112n"})
nativelabor112 = nativelabor112.rename(columns={"communication_share": "communication_share112n"})
nativelabor112 = nativelabor112.rename(columns={"affected_share": "affected_share112n"})
nativelabor112 = nativelabor112.rename(columns={"ces_employment": "ces_employment112n"})

#%%  drop variables:: not necessary anymore
nativelabor112  = nativelabor112.drop(columns=['immigrant', 'age_cat','skill_lev'])


#%% rename variables before merging the data


nativelabor121 = nativelabor121.rename(columns={"hourly_wage": "hourly_wage121n"})
nativelabor121 = nativelabor121.rename(columns={"ahrswork1": "ahrswork1211n"})
nativelabor121 = nativelabor121.rename(columns={"ahrsworkt": "ahrsworkt121n"})
nativelabor121 = nativelabor121.rename(columns={"monthly_wage": "monthly_wage121n"})
nativelabor121 = nativelabor121.rename(columns={"teamwork_share": "teamwork_share121n"})
nativelabor121 = nativelabor121.rename(columns={"customer_share": "customer_share121n"})
nativelabor121 = nativelabor121.rename(columns={"presence_share": "presence_share121n"})
nativelabor121 = nativelabor121.rename(columns={"communication_share": "communication_share121n"})
nativelabor121 = nativelabor121.rename(columns={"affected_share": "affected_share121n"})
nativelabor121 = nativelabor121.rename(columns={"ces_employment": "ces_employment121n"})


#%%   drop variables:: not necessary anymore
nativelabor121  = nativelabor121.drop(columns=['immigrant', 'age_cat','skill_lev'])

#%% rename variables before merging the data


nativelabor122 = nativelabor122.rename(columns={"hourly_wage": "hourly_wage122n"})
nativelabor122 = nativelabor122.rename(columns={"ahrswork1": "ahrswork1122n"})
nativelabor122 = nativelabor122.rename(columns={"ahrsworkt": "ahrsworkt122n"})
nativelabor122 = nativelabor122.rename(columns={"monthly_wage": "monthly_wage122n"})
nativelabor122 = nativelabor122.rename(columns={"teamwork_share": "teamwork_share122n"})
nativelabor122 = nativelabor122.rename(columns={"customer_share": "customer_share122n"})
nativelabor122 = nativelabor122.rename(columns={"presence_share": "presence_share122n"})
nativelabor122 = nativelabor122.rename(columns={"communication_share": "communication_share122n"})
nativelabor122 = nativelabor122.rename(columns={"affected_share": "affected_share122n"})
nativelabor122 = nativelabor122.rename(columns={"ces_employment": "ces_employment122n"})

#%%  drop variables:: not necessary anymore
nativelabor122  = nativelabor122.drop(columns=['immigrant', 'age_cat','skill_lev'])


#%% rename variables before merging the data


nativelabor131 = nativelabor131.rename(columns={"hourly_wage": "hourly_wage131n"})
nativelabor131 = nativelabor131.rename(columns={"ahrswork1": "ahrswork1131n"})
nativelabor131 = nativelabor131.rename(columns={"ahrsworkt": "ahrsworkt131n"})
nativelabor131 = nativelabor131.rename(columns={"monthly_wage": "monthly_wage131n"})
nativelabor131 = nativelabor131.rename(columns={"teamwork_share": "teamwork_share131n"})
nativelabor131 = nativelabor131.rename(columns={"customer_share": "customer_share131n"})
nativelabor131 = nativelabor131.rename(columns={"presence_share": "presence_share131n"})
nativelabor131 = nativelabor131.rename(columns={"communication_share": "communication_share131n"})
nativelabor131 = nativelabor131.rename(columns={"affected_share": "affected_share131n"})
nativelabor131 = nativelabor131.rename(columns={"ces_employment": "ces_employment131n"})


#%%  drop variables:: not necessary anymore
nativelabor131  = nativelabor131.drop(columns=['immigrant', 'age_cat','skill_lev'])

#%% rename variables before merging the data


nativelabor132 = nativelabor132.rename(columns={"hourly_wage": "hourly_wage132n"})
nativelabor132 = nativelabor132.rename(columns={"ahrswork1": "ahrswork1132n"})
nativelabor132 = nativelabor132.rename(columns={"ahrsworkt": "ahrsworkt132n"})
nativelabor132 = nativelabor132.rename(columns={"monthly_wage": "monthly_wage132n"})
nativelabor132 = nativelabor132.rename(columns={"teamwork_share": "teamwork_share132n"})
nativelabor132 = nativelabor132.rename(columns={"customer_share": "customer_share132n"})
nativelabor132 = nativelabor132.rename(columns={"presence_share": "presence_share132n"})
nativelabor132 = nativelabor132.rename(columns={"communication_share": "communication_share132n"})
nativelabor132 = nativelabor132.rename(columns={"affected_share": "affected_share132n"})
nativelabor132 = nativelabor132.rename(columns={"ces_employment": "ces_employment132n"})


#%%  drop variables:: not necessary anymore
nativelabor132  = nativelabor132.drop(columns=['immigrant', 'age_cat','skill_lev'])

#%% rename variables before merging the data


imigrantlabor111 = imigrantlabor111.rename(columns={"hourly_wage": "hourly_wage111m"})
imigrantlabor111 = imigrantlabor111.rename(columns={"ahrswork1": "ahrswork1111m"})
imigrantlabor111 = imigrantlabor111.rename(columns={"ahrsworkt": "ahrsworkt111m"})
imigrantlabor111 = imigrantlabor111.rename(columns={"monthly_wage": "monthly_wage111m"})
imigrantlabor111 = imigrantlabor111.rename(columns={"teamwork_share": "teamwork_share111m"})
imigrantlabor111 = imigrantlabor111.rename(columns={"customer_share": "customer_share111m"})
imigrantlabor111 = imigrantlabor111.rename(columns={"presence_share": "presence_share111m"})
imigrantlabor111 = imigrantlabor111.rename(columns={"communication_share": "communication_share111m"})
imigrantlabor111 = imigrantlabor111.rename(columns={"affected_share": "affected_share111m"})
imigrantlabor111 = imigrantlabor111.rename(columns={"ces_employment": "ces_employment111m"})




#%%  drop variables:: not necessary anymore 
imigrantlabor111  = imigrantlabor111.drop(columns=['immigrant', 'age_cat','skill_lev'])

#%% rename variables before merging the data



imigrantlabor112 = imigrantlabor112.rename(columns={"hourly_wage": "hourly_wage112m"})
imigrantlabor112 = imigrantlabor112.rename(columns={"ahrswork1": "ahrswork1112m"})
imigrantlabor112 = imigrantlabor112.rename(columns={"ahrsworkt": "ahrsworkt112m"})
imigrantlabor112 = imigrantlabor112.rename(columns={"monthly_wage": "monthly_wage112m"})
imigrantlabor112 = imigrantlabor112.rename(columns={"teamwork_share": "teamwork_share112m"})
imigrantlabor112 = imigrantlabor112.rename(columns={"customer_share": "customer_share112m"})
imigrantlabor112 = imigrantlabor112.rename(columns={"presence_share": "presence_share112m"})
imigrantlabor112 = imigrantlabor112.rename(columns={"communication_share": "communication_share112m"})
imigrantlabor112 = imigrantlabor112.rename(columns={"affected_share": "affected_share112m"})
imigrantlabor112 = imigrantlabor112.rename(columns={"ces_employment": "ces_employment112m"})

#%%  drop variables:: not necessary anymore 
imigrantlabor112  = imigrantlabor112.drop(columns=['immigrant', 'age_cat','skill_lev'])

#%% rename variables before merging the data



imigrantlabor121 = imigrantlabor121.rename(columns={"hourly_wage": "hourly_wage121m"})
imigrantlabor121 = imigrantlabor121.rename(columns={"ahrswork1": "ahrswork1211m"})
imigrantlabor121 = imigrantlabor121.rename(columns={"ahrsworkt": "ahrsworkt121m"})
imigrantlabor121 = imigrantlabor121.rename(columns={"monthly_wage": "monthly_wage121m"})
imigrantlabor121 = imigrantlabor121.rename(columns={"teamwork_share": "teamwork_share121m"})
imigrantlabor121 = imigrantlabor121.rename(columns={"customer_share": "customer_share121m"})
imigrantlabor121 = imigrantlabor121.rename(columns={"presence_share": "presence_share121m"})
imigrantlabor121 = imigrantlabor121.rename(columns={"communication_share": "communication_share121m"})
imigrantlabor121 = imigrantlabor121.rename(columns={"affected_share": "affected_share121m"})
imigrantlabor121 = imigrantlabor121.rename(columns={"ces_employment": "ces_employment121m"})



#%%  drop variables:: not necessary anymore
imigrantlabor121  = imigrantlabor121.drop(columns=['immigrant', 'age_cat','skill_lev'])

#%% rename variables before merging the data



imigrantlabor122 = imigrantlabor122.rename(columns={"hourly_wage": "hourly_wage122m"})
imigrantlabor122 = imigrantlabor122.rename(columns={"ahrswork1": "ahrswork1122m"})
imigrantlabor122 = imigrantlabor122.rename(columns={"ahrsworkt": "ahrsworkt122m"})
imigrantlabor122 = imigrantlabor122.rename(columns={"monthly_wage": "monthly_wage122m"})
imigrantlabor122 = imigrantlabor122.rename(columns={"teamwork_share": "teamwork_share122m"})
imigrantlabor122 = imigrantlabor122.rename(columns={"customer_share": "customer_share122m"})
imigrantlabor122 = imigrantlabor122.rename(columns={"presence_share": "presence_share122m"})
imigrantlabor122 = imigrantlabor122.rename(columns={"communication_share": "communication_share122m"})
imigrantlabor122 = imigrantlabor122.rename(columns={"affected_share": "affected_share122m"})
imigrantlabor122 = imigrantlabor122.rename(columns={"ces_employment": "ces_employment122m"})


#%%  drop variables:: not necessary anymore

imigrantlabor122  = imigrantlabor122.drop(columns=['immigrant', 'age_cat','skill_lev'])

#%% rename variables before merging the data



imigrantlabor131 = imigrantlabor131.rename(columns={"hourly_wage": "hourly_wage131m"})
imigrantlabor131 = imigrantlabor131.rename(columns={"ahrswork1": "ahrswork1131m"})
imigrantlabor131 = imigrantlabor131.rename(columns={"ahrsworkt": "ahrsworkt131m"})
imigrantlabor131 = imigrantlabor131.rename(columns={"monthly_wage": "monthly_wage131m"})
imigrantlabor131 = imigrantlabor131.rename(columns={"teamwork_share": "teamwork_share131m"})
imigrantlabor131 = imigrantlabor131.rename(columns={"customer_share": "customer_share131m"})
imigrantlabor131 = imigrantlabor131.rename(columns={"presence_share": "presence_share131m"})
imigrantlabor131 = imigrantlabor131.rename(columns={"communication_share": "communication_share131m"})
imigrantlabor131 = imigrantlabor131.rename(columns={"affected_share": "affected_share131m"})
imigrantlabor131 = imigrantlabor131.rename(columns={"ces_employment": "ces_employment131m"})



#%%  drop variables:: not necessary anymore


imigrantlabor131  = imigrantlabor131.drop(columns=['immigrant', 'age_cat','skill_lev'])

#%% rename variables before merging the data



imigrantlabor132 = imigrantlabor132.rename(columns={"hourly_wage": "hourly_wage132m"})
imigrantlabor132 = imigrantlabor132.rename(columns={"ahrswork1": "ahrswork1132m"})
imigrantlabor132 = imigrantlabor132.rename(columns={"ahrsworkt": "ahrsworkt132m"})
imigrantlabor132 = imigrantlabor132.rename(columns={"monthly_wage": "monthly_wage132m"})
imigrantlabor132 = imigrantlabor132.rename(columns={"teamwork_share": "teamwork_share132m"})
imigrantlabor132 = imigrantlabor132.rename(columns={"customer_share": "customer_share132m"})
imigrantlabor132 = imigrantlabor132.rename(columns={"presence_share": "presence_share132m"})
imigrantlabor132 = imigrantlabor132.rename(columns={"communication_share": "communication_share132m"})
imigrantlabor132 = imigrantlabor132.rename(columns={"affected_share": "affected_share132m"})
imigrantlabor132 = imigrantlabor132.rename(columns={"ces_employment": "ces_employment132m"})



#%%   drop variables:: not necessary anymore
imigrantlabor132  = imigrantlabor132.drop(columns=['immigrant', 'age_cat','skill_lev'])


#%%  list of variables


#%% check if the variable to merge are of the same type 

#   clean_workquartindusexample['ind_code_3dig'] = clean_workquartindusexample['ind_code_3dig'].astype(str)




nativelabor111.dtypes 
nativelabor112.dtypes  
nativelabor121.dtypes 
nativelabor122.dtypes 
nativelabor131.dtypes 
nativelabor132.dtypes 

imigrantlabor111.dtypes 
imigrantlabor112.dtypes 
imigrantlabor121.dtypes 
imigrantlabor122.dtypes 
imigrantlabor131.dtypes 
imigrantlabor132.dtypes 

#%% We merge the data 

nativelabor111.reset_index(drop=True)
nativelabor112.reset_index(drop=True) 
nativelabor121.reset_index(drop=True)
nativelabor122.reset_index(drop=True) 
nativelabor131.reset_index(drop=True)
nativelabor132.reset_index(drop=True) 

imigrantlabor111.reset_index(drop=True)
imigrantlabor112.reset_index(drop=True)
imigrantlabor121.reset_index(drop=True)
imigrantlabor122.reset_index(drop=True)
imigrantlabor131.reset_index(drop=True)
imigrantlabor132.reset_index(drop=True)
#%%
#nativelabor111['year'] = nativelabor111['year'].astype(str)


#%%

#example_datameged = nativelabor111.merge(nativelabor112, left_on=['year','industry_code','month','fipsstate',
#                         'indnaics', 'ind_desc','idm', 'ind_code_3dig', 
#                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',
#                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
#                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021']
#                                , right_on=['year','industry_code','quarter','fipsstate',
#                                                         'indnaics', 'ind_desc','idm', 'ind_code_3dig', 
#                                                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',
#                                                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
#                                                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'],how='right')


#%%

#%% we nned to convert to str to avoid nan when mergin the two datasets                               
                                                                   
#all_columns = list(nativelabor111) # Creates list of all column headers
#nativelabor111[all_columns] = nativelabor111[all_columns].astype(str)

#%%
#all_columns = list(nativelabor112) # Creates list of all column headers
#nativelabor112[all_columns] = nativelabor112[all_columns].astype(str)


#example_datameged.isnull().sum()
#%%
#example_datameged.isna().sum()

#%% native 111 +112
datameged = pd.merge(nativelabor111, nativelabor112, on=['year','industry_code','quarter','fipsstate',
                         'indnaics', 'ind_desc',#'idm',
                         'ind_code_3dig', 
                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',
                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'                                      
                                                         ], how='right')


#%% we nned to convert to str to avoid nan when mergin the two datasets                               
                                                                   
#all_columns = list(datameged) # Creates list of all column headers
#datameged[all_columns] = datameged[all_columns].astype(str)

#%%
#all_columns = list(nativelabor121) # Creates list of all column headers
#nativelabor121[all_columns] = nativelabor121[all_columns].astype(str)

#%% native +121
datameged = pd.merge(datameged, nativelabor121, on=['year' ,'industry_code','quarter','fipsstate',
                         'indnaics', 'ind_desc',#'idm',
                         'ind_code_3dig', 
                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',
                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'                                      
                                                         ], how='right')
#%% we nned to convert to str to avoid nan when mergin the two datasets                               
                                                                   
#all_columns = list(datameged) # Creates list of all column headers
#datameged[all_columns] = datameged[all_columns].astype(str)

#%%
#all_columns = list(nativelabor122) # Creates list of all column headers
#nativelabor122[all_columns] = nativelabor122[all_columns].astype(str)

#%% native +122
datameged = pd.merge(datameged, nativelabor122, on=['year', 'industry_code','quarter','fipsstate',
                         'indnaics', 'ind_desc',#'idm',
                         'ind_code_3dig', 
                         'state', 'countyname','country_code','country_name','region_code','jurisdiction', 
                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'                                
                                                         ], how='right')

#%% we nned to convert to str to avoid nan when mergin the two datasets                               
                                                                   
#all_columns = list(datameged) # Creates list of all column headers
#datameged[all_columns] = datameged[all_columns].astype(str)

#%%
#all_columns = list(nativelabor131) # Creates list of all column headers
#nativelabor131[all_columns] = nativelabor131[all_columns].astype(str)

#%% native + 131
datameged = pd.merge(datameged, nativelabor131, on=['year' , 'industry_code','quarter','fipsstate',
                         'indnaics', 'ind_desc',#'idm', 
                         'ind_code_3dig', 
                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',       
                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'                          
                                                         ], how='left')
#%% we nned to convert to str to avoid nan when mergin the two datasets                               
                                                                   
#all_columns = list(datameged) # Creates list of all column headers
#datameged[all_columns] = datameged[all_columns].astype(str)

#%%
#all_columns = list(nativelabor132) # Creates list of all column headers
#nativelabor132[all_columns] = nativelabor132[all_columns].astype(str)



#%% native + 132
datameged = pd.merge(datameged, nativelabor132, on=['year', 'industry_code','quarter','fipsstate',
                         'indnaics', 'ind_desc',#'idm', 
                         'ind_code_3dig', 
                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',       
                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'                          
                                                         ], how='left')

#%% we nned to convert to str to avoid nan when mergin the two datasets                               
                                                                   
#all_columns = list(datameged) # Creates list of all column headers
#datameged[all_columns] = datameged[all_columns].astype(str)

#%%
#all_columns = list(imigrantlabor111) # Creates list of all column headers
#imigrantlabor111[all_columns] = imigrantlabor111[all_columns].astype(str)

#%% immigrant  + 111
datameged = pd.merge(datameged, imigrantlabor111, on=['year' , 'industry_code','quarter','fipsstate',
                         'indnaics', 'ind_desc',#'idm', 
                         'ind_code_3dig', 
                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',       
                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'                          
                                                         ], how='left')

#%% we nned to convert to str to avoid nan when mergin the two datasets                               
                                                                   
#all_columns = list(datameged) # Creates list of all column headers
#datameged[all_columns] = datameged[all_columns].astype(str)

#%%
#all_columns = list(imigrantlabor112) # Creates list of all column headers
#imigrantlabor112[all_columns] = imigrantlabor112[all_columns].astype(str)

#%% immigrant  + 112
datameged = pd.merge(datameged, imigrantlabor112, on=['year', 'industry_code','quarter','fipsstate',
                         'indnaics', 'ind_desc',#'idm', 
                         'ind_code_3dig', 
                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',       
                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'                          
                                                         ], how='left')

#%% we nned to convert to str to avoid nan when mergin the two datasets                               
                                                                   
#all_columns = list(datameged) # Creates list of all column headers
#datameged[all_columns] = datameged[all_columns].astype(str)

#%%
#all_columns = list(imigrantlabor121) # Creates list of all column headers
#imigrantlabor121[all_columns] = imigrantlabor121[all_columns].astype(str)

#%% immigrant  + 121
datameged = pd.merge(datameged, imigrantlabor121, on=['year' , 'industry_code','quarter','fipsstate',
                         'indnaics', 'ind_desc',#'idm', 
                         'ind_code_3dig', 
                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',       
                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'                          
                                                         ], how='left')
#%% we nned to convert to str to avoid nan when mergin the two datasets                               
                                                                   
#all_columns = list(datameged) # Creates list of all column headers
#datameged[all_columns] = datameged[all_columns].astype(str)

#%%
#all_columns = list(imigrantlabor122) # Creates list of all column headers
#imigrantlabor122[all_columns] = imigrantlabor122[all_columns].astype(str)



#%% immigrant  + 122
datameged = pd.merge(datameged, imigrantlabor122, on=['year' ,'industry_code','quarter','fipsstate',
                         'indnaics', 'ind_desc',#'idm', 
                         'ind_code_3dig', 
                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',       
                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'                          
                                                         ], how='left')

#%% we nned to convert to str to avoid nan when mergin the two datasets                               
                                                                   
#all_columns = list(datameged) # Creates list of all column headers
#datameged[all_columns] = datameged[all_columns].astype(str)

#%%
#all_columns = list(imigrantlabor131) # Creates list of all column headers
#imigrantlabor131[all_columns] = imigrantlabor131[all_columns].astype(str)


#%% immigrant  + 131
datameged = pd.merge(datameged, imigrantlabor131, on=['year' ,'industry_code','quarter','fipsstate',
                         'indnaics', 'ind_desc',#'idm', 
                         'ind_code_3dig', 
                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',       
                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'                          
                                                         ], how='left')
#%% we nned to convert to str to avoid nan when mergin the two datasets                               
                                                                   
#all_columns = list(datameged) # Creates list of all column headers
#datameged[all_columns] = datameged[all_columns].astype(str)

#%%
#all_columns = list(imigrantlabor132) # Creates list of all column headers
#imigrantlabor132[all_columns] = imigrantlabor132[all_columns].astype(str)



#%% immigrant  + 132
datameged = pd.merge(datameged, imigrantlabor132, on=['year', 'industry_code','quarter','fipsstate',
                         'indnaics', 'ind_desc',#'idm', 
                         'ind_code_3dig', 
                         'state', 'countyname','country_code','country_name','region_code','jurisdiction',       
                         'Feb2020','Mar2020', 'Apr2020', 'May2020', 'Jun2020', 'Jul2020', 'Aug2020',               
                         'Sep2020', 'Oct2020', 'Nov2020', 'Dec2020', 'Jan2021', 'Feb2021', 'Mar2021', 'Apr2021'                          
                                                         ], how='left')


datameged.isnull().sum()

#%%  #6BBFBF  #0F5C8C  #032059   #020B26  #031240
#%% "#A60842", "#181A40","#061256"    or #0F95D7  #0F95D7
#import random


import numpy
from matplotlib import pyplot

# young low 
x12=datameged.hourly_wage112m
y12=datameged.hourly_wage112n
# young high
x11=datameged.hourly_wage111m
y11=datameged.hourly_wage111n
# middle aged  low
x22=datameged.hourly_wage122m
y22=datameged.hourly_wage122n
# middle aged  high
x21=datameged.hourly_wage121m
y21=datameged.hourly_wage121n


pyplot.hist(x12, bins='auto', alpha=0.7, color = '#0F95D7', label='Foreign', rwidth=0.85, density = True)
pyplot.hist(y12, bins='auto', alpha=0.7, color = '#0F5C8C', label='Native' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')
pyplot.xlim(1,30)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
#pyplot.show()
plt.savefig('wageagedensityyounglow.pdf', bbox_inches='tight')

#%%

pyplot.hist(x11, bins='auto', alpha=0.7, color = '#0F95D7', label='Foreign', rwidth=0.85, density = True)
pyplot.hist(y11, bins='auto', alpha=0.7, color = '#0F5C8C', label='Native' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')

pyplot.xlim(1,60)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
plt.savefig('wageagedensityyounghigh.pdf', bbox_inches='tight')

#%%

pyplot.hist(x22, bins='auto', alpha=0.7, color = '#0F95D7', label='Foreign', rwidth=0.85, density = True)
pyplot.hist(y22, bins='auto', alpha=0.7, color = '#0F5C8C', label='Native' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')

pyplot.xlim(1,40)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
plt.savefig('wageagedensitymiddlelow.pdf', bbox_inches='tight')

#%%

pyplot.hist(x21, bins='auto', alpha=0.7, color = '#0F95D7', label='Foreign', rwidth=0.85, density = True)
pyplot.hist(y21, bins='auto', alpha=0.7, color = '#0F5C8C', label='Native', rwidth=0.85, density = True)
pyplot.legend(loc='upper right')

pyplot.xlim(2,60)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 

plt.savefig('wageagedensitymiddlehigh.pdf', bbox_inches='tight')




#%% drop obs with 2020 and 2021

datamegedbeforercovid = datameged.drop(datameged[(datameged['year'] == 2020 ) ].index)
datamegedbeforercovid = datamegedbeforercovid.drop(datamegedbeforercovid[(datamegedbeforercovid['year'] == 2021 ) ].index)


#%% 
#%% 
#%%  drop obs with 2018 and 2019
datamegedaftercovid = datameged.drop(datameged[(datameged['year'] == 2018 ) ].index)
datamegedaftercovid = datamegedaftercovid.drop(datamegedaftercovid[(datamegedaftercovid['year'] == 2019 ) ].index)


#%%

# young low 
x12a=datamegedaftercovid.hourly_wage112m
y12a=datamegedaftercovid.hourly_wage112n
# young high
x11a=datamegedaftercovid.hourly_wage111m
y11a=datamegedaftercovid.hourly_wage111n
# middle aged  low
x22a=datamegedaftercovid.hourly_wage122m
y22a=datamegedaftercovid.hourly_wage122n
# middle aged  high
x21a=datamegedaftercovid.hourly_wage121m
y21a=datamegedaftercovid.hourly_wage121n

#%%
x12b=datamegedbeforercovid.hourly_wage112m
y12b=datamegedbeforercovid.hourly_wage112n
# young high
x11b=datamegedbeforercovid.hourly_wage111m
y11b=datamegedbeforercovid.hourly_wage111n
# middle aged  low
x22b=datamegedbeforercovid.hourly_wage122m
y22b=datamegedbeforercovid.hourly_wage122n
# middle aged  high
x21b=datamegedbeforercovid.hourly_wage121m
y21b=datamegedbeforercovid.hourly_wage121n
#%%

#F24B6A
#F24B6A
#73161E
#8C1822
#D92B3A



#%%

#pyplot.hist(x12a, bins='auto', alpha=0.7, color = '#0F95D7', label='Foreign - after covid', rwidth=0.85, density = True)
#pyplot.hist(y12a, bins='auto', alpha=0.7, color = '#0F5C8C', label='Native - after covid' , rwidth=0.85, density = True)
pyplot.hist(x12b, bins='auto', alpha=0.7, color = '#F24B6A', label='Foreign - before covid', rwidth=0.85, density = True)
pyplot.hist(y12b, bins='auto', alpha=0.7, color = '#8C1822', label='Native - before covid' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')
pyplot.xlim(1,30)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
#pyplot.show()
plt.savefig('3Referee_wageagedensityyounglow.pdf', bbox_inches='tight')

#%%

pyplot.hist(x12a, bins='auto', alpha=0.7, color = '#0F95D7', label='Foreign - after covid', rwidth=0.85, density = True)
pyplot.hist(y12a, bins='auto', alpha=0.7, color = '#0F5C8C', label='Native - after covid' , rwidth=0.85, density = True)
#pyplot.hist(x12b, bins='auto', alpha=0.7, color = '#F24B6A', label='Foreign - before covid', rwidth=0.85, density = True)
#pyplot.hist(y12b, bins='auto', alpha=0.7, color = '#8C1822', label='Native - before covid' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')
pyplot.xlim(1,30)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
#pyplot.show()
plt.savefig('2Referee_wageagedensityyounglow.pdf', bbox_inches='tight')







#%%

pyplot.hist(x11a, bins='auto', alpha=0.7, color = '#0F95D7', label='Foreign - after covid', rwidth=0.85, density = True)
pyplot.hist(y11a, bins='auto', alpha=0.7, color = '#0F5C8C', label='Native - after covid' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')

pyplot.xlim(1,60)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
plt.savefig('2Referee_wageagedensityyounghigh.pdf', bbox_inches='tight')

#%%

pyplot.hist(x11b, bins='auto', alpha=0.7, color = '#F24B6A', label='Foreign - before covid', rwidth=0.85, density = True)
pyplot.hist(y11b, bins='auto', alpha=0.7, color = '#8C1822', label='Native - before covid' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')

pyplot.xlim(1,60)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
plt.savefig('3Referee_wageagedensityyounghigh.pdf', bbox_inches='tight')

#%%

pyplot.hist(x22a, bins='auto', alpha=0.7, color = '#0F95D7', label='Foreign - after covid', rwidth=0.85, density = True)
pyplot.hist(y22a, bins='auto', alpha=0.7, color = '#0F5C8C', label='Native - after covid' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')

pyplot.xlim(1,40)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
plt.savefig('2Referee_wageagedensitymiddlelow.pdf', bbox_inches='tight')


#%%

pyplot.hist(x22b, bins='auto', alpha=0.7, color = '#F24B6A', label='Foreign - before covid', rwidth=0.85, density = True)
pyplot.hist(y22b, bins='auto', alpha=0.7, color = '#8C1822', label='Native - before covid' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')

pyplot.xlim(1,40)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
plt.savefig('3Referee_wageagedensitymiddlelow.pdf', bbox_inches='tight')

#%%

pyplot.hist(x21a, bins='auto', alpha=0.7, color = '#0F95D7', label='Foreign - after covid', rwidth=0.85, density = True)
pyplot.hist(y21a, bins='auto', alpha=0.7, color = '#0F5C8C', label='Native - after covid', rwidth=0.85, density = True)
pyplot.legend(loc='upper right')

pyplot.xlim(2,60)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 

plt.savefig('2Referee_wageagedensitymiddlehigh.pdf', bbox_inches='tight')


#%%

pyplot.hist(x21b, bins='auto', alpha=0.7, color = '#F24B6A', label='Foreign - before covid', rwidth=0.85, density = True)
pyplot.hist(y21b, bins='auto', alpha=0.7, color = '#8C1822', label='Native - before covid', rwidth=0.85, density = True)
pyplot.legend(loc='upper right')

pyplot.xlim(2,60)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 

plt.savefig('3Referee_wageagedensitymiddlehigh.pdf', bbox_inches='tight')




#%%

#%%  CHECKKKKKK  
import seaborn as sns
import matplotlib.pyplot as plt



#%% 11




#plt.figure(figsize=(10, 6))

pyplot.hist(y12b, bins='auto', alpha=0.7,color = '#0F95D7', rwidth=0.85, density = True)
sns.kdeplot(y12b, color='#0F95D7', linewidth=2)

pyplot.hist(y12a, bins='auto', alpha=0.7,color = '#0F5C8C',  rwidth=0.85, density = True)
sns.kdeplot(y12a, color='#0F5C8C', linewidth=2)

#plt.legend(loc='upper right')
plt.xlim(1,30)
plt.ylabel("Probability Density", fontsize=20)
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)
plt.xlabel('')
# Add legends
#plt.legend(loc='upper right', fontsize=22)
# Save the plot
plt.savefig('N_Beforeandafter_wageagedensityyounglow.pdf', bbox_inches='tight')
#%%
pyplot.hist(x12b, bins='auto', alpha=0.7,color = '#0F95D7',  rwidth=0.85, density = True)
sns.kdeplot(x12b, color='#0F95D7', linewidth=2)

pyplot.hist(x12a, bins='auto', alpha=0.7,color = '#0F5C8C',  rwidth=0.85, density = True)
sns.kdeplot(x12a, color='#0F5C8C', linewidth=2)

#plt.legend(loc='upper right')
plt.xlim(1,30)
plt.ylabel("Probability Density", fontsize=20)
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)
plt.xlabel('')
# Add legends
#plt.legend(loc='upper right', fontsize=22)
# Save the plot
plt.savefig('F_Beforeandafter_wageagedensityyounglow.pdf', bbox_inches='tight')

#%% 22

pyplot.hist(y11b, bins='auto', alpha=0.7,color = '#0F95D7', label='2018-2019' , rwidth=0.85, density = True)
sns.kdeplot(y11b, color='#0F95D7', linewidth=2)

pyplot.hist(y11a, bins='auto', alpha=0.7,color = '#0F5C8C', label='2020-2021', rwidth=0.85, density = True)
sns.kdeplot(y11a, color='#0F5C8C', linewidth=2)


plt.legend(loc='upper right')

plt.xlim(1,60)
plt.tight_layout()
plt.ylabel("Probability Density",fontsize=20)

 
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)
plt.xlabel('')

plt.legend()
plt.legend(fontsize=22) 
plt.savefig('N_Beforeandafter_wageagedensityyounghigh.pdf', bbox_inches='tight')

#%%
#x11a = np.array(x11a)
#x11a[np.isinf(x11a)] = np.nan
#%%
#x11a = x11a[~np.isnan(x11a)]

#x11a = np.array(x11a)  # Uncomment this if x11a is not already a numpy array

# Replace infinite values with NaN
#x11a[np.isinf(x11a)] = np.nan

# Drop NaN values
#x11a = x11a[~np.isnan(x11a)]
#%%
pyplot.hist(x11b,  bins='auto', alpha=0.7,color = '#0F95D7', label='2018-2019' ,rwidth=0.85, density = True)
sns.kdeplot(x11b, color='#0F95D7', linewidth=2)

pyplot.hist(x11a,  bins='auto', alpha=0.7,color = '#0F5C8C', label='2020-2021', rwidth=0.85, density = True)
sns.kdeplot(x11a, color='#0F5C8C', linewidth=2 )#, bw_adjust=0.085)

plt.legend(loc='upper right')

plt.xlim(1,60)
plt.tight_layout()
plt.ylabel("Probability Density",fontsize=20)

 
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)
plt.xlabel('')

plt.legend()
plt.legend(fontsize=22) 
plt.savefig('F_Beforeandafter_wageagedensityyounghigh.pdf', bbox_inches='tight')



#%% 33

pyplot.hist(y22b, bins='auto', alpha=0.7,color = '#0F95D7', rwidth=0.85, density = True)
sns.kdeplot(y22b, color='#0F95D7', linewidth=2)

pyplot.hist(y22a, bins='auto', alpha=0.7,color = '#0F5C8C' , rwidth=0.85, density = True)
sns.kdeplot(y22a, color='#0F5C8C', linewidth=2)


#plt.legend(loc='upper right')

plt.xlim(1,40)
plt.tight_layout()
plt.ylabel("Probability Density",fontsize=20)
plt.xlabel('')

 
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)

#plt.legend()
#plt.legend(fontsize=22) 
plt.savefig('N_Beforeandafter_wageagedensitymiddlelow.pdf', bbox_inches='tight')


#%%
pyplot.hist(x22b, bins='auto', alpha=0.7,color = '#0F95D7',  rwidth=0.85, density = True)
sns.kdeplot(x22b, color='#0F95D7', linewidth=2)

pyplot.hist(x22a, bins='auto', alpha=0.7,color = '#0F5C8C',  rwidth=0.85, density = True)
sns.kdeplot(x22a, color='#0F5C8C', linewidth=2)

#plt.legend(loc='upper right')

plt.xlim(1,40)
plt.tight_layout()
plt.ylabel("Probability Density",fontsize=20)

 
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)
plt.xlabel('')

#plt.legend()
#plt.legend(fontsize=22) 
plt.savefig('F_Beforeandafter_wageagedensitymiddlelow.pdf', bbox_inches='tight')





#%% wageagedensitymiddlehigh

pyplot.hist(y21b, bins='auto', alpha=0.7,color='#0F95D7',  rwidth=0.85, density = True)
sns.kdeplot(y21b, color='#0F95D7', linewidth=2)

pyplot.hist(y21a, bins='auto', alpha=0.7,color='#0F5C8C', rwidth=0.85, density = True)
sns.kdeplot(y21a, color='#0F5C8C', linewidth=2)

# Adding KDE lines using seaborn

# Customize the plot
plt.xlim(2, 60)
plt.ylabel("Probability Density", fontsize=20)
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)
plt.xlabel('')
# Add legends
#plt.legend(loc='upper right', fontsize=20)
# Save the plot
plt.savefig('N_Beforeandafter_wageagedensitymiddlehigh.pdf', bbox_inches='tight')



#%%
pyplot.hist(x21b, bins='auto', alpha=0.7, color='#0F95D7',  rwidth=0.85, density = True)
sns.kdeplot(x21b, color='#0F95D7', linewidth=2)

pyplot.hist(x21a, bins='auto', alpha=0.7, color='#0F5C8C',  rwidth=0.85, density = True)
sns.kdeplot(x21a, color='#0F5C8C', linewidth=2)

# Customize the plot
plt.xlim(2, 60)
plt.ylabel("Probability Density", fontsize=20)
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)
plt.xlabel('')
# Add legends
#plt.legend(loc='upper right', fontsize=22)
# Save the plot
plt.savefig('F_Beforeandafter_wageagedensitymiddlehigh.pdf', bbox_inches='tight')




#%%

#%%  check missing data
x1111= datameged.isnull().sum()
#%% replace missing values with mean  !!!!!!!!!!!!!! (I replace by mean maybe it is not the best way ==> to check again )
#datameged=datameged.fillna(datameged.mean())


#numeric_cols = datameged.select_dtypes(include=['number']).columns
#datameged[numeric_cols] = datameged[numeric_cols].fillna(datameged[numeric_cols].mean())


#%% replace missing values with mean 
#datameged=datameged.fillna(datameged.mean())

#%%

#%%
#datameged[['hourly_wage111n','ahrswork1111n','ahrsworkt111n','quarterly_wage111n']]=datameged[['hourly_wage111n','ahrswork1111n','ahrsworkt111n','monthly_wage111n']].fillna(datameged.mean())
#%%
#datameged[['hourly_wage112n','ahrswork1112n','ahrsworkt112n','monthly_wage112n']]=datameged[['hourly_wage112n','ahrswork1112n','ahrsworkt112n','monthly_wage112n']].fillna(datameged.mean())
#%%                                                                                            
#datameged[['hourly_wage121n','ahrswork1211n','ahrsworkt121n','monthly_wage121n']]=datameged[['hourly_wage121n','ahrswork1211n','ahrsworkt121n','monthly_wage121n']].fillna(datameged.mean())
#%%
#datameged[['hourly_wage122n','ahrswork1122n','ahrsworkt122n','monthly_wage122n']]=datameged[['hourly_wage122n','ahrswork1122n','ahrsworkt122n','monthly_wage122n']].fillna(datameged.mean())
#%%
#datameged[['hourly_wage131n','ahrswork1131n','ahrsworkt131n','monthly_wage131n']]=datameged[['hourly_wage131n','ahrswork1131n','ahrsworkt131n','monthly_wage131n']].fillna(datameged.mean())
#%%
#datameged[['hourly_wage132n','ahrswork1132n','ahrsworkt132n','monthly_wage132n']]=datameged[['hourly_wage132n','ahrswork1132n','ahrsworkt132n','monthly_wage132n']].fillna(datameged.mean())
#%%
#datameged[['hourly_wage111m','ahrswork1111m','ahrsworkt111m','monthly_wage111m']]=datameged[['hourly_wage111m','ahrswork1111m','ahrsworkt111m','monthly_wage111m']].fillna(datameged.mean())
#%%
#datameged[['hourly_wage112m','ahrswork1112m','ahrsworkt112m','monthly_wage112m']]=datameged[['hourly_wage112m','ahrswork1112m','ahrsworkt112m','monthly_wage112m']].fillna(datameged.mean())
#%%
#datameged[['hourly_wage121m','ahrswork1211m','ahrsworkt121m','monthly_wage121m']]=datameged[['hourly_wage121m','ahrswork1211m','ahrsworkt121m','monthly_wage121m']].fillna(datameged.mean())
#%%
#datameged[['hourly_wage122m','ahrswork1122m','ahrsworkt122m','monthly_wage122m']]=datameged[['hourly_wage122m','ahrswork1122m','ahrsworkt122m','monthly_wage122m']].fillna(datameged.mean())
#%%
#datameged[['hourly_wage131m','ahrswork1131m','ahrsworkt131m','monthly_wage131m']]=datameged[['hourly_wage131m','ahrswork1131m','ahrsworkt131m','monthly_wage131m']].fillna(datameged.mean())
#%%
#datameged[['hourly_wage132m','ahrswork1132m','ahrsworkt132m','monthly_wage132m']]=datameged[['hourly_wage132m','ahrswork1132m','ahrsworkt132m','monthly_wage132m']].fillna(datameged.mean())
#%%


columns_to_fill = ['hourly_wage111n','ahrswork1111n','ahrsworkt111n','monthly_wage111n',
                   'hourly_wage112n','ahrswork1112n','ahrsworkt112n','monthly_wage112n',
                   'hourly_wage121n','ahrswork1211n','ahrsworkt121n','monthly_wage121n',
                   'hourly_wage122n','ahrswork1122n','ahrsworkt122n','monthly_wage122n',
                   'hourly_wage131n','ahrswork1131n','ahrsworkt131n','monthly_wage131n',
                   'hourly_wage132n','ahrswork1132n','ahrsworkt132n','monthly_wage132n',
                   'hourly_wage111m','ahrswork1111m','ahrsworkt111m','monthly_wage111m',
                   'hourly_wage112m','ahrswork1112m','ahrsworkt112m','monthly_wage112m',
                   'hourly_wage121m','ahrswork1211m','ahrsworkt121m','monthly_wage121m',
                   'hourly_wage122m','ahrswork1122m','ahrsworkt122m','monthly_wage122m',
                   'hourly_wage131m','ahrswork1131m','ahrsworkt131m','monthly_wage131m',
                   'hourly_wage132m','ahrswork1132m','ahrsworkt132m','monthly_wage132m']

# Fill missing values in these specific columns with their respective means
datameged[columns_to_fill] = datameged[columns_to_fill].apply(lambda col: col.fillna(col.mean()))



#%%
x1111= datameged.isnull().sum()
#%% 

                                       
#%%  variable of interest are : hourly wage hourly_wage
#     and  hours worked  (month level)  ahrsworkt


#%% calculate the sum of hours supplied by young ly  and middle age lm
datameged.loc[:,'Sumly'] = datameged.loc[:,['ahrsworkt111n','ahrsworkt112n','ahrsworkt111m','ahrsworkt112m']].sum(axis=1, min_count=1)

datameged.loc[:,'Sumlm'] = datameged.loc[:,['ahrsworkt121n','ahrsworkt122n','ahrsworkt121m','ahrsworkt122m']].sum(axis=1, min_count=1)
 
#%%  compute paramter phi:  from ly   (young)
phi111n = (datameged.ahrsworkt111n).sum() /(datameged.Sumly).sum()
phi112n = (datameged.ahrsworkt112n).sum() /(datameged.Sumly).sum()
phi111m = (datameged.ahrsworkt111m).sum() /(datameged.Sumly).sum()
phi112m = (datameged.ahrsworkt112m).sum() /(datameged.Sumly).sum()

print(f'The value of \phi_hny is {phi111n}.')
print(f'The value of \phi_lny is {phi112n}.')
print(f'The value of \phi_hfy is {phi111m}.')
print(f'The value of \phi_lfy is {phi112m}.')

#%%  compute paramter theta: from lm    (middle age) 
theta121n =  (datameged.ahrsworkt121n).sum() / (datameged.Sumlm).sum()
theta122n =  (datameged.ahrsworkt122n).sum() / (datameged.Sumlm).sum()
theta121m =  (datameged.ahrsworkt121m).sum() / (datameged.Sumlm).sum()
theta122m =  (datameged.ahrsworkt122m).sum() / (datameged.Sumlm).sum()

print(f'The value of \theta_hnm is {theta121n}.')
print(f'The value of \theta_lnm is {theta122n}.')
print(f'The value of \theta_hfm is {theta121m}.')
print(f'The value of \theta_lfm is {theta122m}.')

#%% compute paramter alpha:  form lm and ly   (youth labor share) 
alphay = (datameged.Sumly).sum() /((datameged.Sumly).sum() +  (datameged.Sumlm).sum() )

print(f'The value of alpha is {alphay}.')

#%%   Compute the elasticties   
datameged_clean = datameged
#%%
datameged_clean["year2"] = datameged_clean["year"]
datameged_clean["county2"] = datameged_clean["countyname"]

#%%  (+add a constant that will be used in the estimation)
datameged_clean['const'] = 1
#%% compute wage and labor dfferentials in log  
# log1p is used to handle log(0) by computing log(1 + x)

#%%  high skill =2  young=1
datameged_clean['logwagedifferential112m_112n'] = np.log1p(datameged_clean['hourly_wage112m'])  -  np.log1p(datameged_clean['hourly_wage112n'])
datameged_clean['loghoursdifferential112m_112n'] =   np.log1p(datameged_clean['ahrsworkt112m'])  - np.log1p(datameged_clean['ahrsworkt112n']) 
                             
#%% low skill =1  young  =1
datameged_clean['logwagedifferential111m_111n'] = np.log1p(datameged_clean['hourly_wage111m'])  -  np.log1p(datameged_clean['hourly_wage111n'])
datameged_clean['loghoursdifferential111m_111n'] =   np.log1p(datameged_clean['ahrsworkt111m'])  - np.log1p(datameged_clean['ahrsworkt111n']) 
                             
#%% high skill =2  middle age  =2
datameged_clean['logwagedifferential122m_122n'] = np.log1p(datameged_clean['hourly_wage122m'])  -  np.log1p(datameged_clean['hourly_wage122n'])
datameged_clean['loghoursdifferential122m_122n'] =   np.log1p(datameged_clean['ahrsworkt122m'])  -  np.log1p(datameged_clean['ahrsworkt122n']) 
                             
#%% low skill =1  middle age  =2
datameged_clean['logwagedifferential121m_121n'] = np.log1p(datameged_clean['hourly_wage121m'])  -  np.log1p(datameged_clean['hourly_wage121n'])
datameged_clean['loghoursdifferential121m_121n'] =   np.log1p(datameged_clean['ahrsworkt121m'])  -  np.log1p(datameged_clean['ahrsworkt121n']) 
                             
#%% drop nan in the selected variables (subset)      
#datameged_clean = datameged_clean.dropna(subset=['loghoursdifferential112m_112n','logwagedifferential112m_112n','logwagedifferential111m_111n','loghoursdifferential111m_111n','logwagedifferential122m_122n','loghoursdifferential122m_122n','logwagedifferential121m_121n','loghoursdifferential121m_121n'])

#%% replace inf by nan and then drop nan
#datameged_clean = datameged_clean.replace([np.inf, -np.inf], np.nan).dropna()
#%% define index (can also be used as time and county FE  in the estimation)
datameged_clean = datameged_clean.set_index(['countyname','year'])

#%%  estimate varrho using the linearized euler equations
#%% Euler equation: log( hourly_wage112m)  - log(hourly_wage112n) =   (1/(varrho)-1) * ( log(phi112m *ahrsworkt112m)  - log (phi112n*ahrsworkt112n) )
exog_vars = ['loghoursdifferential112m_112n'] # 
exog = sm.add_constant(datameged_clean[exog_vars])
#%%  
print ("OLS regression model for the varrho  ")
cons = PanelOLS(datameged_clean.logwagedifferential112m_112n,exog,entity_effects=True,time_effects=True)
two_res1 = cons.fit()
print(two_res1)
# significant    -1.3710   : w/o County and year FE
# significant    -1.4714   : with county fe
# significant    -1.3839   : with time fe
# significant    -1.4830   : with county and time FE 
#%%
print ("OLS regression model for the varrho  ")
cons = PanelOLS(datameged_clean.logwagedifferential112m_112n,exog,entity_effects=False,time_effects=False)
two_res1H2 = cons.fit()
print(two_res1H2)
#%%
print ("OLS regression model for the varrho  ")
cons = PanelOLS(datameged_clean.logwagedifferential112m_112n,exog,entity_effects=True,time_effects=False)
two_res1H3 = cons.fit()
print(two_res1H3)
#%%
print ("OLS regression model for the varrho  ")
cons = PanelOLS(datameged_clean.logwagedifferential112m_112n,exog,entity_effects=False,time_effects=True)
two_res1H4 = cons.fit()
print(two_res1H4)


#%%
from statsmodels.iolib.summary3 import summary_col

beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res1,two_res1H2,two_res1H3,two_res1H4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elavarrho.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()

#%%
from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res1,two_res1H2,two_res1H3,two_res1H4])
stargazer.title("OLS varrho ")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential112m_112n'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elavarrho.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    


#%%  estimate upsilon using the linearized euler equations
#%% Euler equation: log( hourly_wage111m)  - log(hourly_wage111n) =   (1/(upsilon)-1) * ( log(phi111m *ahrsworkt111m)  - log (phi111n*ahrsworkt111n) )
exog_vars = ['loghoursdifferential111m_111n'] # 
exog = sm.add_constant(datameged_clean[exog_vars])
#%%
print ("OLS regression model for the upsilon  ")
cons = PanelOLS(datameged_clean.logwagedifferential111m_111n,exog,entity_effects=True,time_effects=True)
two_res2 = cons.fit()
print(two_res2)

# not significant    -0.9081  : w/o County and year FE
# not significant    -0.9033  : with county fe
# not significant    -0.9214   : with time fe
# not significant    -0.9189    : with county and time FE

print ("OLS regression model for the upsilon  ")
cons = PanelOLS(datameged_clean.logwagedifferential111m_111n,exog,entity_effects=False,time_effects=False)
two_res2H2 = cons.fit()
print(two_res2H2)
print ("OLS regression model for the upsilon  ")
cons = PanelOLS(datameged_clean.logwagedifferential111m_111n,exog,entity_effects=True,time_effects=False)
two_res2H3 = cons.fit()
print(two_res2H3)
print ("OLS regression model for the upsilon  ")
cons = PanelOLS(datameged_clean.logwagedifferential111m_111n,exog,entity_effects=False,time_effects=True)
two_res2H4 = cons.fit()
print(two_res2H4)


#%%
from statsmodels.iolib.summary3 import summary_col

beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res2,two_res2H2,two_res2H3,two_res2H4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elaupsilon.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()


#%%
from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res2,two_res2H2,two_res2H3,two_res2H4])
stargazer.title("OLS upsilon ")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential111m_111n'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elaupsilon.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    

#%%  estimate varepsilon using the linearized euler equations
#%% Euler equation: log( hourly_wage122m)  - log(hourly_wage122n) =   (1/(varepsilon)-1) * ( log(theta122m *ahrsworkt122m)  - log (theta122n*ahrsworkt122n) )
exog_vars = ['loghoursdifferential122m_122n'] # 
exog = sm.add_constant(datameged_clean[exog_vars])
#%%
print ("OLS regression model for the varepsilon  ")
cons = PanelOLS(datameged_clean.logwagedifferential122m_122n,exog,entity_effects=True,time_effects=True)
two_res3 = cons.fit()
print(two_res3)
# not significant   0.3037   : w/o county and time FE
# not significant   0.3506   : with county  FE
# not significant   0.1486   : with time FE
# not significant   0.1893   : with county and time FE


print ("OLS regression model for the varepsilon  ")
cons = PanelOLS(datameged_clean.logwagedifferential122m_122n,exog,entity_effects=False,time_effects=False)
two_res3H2 = cons.fit()
print(two_res3H2)
print ("OLS regression model for the varepsilon  ")
cons = PanelOLS(datameged_clean.logwagedifferential122m_122n,exog,entity_effects=True,time_effects=False)
two_res3H3 = cons.fit()
print(two_res3H3)
print ("OLS regression model for the varepsilon  ")
cons = PanelOLS(datameged_clean.logwagedifferential122m_122n,exog,entity_effects=False,time_effects=True)
two_res3H4 = cons.fit()
print(two_res3H4)


#%%
from statsmodels.iolib.summary3 import summary_col

beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res3,two_res3H2,two_res3H3,two_res3H4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elavarepsilon.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()


#%%
from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res3,two_res3H2,two_res3H3,two_res3H4])
stargazer.title("OLS varepsilon ")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential122m_122n'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elavarepsilon.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    
#%%  estimate zeta using the linearized euler equations
#%% Euler equation: log( hourly_wage121m)  - log(hourly_wage121n) =   (1/(zeta)-1) * ( log(theta121m *ahrsworkt121m)  - log (theta121n*ahrsworkt121n) )
exog_vars = ['loghoursdifferential121m_121n'] # 
exog = sm.add_constant(datameged_clean[exog_vars])
#%%
print ("OLS regression model for the zeta  ")
cons = PanelOLS(datameged_clean.logwagedifferential121m_121n,exog,entity_effects=True,time_effects=True)
two_res4 = cons.fit()
print(two_res4)

# significant       1.6535   : w/o county and time FE
# not significant   1.4559   : with county  FE
# not significant   1.5915   : with time FE
# not significant   1.3646   : with county and time FE

print ("OLS regression model for the zeta  ")
cons = PanelOLS(datameged_clean.logwagedifferential121m_121n,exog,entity_effects=False,time_effects=False)
two_res4H2 = cons.fit()
print(two_res4H2)
print ("OLS regression model for the zeta  ")
cons = PanelOLS(datameged_clean.logwagedifferential121m_121n,exog,entity_effects=True,time_effects=False)
two_res4H3 = cons.fit()
print(two_res4H3)
print ("OLS regression model for the zeta  ")
cons = PanelOLS(datameged_clean.logwagedifferential121m_121n,exog,entity_effects=False,time_effects=True)
two_res4H4 = cons.fit()
print(two_res4H4)

beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res4,two_res4H2,two_res4H3,two_res4H4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elazeta.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()

#%%
from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res4,two_res4H2,two_res4H3,two_res4H4])
stargazer.title("OLS zeta ")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential121m_121n'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elazeta.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
#%%  young:  average wage by year
youngaveragewagebyyear=  datameged.groupby(['year'])[['hourly_wage112m','hourly_wage112n','hourly_wage111m','hourly_wage111n']].mean()
youngaveragewagebyyear_sem=  datameged.groupby(['year'])[['hourly_wage112m','hourly_wage112n','hourly_wage111m','hourly_wage111n']].sem()

youngaveragehoursbyyear=  datameged.groupby(['year'])[['ahrsworkt112m','ahrsworkt112n','ahrsworkt111m','ahrsworkt111n']].mean()
youngaveragehoursbyyear_sem=  datameged.groupby(['year'])[['ahrsworkt112m','ahrsworkt112n','ahrsworkt111m','ahrsworkt111n']].sem()

#%%  middle age: average wage by year

middleageaveragewagebyyear=  datameged.groupby(['year'])[['hourly_wage122m','hourly_wage122n','hourly_wage121m','hourly_wage121n']].mean()
middleageaveragewagebyyear_sem=  datameged.groupby(['year'])[['hourly_wage122m','hourly_wage122n','hourly_wage121m','hourly_wage121n']].sem()

middleageaveragehoursbyyear=  datameged.groupby(['year'])[['ahrsworkt122m','ahrsworkt122n','ahrsworkt121m','ahrsworkt121n']].mean()
middleageaveragehoursbyyear_sem=  datameged.groupby(['year'])[['ahrsworkt122m','ahrsworkt122n','ahrsworkt121m','ahrsworkt121n']].sem()

#%%  old: average wage by year

oldaveragewagebyyear=  datameged.groupby(['year'])[['hourly_wage132m','hourly_wage132n','hourly_wage131m','hourly_wage131n']].mean()
oldaveragewagebyyear_sem=  datameged.groupby(['year'])[['hourly_wage132m','hourly_wage132n','hourly_wage131m','hourly_wage131n']].sem()

oldaveragehoursbyyear=  datameged.groupby(['year'])[['ahrsworkt132m','ahrsworkt132n','ahrsworkt131m','ahrsworkt131n']].mean()
oldaveragehoursbyyear_sem=  datameged.groupby(['year'])[['ahrsworkt132m','ahrsworkt132n','ahrsworkt131m','ahrsworkt131n']].sem()
               

#%%

from scipy import stats

# Function to perform t-test and return p-value
def perform_t_test(mean_values):
    p_values = {}
    for col in mean_values.columns:
        clean_values = mean_values[col].dropna()
        t_stat, p_val = stats.ttest_1samp(clean_values, 0)
        p_values[col] = p_val
    return pd.Series(p_values)

# Compute p-values for each group and metric
selected_data = datameged[datameged['year'] == 2018][['hourly_wage112m','hourly_wage112n','hourly_wage111m','hourly_wage111n']]
young_wage_p_values2018 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2019][['hourly_wage112m','hourly_wage112n','hourly_wage111m','hourly_wage111n']]
young_wage_p_values2019 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2020][['hourly_wage112m','hourly_wage112n','hourly_wage111m','hourly_wage111n']]
young_wage_p_values2020 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2021][['hourly_wage112m','hourly_wage112n','hourly_wage111m','hourly_wage111n']]
young_wage_p_values2021 = perform_t_test(selected_data)



selected_data = datameged[datameged['year'] == 2018][['ahrsworkt112m','ahrsworkt112n','ahrsworkt111m','ahrsworkt111n']]
young_hours_p_values2018 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2019][['ahrsworkt112m','ahrsworkt112n','ahrsworkt111m','ahrsworkt111n']]
young_hours_p_values2019 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2020][['ahrsworkt112m','ahrsworkt112n','ahrsworkt111m','ahrsworkt111n']]
young_hours_p_values2020 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2021][['ahrsworkt112m','ahrsworkt112n','ahrsworkt111m','ahrsworkt111n']]
young_hours_p_values2021 = perform_t_test(selected_data)


selected_data = datameged[datameged['year'] == 2018][['hourly_wage122m','hourly_wage122n','hourly_wage121m','hourly_wage121n']]
middleage_wage_p_values2018 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2019][['hourly_wage122m','hourly_wage122n','hourly_wage121m','hourly_wage121n']]
middleage_wage_p_values2019 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2020][['hourly_wage122m','hourly_wage122n','hourly_wage121m','hourly_wage121n']]
middleage_wage_p_values2020 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2021][['hourly_wage122m','hourly_wage122n','hourly_wage121m','hourly_wage121n']]
middleage_wage_p_values2021 = perform_t_test(selected_data)


selected_data = datameged[datameged['year'] == 2018][['ahrsworkt122m','ahrsworkt122n','ahrsworkt121m','ahrsworkt121n']]
middleage_hours_p_values2018 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2019][['ahrsworkt122m','ahrsworkt122n','ahrsworkt121m','ahrsworkt121n']]
middleage_hours_p_values2019 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2020][['ahrsworkt122m','ahrsworkt122n','ahrsworkt121m','ahrsworkt121n']]
middleage_hours_p_values2020 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2021][['ahrsworkt122m','ahrsworkt122n','ahrsworkt121m','ahrsworkt121n']]
middleage_hours_p_values2021 = perform_t_test(selected_data)


selected_data = datameged[datameged['year'] == 2018][['hourly_wage132m','hourly_wage132n','hourly_wage131m','hourly_wage131n']]
old_wage_p_values2018 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2019][['hourly_wage132m','hourly_wage132n','hourly_wage131m','hourly_wage131n']]
old_wage_p_values2019 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2020][['hourly_wage132m','hourly_wage132n','hourly_wage131m','hourly_wage131n']]
old_wage_p_values2020 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2021][['hourly_wage132m','hourly_wage132n','hourly_wage131m','hourly_wage131n']]
old_wage_p_values2021 = perform_t_test(selected_data)


selected_data = datameged[datameged['year'] == 2018][['ahrsworkt132m','ahrsworkt132n','ahrsworkt131m','ahrsworkt131n']]
old_hours_p_values2018 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2019][['ahrsworkt132m','ahrsworkt132n','ahrsworkt131m','ahrsworkt131n']]
old_hours_p_values2019 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2020][['ahrsworkt132m','ahrsworkt132n','ahrsworkt131m','ahrsworkt131n']]
old_hours_p_values2020 = perform_t_test(selected_data)
selected_data = datameged[datameged['year'] == 2021][['ahrsworkt132m','ahrsworkt132n','ahrsworkt131m','ahrsworkt131n']]
old_hours_p_values2021 = perform_t_test(selected_data)

#%%


#%% new table   statistical sign

# Combine means, SEMs, and p-values into DataFrames
dfs1 = pd.concat([youngaveragewagebyyear, youngaveragewagebyyear_sem,  pd.DataFrame([young_wage_p_values2018, young_wage_p_values2019, young_wage_p_values2020 , young_wage_p_values2021]).T ])
dfs2 = pd.concat([ youngaveragehoursbyyear,  youngaveragehoursbyyear_sem,  pd.DataFrame([young_hours_p_values2018 , young_hours_p_values2019 , young_hours_p_values2020 ,young_hours_p_values2021]).T  ])
dfs3 = pd.concat([ middleageaveragewagebyyear, middleageaveragewagebyyear_sem, pd.DataFrame([middleage_wage_p_values2018 , middleage_wage_p_values2019 , middleage_wage_p_values2020 , middleage_wage_p_values2021]).T  ])
dfs4 = pd.concat([ middleageaveragehoursbyyear, middleageaveragehoursbyyear_sem, pd.DataFrame([middleage_hours_p_values2018 , middleage_hours_p_values2019 , middleage_hours_p_values2020 , middleage_hours_p_values2021]).T  ])
#dfs5 = pd.concat([oldaveragewagebyyear, oldaveragewagebyyear_sem,  pd.DataFrame([old_wage_p_values2018 ,old_wage_p_values2019 , old_wage_p_values2020 ,old_wage_p_values2021]).T   ])
#dfs6 = pd.concat([ oldaveragehoursbyyear, oldaveragehoursbyyear_sem ,  pd.DataFrame([old_hours_p_values2018 , old_hours_p_values2019 , old_hours_p_values2020 , old_hours_p_values2021]).T  ])


# List of dataframes
dfs = [dfs1,dfs2, dfs3 , dfs4, dfs4]

# Function to write multiple dataframes to an Excel sheet
def multiple_dfs(df_list, sheet_name, file_name, spaces):
    writer = pd.ExcelWriter(file_name, engine='xlsxwriter')   
    row = 0
    for dataframe in df_list:
        dataframe.to_excel(writer, sheet_name=sheet_name, startrow=row, startcol=0)   
        row = row + len(dataframe.index) + spaces + 1
    writer.close()

# Run function
multiple_dfs(dfs, 'Validation', 'Signtest1newH.xlsx', 1)






#%%  OLD TABLE 
import pandas as pd
import numpy as np
import xlsxwriter

# funtion
def multiple_dfs(df_list, sheets, file_name, spaces):
    writer = pd.ExcelWriter(file_name,engine='xlsxwriter')   
    row = 0
    for dataframe in df_list:
        dataframe.to_excel(writer,sheet_name=sheets,startrow=row , startcol=0)   
        row = row + len(dataframe.index) + spaces + 1
    writer.close()

# list of dataframes
dfs = [youngaveragewagebyyear,youngaveragehoursbyyear,middleageaveragewagebyyear,middleageaveragehoursbyyear,oldaveragewagebyyear,oldaveragehoursbyyear]

# run function
multiple_dfs(dfs, 'Validation', 'test1.xlsx', 1)


#%% estimate elasticity s  (young vs middle age)


datameged_clean['hourlywage_young_avg'] = datameged_clean[['hourly_wage112m', 'hourly_wage112n','hourly_wage111m','hourly_wage111n']].mean(axis=1)
datameged_clean['ahrsworkt_young_avg'] = datameged_clean[['ahrsworkt112m','ahrsworkt112n','ahrsworkt111m','ahrsworkt111n']].mean(axis=1)

datameged_clean['hourlywage_middle_avg'] = datameged_clean[['hourly_wage122m', 'hourly_wage122n','hourly_wage121m','hourly_wage121n']].mean(axis=1)
datameged_clean['ahrsworkt_middle_avg'] = datameged_clean[['ahrsworkt122m','ahrsworkt122n','ahrsworkt121m','ahrsworkt121n']].mean(axis=1)


#%% estimate elasloghoursdifferentialloghoursdifferentialticity  (high vs low skill ) when young  sigma

datameged_clean['hourlywage_lowskillyoung_avg'] = datameged_clean[['hourly_wage111m', 'hourly_wage111n']].mean(axis=1)
datameged_clean['hourlywage_highskillyoung_avg'] = datameged_clean[['hourly_wage112m', 'hourly_wage112n']].mean(axis=1)
datameged_clean['ahrsworkt_lowskillyoung_avg'] = datameged_clean[['ahrsworkt111m','ahrsworkt111n']].mean(axis=1)
datameged_clean['ahrsworkt_highskillyoung_avg'] = datameged_clean[['ahrsworkt112m','ahrsworkt112n']].mean(axis=1)


#%% estimate elasticity  (high vs low skill ) when middle age \xi

datameged_clean['hourlywage_lowskillmidddle_avg'] = datameged_clean[['hourly_wage121m','hourly_wage121n']].mean(axis=1)
datameged_clean['hourlywage_highskillmidddle_avg'] = datameged_clean[['hourly_wage122m','hourly_wage122n']].mean(axis=1)
datameged_clean['ahrsworkt_lowskillmidddle_avg'] = datameged_clean[['ahrsworkt121m','ahrsworkt121n']].mean(axis=1)            
datameged_clean['ahrsworkt_highskillmidddle_avg'] = datameged_clean[['ahrsworkt122m','ahrsworkt122n']].mean(axis=1)



#%% #%% compute wage and labor dfferentials in log  
#%% estimate elasticity s  (young vs middle age)


datameged_clean['logwagedifferential_young_midlle_age'] = np.log1p(datameged_clean['hourlywage_young_avg']) - np.log1p(datameged_clean['hourlywage_middle_avg'])
datameged_clean['loghoursdifferential_young_midlle_age'] = np.log1p(datameged_clean['ahrsworkt_young_avg'] ) - np.log1p( datameged_clean['ahrsworkt_middle_avg']) 

#%% estimate elasticity  (high vs low skill ) when young  \sigma

datameged_clean['logwagedifferential_young_low_vs_high'] = np.log1p(datameged_clean['hourlywage_lowskillyoung_avg'])  - np.log1p(datameged_clean['hourlywage_highskillyoung_avg'] )
datameged_clean['loghoursdifferential_ young_low_vs_high']= np.log1p(datameged_clean['ahrsworkt_lowskillyoung_avg'])   - np.log1p(datameged_clean['ahrsworkt_highskillyoung_avg'] )

#%% estimate elasticity  (high vs low skill ) when middle age xi

datameged_clean['logwagedifferential_middle_low_vs_high']=  np.log1p(datameged_clean['hourlywage_lowskillmidddle_avg'])  - np.log1p(datameged_clean['hourlywage_highskillmidddle_avg']) 
datameged_clean['loghoursdifferential_middle_low_vs_high']= np.log1p(datameged_clean['ahrsworkt_lowskillmidddle_avg'])  - np.log1p(datameged_clean['ahrsworkt_highskillmidddle_avg'] )









#%%


datameged_cleanneNEW = datameged_clean
#%%
#datameged_cleanneNEW = datameged_clean.dropna(subset=['logwagedifferential_young_midlle_age','loghoursdifferential_young_midlle_age',
#'logwagedifferential_young_low_vs_high','loghoursdifferential_ young_low_vs_high',
#'logwagedifferential_middle_low_vs_high','loghoursdifferential_middle_low_vs_high'])
    
    

#%% replace inf by nan and then drop nan
#datameged_cleanneNEW  = datameged_cleanneNEW.replace([np.inf, -np.inf], np.nan).dropna()
#%% define index (can also be used as time and county FE  in the estimation)
#datameged_cleanneNEW  = datameged_cleanneNEW.set_index(['countyname','year'])

#%%  estimate s using the linearized euler equations
#%% Euler equation: logwagedifferential_young_midlle_age  =   (-1/s) * (loghoursdifferential_young_midlle_age)  
exog_vars = ['loghoursdifferential_young_midlle_age'] # 
exog = sm.add_constant(datameged_cleanneNEW[exog_vars])
#%%  
print ("OLS regression model for the s ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_young_midlle_age,exog,entity_effects=True,time_effects=True)
two_res1_s = cons.fit()
print(two_res1_s)

# significant   = 0.7360   with time and county fixed effects
# significant   =  0.7389 with time fe
# significant   =   0.7065   with  county fixed effects
# significant   =  0.7088 without time and county fe

print ("OLS regression model for the s ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_young_midlle_age,exog,entity_effects=False,time_effects=False)
two_res1_sH2 = cons.fit()
print(two_res1_sH2)
print ("OLS regression model for the s ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_young_midlle_age,exog,entity_effects=True,time_effects=False)
two_res1_sH3 = cons.fit()
print(two_res1_sH3)
print ("OLS regression model for the s ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_young_midlle_age,exog,entity_effects=False,time_effects=True)
two_res1_sH4 = cons.fit()
print(two_res1_sH4)



beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res1_s,two_res1_sH2,two_res1_sH3,two_res1_sH4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elassss.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()

#%%
from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res1_s,two_res1_sH2,two_res1_sH3,two_res1_sH4])
stargazer.title("OLS elassss")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential_young_midlle_age'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elassss.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    
    
#%%  estimate using the linearized euler equations
#%% Euler equation: logwagedifferential_young_low_vs_high  =   (1/(sigma)-1) * (loghoursdifferential_ young_low_vs_high)  
exog_vars = ['loghoursdifferential_ young_low_vs_high'] # 
exog = sm.add_constant(datameged_cleanneNEW[exog_vars])
#%%  
print ("OLS regression model for the sigma ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_young_low_vs_high,exog,entity_effects=True,time_effects=True)
two_res1_sigma = cons.fit()
print(two_res1_sigma)
# not significant   = 0.0145  with time and county fixed effects
# not significant   =  0.0145  with time fe
# not significant   =  0.0161 with  county fixed effects
# not significant   =  0.0160  without time and county fe
print ("OLS regression model for the sigma ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_young_low_vs_high,exog,entity_effects=False,time_effects=False)
two_res1_sigmaH2 = cons.fit()
print(two_res1_sigmaH2)
print ("OLS regression model for the sigma ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_young_low_vs_high,exog,entity_effects=True,time_effects=False)
two_res1_sigmaH3 = cons.fit()
print(two_res1_sigmaH3)
print ("OLS regression model for the sigma ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_young_low_vs_high,exog,entity_effects=False,time_effects=True)
two_res1_sigmaH4 = cons.fit()
print(two_res1_sigmaH4)



beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res1_sigma,two_res1_sigmaH2,two_res1_sigmaH3,two_res1_sigmaH4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elasigma.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()




#%%
from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res1_sigma,two_res1_sigmaH2,two_res1_sigmaH3,two_res1_sigmaH4])
stargazer.title("OLS elasigma")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential_ young_low_vs_high'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elasigma.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    
    
    

#%%  estimate  using the linearized euler equations
#%% Euler equation: logwagedifferential_middle_low_vs_high  =   (1/(xi)-1) * (loghoursdifferential_middle_low_vs_high)  
exog_vars = ['loghoursdifferential_middle_low_vs_high'] # 
exog = sm.add_constant(datameged_cleanneNEW[exog_vars])
#%%  
print ("OLS regression model for the xi ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_middle_low_vs_high,exog,entity_effects=True,time_effects=True)
two_res1_xi = cons.fit()
print(two_res1_xi)


# significant   = 0.7036    with time and county fixed effects
# significant   = 0.7024  with time fe
# significant   = 0.6483  with  county fixed effects
# significant   =  0.6472  without time and county fe

print ("OLS regression model for the xi ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_middle_low_vs_high,exog,entity_effects=False,time_effects=False)
two_res1_xiH2 = cons.fit()
print(two_res1_xiH2)
print ("OLS regression model for the xi ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_middle_low_vs_high,exog,entity_effects=True,time_effects=False)
two_res1_xiH3 = cons.fit()
print(two_res1_xiH3)
print ("OLS regression model for the xi ")
cons = PanelOLS(datameged_cleanneNEW.logwagedifferential_middle_low_vs_high,exog,entity_effects=False,time_effects=True)
two_res1_xiH4 = cons.fit()
print(two_res1_xiH4)

beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res1_xi,two_res1_xiH2,two_res1_xiH3,two_res1_xiH4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elaxxxxi.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()

#%%
#%%
from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res1_xi,two_res1_xiH2,two_res1_xiH3,two_res1_xiH4])
stargazer.title("OLS elaxxxxi")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential_middle_low_vs_high'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elaxxxxi.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    
    
    
    


#%% report the results of the estimation to latex file 
from statsmodels.iolib.summary3 import summary_col




beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"



resultelasti11 = summary_col([two_res1,two_res2,two_res3,two_res4,two_res1_s,two_res1_sigma,two_res1_xi],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elasticities22.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()



#%%

#%%
from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res1,two_res2,two_res3,two_res4,two_res1_s,two_res1_sigma,two_res1_xi])
stargazer.title("OLS elasticities22")
stargazer.custom_columns(["County and Year Effects", "County and Year Effects", "County and Year Effects", "County and Year Effects", "County and Year Effects","County and Year Effects","County and Year Effects",], [1, 1, 1, 1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const','loghoursdifferential112m_112n', 'loghoursdifferential111m_111n', 'loghoursdifferential122m_122n', 'loghoursdifferential121m_121n',
 'loghoursdifferential_young_midlle_age','loghoursdifferential_ young_low_vs_high','loghoursdifferential_middle_low_vs_high'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elasticities22.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    
    
    
    
#%%  young and middle  all :  average wage by year
allyoungaveragewagebyyear =  datameged_clean.groupby(['year'])['hourlywage_young_avg'].mean()

allmiddleaveragehoursbyyear=  datameged_clean.groupby(['year'])['hourlywage_middle_avg'].mean()










#%%


#%% report the parameters to excel 


import xlsxwriter

workbook = xlsxwriter.Workbook('write_dictparam111.xlsx')
worksheet = workbook.add_worksheet()

my_dict = my_dict = {'phi_{111n}': [phi111n],
                     'phi_{112n}': [phi112n],
                     'phi_{111m}': [phi111m],
                     'phi_{112m}': [phi112m],
                     'theta_{121n}': [theta121n],
                     'theta_{122n}': [theta122n],
                     'theta_{121m}': [theta121m],
                     'theta_{122m}': [theta122m],
                     'alpha_{1}': [alphay]}

col_num = 0
for key, value in my_dict.items():
    worksheet.write(0, col_num, key)
    worksheet.write_column(1, col_num, value)
    col_num += 1

workbook.close()


#%% foreign vs native
#%% young vs middle age
#%% high vs low skill ********* work on this 


datadiff_112m_112n=  datameged.groupby(['year'])['hourly_wage112m'].mean() -  datameged.groupby(['year'])['hourly_wage112n'].mean()
datadiff_112m_111m=  datameged.groupby(['year'])['hourly_wage112m'].mean() -  datameged.groupby(['year'])['hourly_wage111m'].mean()
datadiff_112m_111n=  datameged.groupby(['year'])['hourly_wage112m'].mean() -  datameged.groupby(['year'])['hourly_wage111n'].mean()

    


datadiff_111m_111n = datameged.groupby(['year'])['hourly_wage111m'].mean() -  datameged.groupby(['year'])['hourly_wage111n'].mean()
datadiff_122m_122n = datameged.groupby(['year'])['hourly_wage122m'].mean() -  datameged.groupby(['year'])['hourly_wage122n'].mean()
datadiff_121m_121n = datameged.groupby(['year'])['hourly_wage121m'].mean() -  datameged.groupby(['year'])['hourly_wage121n'].mean()

datadiff_112n_111n = datameged.groupby(['year'])['hourly_wage112n'].mean() -  datameged.groupby(['year'])['hourly_wage111n'].mean()
datadiff_122m_121m = datameged.groupby(['year'])['hourly_wage122m'].mean() -  datameged.groupby(['year'])['hourly_wage121m'].mean()
datadiff_122n_121n = datameged.groupby(['year'])['hourly_wage122n'].mean() -  datameged.groupby(['year'])['hourly_wage121n'].mean()
datadiff_111m_121m = datameged.groupby(['year'])['hourly_wage111m'].mean() -  datameged.groupby(['year'])['hourly_wage121m'].mean()
datadiff_111n_121n = datameged.groupby(['year'])['hourly_wage111n'].mean() -  datameged.groupby(['year'])['hourly_wage121n'].mean()
datadiff_112m_122m = datameged.groupby(['year'])['hourly_wage112m'].mean() -  datameged.groupby(['year'])['hourly_wage122m'].mean()
datadiff_112n_122n = datameged.groupby(['year'])['hourly_wage112n'].mean() -  datameged.groupby(['year'])['hourly_wage122n'].mean()
    
#%%  middle age: average wage by year

middleageaveragewagebyyear=  datameged.groupby(['year'])[['hourly_wage122m','hourly_wage122n','hourly_wage121m','hourly_wage121n']].mean()



#%% report wage differtial
import xlsxwriter

workbook = xlsxwriter.Workbook('write_dictparam111.xlsx')
worksheet = workbook.add_worksheet()

my_dict = my_dict = {'diffomega_{112m_112n}': [datadiff_112m_112n],
                     'diffomega_{111m_111n}': [datadiff_111m_111n],
                     'diffomega_{122m_122n}': [datadiff_122m_122n],
                     'diffomega_{121m_121n}': [datadiff_121m_121n],
                     'diffomega_{112m_111m}': [datadiff_112m_111m],
                     'diffomega_{112n_111n}': [datadiff_112n_111n],
                     'diffomega_{122m_121m}': [datadiff_122m_121m],
                     'diffomega_{122n_121n}': [datadiff_122n_121n],
                     'diffomega_{111m_121m}': [datadiff_111m_121m],
                     'diffomega_{111n_121n}': [datadiff_111n_121n],
                     'diffomega_{112m_122m}': [datadiff_112m_122m],
                     'diffomega_{112n_122n}': [datadiff_112n_122n]}

col_num = 0
for key, value in my_dict.items():
    worksheet.write(0, col_num, key)
    worksheet.write_column(1, col_num, value)
    col_num += 1

workbook.close()


#%% Next 
#%% Covid shock  (by county and industry from bea data  annual  (monthly ) 

#%% z_t = tfp + tfp*dummies (measure for restrictions.....)

# without covid log (z) = log(y) - alpha log (ly) +(1-alpha) log (lm)  + 1/2 alpha (1-alpha)  (log (ly/lm) )^(2)  
# with covid log (zbar) = log(y) - alpha log (ly) +(1-alpha) log (lm)  + 1/2 alpha (1-alpha)  (log (ly/lm) )^(2)  

# dummies short reflect

# log(zbar) = log(z)  + log(z) *  dummies
#%%

# THIS PART OF CODE IS MISSING THE ESTIMATION OF PRODUCTIVTY SHOCKS PARAMETERS.




#%%Z  Referee : Robustness check





datameged_cleancovid1 =  datameged_clean 
#%%
#datameged_cleancovid1 =  datameged_cleancovid1

datameged_cleancovid1 = datameged_cleancovid1[datameged_cleancovid1.year2 != 2020]

datameged_cleancovid = datameged_cleancovid1[datameged_cleancovid1.year2 != 2021]

#%%
# drop covid observations 
#datameged_cleancovid1 = datameged_cleancovid1.drop(datameged_cleancovid1[(datameged_cleancovid1['year2'] == 2020 ) ].index)
#%%
#datameged_cleancovid = datameged_cleancovid1.drop(datameged_cleancovid1[(datameged_cleancovid1['year2'] == 2021 ) ].index)


#%%  (+add a constant that will be used in the estimation)
datameged_cleancovid['const'] = 1

#%% define index (can also be used as time and county FE  in the estimation)
datameged_cleancovid = datameged_cleancovid.set_index(['county2','year'])

#%%  estimate varrho using the linearized euler equations
#%% Euler equation: log( hourly_wage112m)  - log(hourly_wage112n) =   (1/(varrho)-1) * ( log(phi112m *ahrsworkt112m)  - log (phi112n*ahrsworkt112n) )
exog_vars = ['loghoursdifferential112m_112n'] # 
exog = sm.add_constant(datameged_cleancovid[exog_vars])
#%%  
print ("OLS regression model for the varrho  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential112m_112n,exog,entity_effects=True,time_effects=True)
two_res1 = cons.fit()
print(two_res1)
# significant    -1.3710   : w/o County and year FE
# significant    -1.4714   : with county fe
# significant    -1.3839   : with time fe
# significant    -1.4830   : with county and time FE 
#%%
print ("OLS regression model for the varrho  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential112m_112n,exog,entity_effects=False,time_effects=False)
two_res1H2 = cons.fit()
print(two_res1H2)
#%%
print ("OLS regression model for the varrho  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential112m_112n,exog,entity_effects=True,time_effects=False)
two_res1H3 = cons.fit()
print(two_res1H3)
#%%
print ("OLS regression model for the varrho  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential112m_112n,exog,entity_effects=False,time_effects=True)
two_res1H4 = cons.fit()
print(two_res1H4)


#%%
from statsmodels.iolib.summary3 import summary_col

beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res1,two_res1H2,two_res1H3,two_res1H4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elavarrhoR.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()

#%%

from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res1,two_res1H2,two_res1H3,two_res1H4])
stargazer.title("OLS elavarrhoR clean covid")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential112m_112n'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elavarrhoR.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    


#%%  estimate upsilon using the linearized euler equations
#%% Euler equation: log( hourly_wage111m)  - log(hourly_wage111n) =   (1/(upsilon)-1) * ( log(phi111m *ahrsworkt111m)  - log (phi111n*ahrsworkt111n) )
exog_vars = ['loghoursdifferential111m_111n'] # 
exog = sm.add_constant(datameged_cleancovid[exog_vars])
#%%
print ("OLS regression model for the upsilon  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential111m_111n,exog,entity_effects=True,time_effects=True)
two_res2 = cons.fit()
print(two_res2)

# not significant    -0.9081  : w/o County and year FE
# not significant    -0.9033  : with county fe
# not significant    -0.9214   : with time fe
# not significant    -0.9189    : with county and time FE

print ("OLS regression model for the upsilon  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential111m_111n,exog,entity_effects=False,time_effects=False)
two_res2H2 = cons.fit()
print(two_res2H2)
print ("OLS regression model for the upsilon  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential111m_111n,exog,entity_effects=True,time_effects=False)
two_res2H3 = cons.fit()
print(two_res2H3)
print ("OLS regression model for the upsilon  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential111m_111n,exog,entity_effects=False,time_effects=True)
two_res2H4 = cons.fit()
print(two_res2H4)


#%%
from statsmodels.iolib.summary3 import summary_col

beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res2,two_res2H2,two_res2H3,two_res2H4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elaupsilonR.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()



#%%

from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res2,two_res2H2,two_res2H3,two_res2H4])
stargazer.title("OLS elaupsilonR clean covid")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential111m_111n'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elaupsilonR.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    
    
#%%  estimate varepsilon using the linearized euler equations
#%% Euler equation: log( hourly_wage122m)  - log(hourly_wage122n) =   (1/(varepsilon)-1) * ( log(theta122m *ahrsworkt122m)  - log (theta122n*ahrsworkt122n) )
exog_vars = ['loghoursdifferential122m_122n'] # 
exog = sm.add_constant(datameged_cleancovid[exog_vars])
#%%
print ("OLS regression model for the varepsilon  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential122m_122n,exog,entity_effects=True,time_effects=True)
two_res3 = cons.fit()
print(two_res3)
# not significant   0.3037   : w/o county and time FE
# not significant   0.3506   : with county  FE
# not significant   0.1486   : with time FE
# not significant   0.1893   : with county and time FE


print ("OLS regression model for the varepsilon  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential122m_122n,exog,entity_effects=False,time_effects=False)
two_res3H2 = cons.fit()
print(two_res3H2)
print ("OLS regression model for the varepsilon  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential122m_122n,exog,entity_effects=True,time_effects=False)
two_res3H3 = cons.fit()
print(two_res3H3)
print ("OLS regression model for the varepsilon  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential122m_122n,exog,entity_effects=False,time_effects=True)
two_res3H4 = cons.fit()
print(two_res3H4)


#%%
from statsmodels.iolib.summary3 import summary_col

beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res3,two_res3H2,two_res3H3,two_res3H4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elavarepsilonR.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()


#%%

from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res3,two_res3H2,two_res3H3,two_res3H4])
stargazer.title("OLS elavarepsilonR  clean covid")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential122m_122n'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elavarepsilonR.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    
    
    
#%%  estimate zeta using the linearized euler equations
#%% Euler equation: log( hourly_wage121m)  - log(hourly_wage121n) =   (1/(zeta)-1) * ( log(theta121m *ahrsworkt121m)  - log (theta121n*ahrsworkt121n) )
exog_vars = ['loghoursdifferential121m_121n'] # 
exog = sm.add_constant(datameged_cleancovid[exog_vars])
#%%
print ("OLS regression model for the zeta  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential121m_121n,exog,entity_effects=True,time_effects=True)
two_res4 = cons.fit()
print(two_res4)

# significant       1.6535   : w/o county and time FE
# not significant   1.4559   : with county  FE
# not significant   1.5915   : with time FE
# not significant   1.3646   : with county and time FE

print ("OLS regression model for the zeta  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential121m_121n,exog,entity_effects=False,time_effects=False)
two_res4H2 = cons.fit()
print(two_res4H2)
print ("OLS regression model for the zeta  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential121m_121n,exog,entity_effects=True,time_effects=False)
two_res4H3 = cons.fit()
print(two_res4H3)
print ("OLS regression model for the zeta  ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential121m_121n,exog,entity_effects=False,time_effects=True)
two_res4H4 = cons.fit()
print(two_res4H4)

beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res4,two_res4H2,two_res4H3,two_res4H4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elazetaR.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()


#%%

from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res4,two_res4H2,two_res4H3,two_res4H4])
stargazer.title("OLS elazetaR  clean covid")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential121m_121n'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elazetaR.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    
    

#%%
#datameged_cleancovidneNEW = datameged_cleancovid
# datameged_cleanneNEW

#datameged_cleancovid

#%% Euler equation: logwagedifferential_young_midlle_age  =   (-1/s) * (loghoursdifferential_young_midlle_age)  
exog_vars = ['loghoursdifferential_young_midlle_age'] # 
exog = sm.add_constant(datameged_cleancovid[exog_vars])
#%%  
print ("OLS regression model for the s ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_young_midlle_age,exog,entity_effects=True,time_effects=True)
two_res1_s = cons.fit()
print(two_res1_s)

# significant   = 0.7360   with time and county fixed effects
# significant   =  0.7389 with time fe
# significant   =   0.7065   with  county fixed effects
# significant   =  0.7088 without time and county fe

print ("OLS regression model for the s ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_young_midlle_age,exog,entity_effects=False,time_effects=False)
two_res1_sH2 = cons.fit()
print(two_res1_sH2)
print ("OLS regression model for the s ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_young_midlle_age,exog,entity_effects=True,time_effects=False)
two_res1_sH3 = cons.fit()
print(two_res1_sH3)
print ("OLS regression model for the s ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_young_midlle_age,exog,entity_effects=False,time_effects=True)
two_res1_sH4 = cons.fit()
print(two_res1_sH4)

#%%

beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res1_s,two_res1_sH2,two_res1_sH3,two_res1_sH4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elassssR.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()


#%%

from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res1_s,two_res1_sH2,two_res1_sH3,two_res1_sH4])
stargazer.title("OLS elassssR  clean covid")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential_young_midlle_age'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elassssR.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    
    
#%%  estimate using the linearized euler equations
#%% Euler equation: logwagedifferential_young_low_vs_high  =   (1/(sigma)-1) * (loghoursdifferential_ young_low_vs_high)  
exog_vars = ['loghoursdifferential_ young_low_vs_high'] # 
exog = sm.add_constant(datameged_cleancovid[exog_vars])
#%%  
print ("OLS regression model for the sigma ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_young_low_vs_high,exog,entity_effects=True,time_effects=True)
two_res1_sigma = cons.fit()
print(two_res1_sigma)
# not significant   = 0.0145  with time and county fixed effects
# not significant   =  0.0145  with time fe
# not significant   =  0.0161 with  county fixed effects
# not significant   =  0.0160  without time and county fe
print ("OLS regression model for the sigma ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_young_low_vs_high,exog,entity_effects=False,time_effects=False)
two_res1_sigmaH2 = cons.fit()
print(two_res1_sigmaH2)
print ("OLS regression model for the sigma ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_young_low_vs_high,exog,entity_effects=True,time_effects=False)
two_res1_sigmaH3 = cons.fit()
print(two_res1_sigmaH3)
print ("OLS regression model for the sigma ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_young_low_vs_high,exog,entity_effects=False,time_effects=True)
two_res1_sigmaH4 = cons.fit()
print(two_res1_sigmaH4)



beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res1_sigma,two_res1_sigmaH2,two_res1_sigmaH3,two_res1_sigmaH4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elasigmaR.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()

#%%

from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res1_sigma,two_res1_sigmaH2,two_res1_sigmaH3,two_res1_sigmaH4])
stargazer.title("OLS elasigmaR clean covid")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential_ young_low_vs_high'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elasigmaR.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    
    

#%%  estimate  using the linearized euler equations
#%% Euler equation: logwagedifferential_middle_low_vs_high  =   (1/(xi)-1) * (loghoursdifferential_middle_low_vs_high)  
exog_vars = ['loghoursdifferential_middle_low_vs_high'] # 
exog = sm.add_constant(datameged_cleancovid[exog_vars])
#%%  
print ("OLS regression model for the xi ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_middle_low_vs_high,exog,entity_effects=True,time_effects=True)
two_res1_xi = cons.fit()
print(two_res1_xi)


# significant   = 0.7036    with time and county fixed effects
# significant   = 0.7024  with time fe
# significant   = 0.6483  with  county fixed effects
# significant   =  0.6472  without time and county fe

print ("OLS regression model for the xi ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_middle_low_vs_high,exog,entity_effects=False,time_effects=False)
two_res1_xiH2 = cons.fit()
print(two_res1_xiH2)
print ("OLS regression model for the xi ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_middle_low_vs_high,exog,entity_effects=True,time_effects=False)
two_res1_xiH3 = cons.fit()
print(two_res1_xiH3)
print ("OLS regression model for the xi ")
cons = PanelOLS(datameged_cleancovid.logwagedifferential_middle_low_vs_high,exog,entity_effects=False,time_effects=True)
two_res1_xiH4 = cons.fit()
print(two_res1_xiH4)

beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"

resultelasti11 = summary_col([two_res1_xi,two_res1_xiH2,two_res1_xiH3,two_res1_xiH4],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elaxxxxiR.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()



#%%

from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res1_xi,two_res1_xiH2,two_res1_xiH3,two_res1_xiH4])
stargazer.title("OLS elaxxxxiR clean covid")
stargazer.custom_columns(["County and Year Effects", "No Effects", "County Effects Only", "Year Effects Only"], [1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const', 'loghoursdifferential_middle_low_vs_high'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elaxxxxiR.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    

#%% report the results of the estimation to latex file 
from statsmodels.iolib.summary3 import summary_col




beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}"""
endtex = "\end{document}"



resultelasti11 = summary_col([two_res1,two_res2,two_res3,two_res4,two_res1_s,two_res1_sigma,two_res1_xi],stars=True,float_format='%0.5f',show='se') 


dfoutput = open("elasticities22R.tex",'w')
dfoutput.write(beginningtex)
dfoutput.write(resultelasti11.as_latex())
dfoutput.write(endtex)
dfoutput.close()





#%%

from stargazer.stargazer import Stargazer


# Using stargazer to format the regression results in LaTeX
stargazer = Stargazer([two_res1,two_res2,two_res3,two_res4,two_res1_s,two_res1_sigma,two_res1_xi])
stargazer.title("OLS elasticities22R clean covid")
stargazer.custom_columns(["County and Year Effects", "County and Year Effects", "County and Year Effects",  "County and Year Effects", "County and Year Effects", "County and Year Effects", "County and Year Effects"], [1, 1, 1, 1, 1, 1, 1])
stargazer.significance_levels([0.1, 0.05, 0.01])
stargazer.show_degrees_of_freedom(False)
stargazer.covariate_order(['const','loghoursdifferential112m_112n', 'loghoursdifferential111m_111n', 'loghoursdifferential122m_122n', 'loghoursdifferential121m_121n',
 'loghoursdifferential_young_midlle_age','loghoursdifferential_ young_low_vs_high','loghoursdifferential_middle_low_vs_high'])

# Prepare the LaTeX document structure
beginningtex = """\\documentclass{report}
\\usepackage{booktabs}
\\begin{document}
"""
endtex = "\\end{document}"

# Write to LaTeX file
with open("elasticities22R.tex", 'w') as dfoutput:
    dfoutput.write(beginningtex)
    dfoutput.write(stargazer.render_latex())
    dfoutput.write(endtex)
    




#%% Robustness check  DATA SPID 

#%% sipp_collapsed_nat


datalaborsipp = pd.read_csv('sipp_collapsed.csv', sep=',',error_bad_lines=False)


#%% drop value = 0 to obtain for native   because imiigrant= 1 native = 0



imglabor = datalaborsipp.drop(datalaborsipp[(datalaborsipp.immigrant == 0)].index)

#%%
imglabory = imglabor.drop(imglabor[(imglabor.age_cat == 2)].index)
imglabory = imglabory.drop(imglabory[(imglabory.age_cat == 3)].index)

imglaboryH = imglabory.drop(imglabory[(imglabory.skill_lev == 2)].index)
imglaboryL = imglabory.drop(imglabory[(imglabory.skill_lev == 1)].index)

#%%
imglaborm = imglabor.drop(imglabor[(imglabor.age_cat == 1)].index)
imglaborm = imglaborm.drop(imglaborm[(imglaborm.age_cat == 3)].index)

imglabormH = imglaborm.drop(imglaborm[(imglaborm.skill_lev == 2)].index)
imglabormL = imglaborm.drop(imglaborm[(imglaborm.skill_lev == 1)].index)

#%%
natvlabor = datalaborsipp.drop(datalaborsipp[(datalaborsipp.immigrant == 1)].index)

#%%

natvlabory = natvlabor.drop(natvlabor[(natvlabor.age_cat == 2)].index)
natvlabory = natvlabory.drop(natvlabory[(natvlabory.age_cat == 3)].index)


natvlaboryH = natvlabory.drop(natvlabory[(natvlabory.skill_lev == 2)].index)
natvlaboryL = natvlabory.drop(natvlabory[(natvlabory.skill_lev == 1)].index)

#%%
natvlaborm = natvlabor.drop(natvlabor[(natvlabor.age_cat == 1)].index)
natvlaborm = natvlaborm.drop(natvlabor[(natvlabor.age_cat == 3)].index)

natvlabormH = natvlaborm.drop(natvlaborm[(natvlaborm.skill_lev == 2)].index)
natvlabormL = natvlaborm.drop(natvlaborm[(natvlaborm.skill_lev == 1)].index)

#%%


import numpy
from matplotlib import pyplot




x12=natvlabormH.hourly_wage
y12=imglabormH.hourly_wage

x11=natvlabormL.hourly_wage
y11=imglabormL.hourly_wage

x22=natvlaboryH.hourly_wage
y22=imglaboryH.hourly_wage

x21=natvlaboryL.hourly_wage
y21=imglaboryL.hourly_wage

pyplot.hist(x12, bins='auto', alpha=0.7, color = '#0F95D7', label='Native', rwidth=0.85, density = True)
pyplot.hist(y12, bins='auto', alpha=0.7, color = '#0F5C8C', label='Foreign' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')
pyplot.xlim(1,30)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)
 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 

plt.savefig('sippexample.pdf', bbox_inches='tight')


#%%

pyplot.hist(x11, bins='auto', alpha=0.7, color = '#0F95D7', label='Native', rwidth=0.85, density = True)
pyplot.hist(y11, bins='auto', alpha=0.7, color = '#0F5C8C', label='Foreign' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')
pyplot.xlim(1,30)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
#pyplot.show()
plt.savefig('sippexample2.pdf', bbox_inches='tight')

#%%


pyplot.hist(x22, bins='auto', alpha=0.7, color = '#0F95D7', label='Native', rwidth=0.85, density = True)
pyplot.hist(y22, bins='auto', alpha=0.7, color = '#0F5C8C', label='Foreign' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')
pyplot.xlim(1,30)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
#pyplot.show()
plt.savefig('sippexample3.pdf', bbox_inches='tight')


#%%

pyplot.hist(x21, bins='auto', alpha=0.7, color = '#0F95D7', label='Native', rwidth=0.85, density = True)
pyplot.hist(y21, bins='auto', alpha=0.7, color = '#0F5C8C', label='Foreign' , rwidth=0.85, density = True)
pyplot.legend(loc='upper right')
pyplot.xlim(1,30)
pyplot.tight_layout()
pyplot.ylabel("Probability Density",fontsize=14)

 
pyplot.xticks(fontsize=14)
pyplot.yticks(fontsize=14)

plt.legend()
plt.legend(fontsize=12) 
#pyplot.show()
plt.savefig('sippexample4.pdf', bbox_inches='tight')



#%% sipp_collapsed_nat


datalaborsipp = pd.read_csv('sipp_collapsed_nat.csv', sep=',',error_bad_lines=False)


#%% drop value = 0 to obtain for native   because imiigrant= 1 native = 0
imglabor = datalaborsipp.drop(datalaborsipp[(datalaborsipp.immigrant == 0)].index)
#%%
imglabory = imglabor.drop(imglabor[(imglabor.age_cat == 2)].index)
imglabory = imglabory.drop(imglabory[(imglabory.age_cat == 3)].index)

imglaboryH = imglabory.drop(imglabory[(imglabory.skill_lev == 2)].index)
imglaboryL = imglabory.drop(imglabory[(imglabory.skill_lev == 1)].index)

#%%
imglaborm = imglabor.drop(imglabor[(imglabor.age_cat == 1)].index)
imglaborm = imglaborm.drop(imglaborm[(imglaborm.age_cat == 3)].index)

imglabormH = imglaborm.drop(imglaborm[(imglaborm.skill_lev == 2)].index)
imglabormL = imglaborm.drop(imglaborm[(imglaborm.skill_lev == 1)].index)




#%%
natvlabor = datalaborsipp.drop(datalaborsipp[(datalaborsipp.immigrant == 1)].index)
#%%
natvlabory = natvlabor.drop(natvlabor[(natvlabor.age_cat == 2)].index)
natvlabory = natvlabory.drop(natvlabory[(natvlabory.age_cat == 3)].index)

natvlaboryH = natvlabory.drop(natvlabory[(natvlabory.skill_lev == 2)].index)
natvlaboryL = natvlabory.drop(natvlabory[(natvlabory.skill_lev == 1)].index)

#%%
natvlaborm = natvlabor.drop(natvlabor[(natvlabor.age_cat == 1)].index)
natvlaborm = natvlaborm.drop(natvlabor[(natvlabor.age_cat == 3)].index)

natvlabormH = natvlaborm.drop(natvlaborm[(natvlaborm.skill_lev == 2)].index)
natvlabormL = natvlaborm.drop(natvlaborm[(natvlaborm.skill_lev == 1)].index)

#%%





#%% monthcode,tehc_st,tjb1_ind,year,skill_lev,age_cat,immigrant,
#%% tjb1_mwkhrs,tjb1_wkhrs1,tjb1_wkhrs2,tjb1_wkhrs3,tjb1_wkhrs4,tjb1_wkhrs5,tjb1_msumalt,
#%% rmesr,hourly_wage






#%% rename variables before merging the data   imglabory

natvlaboryH = natvlaboryH.rename(columns={"hourly_wage": "hourly_wageNYH"})
natvlaboryH = natvlaboryH.rename(columns={"tjb1_mwkhrs": "tjb1_mwkhrsNYH"})



#%% drop variables:: not necessary anymore   
natvlaboryH  = natvlaboryH.drop(columns=['immigrant', 'age_cat','skill_lev','tjb1_wkhrs1','tjb1_wkhrs2','tjb1_wkhrs3','tjb1_wkhrs4','tjb1_wkhrs5','tjb1_msumalt','rmesr'])

#%%   rename variables before merging the data


natvlaboryL = natvlaboryL.rename(columns={"hourly_wage": "hourly_wageNYL"})
natvlaboryL = natvlaboryL.rename(columns={"tjb1_mwkhrs": "tjb1_mwkhrsNYL"})


#%%  drop variables:: not necessary anymore
natvlaboryL  = natvlaboryL.drop(columns=['immigrant', 'age_cat','skill_lev','tjb1_wkhrs1','tjb1_wkhrs2','tjb1_wkhrs3','tjb1_wkhrs4','tjb1_wkhrs5','tjb1_msumalt','rmesr'])


#%% rename variables before merging the data


natvlabormH = natvlabormH.rename(columns={"hourly_wage": "hourly_wageNMH"})
natvlabormH = natvlabormH.rename(columns={"tjb1_mwkhrs": "tjb1_mwkhrsNMH"})



#%%   drop variables:: not necessary anymore
natvlabormH  = natvlabormH.drop(columns=['immigrant', 'age_cat','skill_lev','tjb1_wkhrs1','tjb1_wkhrs2','tjb1_wkhrs3','tjb1_wkhrs4','tjb1_wkhrs5','tjb1_msumalt','rmesr'])


#%% rename variables before merging the data


natvlabormL = natvlabormL.rename(columns={"hourly_wage": "hourly_wageNML"})
natvlabormL = natvlabormL.rename(columns={"tjb1_mwkhrs": "tjb1_mwkhrsNML"})

#%%  drop variables:: not necessary anymore
natvlabormL  = natvlabormL.drop(columns=['immigrant', 'age_cat','skill_lev','tjb1_wkhrs1','tjb1_wkhrs2','tjb1_wkhrs3','tjb1_wkhrs4','tjb1_wkhrs5','tjb1_msumalt','rmesr'])



#%% rename variables before merging the data


imglaboryH = imglaboryH.rename(columns={"hourly_wage": "hourly_wageIYH"})
imglaboryH = imglaboryH.rename(columns={"tjb1_mwkhrs": "tjb1_mwkhrsIYH"})



#%%  drop variables:: not necessary anymore 
imglaboryH  = imglaboryH.drop(columns=['immigrant', 'age_cat','skill_lev','tjb1_wkhrs1','tjb1_wkhrs2','tjb1_wkhrs3','tjb1_wkhrs4','tjb1_wkhrs5','tjb1_msumalt','rmesr'])

#%% rename variables before merging the data



imglaboryL = imglaboryL.rename(columns={"hourly_wage": "hourly_wageIYL"})
imglaboryL = imglaboryL.rename(columns={"tjb1_mwkhrs": "tjb1_mwkhrsIYL"})


#%%  drop variables:: not necessary anymore 
imglaboryL  = imglaboryL.drop(columns=['immigrant', 'age_cat','skill_lev','tjb1_wkhrs1','tjb1_wkhrs2','tjb1_wkhrs3','tjb1_wkhrs4','tjb1_wkhrs5','tjb1_msumalt','rmesr'])

#%% rename variables before merging the data



imglabormH = imglabormH.rename(columns={"hourly_wage": "hourly_wageIMH"})
imglabormH = imglabormH.rename(columns={"tjb1_mwkhrs": "tjb1_mwkhrsIMH"})




#%%  drop variables:: not necessary anymore
imglabormH  = imglabormH.drop(columns=['immigrant', 'age_cat','skill_lev','tjb1_wkhrs1','tjb1_wkhrs2','tjb1_wkhrs3','tjb1_wkhrs4','tjb1_wkhrs5','tjb1_msumalt','rmesr'])

#%% rename variables before merging the data



imglabormL = imglabormL.rename(columns={"hourly_wage": "hourly_wageIML"})
imglabormL = imglabormL.rename(columns={"tjb1_mwkhrs": "tjb1_mwkhrsIML"})


#%%  drop variables:: not necessary anymore

imglabormL  = imglabormL.drop(columns=['immigrant', 'age_cat','skill_lev','tjb1_wkhrs1','tjb1_wkhrs2','tjb1_wkhrs3','tjb1_wkhrs4','tjb1_wkhrs5','tjb1_msumalt','rmesr'])




#%%   reset_index(drop=True)

natvlaboryH.reset_index(drop=True)
natvlaboryL.reset_index(drop=True)

natvlabormH.reset_index(drop=True)
natvlabormL.reset_index(drop=True)

imglaboryH.reset_index(drop=True)
imglaboryL.reset_index(drop=True)

imglabormH.reset_index(drop=True)
imglabormL.reset_index(drop=True)

#%%  

#%% monthcode,tehc_st,tjb1_ind,year,skill_lev,age_cat,immigrant,
#%% tjb1_mwkhrs,tjb1_wkhrs1,tjb1_wkhrs2,tjb1_wkhrs3,tjb1_wkhrs4,tjb1_wkhrs5,tjb1_msumalt,
#%% rmesr,hourly_wage
#datameged = pd.merge(natvlaboryH, natvlaboryH, on=['monthcode','tjb1_ind','year'], how='right')

#%% 
datameged = pd.merge(natvlaboryH, natvlaboryL, on=['monthcode','tjb1_ind','year'], how='right')
#%% 
datameged = pd.merge(datameged, natvlabormH, on=['monthcode','tjb1_ind','year'], how='right')
#%% 
datameged = pd.merge(datameged, natvlabormL, on=['monthcode','tjb1_ind','year'], how='right')
#%% 
datameged = pd.merge(datameged, imglaboryH, on=['monthcode','tjb1_ind','year'], how='right')
#%% 
datameged = pd.merge(datameged, imglaboryL, on=['monthcode','tjb1_ind','year'], how='right')
#%% 
datameged = pd.merge(datameged, imglabormH, on=['monthcode','tjb1_ind','year'], how='right')
#%% 
datameged = pd.merge(datameged, imglabormL, on=['monthcode','tjb1_ind','year'], how='right')


# topf=natvlaboryH.merge(convertcountytostate8consumption, left_on=['monthcode','tjb1_ind','year']
#                                , right_on=['monthcode','tjb1_ind','year'])


#%%
datameged.isnull().sum()


#%%
datameged_clean = datameged


#%%  
datameged_clean['const'] = 1
#%% compute wage and labor dfferentials in log  

#%% 
datameged_clean['logwagedifferentialWAGE_IML_NML'] = np.log(datameged_clean['tjb1_mwkhrsIML'])  -  np.log(datameged_clean['tjb1_mwkhrsNML'])
datameged_clean['loghoursdifferentialHOURS_IML_NML'] =   np.log(datameged_clean['hourly_wageIML'])  - np.log(datameged_clean['hourly_wageNML']) 

datameged_clean['logwagedifferentialWAGE_IYL_NYL'] = np.log(datameged_clean['tjb1_mwkhrsIYL'])  -  np.log(datameged_clean['tjb1_mwkhrsNYL'])
datameged_clean['loghoursdifferentialHOURS_IYL_NYL'] =   np.log(datameged_clean['hourly_wageIYL'])  - np.log(datameged_clean['hourly_wageNYL']) 
                             





datameged_clean['logwagedifferentialWAGE_IMH_NMH'] = np.log(datameged_clean['tjb1_mwkhrsIMH'])  -  np.log(datameged_clean['tjb1_mwkhrsNMH'])
datameged_clean['loghoursdifferentialHOURS_IMH_NMH'] =   np.log(datameged_clean['hourly_wageIMH'])  - np.log(datameged_clean['hourly_wageNMH']) 
                             




datameged_clean['logwagedifferentialWAGE_IYH_NYH'] = np.log(datameged_clean['tjb1_mwkhrsIYH'])  -  np.log(datameged_clean['tjb1_mwkhrsNYH'])
datameged_clean['loghoursdifferentialHOURS_IYH_NYH'] =   np.log(datameged_clean['hourly_wageIYH'])  - np.log(datameged_clean['hourly_wageNYH']) 
                             


                             




                             
#%% drop nan in the selected variables (subset)      
datameged_clean = datameged_clean.dropna(subset=['logwagedifferentialWAGE_IML_NML','loghoursdifferentialHOURS_IML_NML','logwagedifferentialWAGES_IYL_NYL','loghoursdifferentialHOURS_IYL_NYL','logwagedifferentialWAGE_IMH_NMH','loghoursdifferentialHOURS_IMH_NMH','logwagedifferentialWAGE_IYH_NYH','loghoursdifferentialHOURS_IYH_NYH'])

#%% replace inf by nan and then drop nan
datameged_clean = datameged_clean.replace([np.inf, -np.inf], np.nan).dropna()
#%% define index (can also be used as time and county FE  in the estimation)
datameged_clean = datameged_clean.set_index(['tjb1_ind','year'])


#%% Euler equation: 

# Immig vs native high young  varrho
exog_vars = ['loghoursdifferentialHOURS_IYH_NYH'] # 
exog = sm.add_constant(datameged_clean[exog_vars])
#%%  
print ("OLS regression model for the varrho  ")
cons = PanelOLS(datameged_clean.logwagedifferentialWAGE_IYH_NYH,exog,entity_effects=True,time_effects=True)
two_resyh = cons.fit()
print(two_resyh)

#%%  
# Immig vs native low young upsilon
exog_vars = ['loghoursdifferentialHOURS_IYL_NYL'] # 
exog = sm.add_constant(datameged_clean[exog_vars])
#%%  
print ("OLS regression model for the upsilon ")
cons = PanelOLS(datameged_clean.logwagedifferentialWAGE_IYL_NYL,exog,entity_effects=True,time_effects=True)
two_resyl = cons.fit()
print(two_resyl)


#%%  
# Immig vs native high midlle epsilon
exog_vars = ['loghoursdifferentialHOURS_IMH_NMH'] # 
exog = sm.add_constant(datameged_clean[exog_vars])
#%%  
print ("OLS regression model for the epsilon ")
cons = PanelOLS(datameged_clean.logwagedifferentialWAGE_IMH_NMH,exog,entity_effects=True,time_effects=True)
two_resmh = cons.fit()
print(two_resmh)



#%%  
# Immig vs native low midlle zeta
exog_vars = ['loghoursdifferentialHOURS_IML_NML'] # 
exog = sm.add_constant(datameged_clean[exog_vars])
#%%  
print ("OLS regression model for the zeta ")
cons = PanelOLS(datameged_clean.logwagedifferentialWAGE_IML_NML,exog,entity_effects=True,time_effects=True)
two_resml = cons.fit()
print(two_resml)





#%%  check if the results are robust to the transformation log1p 


