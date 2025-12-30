* Encoding: UTF-8.
******************************************Quota.
CROSSTABS
  /TABLES=qcountry BY hids1group2
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

If(hids4de=1)Quota1=1.
If(s4a0=2)Quota2=1.
Val lab Quota1
1 "Quota1".
exe.
Val lab Quota2
1 "NO LUGPA".
exe.
Freq Quota1 Quota2.
Del var Quota1 Quota2.
exe.

***************************************DV Script.
COUNT QTEST_CASE = user_id screenstatus scrstatus specialty_98_other a4x1_1 a4x1_2 a4x1_3 a4x1_4 a4x1_5 a4x2_1 a4x2_2 a4x2_3 a4x2_4 a4x2_5 ('test','TEST', 'Test','TEst', 'TESt','tEST' '?','.').
exe.
FREQ QTEST_CASE.
Del var QTEST_CASE.
exe.

**************** Procedure to check Multi Punch Questions ****************************.
Define !MULTI_A (svar !TOKENS (1) /evar !TOKENS (1) /qnt !TOKENS (1) /ctr !TOKENS (1))

count var_cnt = !svar to !evar(1).

tit !qnt - Nothing Selected.
sel if var_cnt = 0.
list respid, !svar to !evar.

tit !qnt - Invalid Punches.
temporary.
count var1_cnt = !svar to !evar(0 1).
sel if var1_cnt <>  !ctr.
list respid, !svar to !evar.
temporary.
count var1_cnt = !svar to !evar(1).
sel if var1_cnt =  !ctr.
tit !qnt - Error Flag-ALL Respondents have punch 1 ONLY.
list respid, !svar to !evar.
!EndDefine.

**************** Procedure to check Multi Punch Questions ****************************.
Define !MULTI_B (svar !TOKENS (1) /evar !TOKENS (1) /qnt !TOKENS (1) /ctr !TOKENS (1))

count var_cnt = !svar to !evar(1).

tit !qnt - Nothing Selected.
sel if var_cnt = 0.
list respid, !svar to !evar.

tit !qnt - Invalid Punches.
count var1_cnt = !svar to !evar(0 1).
temporary.
sel if var1_cnt <>  !ctr.
list respid, !svar to !evar.

tit !qnt - None/DK selected with valid codes.
count var_cnt = !svar to !evar(1).
temporary.
sel if var_cnt > 1 and !evar=1.
list respid, !svar to !evar.
temporary.
count var1_cnt = !svar to !evar(1).
sel if var1_cnt =  !ctr.
tit !qnt - Error Flag-ALL Respondents have punch 1 ONLY.
list respid, !svar to !evar.
!EndDefine.


*** To be use in case of check Sum must equal to 100 OR Sum atleast to 100% OR atleast SUM to response from other data variable**.
                                                                                                                                  
Define !Sum_to_var (svar !TOKENS (1) /evar !TOKENS (1) /qnt !TOKENS (1) /ctr !TOKENS (1) /opr !TOKENS (1))                        
                                                                                                                                  
compute SumX=sum(!svar to !evar).                                                                                                 
exe.                                                                                                                              
                                                                                                                                  
tit !qnt - SUM NOT MATCHING TO !ctr.                                                                                              
temporary.                                                                                                                        
sel if SumX !opr !ctr.                                                                                                            
list respid, !svar to !evar.                                                                                                      
del var SumX.                                                                                                                     
!EndDefine.                                                                                                                       
                                                                                                                                  
** input defined are as follows.                                                                                                  
* svar= Starting variable .                                                                                                       
* evar= Ending variable   .                                                                                                       
* qnt= Question id        .                                                                                                       
* ctr= It can be any VARIABLE NAME or 100 (any other numeric value) (based on what type of logic is getting check).               
* opr= pass operator (=, ~=, <> , <, >, =>, <= ) which is based on what logic wants to check.                                     
                                                                                                                                  
                                                                                                                                  
!Sum_to_var svar=A evar=D qnt=Q100 ctr=val opr= <>.                                                                               


************ ONLY selected number of response allowed for MULTI RESPONSE Qs (ex. like only 3, atleast 3 selection allowed) * . 

                                                                                                                               
Define !multi_numb (svar !TOKENS (1) /evar !TOKENS (1) /qnt !TOKENS (1) /ctr !TOKENS (1) /opr !TOKENS (1))                     
                                                                                                                               
COUNT numb=!svar to !evar (1).                                                                                                 
exe.                                                                                                                           
                                                                                                                               
tit !qnt - SLECTION NOT MATCHIN TO !ctr.                                                                                       
temporary.                                                                                                                     
sel if numb !opr !ctr.                                                                                                         
list respid, !svar to !evar.                                                                                                   
del var numb.                                                                                                                  
!EndDefine.                                                                                                                    
                                                                                                                               
** input defined are as follows.                                                                                               
* svar= Starting variable .                                                                                                    
* evar= Ending variable   .                                                                                                    
* qnt= Question id        .                                                                                                    
* ctr= It can be any VARIABLE NAME or 100 (any other numeric value) (based on what type of logic is getting check).            
* opr= pass operator (=, ~=, <> , <, >, =>, <= ) which is based on what logic wants to check.                                  
                                                                                                                               
!multi_numb svar=e evar=g qnt=efg ctr=2 opr= <.                                                                                
******************************************************************************************************************************.


************ RANK CHECK * .                                                                                   

Define !Rank_ALL_CHK (svar !TOKENS (1) /evar !TOKENS (1) /qnt !TOKENS (1) /rank !TOKENS (1) /opr !TOKENS (1)) 
                                                                                                              
                                                                                                              
COMPUTE scoreval =nvalid(!svar to !evar).                                                                     
exe.                                                                                                          
                                                                                                              
tit !qnt - RANK NOT MATCHING TO !rank.                                                                        
temporary.                                                                                                    
sel if scoreval !opr !rank.                                                                                   
list respid, !svar to !evar.                                                                                  
                                                                                                              
COMPUTE minrank =min(!svar to !evar).                                                                         
exe.                                                                                                          
                                                                                                              
COMPUTE maxrank =max(!svar to !evar).                                                                         
exe.                                                                                                          
                                                                                                              
tit !qnt - INVALID RANKS .                                                                                    
temporary.                                                                                                    
sel if (minrank !opr 1 OR maxrank !opr scoreval).                                                             
list respid, !svar to !evar.                                                                                  
                                                                                                              
                                                                                                              
EXECUTE.                                                                                                      
*Compute scoreval to determine the number of valid values in each row for comparison.                         
COMPUTE k = 0.                                                                                                
EXECUTE.                                                                                                      
*create the output value of k all values =0.                                                                  
VECTOR X = !svar to !evar.                                                                                    
LOOP #i = 1 to scoreval.                                                                                      
+ LOOP #j = (#i+1) to scoreval.                                                                               
+ IF X(#i) = X(#j) k=1.                                                                                       
END LOOP.                                                                                                     
END LOOP.                                                                                                     
EXECUTE .                                                                                                     
                                                                                                              
tit !qnt - RANK DUPLICATE.                                                                                    
temporary.                                                                                                    
sel if k=1.                                                                                                   
list respid, !svar to !evar.                                                                                  
del var scoreval k minrank maxrank.                                                                           
                                                                                                              
!EndDefine.                                                                                                   
                                                                                                              
** input defined are as follows.                                                                              
* svar= Starting variable .                                                                                   
* evar= Ending variable   .                                                                                   
* qnt= Question id        .                                                                                   
* rank= It can be any numeric Rank.                                                                           
* opr= pass operator (=, ~=, <> , <, >, =>, <= ) which is based on what logic wants to check.                 
                                                                                                              
!Rank_ALL_CHK svar=A evar=G qnt=ABCD rank=7  opr= ~=.                                                         

***************************************RESPID.
tit respid.
temporary.
sel if miss(respid) or respid < 0.
list respid.

***************************************USER_ID.
tit user_id.
temporary.
sel if user_id =''.
list respid,user_id.

***************************************INTERVIEW_START.
tit interview_start.
temporary.
sel if miss(interview_start).
list respid,interview_start.

***************************************INTERVIEW_END.
tit interview_end.
temporary.
sel if miss(interview_end).
list respid,interview_end.

***************************************SCREENSTATUS.
tit screenStatus.
temporary.
sel if miss(screenStatus) or SCREENSTATUS<>'COMPLETE'.
list respid, screenStatus.

***************************************SCRSTATUS.
tit scrStatus.
temporary.
sel if scrStatus='' or scrStatus<>'COMPLETE'.
list respid.

***************************************HIDCHANGE.
tit hidChange.
temporary.
sel if miss(hidChange) or ~range(hidChange,0,10).
list respid, hidChange.

***************************************QCOUNTRY.
tit qCountry.
temporary.
sel if miss(qCountry) or ~any(qCountry,7,10,12,16,1033,2057,3081).
list respid, qCountry.

***************************************SI1.
tit SI1.
temporary.
sel if miss(SI1) or SI1<>1.
list respid, SI1.

***************************************SI2.
If any(qcountry,7,10,12,16,2057) and (mis(SI2) or SI2<>1)Flag1=1.
If(mis(qcountry) or ~any(qcountry,7,10,12,16,2057)) and ~mis(SI2)Flag2=1.
exe.

temporary.
sel if sum(Flag1 to Flag2)>0.
list respid, SI2.
Del var Flag1 Flag2.
exe.

***************************************SUS1A.
If (qcountry=1033) and (mis(SUS1a) or ~range(SUS1a,1,19,21,21,23,23,25,45,47,51))Flag1=1.
If(mis(qcountry) or qcountry<>1033) and ~mis(SUS1a)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid, SI2.
Del var Flag1 Flag2.
exe.

***************************************S0C.
If mis(S0c) or ~any(S0c,1,2)Flag=1.
temporary.
sel if Flag=1.
list respid, S0C.
Del var Flag.
EXECUTE.

***************************************FR1.
If(qcountry=12) and (mis(FR1) or FR1<>1)Flag1=1.
If(mis(qcountry) or qcountry<>12) and ~mis(FR1)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid, FR1.
Del var Flag1 Flag2.
EXECUTE.

***************************************FR2.
If(qcountry=12) and (mis(FR2) or FR2<>1)Flag1=1.
If(mis(qcountry) or qcountry<>12) and ~mis(FR2)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid, FR2.
Del var Flag1 Flag2.
EXECUTE.

***************************************IT1.
If(qcountry=16) and (mis(IT1) or ~any(IT1,1,2))Flag1=1.
If(mis(qcountry) or qcountry<>16) and ~mis(IT1)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid, IT1.
Del var Flag1 Flag2.
EXECUTE.

***************************************ES1.
If(qcountry=10) and (mis(ES1) or ~any(ES1,1,2))Flag1=1.
If(mis(qcountry) or qcountry<>10) and ~mis(ES1)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid, ES1.
Del var Flag1 Flag2.
EXECUTE.

***************************************UK1.
If any(qcountry,2057,3081) and (mis(UK1) or ~range(UK1,1,2))Flag1=1.
If(mis(qcountry) or ~any(qcountry,2057,3081)) and ~mis(UK1)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid, UK1.
Del var Flag1 Flag2.
EXECUTE.

***************************************US1.
If(qcountry=1033) and (mis(US1) or ~any(US1,1,2))Flag1=1.
If(mis(qcountry) or qcountry<>1033) and ~mis(US1)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid, US1.
Del var Flag1 Flag2.
EXECUTE.

***************************************US2.
If(qcountry=1033) and (mis(US2) or US2<>2)Flag1=1.
If(mis(qcountry) or qcountry<>1033) and ~mis(US2)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid, US2.
Del var Flag1 Flag2.
EXECUTE.

***************************************S0B.
tit S0b.
temporary.
sel if miss(S0b) or S0b<>2.
list respid, S0b.

***************************************SPECIALTY.
If(qcountry=1033 and qlist=1) and (mis(specialty) or ~range(specialty,1,3,5,9,98,98) or specialty_98_other<>'')Flag1=1.
If(qcountry=1033 and qlist=1) and (specialty=98 and specialty_98_other='')Flag2=1.
If(qcountry=1033 and qlist=1) and ((mis(specialty) or specialty<>98) and specialty_98_other<>'')Flag3=1. 
If(qcountry=1033 and qlist=2) and (mis(specialty) or ~range(specialty,1,3,5,6,8,9) or specialty_98_other<>'')Flag4=1.
If(qcountry=7) and (mis(specialty) or ~range(specialty,1,3,5,6) or specialty_98_other<>'')Flag5=1.
If(qcountry=12) and (mis(specialty) or ~range(specialty,1,3,5,5) or specialty_98_other<>'')Flag6=1.
If(qcountry=10) and (mis(specialty) or ~range(specialty,1,3,5,5) or specialty_98_other<>'')Flag7=1.
If(qcountry=16) and (mis(specialty) or ~range(specialty,1,3,5,6) or specialty_98_other<>'')Flag8=1.
If(qcountry=2057) and (mis(specialty) or ~range(specialty,1,3,5,5) or specialty_98_other<>'')Flag9=1.
If(qcountry=3081) and (mis(specialty) or ~range(specialty,1,3,5,5) or specialty_98_other<>'')Flag10=1.
temporary.
sel if sum(Flag1 to Flag10)>0.
list respid,specialty.
Del var Flag1 to Flag10.
EXECUTE.

***************************************S1B.
If(qcountry=1033 and specialty=6)S1b_F=1.
If(S1b_F=1) and (mis(s1b) or s1b<>2)Flag1=1.
If mis(S1b_F) and ~mis(s1b)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid,s1b.
Del var S1b_F to Flag2.
EXECUTE.

***************************************S1C.
If(qcountry=1033) and any(specialty,8,9)S1c_F=1.
If(S1c_F=1) and (mis(s1c) or ~range(S1c,1,3))Flag1=1.
If mis(S1c_F) and ~mis(s1c)Flag2=1.
if (S1c=3) and (qlist NE 1) flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid,s1b.
Del var S1c_F to Flag3.
EXECUTE.

***************************************hids1group1.
If(qcountry=1033) and any(specialty,1,5)hids1group1_F=1.
If(qcountry=1033) and any(specialty,2,6)hids1group1_F=2.
If(qcountry=1033 and specialty=3)hids1group1_F=3.
If(qcountry=7) and any(specialty,1,5)hids1group1_F=1.
If(qcountry=7) and any(specialty,2,6)hids1group1_F=2.
If(qcountry=7 and specialty=3)hids1group1_F=3.
If(qcountry=12) and any(specialty,1,5)hids1group1_F=1.
If(qcountry=12) and any(specialty,2,3)hids1group1_F=2.
If(qcountry=10) and any(specialty,1,5)hids1group1_F=1.
If(qcountry=10 and specialty=2)hids1group1_F=2.
If(qcountry=10 and specialty=3)hids1group1_F=3.
If(qcountry=16) and any(specialty,1,5)hids1group1_F=1.
If(qcountry=16) and any(specialty,2,6)hids1group1_F=2.
If(qcountry=16 and specialty=3)hids1group1_F=3.
If(qcountry=2057) and any(specialty,1,5)hids1group1_F=1.
If(qcountry=2057 and specialty=2)hids1group1_F=2.
If(qcountry=2057 and specialty=3)hids1group1_F=3.
If(qcountry=3081) and any(specialty,1,5)hids1group1_F=1.
If(qcountry=3081 and specialty=2)hids1group1_F=2.
If(qcountry=3081 and specialty=3)hids1group1_F=3.
if (qcountry=1033 and s1c=1) hids1group1_F=2.
if (qcountry=1033 and s1c=2) hids1group1_F=1.
exe.

Do repeat x=hids1group1/y=hids1group1_F.
If(x<>y) or (mis(x) and ~mis(y)) or (~mis(x) and mis(y))Flag1=1.
If (s1c NE 3) and (mis(x) or ~range(x,1,3)) Flag2=1.
If (s1c = 3) and (~mis(x)) Flag3=1.
end repeat.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid,hids1group1.
Del var hids1group1_F to Flag3.
EXECUTE.

***************************************HIDS1GROUP2.
If(hids1group1=1)HidS1Group2_F=1.
If any(hids1group1,2,3)hids1group2_F=2.
exe.
Do repeat x=hids1group2/y=hids1group2_F.
If(x<>y) or (mis(x) and ~mis(y)) or (~mis(x) and mis(y))Flag1=1.
If ~range(x,1,2)Flag2=1.
end repeat.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid,hids1group2.
Del var hids1group2_F to Flag2.
EXECUTE.

***************************************S2.
tit S2.
temporary.
sel if miss(S2_1) or ~range(S2_1,2,40).
list respid, S2_1.

***************************************S3.
tit S3.
temporary.
sel if miss(S3_1) or ~range(S3_1,50,100).
list respid, S3_1.

***************************************S4.
If(qcountry=1033) and (mis(S4) or ~range(S4,1,8))Flag1=1.
If(qcountry=7) and (mis(S4) or ~range(S4,21,23))Flag2=1.
If(qcountry=12) and (mis(S4) or ~range(S4,31,34,37,37))Flag3=1.
If(qcountry=16) and (mis(S4) or ~range(S4,41,45))Flag4=1.
If(qcountry=2057) and (mis(S4) or ~range(S4,51,53))Flag5=1.
If(qcountry=10) and (mis(S4) or ~range(S4,64,68))Flag6=1.
If(qcountry=3081) and (mis(S4) or ~range(S4,69,71))Flag7=1.
temporary.
sel if sum(Flag1 to Flag7)>0.
list respid,S4.
Del var Flag1 to Flag7.
EXECUTE.

***************************************HIDS4DE.
If(qcountry=7 and range(s4,21,23))hids4de_F=1.
If(qcountry=7 and s4=21) and (mis(hids4de) or hids4de<>1)Flag1=1.
If(qcountry=7 and any(s4,22,23)) and (mis(hids4de) or hids4de<>2)Flag2=1.
If(hids4de_F=1) and (mis(hids4de) or ~any(hids4de,1,2))Flag3=1.
If mis(hids4de_F) and ~mis(hids4de)Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid,hids4de.
Del var hids4de_F to Flag4.
EXECUTE.

*******************************Check Manually CODE1 = Hospital [MAX QUOTA N=20 FOR HOSPITAL]/CODE2 = OFFICE BASED [MIN QUOTA N=80 OFFICE BASED].
Freq hids4de.
exe.

***************************************S4A0.
If(qcountry=1033 and hids1group1=1)S4a0_F=1.
If(s4a0_F=1) and (mis(S4a0) or ~any(S4a0,1,2))Flag1=1.
If mis(s4a0_F) and ~mis(S4a0)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid,S4a0.
Del var S4a0_F to Flag2.
EXECUTE.

*******************************Check Manually CODE2 = No [MAX QUOTA N=60 FOR NO].
Freq S4a0.
exe.

***************************************S4A - Deleted.
tit S4a.
temporary.
sel if ~miss(S4a).
list respid, S4a.

***************************************S5.
Do repeat x=s5_1 to s5_5.
If(qcountry=1033) and (mis(x) or ~range(x,0,100))Flag1=1.
If(mis(qcountry) or qcountry<>1033) and ~mis(x)Flag2=1.
end repeat.
If(qcountry=1033) and sum(s5_1 to s5_5)<>100 Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************S6.
If mis(s6_1) or ~range(s6_1,0,999)Flag1=1.
Do repeat x=s6_2 to s6_6.
If mis(x) or ~range(x,0,s6_1)Flag2=1.
end repeat.
If sum(s6_2 to s6_6)>s6_1 Flag3=1.
If sum(s6_2 to s6_4)<8 Flag4=1.
If (qcountry=1033) and (sum(s6_2 to s6_4)<5) Flag5=1.
exe.
temporary.
sel if sum(Flag1 to Flag5)>0.
list respid.
Del var Flag1 to Flag5.
EXECUTE.

***************************************S6A.
If(specialty=3)s6a_F=1.
Filt by s6a_F.
tit S6a.
temporary.
!MULTI_B svar=s6a_1 evar=s6a_99 qnt=s6a ctr= 5.
Filt off.
Do repeat x=s6a_1 to s6a_99.
If mis(s6a_F) and ~mis(x)Flag1=1.
end repeat.
If(s6a_F=1 and  s6a_99<>0)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var s6a_F to Flag2.
EXECUTE.

***************************************HIDS7VALS.
Do repeat x=s6_2 to s6_6/y=hids7vals_1 to hids7vals_5.
If(x<>y) or (mis(x) and ~mis(y)) or (~mis(x) and mis(y))Flag=1.
end repeat.
temporary.
sel if Flag=1.
list respid.
Del var Flag.
EXECUTE.

***************************************S7.
Do repeat x=s7_1 to s7_5 /y=hids7vals_1 to hids7vals_5.
If (y>0) and (mis(x) or ~range(x,0,y))Flag1=1.
If (~miss(x)) and (~range(x,0,y))Flag2=1.
end repeat.
if (sum(s7_1 to s7_4)<4) flag3=1.
if (sum(s7_1 to s7_4)<2) and (qcountry = 1033 and qlist=2) flag4=1.
exe.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

***************************************HIDS7.
If(mis(s7_1) or s7_1=0) and (mis(hidS7) or hidS7<>1)Flag1=1.
If (s7_1>0) and (mis(hidS7) or hidS7<>2)Flag2=1.
If(mis(hidS7) or ~range(hidS7,1,2))Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

**************************************Check manually Code2 - min 30% market sample to have >0.
Freq hidS7.
exe.

***************************************S8.
tit S8.
temporary.
sel if miss(S8) or ~range(S8,1,3).
list respid, S8.

temporary.
sel if (S8=3) and (qcountry NE 1033 or qlist=2).
list respid, S8.

***************************************S9DE.
If(qcountry=7) and (mis(S9DE) or ~range(S9DE,1,16))Flag1=1.
If(mis(qcountry) or qcountry<>7) and ~mis(S9DE)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************S9FR.
If(qcountry=12) and (mis(S9FR) or ~range(S9FR,1,13))Flag1=1.
If(mis(qcountry) or qcountry<>12) and ~mis(S9FR)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************S9IT.
If(qcountry=16) and (mis(S9IT) or ~range(S9IT,1,20))Flag1=1.
If(mis(qcountry) or qcountry<>16) and ~mis(S9IT)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************S9UK.
If(qcountry=2057) and (mis(S9UK) or ~range(S9UK,1,12))Flag1=1.
If(mis(qcountry) or qcountry<>2057) and ~mis(S9UK)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************S9ES.
If(qcountry=10) and (mis(S9ES) or ~range(S9ES,1,18))Flag1=1.
If(mis(qcountry) or qcountry<>10) and ~mis(S9ES)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************S9US.
If(qcountry=1033) and (mis(S9US) or ~range(S9US,1,51))Flag1=1.
If(mis(qcountry) or qcountry<>1033) and ~mis(S9US)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************S9AU.
If(qcountry=3081) and (mis(S9AU) or ~range(S9AU,52,59))Flag1=1.
If(mis(qcountry) or qcountry<>3081) and ~mis(S9AU)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************HIDSCRQS.
If(qcountry=1033 and (s1b=2 or any(s1c,1,2,3)))hidscrqs_4F=1.
exe.

If ~mis(hidscrqs_1)Flag1=1.
If(qcountry=1033 and us2=2) and (mis(hidscrqs_2) or hidscrqs_2<>1)Flag2=1.
If(mis(qcountry) or qcountry<>1033 or mis(us2) or us2<>2) and ~mis(hidscrqs_2)Flag3=1.
If(qcountry=1033 and s0b=2) and (mis(hidscrqs_3) or hidscrqs_3<>1)Flag4=1.
If(mis(qcountry) or qcountry<>1033 or mis(s0b) or s0b<>2) and ~mis(hidscrqs_3)Flag5=1.
If(hidscrqs_4F=1) and (mis(hidscrqs_4) or hidscrqs_4<>1)Flag6=1.
If mis(hidscrqs_4F) and ~mis(hidscrqs_4)Flag7=1.
If(qcountry=1033 and range(s2_1,2,35)) and (mis(hidscrqs_5) or hidscrqs_5<>1)Flag8=1.
If(mis(qcountry) or qcountry<>1033 or mis(s2_1) or ~range(s2_1,2,35)) and ~mis(hidscrqs_5)Flag9=1.
If(qcountry=1033 and range(s3_1,50,100)) and (mis(hidscrqs_6) or hidscrqs_6<>1)Flag10=1.
If(mis(qcountry) or qcountry<>1033 or mis(s3_1) or ~range(s3_1,50,100)) and ~mis(hidscrqs_6)Flag11=1.
If(qcountry=1033 and range(s4,1,8)) and (mis(hidscrqs_7) or hidscrqs_7<>1)Flag12=1.
If(mis(qcountry) or qcountry<>1033 or mis(s4) or ~range(s4,1,8)) and ~mis(hidscrqs_6)Flag13=1.
If(qcountry=1033 and range(s4a0,1,2)) and (mis(hidscrqs_8) or hidscrqs_8<>1)Flag14=1.
If(mis(qcountry) or qcountry<>1033 or mis(s4a0) or ~range(s4a0,1,2)) and ~mis(hidscrqs_8)Flag15=1.
If ~mis(hidscrqs_9)Flag16=1.
If(qcountry=1033 and sum(s5_1 to s5_5)=100) and (mis(hidscrqs_10) or hidscrqs_10<>1)Flag17=1.
If(mis(qcountry) or qcountry<>1033 or  sum(s5_1 to s5_5)=0) and ~mis(hidscrqs_10)Flag18=1.
If(qcountry=1033 and sum(s6_1 to s6_6)>0) and (mis(hidscrqs_11) or hidscrqs_11<>1)Flag19=1.
If(mis(qcountry) or qcountry<>1033 or  sum(s6_1 to s6_6)=0) and ~mis(hidscrqs_11)Flag20=1.
If(qcountry=1033 and sum(s6a_1 to s6a_4)>0) and (mis(hidscrqs_12) or hidscrqs_12<>1)Flag21=1.
If(mis(qcountry) or qcountry<>1033 or  sum(s6a_1 to s6a_4)=0) and ~mis(hidscrqs_12)Flag22=1.
If(qcountry=1033 and sum(s7_1 to s7_5)>0) and (mis(hidscrqs_13) or hidscrqs_13<>1)Flag23=1.
If(mis(qcountry) or qcountry<>1033 or  sum(s7_1 to s7_5)=0) and ~mis(hidscrqs_13)Flag24=1.
If(qcountry=1033 and any(s8,1,3)) and (mis(hidscrqs_14) or hidscrqs_14<>1)Flag25=1.
If(mis(qcountry) or qcountry<>1033 or  mis(s8) or ~any(s8,1,2)) and ~mis(hidscrqs_14)Flag26=1.
If ~mis(hidscrqs_15)Flag27=1.
If sum(hidscrqs_1 to hidscrqs_15)<>hidscrqscnts_1 Flag28=1.
exe.
Do repeat x=hidscrqs_1 to hidscrqs_14.
If x<>1 Flag29=1.
end repeat.
temporary.
sel if sum(Flag1 to Flag29)>0.
list respid.
Del var hidscrqs_4F to Flag29.
EXECUTE.

***************************************A1.
Do repeat x=a1x1_51 to a1x1_7 a1x1_8 a1x1_9.
If(s7_1>0) and (mis(x) or ~range(x,0,s7_1))Flag1=1.
If(mis(s7_1) or s7_1<=0) and ~mis(x)Flag2=1.
end repeat.
Do repeat x=a1x1_2 to a1x1_6.
If ~mis(x)Flag3=1.
end repeat.
If(s7_1>0) and (sum(a1x1_51 to a1x1_7,a1x1_8,a1x1_9)<>s7_1)Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

Do repeat x=a1x2_1 a1x2_7 to a1x2_4 a1x2_5 to a1x2_9.
If(s7_2>0) and (mis(x) or ~range(x,0,s7_2))Flag1=1.
If(mis(s7_2) or s7_2<=0) and ~mis(x)Flag2=1.
end repeat.
Do repeat x=a1x2_51 a1x2_52 to a1x2_53 a1x2_56.
If ~mis(x)Flag3=1.
end repeat.
If(s7_2>0) and (sum(a1x2_1,a1x2_7 to a1x2_4,a1x2_5 to a1x2_9)<>s7_2)Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

Do repeat x=a1x3_1 a1x3_7 a1x3_3 to a1x3_4 a1x3_5 to a1x3_9.
If(s7_3>0) and (mis(x) or ~range(x,0,s7_3))Flag1=1.
If(mis(s7_3) or s7_3<=0) and ~mis(x)Flag2=1.
end repeat.
Do repeat x=a1x3_51 a1x3_52 to a1x3_53 a1x3_2 a1x3_56.
If ~mis(x)Flag3=1.
end repeat.
If(s7_3>0) and (sum(a1x3_1,a1x3_7,a1x3_3 to a1x3_4,a1x3_5 to a1x3_9)<>s7_3)Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

Do repeat x=a1x4_1 a1x4_7 a1x4_3 to a1x4_4 a1x4_5 to a1x4_9.
If(s7_4>0) and (mis(x) or ~range(x,0,s7_4))Flag1=1.
If(mis(s7_4) or s7_4<=0) and ~mis(x)Flag2=1.
end repeat.
Do repeat x=a1x4_51 a1x4_52 to a1x4_53 a1x4_2 a1x4_56.
If ~mis(x)Flag3=1.
end repeat.
If(s7_4>0) and (sum(a1x4_1,a1x4_7,a1x4_3 to a1x4_4,a1x4_5 to a1x4_9)<>s7_4)Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

Do repeat x=a1x5_1 a1x5_7 a1x5_3 to a1x5_4 a1x5_5 to a1x5_9.
If(s7_5>0) and (mis(x) or ~range(x,0,s7_5))Flag1=1.
If(mis(s7_5) or s7_5<=0) and ~mis(x)Flag2=1.
end repeat.
Do repeat x=a1x5_51 a1x5_52 to a1x5_53 a1x5_2 a1x5_56.
If ~mis(x)Flag3=1.
end repeat.
If(s7_5>0) and (sum(a1x5_1,a1x5_7,a1x5_3 to a1x5_4,a1x5_5 to a1x5_9)<>s7_5)Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

***************************************HIDA1ARPIS.
If sum(a1x1_53,a1x1_7,a1x1_54)<>hida1arpis_1 Flag1=1.
If sum(a1x2_2,a1x2_3,a1x2_4,a1x2_5,a1x2_6,a1x2_7)<>hida1arpis_2 Flag2=1.
If sum(a1x3_2,a1x3_3,a1x3_4,a1x3_5,a1x3_6,a1x3_7)<>hida1arpis_3 Flag3=1.
If sum(a1x4_2,a1x4_3,a1x4_4,a1x4_5,a1x4_6,a1x4_7)<>hida1arpis_4 Flag4=1.
If sum(a1x5_2,a1x5_3,a1x5_4,a1x5_5,a1x5_6,a1x5_7)<>hida1arpis_5 Flag5=1.
temporary.
sel if sum(Flag1 to Flag5)>0.
list respid.
Del var Flag1 to Flag5.
EXECUTE.

***************************************A3.
Do repeat x=a3x1 to a3x5.
If mis(x) or ~range(x,1,6)Flag=1.
end repeat.
temporary.
sel if Flag=1.
list respid.
Del var Flag.
EXECUTE.

***************************************A4.
do repeat x=a4x1_1 to a4x1_4/ y=a4x1_2 to a4x1_5.
If(a4dkx1_99=0) and (a4x1_1='' or char.len(a4x1_1)<5)Flag1=1.
If(a4dkx1_99=0) and (x='' and y<>'')Flag2=1.
end repeat.
Do repeat x=a4x1_1 to a4x1_5.
If(a4dkx1_99=1 and x<>'')Flag3=1.
if miss(a4dkx1_99) or ~any(a4dkx1_99,0,1)Flag4 = 1.
end repeat.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

do repeat x=a4x2_1 to a4x2_4/ y=a4x2_2 to a4x2_5.
If(a4dkx2_99=0) and (a4x2_1='' or char.len(a4x2_1)<5)Flag1=1.
If(a4dkx2_99=0) and (x='' and y<>'')Flag2=1.
end repeat.
Do repeat x=a4x2_1 to a4x2_5.
If(a4dkx2_99=1 and x<>'')Flag3=1.
if miss(a4dkx2_99) or ~any(a4dkx2_99,0,1)Flag4 = 1.
end repeat.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

***************************************qlist.
If mis(qlist) or ~any(qlist,1,2)Flag=1.
temporary.
sel if Flag=1.
list respid.
Del var Flag.
EXECUTE.

