* Encoding: UTF-8.
COUNT QTEST_CASE = user_id screenstatus scrstatus vendorid userid targetrx_id basicuserid me npi ama_primary_spec ama_secondary_spec physician_edc_id edc_status_code panel_desc ims_id
hce_id tlrowid panel_disposition honorarium projid survid payment_inviteelistid tl_abrysvo_mat_seg_value tl_abrysvo_mat_acct_stocker_s2_2024 tl_acct_stocker_s2_2024
tl_abrysvo_mat_calls_2025 tl_acct_stocker_2025 s2b_98_other s8a_98_other s8adeug_98_other s8afra_5_other s8ajpn_98_other s8aaus_98_other s8aba_98_other
s8amex_98_other s12g_3_other s15_98_other hidsegment q135x1_1 q135x2_1 q245_98_other q215_98_other q433_98_other q441_98_other q450_6_other q516_98_other
q517_98_other q940_98_other q950_98_other ('test','TEST', 'Test','TEst', 'TESt','tEST' '?','.').
exe.
FREQ  QTEST_CASE.
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
list respid,respid.

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
sel if screenStatus=" " or screenStatus ~= "COMPLETE".
list respid, screenStatus.

***************************************SCRSTATUS.
tit scrStatus.
temporary.
sel if scrStatus =" " or scrStatus ~= "COMPLETE"..
list respid,scrStatus.

***************************************HIDCHANGE.
tit hidChange.
temporary.
sel if miss(hidChange) or ~range(hidChange,0,10).
list respid, hidChange.

***************************************QCOUNTRY.
tit qCountry.
temporary.
sel if miss(qCountry) or ~any(qCountry,7,12,17,1033,1046,2058,3081,11274).
list respid, qCountry.

********************************************************************SCREENER.
***************************************S0.
tit S0.
if(miss(S0) or ~range(S0, 1,6)) flag1 = 1.
if(~any(qCountry, 2058, 11274) AND S0 = 2) flag2 = 1.
if(qCountry NE 12 AND S0 = 3) flag3 = 1.
if(qCountry NE 7 AND S0 = 4) flag4 = 1.
if(qCountry NE 1046 AND S0 = 5) flag5 = 1.
if(qCountry NE 17 AND S0 = 6) flag6 = 1.
if(any(qCountry, 1033, 3081) AND S0 NE 1) flag7 = 1.
temporary.
sel if SUM(flag1 to flag7) GT 0.
list respid flag1 to flag7 S0.
del var flag1 to flag7.
exe.

***************************************S1A.
tit S1a.
temporary.
sel if (qcountry = 1033 and (miss(S1a) or ~range(S1a, 1,1))) or ((qcountry NE 1033 or miss(qcountry)) AND ~miss(S1a)).
list respid, S1a.
exe.

***************************************S1B.
tit S1b.
temporary.
sel if (qcountry = 1033 and (miss(S1b) or ~range(S1b, 1,2))) or ((qcountry NE 1033 or miss(qcountry)) AND ~miss(S1b)).
list respid, S1b.
exe.

***************************************SQ100AEDE.
tit SQ100AEDE.
temporary.
sel if (qcountry = 7 and (miss(SQ100AEDE) or ~range(SQ100AEDE, 1,1))) or ((qcountry NE 7 or miss(qcountry)) AND ~miss(SQ100AEDE)).
list respid, SQ100AEDE.
exe.

***************************************SQ105AEDE.
tit SQ105AEDE.
temporary.
sel if (qcountry = 7 and (miss(SQ105AEDE) or ~range(SQ105AEDE, 1,1))) or ((qcountry NE 7 or miss(qcountry)) AND ~miss(SQ105AEDE)).
list respid, SQ105AEDE.
exe.

***************************************SQ115AEDE.
tit SQ115AEDE.
temporary.
sel if (qcountry = 7 and (miss(SQ115AEDE) or ~range(SQ115AEDE, 1,1))) or ((qcountry NE 7 or miss(qcountry)) AND ~miss(SQ115AEDE)).
list respid, SQ115AEDE.
exe.

***************************************SQ105FR.
tit SQ105FR.
temporary.
sel if (qcountry = 12 and (miss(SQ105FR) or ~range(SQ105FR, 1,1))) or ((qcountry NE 12 or miss(qcountry)) AND ~miss(SQ105FR)).
list respid, SQ105FR.
exe.

***************************************SQ110FR.
tit SQ110FR.
temporary.
sel if (qcountry = 12 and (miss(SQ110FR) or ~range(SQ110FR, 1,1))) or ((qcountry NE 12 or miss(qcountry)) AND ~miss(SQ110FR)).
list respid, SQ110FR.
exe.

***************************************SQ115FR.
tit SQ115FR.
temporary.
sel if (qcountry = 12 and (miss(SQ115FR) or ~range(SQ115FR, 1,1))) or ((qcountry NE 12 or miss(qcountry)) AND ~miss(SQ115FR)).
list respid, SQ115FR.
exe.

***************************************SQ110AEJP.
tit SQ110AEJP.
temporary.
sel if (qcountry = 17 and (miss(SQ110AEJP) or ~range(SQ110AEJP, 1,1))) or ((qcountry NE 17 or miss(qcountry)) AND ~miss(SQ110AEJP)).
list respid, SQ110AEJP.
exe.

***************************************SQ100AUS.
tit SQ100AUS.
temporary.
sel if (qcountry = 3081 and (miss(SQ100AUS) or ~range(SQ100AUS, 1,1))) or ((qcountry NE 3081 or miss(qcountry)) AND ~miss(SQ100AUS)).
list respid, SQ100AUS.
exe.

***************************************SQ105AUS.
tit SQ105AUS.
temporary.
sel if (qcountry = 3081 and (miss(SQ105AUS) or ~range(SQ105AUS, 1,2))) or ((qcountry NE 3081 or miss(qcountry)) AND ~miss(SQ105AUS)).
list respid, SQ105AUS.
exe.

***************************************SQ100AEBAM.
tit SQ100AEBAM.
temporary.
sel if (any(qcountry, 1046, 2058, 11274) and (miss(SQ100AEBAM) or ~range(SQ100AEBAM, 1,1))) or ((~any(qcountry, 1046, 2058, 11274) or miss(qcountry)) AND ~miss(SQ100AEBAM)).
list respid, SQ100AEBAM.
exe.

***************************************SQ105AEBRA.
tit SQ105AEBRA.
temporary.
sel if (qcountry = 1046 and (miss(SQ105AEBRA) or ~range(SQ105AEBRA, 1,2))) or ((qcountry NE 1046 or miss(qcountry)) AND ~miss(SQ105AEBRA)).
list respid, SQ105AEBRA.
exe.

***************************************SQ106AEBRA.
tit SQ106AEBRA.
temporary.
sel if (qcountry = 1046 and (miss(SQ106AEBRA) or ~range(SQ106AEBRA, 1,2))) or ((qcountry NE 1046 or miss(qcountry)) AND ~miss(SQ106AEBRA)).
list respid, SQ106AEBRA.
exe.

***************************************S2B.
tit S2b.
if(miss(S2b) or ~range(S2b,1,1,3,4)) flag1 = 1.
if(~any(qcountry, 12, 2058, 3081) AND S2b = 3) flag2 = 1.
if(~any(qcountry, 12, 1033, 3081) AND S2b = 4) flag3 = 1.
if(S2b_98_other ~= " ") flag4 = 1.
temporary.
sel if SUM(flag1 to flag4) GT 0.
list respid flag1 to flag4 S2b.
del var flag1 to flag4.
exe.

CROSSTABS S2b by qcountry.    /*MEX: 20 MAX in 'General Practitioner'.

***************************************HIDS2B.
tit hidS2b.
if(miss(hidS2b) or ~range(hidS2b,1,3)) flag1 = 1.
if((S2b <>1 or miss(S2b)) AND hidS2b = 1) flag2 = 1.
if((~any(qcountry, 12, 1033, 3081) or S2b<>4 or miss(S2b)) AND hidS2b=2) flag3 = 1.
if((~any(qcountry, 12, 2058, 3081) or S2b<>3 or miss(S2b)) AND hidS2b=3) flag4 = 1.
temporary.
sel if SUM(flag1 to flag4) GT 0.
list respid flag1 to flag4 hidS2b S2b.
del var flag1 to flag4.
exe.

***************************************S5.
tit S5.
if(qcountry = 1033 AND hidS2b = 1) QC_HID_FIL = 1.
temporary.
sel if (QC_HID_FIL = 1 and (miss(S5) or ~range(S5, 1,1))) or ((QC_HID_FIL NE 1 or miss(QC_HID_FIL)) AND ~miss(S5)).
list respid, S5, qcountry, hidS2b.
del var QC_HID_FIL.
exe.

***************************************S6.
tit S6.
temporary.
sel if (qcountry = 1033 and (miss(S6) or ~range(S6, 1,19, 21,45, 47,48, 50,51))) or ((qcountry NE 1033 or miss(qcountry)) and ~miss(S6)).
list respid, S6.
exe.

***************************************QTREGIONS6.
tit qtRegionS6.
if(miss(qtRegionS6) or ~range(qtRegionS6,1,4)) flag1 = 1.
if(any(S6, 7,22,32,33,35,39,40) AND qtRegionS6 NE 1) flag2 = 1.
if(any(S6, 14,15,16,17,23,24,26,29,30,36,42,50) AND qtRegionS6 NE 2) flag3 = 1.
if(any(S6, 1,4,8,9,10,11,18,19,21,25,28,37,41,43,44,47) AND qtRegionS6 NE 3) flag4 = 1.
if(any(S6, 2,3,5,6,12,13,27,31,34,38,45,48,51) AND qtRegionS6 NE 4) flag5 = 1.
temporary.
sel if SUM(flag1 to flag5) GT 0.
list respid flag1 to flag5 qtRegionS6.
del var flag1 to flag5.
exe.

***************************************S7.
tit S7.
temporary.
sel if miss(S7_1) or ~range(S7_1, 2,35).
list respid, S7_1.
exe.

***************************************S8A.
tit S8a.
temporary.
sel if (qcountry = 1033 and (miss(S8a) or ~range(S8a, 1,8))) or ((qcountry NE 1033 or miss(qcountry)) and ~miss(S8a)) or S8a_98_other ~= " ".
list respid, S8a, S8a_98_other.
exe.

***************************************S8ADEU.
tit S8adeu.
do repeat x = s8adeu_1 s8adeu_2 s8adeu_3 s8adeu_4 s8adeu_5 s8adeu_6 s8adeu_7 s8adeu_8 s8adeu_98.
if(qcountry = 7 AND (miss(x) or ~range(x, 0,100))) flag1 = 1.
if((qcountry NE 7 OR miss(qcountry)) AND ~miss(x)) flag2 = 1.
end repeat.
if(qcountry = 7 AND SUM(s8adeu_4 to s8adeu_8) GT 25) flag3 = 1.
if(qcountry = 7 AND SUM(s8adeu_1 to s8adeu_98) NE 100) flag4 = 1.
if(s8adeu_98 GT 0 AND (s8adeug_98_other = " " or Char.len(s8adeug_98_other)>20)) flag5 = 1.
if((s8adeu_98 LE 0 or miss(s8adeu_98)) AND s8adeug_98_other ~= " ") flag6 = 1.
temporary.
sel if SUM(flag1 to flag6) GT 0.
list respid flag1 to flag6.
del var flag1 to flag6.
exe.

***************************************S8AFRA.
tit S8afra.
do repeat x = s8afra_1 s8afra_2 s8afra_3 s8afra_4 s8afra_5.
if(qcountry = 12 AND (miss(x) or ~range(x, 0,100))) flag1 = 1.
if((qcountry NE 12 OR miss(qcountry)) AND ~miss(x)) flag2 = 1.
end repeat.
if(s8afra_5 GT 50) flag3 = 1.
if(qcountry = 12 AND SUM(s8afra_1 to s8afra_5) NE 100) flag4 = 1.
if(s8afra_5>0 AND (s8afra_5_other = " " or Char.len(s8afra_5_other)>20)) flag5 = 1.
if((Sum(s8afra_5,0)=0) AND s8afra_5_other ~= " ") flag6 = 1.
temporary.
sel if SUM(flag1 to flag6) GT 0.
list respid flag1 to flag6.
del var flag1 to flag6.
exe.

***************************************S8AJPN.
tit S8ajpn.
do repeat x = s8ajpn_1 s8ajpn_2 s8ajpn_3 s8ajpn_4 s8ajpn_5 s8ajpn_98.
if(qcountry = 17 AND (miss(x) or ~range(x, 0,100))) flag1 = 1.
if((qcountry NE 17 OR miss(qcountry)) AND ~miss(x)) flag2 = 1.
end repeat.
if(s8ajpn_98 GT 50) flag3 = 1.
if(qcountry = 17 AND SUM(s8ajpn_1 to s8ajpn_98) NE 100) flag4 = 1.
if(s8ajpn_98>0 AND (s8ajpn_98_other = " " or Char.len(s8ajpn_98_other)>20))  flag5 = 1.
if((Sum(s8ajpn_98,0)=0) AND s8ajpn_98_other ~= " ") flag6 = 1.
temporary.
sel if SUM(flag1 to flag6) GT 0.
list respid flag1 to flag6.
del var flag1 to flag6.
exe.

***************************************S8BJPN.
tit S8bjpn.
temporary.
sel if (qcountry = 17 and (miss(S8bjpn) or ~range(S8bjpn,1,3))) or ((qcountry NE 17 OR miss(qcountry)) AND ~miss(S8bjpn)).
list respid, S8bjpn.
exe.

***************************************HIDS8BJPN.
tit hidS8bjpn.
if(range(S8bjpn,1,3) AND (miss(hidS8bjpn) or ~range(hidS8bjpn, 1,2))) flag1 = 1.
if((~range(S8bjpn,1,3) OR miss(S8bjpn)) AND ~miss(hidS8bjpn)) flag2 = 1.
if((S2b = 1 AND range(S8bjpn,1,2)) AND hidS8bjpn NE 1) flag3 = 1.
if((S2b = 1 AND S8bjpn = 3) AND hidS8bjpn NE 2) flag4 = 1.
temporary.
sel if SUM(flag1 to flag4) GT 0.
list respid flag1 to flag4 hidS8bjpn.
del var flag1 to flag4.
exe.

***************************************S8AAUS.
tit S8aaus.
do repeat x = s8aaus_1 s8aaus_2 s8aaus_3 s8aaus_98.
if(qcountry = 3081 AND (miss(x) or ~range(x, 0,100))) flag1 = 1.
if((qcountry NE 3081 OR miss(qcountry)) AND ~miss(x)) flag2 = 1.
end repeat.
if(s8aaus_98 GT 50) flag3 = 1.
if(qcountry = 3081 AND SUM(s8aaus_1 to s8aaus_98) NE 100) flag4 = 1.
if(s8aaus_98>0 AND (s8aaus_98_other = " " or Char.len(s8aaus_98_other)>20))  flag5 = 1.
if((Sum(s8aaus_98,0)=0) AND s8aaus_98_other ~= " ") flag6 = 1.
temporary.
sel if SUM(flag1 to flag6) GT 0.
list respid flag1 to flag6.
del var flag1 to flag6.
exe.

***************************************S8ABA.
tit S8aba.
do repeat x = s8aba_1 s8aba_2 s8aba_3 s8aba_4 s8aba_98.
if(any(qcountry, 1046, 11274) AND (miss(x) or ~range(x, 0,100))) flag1 = 1.
if((~any(qcountry, 1046, 11274) OR miss(qcountry)) AND ~miss(x)) flag2 = 1.
end repeat.
if(s8aba_3 LT 50 OR s8aba_98 GT 50) flag3 = 1.
if(any(qcountry, 1046, 11274) AND SUM(s8aba_1 to s8aba_98) NE 100) flag4 = 1.
if(range(s8aba_98, 1,50) AND (s8aba_98_other = " " or Char.len(s8aba_98_other)>20)) flag5 = 1.
if((~range(s8aba_98, 1,50) or miss(s8aba_98)) AND s8aba_98_other ~= " ") flag6 = 1.
temporary.
sel if SUM(flag1 to flag6) GT 0.
list respid flag1 to flag6.
del var flag1 to flag6.
exe.

***************************************S8AMEX.
tit S8amex.
do repeat x = s8amex_1 s8amex_2 s8amex_3 s8amex_4 s8amex_98.
if(qcountry = 2058 AND (miss(x) or ~range(x, 0,100))) flag1 = 1.
if((qcountry NE 2058 OR miss(qcountry)) AND ~miss(x)) flag2 = 1.
end repeat.
if(s8amex_3 LT 50) flag3 = 1.
if(qcountry = 2058 AND SUM(s8amex_1 to s8amex_98) NE 100) flag4 = 1.
if(s8amex_98 GT 0 AND (s8amex_98_other = " " or Char.len(s8amex_98_other)>20)) flag5 = 1.
if((s8amex_98 LE 0 or miss(s8amex_98)) AND s8amex_98_other ~= " ") flag6 = 1.
temporary.
sel if SUM(flag1 to flag6) GT 0.
list respid flag1 to flag6.
del var flag1 to flag6.
exe.

***************************************S8B.
tit S8b.
if(miss(S8b_1) OR ~range(S8b_1, 1,9999)) flag1 = 1.
if(S8a = 1 AND S8b_1 NE 1) flag2 = 1.
temporary.
sel if SUM(flag1 to flag2) GT 0.
list respid flag1 to flag2 S8b_1.
del var flag1 to flag2.
exe.

***************************************HIDS8B.
tit hidS8b.
if(qcountry = 1033 AND (miss(hidS8b) OR ~range(hidS8b, 1,2))) flag1 = 1.
if((qcountry NE 1033 OR miss(qcountry)) AND ~miss(hidS8b)) flag2 = 1.
if(S8b_1 LE 3 AND hidS8b NE 1) flag3 = 1.
if(S8b_1 GT 3 AND hidS8b NE 2) flag4 = 1.
temporary.
sel if SUM(flag1 to flag4) GT 0.
list respid flag1 to flag4 hidS8b.
del var flag1 to flag4.
exe.

***************************************S8C.
tit S8c.
temporary.
sel if (qcountry = 1033 and (miss(S8c) or ~range(S8c,1,2))) or ((qcountry NE 1033 or miss(qcountry)) and ~miss(S8c)).
list respid, S8c.
exe.

***************************************S8D.
tit S8d.
if(qcountry = 1033 AND S8c = 1) QC_S8C_FIL = 1.
temporary.
sel if (QC_S8C_FIL = 1 and (miss(S8d) or ~range(S8d,1,3))) or ((QC_S8C_FIL NE 1or miss(QC_S8C_FIL)) and ~miss(S8d)).
list respid, S8d.
del var QC_S8C_FIL.
exe.

***************************************HIDS8CD.
tit hidS8cd.
if(qcountry = 1033 AND (miss(hidS8cd) or ~range(hidS8cd,1,3))) flag1 = 1.
if((qcountry NE 1033 or miss(qcountry)) and ~miss(hidS8cd)) flag2 = 1.
if(S8d NE hidS8cd) flag3 = 1.
if(S8c = 2 AND hidS8cd NE 3) flag4 = 1.
temporary.
sel if SUM(flag1 to flag4) GT 0.
list respid flag1 to flag4 hidS8cd.
del var flag1 to flag4.
exe.

***************************************S8E.
tit S8e.
temporary.
sel if miss(S8e) or ~any(S8e,1,3).
list respid, S8e.
exe.

***************************************S9.
tit S9.
temporary.
sel if (miss(S9_1) or (qcountry NE 1046 and  ~range(S9_1, 75,100)) or (qcountry = 1046 and ~range(S9_1, 60,100))).
list respid, S9_1.
exe.

***************************************S10.
tit S10.
if(miss(S10_1) or ~range(S10_1, 1,99999)) flag1 = 1.
if(qcountry = 1033 AND S10_1 LT 100) flag2 = 1.
if(any(qcountry, 7, 17, 1046, 2058, 3081, 11274) AND S10_1 LT 60) flag3 = 1.
if((qcountry = 12 AND (hids2b = 1 OR s2b  = 4)) AND S10_1 LT 50) flag4 = 1.
if((qcountry = 12 AND hids2b = 3) AND S10_1 LT 15) flag5 = 1.
temporary.
sel if SUM(flag1 to flag5) GT 0.
list respid flag1 to flag5 S10_1.
del var flag1 to flag5.
exe.

***************************************S12.
tit S12.
do repeat x = s12_1 s12_2 s12_3.
if(qcountry = 1033 AND (miss(x) or ~range(x, 0,100))) flag1 = 1.
if((qcountry NE 1033 OR miss(qcountry)) AND ~miss(x)) flag2 = 1.
end repeat.
if(s12_3 = 100) flag3 = 1.
if(qcountry = 1033 AND SUM(s12_1 to s12_3) NE 100) flag4 = 1.
if(s12_3 GT 0 AND (s12g_3_other = " " or char.len(s12g_3_other)>20)) flag5 = 1.
if((s12_3 LE 0 or miss(s12_3)) AND s12g_3_other ~= " ") flag6 = 1.
temporary.
sel if SUM(flag1 to flag6) GT 0.
list respid flag1 to flag6 s12g_3_other.
del var flag1 to flag6.
exe.

***************************************S13A.
tit S13a.
do repeat x = s13a_1 s13a_2.
if(qcountry = 7 AND (miss(x) or ~range(x, 0,100))) flag1 = 1.
if((qcountry NE 7 OR miss(qcountry)) AND ~miss(x)) flag2 = 1.
end repeat.
if(qcountry = 7 AND SUM(s13a_1, s13a_2) NE 100) flag3 = 1.
temporary.
sel if SUM(flag1 to flag3) GT 0.
list respid flag1 to flag3.
del var flag1 to flag3.
exe.

***************************************S13B.
tit S13b.
do repeat x = s13b_1 s13b_2.
if(any(qcountry, 12,1046,2058,11274) AND (miss(x) or ~range(x, 0,100))) flag1 = 1.
if((~any(qcountry, 12,1046,2058,11274) OR miss(qcountry)) AND ~miss(x)) flag2 = 1.
end repeat.
if((qcountry = 1046 AND S2b = 1) AND s13b_1 LT 50) flag3 = 1.
if(any(qcountry, 12,1046,2058,11274) AND SUM(s13b_1, s13b_2) NE 100) flag4 = 1.
temporary.
sel if SUM(flag1 to flag4) GT 0.
list respid flag1 to flag4.
del var flag1 to flag4.
exe.

***************************************S14A.
tit S14a.
temporary.
sel if (qcountry NE 17 and (miss(S14a_1) or ~range(S14a_1, 2,5))) or ((qcountry = 17 or miss(qcountry)) AND ~miss(S14a_1)).
list respid, S14a_1.
exe.

***************************************S14B.
tit S14b.
temporary.
sel if (qcountry = 17 and (miss(S14b_1) or ~range(S14b_1, 2,5))) or ((qcountry NE 17 or miss(qcountry)) AND ~miss(S14b_1)).
list respid, S14b_1.
exe.

***************************************S15.
tit S15.
Do repeat x = s15_1 s15_2 s15_3 s15_98 s15_99.
if(~any(qcountry, 12, 1046, 11274) and (miss(x) or ~range(x, 0,1))) flag1 = 1.
if((any(qcountry, 12, 1046, 11274) or miss(qcountry)) and ~miss(x)) flag2 = 1.
end repeat.
if(~any(qcountry, 12, 1046, 11274, 2058) and (miss(s15_4) or ~range(s15_4, 0,1))) flag3 = 1.
if((any(qcountry, 12, 1046, 11274, 2058) or miss(qcountry)) and ~miss(s15_4)) flag4 = 1.
if(SUM(s15_1 to s15_99) LT 1) flag5 = 1.
if(s15_99=1 and SUM(s15_1 to s15_98) GE 1) flag6 = 1.
if(S15_98 = 1 and (S15_98_other = " " or char.len(S15_98_other)>20)) flag7 = 1.
if((S15_98 NE 1 or miss(S15_98)) and S15_98_other ~= " ") flag8 = 1.
temporary.
sel if SUM(flag1 to flag8) GT 0.
list respid flag1 to flag8.
del var flag1 to flag8.
exe.

***************************************HIDS15.
tit hidS15.
if((qcountry = 1033 AND ~Miss(S15_4)) AND (miss(hidS15) OR ~range(hidS15, 1, 2))) flag1 = 1.
if((miss(S15_4) or qcountry NE 1033 or miss(qcountry)) AND ~miss(hidS15)) flag2 = 1.
if(S15_4 = 1 AND hidS15 NE 1) flag3 = 1.
if(S15_4 = 0 AND hidS15 NE 2) flag4 = 1.
temporary.
sel if SUM(flag1 to flag4) GT 0.
list respid flag1 to flag4 hidS15.
del var flag1 to flag4.
exe.

***************************************S16.
tit S16.
if(~any(qcountry, 12, 1046, 11274) AND S15_99 = 0) QC_S15_FIL = 1.
exe.
temporary.
sel if (QC_S15_FIL = 1 and (miss(S16) or ~range(S16, 1,4))) or ((QC_S15_FIL NE 1 or miss(QC_S15_FIL)) and ~miss(S16)).
list respid, S16.
del var QC_S15_FIL.
exe.

***************************************S1TYPE.
tit S1Type.
temporary.
sel if miss(S1Type_1) or ~range(S1Type_1, 1,7).
list respid, S1Type_1.
exe.

***************************************S2TYPE.
tit S2Type.
temporary.
sel if miss(S2Type_1) or ~range(S2Type_1, 1,7).
list respid, S2Type_1.
exe.

***************************************S3TYPE.
tit S3Type.
temporary.
sel if miss(S3Type_1) or ~range(S3Type_1, 1,7).
list respid, S3Type_1.
exe.

***************************************HIDSEGMENT.  /*Typing tool.
tit hidSegment.
temporary.
sel if miss(hidSegment).
list respid, hidSegment.

***************************************S19A.
tit S19a.
temporary.
sel if (qcountry = 1033 and (miss(S19a) or ~range(S19a, 5,5))) or ((qcountry NE 1033 or miss(qcountry)) and ~miss(S19a)).
list respid, S19a.
exe.

***************************************S19B.
tit S19b.
temporary.
sel if miss(S19b) or ~range(S19b, 2,2).
list respid, S19b.
exe.

*************************************************************************Section I – Current Vaccine Perceptions and Behaviors.

***************************************Q20.
tit Q20.
Do repeat x1=q20x1_1 q20x2_1 q20x3_1 q20x4_1
/x2=q20x1_2 q20x2_2 q20x3_2 q20x4_2
/x3=q20x1_3 q20x2_3 q20x3_3 q20x4_3
/y=0 0 0 2058.
if qcountry<>y and (miss(x1) or ~range(x1,0,100)) flag=1.
if qcountry<>y and (miss(x2) or ~range(x2,0,100)) flag=2.
if qcountry<>y and (miss(x3) or ~range(x3,0,100)) flag=3.
if qcountry=y and (~miss(x1) or ~miss(x2) or ~miss(x3)) flag=4.
if Sum(x1,x2,x3)<>100 flag=4.
end repeat.
freq flag.
DELETE VARIABLES flag.

***************************************Q24.
tit Q24.
Do repeat x1=q24x1_1 q24x2_1 q24x3_1 q24x4_1
/x2=q24x1_2 q24x2_2 q24x3_2 q24x4_2
/y1=q20x1_1 q20x2_1 q20x3_1 q20x4_1
/y2=s15_1 s15_2 s15_3 s15_4.
if (~any(qcountry,12,1046,11274) and y1>0 and y2=1) and (miss(x1) or ~range(x1,0,100)) flag=1.
if (~any(qcountry,12,1046,11274) and y1>0 and y2=1) and (miss(x2) or ~range(x2,0,100) or (100-x1)<>x2) flag=2.
if (any(qcountry,12,1046,11274) or Sum(y1,0)=0 or Sum(y2,0)=0) and (~miss(x1) or ~miss(x2)) flag=3.
if Sum(x1,x2)<>100 flag=4.
end repeat.
freq flag.
DELETE VARIABLES flag.

***************************************Q24A.
tit Q24a.
Do repeat x=Q24a_1 Q24a_2.
if (qcountry=3081 and q24x4_2>0) and (miss(x) or ~range(x,0,100)) flag=1.
if (Sum(q24x4_2,0)=0 or qcountry<>3081) and ~miss(x) flag=2.
end repeat.
if Sum(Q24a_1,Q24a_2)<>100 flag=3.
freq flag.
DELETE VARIABLES flag.

***************************************Q25.
if ~any(qcountry,12,2058,1046,11274) and s15_4=0 Q25_F=1.
exe.

tit Q25.
temporary.
sel if (Q25_F=1 and (miss(Q25) or ~range(Q25,1,4))) or (Sum(Q25_F,0)<>1 and ~miss(Q25)).
list respid, Q25.
DELETE VARIABLES Q25_F.

***************************************Q32.
tit Q32.
Do repeat x=Q32_1 Q32_2 Q32_3 Q32_4/y1=q20x1_1 q20x2_1 q20x3_1 q20x4_1/y2=q20x1_2 q20x2_2 q20x3_2 q20x4_2/z=1033 1033 0 2058.
if (qcountry<>z and Sum(y1,y2)>0) and (miss(x) or ~range(x,1,5)) flag=1.
if (qcountry=z or Sum(y1,y2,0)=0) and ~miss(x) flag=2.
end repeat.
freq flag.
DELETE VARIABLES flag.

***************************************Q40.
tit Q40.
Do repeat x=q40_2 q40_3 q40_6 q40_7 q40_10 q40_13.
if miss(x) or ~range(x,1,5) flag=1.
end repeat.
if (~any(qcountry,12,1046,11274) and S15_99<>1) and (miss(q40_1) or ~range(q40_1,1,5)) flag=2.
if (any(qcountry,12,1046,11274) or S15_99=1 or miss(S15_99)) and ~miss(q40_1) flag=3.
if (~any(S2b,3)) and (miss(q40_12) or ~range(q40_12,1,5)) flag=4.
if (any(S2b,3) or miss(S2b)) and ~miss(q40_12) flag=5.
if (~any(S2b,1,4)) and (miss(q40_14) or ~range(q40_14,1,5)) flag=6.
if (any(S2b,1,4) or miss(S2b)) and ~miss(q40_14) flag=7.
freq flag.
DELETE VARIABLES flag.

*************************************************************************Section II – Current Perception of RSV Disease for Maternal Population.

***************************************Q100.
tit Q100.
!Rank_ALL_CHK svar=Q100_1 evar=Q100_4 qnt=Q100 rank=4  opr= ~=.     

***************************************Q125.
tit Q125.
Do repeat x=q125_1 q125_2 q125_3 q125_4 q125_5 q125_6 q125_7 q125_9 q125_10 q125_13 q125_15 q125_16 q125_17 q125_18 q125_19 q125_22 q125_23.
if miss(x) or ~range(x,1,7) flag=1.
end repeat.
if (any(qcountry,7,1033)) and (miss(q125_8) or ~range(q125_8,1,7)) flag=2.
if (~any(qcountry,7,1033)) and ~miss(q125_8) flag=3.
if (~any(qcountry,12,1046,11274)) and (miss(q125_11) or ~range(q125_11,1,7)) flag=4.
if (any(qcountry,12,1046,11274)) and ~miss(q125_11) flag=5.
if (~any(qcountry,1046,11274)) and (miss(q125_12) or ~range(q125_12,1,7)) flag=6.
if (any(qcountry,1046,11274)) and ~miss(q125_12) flag=7.
if (any(qcountry,12,11274)) and (miss(q125_21) or ~range(q125_21,1,7)) flag=8.
if (~any(qcountry,12,11274)) and ~miss(q125_21) flag=9.
freq flag.
DELETE VARIABLES flag.

***************************************Q135.
tit Q135.
Do repeat x=Q135x1_1 Q135x2_1.
if x='' or char.len(x)>20 flag=1.
end repeat.
TEMPORARY.
Sel if flag>0.
list respid flag Q135x1_1 Q135x2_1.
DELETE VARIABLES flag.

*************************************************************************Section III-A – US RSV Maternal Vaccine Pre-Base Case Demand.

***************************************Q600.
tit Q600.
Do repeat x1=q600x1_1 q600x2_1/x2=q600x1_2 q600x2_2.
if qcountry=1033 and (miss(x1) or ~range(x1,0,100)) flag=1.
if qcountry=1033 and (miss(x2) or ~range(x2,0,100)) flag=2.
if Sum(x1,x2)<>100 flag=3.
end repeat.
TEMPORARY.
Sel if flag>0.
list respid flag.
DELETE VARIABLES flag.

***************************************Q602.
tit Q602.
Do repeat x1=q602x1_1 q602x2_1/x2=q602x1_2 q602x2_2/y=q600x1_1 q600x2_1.
if y>0 and (miss(x1) or ~range(x1,0,100)) flag=1.
if y>0 and (miss(x2) or ~range(x2,0,100)) flag=2.
if y=0 and (miss(x1) or x1<>0) flag=3.
if y=0 and (miss(x2) or x2<>100) flag=4.
if miss(y) and (~miss(x1) or ~miss(x2)) flag=5.
if Sum(x1,x2)<>100 flag=6.
end repeat.
TEMPORARY.
Sel if flag>0.
list respid flag.
DELETE VARIABLES flag.

***************************************Q605.
tit Q605.
Do repeat x1=q605x1_1 q605x2_1/x2=q605x1_2 q605x2_2.
if qcountry=1033 and (miss(x1) or ~range(x1,0,100)) flag=1.
if qcountry=1033 and (miss(x2) or ~range(x2,0,100)) flag=2.
if Sum(x1,x2)<>100 flag=3.
end repeat.
TEMPORARY.
Sel if flag>0.
list respid flag.
DELETE VARIABLES flag.

***************************************Q607.
tit Q607.
Do repeat x1=q607x1_1 q607x2_1/x2=q607x1_2 q607x2_2/y=q605x1_1 q605x2_1.
if y>0 and (miss(x1) or ~range(x1,0,100)) flag=1.
if y>0 and (miss(x2) or ~range(x2,0,100)) flag=2.
if y=0 and (miss(x1) or x1<>0) flag=3.
if y=0 and (miss(x2) or x2<>100) flag=4.
if miss(y) and (~miss(x1) or ~miss(x2)) flag=5.
if Sum(x1,x2)<>100 flag=6.
end repeat.
TEMPORARY.
Sel if flag>0.
list respid flag.
DELETE VARIABLES flag.

*************************************************************************Section III-B – RSV Maternal Vaccine TPP Perceptions and Base Case Demand.

***************************************Q220.
tit Q220.
Do repeat x1=Q220x1_1 Q220x2_1/x2=Q220x1_2 Q220x2_2.
if (miss(x1) or ~range(x1,0,100)) flag=1.
if (miss(x2) or ~range(x2,0,100)) flag=2.
if Sum(x1,x2)<>100 flag=3.
end repeat.
TEMPORARY.
Sel if flag>0.
list respid flag.
DELETE VARIABLES flag.

***************************************Q222.
tit Q222.
Do repeat x1=Q222x1_1 Q222x2_1/x2=Q222x1_2 Q222x2_2/y=Q220x1_1 Q220x2_1.
if y>0 and (miss(x1) or ~range(x1,0,100)) flag=1.
if y>0 and (miss(x2) or ~range(x2,0,100)) flag=2.
if y=0 and (miss(x1) or x1<>0) flag=3.
if y=0 and (miss(x2) or x2<>100) flag=4.
if miss(y) and (~miss(x1) or ~miss(x2)) flag=5.
if Sum(x1,x2)<>100 flag=6.
end repeat.
TEMPORARY.
Sel if flag>0.
list respid flag.
DELETE VARIABLES flag.

***************************************Q245.
tit Q245.
if Sum(Q222x1_2, Q222x2_2)>0 and qcountry<>2058 Q245_F=1.
filter by Q245_F.
temporary.
!MULTI_A svar=Q245_1 evar=Q245_98 qnt=Q245 ctr= 13.
filter off.

if Sum(Q222x1_2, Q222x2_2)>0 and qcountry=2058 Q245_F1=1.
filter by Q245_F1.
temporary.
!MULTI_A svar=Q245_1 evar=Q245_98 qnt=Q245 ctr= 12.
filter off.

if sum(Q245_F,Q245_F1,0)=0 and nmiss(Q245_1 to Q245_98)<>13 flag=1.
if Q245_F1=1 and ~miss(Q245_F1) flag=2.
if Q245_98=1 and (q245_98_other='' or char.len(q245_98_other)>20) flag=3.
if Sum(Q245_98,0)<>1 and q245_98_other<>'' flag=4.
freq flag.
DELETE VARIABLES flag Q245_F,Q245_F1.

***************************************HQ200LABELS.    /*label checking purpose only.
tit hQ200labels.
Do repeat x=hQ200labels_USx1 to hQ200labels_AUSx16.
if ~miss(x) flag=1.
end repeat.
freq flag.
DELETE VARIABLES flag.

***************************************Q200.
tit Q200.
if any(Qcountry,1033,11274) Q200_F=1.
filter by Q200_F.
temporary.
!MULTI_B svar=Q200_1 evar=Q200_99 qnt=Q200 ctr= 19 .
filter off.

if ~any(Qcountry,1033,11274) Q200_F1=1.
filter by Q200_F1.
temporary.
!MULTI_B svar=Q200_1 evar=Q200_99 qnt=Q200 ctr= 17.
filter off.

if (Q200_F<>1 or Q200_F1=1) and nmiss(Q200_7,Q200_8)<>2 flag=1.
freq flag.
DELETE VARIABLES flag Q200_F Q200_F1.

***************************************Q210.
count cnt_200=Q200_1 to Q200_99(0).
exe.

tit Q210.
if Q200_99<>1 and cnt_200>1 Q210_F=1.
filter by Q210_F.
temporary.
!MULTI_B svar=Q210_1 evar=Q210_99 qnt=Q210 ctr= cnt_200 .
filter off.

if Q200_99=1 and any(Qcountry,1033,11274) Q210_F1=1.
filter by Q210_F1.
temporary.
!MULTI_B svar=Q210_1 evar=Q210_99 qnt=Q210 ctr= 19.
filter off.

if Q200_99=1 and ~any(Qcountry,1033,11274) Q210_F2=1.
filter by Q210_F2.
temporary.
!MULTI_B svar=Q210_1 evar=Q210_99 qnt=Q210 ctr= 17.
filter off.

do repeat x=Q210_1 to Q210_16/y=Q200_1 to Q200_16.
if ~miss(x) and y=1 flag=1.
end repeat.
if (Q210_F1<>1 or Q210_F2=1) and nmiss(Q210_7,Q210_8)<>2 flag=2.
if (Q200_99<>1 and cnt_200=1) and nmiss(Q210_1 to Q210_99)<>19 flag=3.
freq flag.
DELETE VARIABLES flag Q210_F Q210_F1 cnt_200.

***************************************Q215.
tit Q215.
temporary.
sel if (~any(qcountry,7,2058) and (miss(Q215) or ~range(Q215,1,5,98,99))) or (any(qcountry,7,2058) and ~miss(Q215)).
list respid, Q215.

if Q215=98 and (Q215_98_other='' or char.len(Q215_98_other)>20) flag=1.
if Sum(Q215,0)<>98 and Q215_98_other<>'' flag=2.
freq flag.
DELETE VARIABLES flag.

*************************************************************************Section IV – Alternate Demand Scenarios.

***************************************Q430.
tit Q430.
Do repeat x1=Q430x1_1 Q430x2_1/x2=Q430x1_2 Q430x2_2.
if any(qcountry,7,17,2058) and  (miss(x1) or ~range(x1,0,100)) flag=1.
if any(qcountry,7,17,2058) and (miss(x2) or ~range(x2,0,100)) flag=2.
if ~any(qcountry,7,17,2058) and (~miss(x1) or ~miss(x2)) flag=3.
if Sum(x1,x2)<>100 flag=4.
end repeat.
TEMPORARY.
Sel if flag>0.
list respid flag.
DELETE VARIABLES flag.

***************************************Q432X1.
tit Q432.
Do repeat x1=Q432x1_1 Q432x2_1/x2=Q432x1_2 Q432x2_2/y=Q430x1_1 Q430x2_1.
if y>0 and (miss(x1) or ~range(x1,0,100)) flag=1.
if y>0 and (miss(x2) or ~range(x2,0,100)) flag=2.
if y=0 and (miss(x1) or x1<>0) flag=3.
if y=0 and (miss(x2) or x2<>100) flag=4.
if miss(y) and (~miss(x1) or ~miss(x2)) flag=5.
if Sum(x1,x2)<>100 flag=6.
end repeat.
TEMPORARY.
Sel if flag>0.
list respid flag.
DELETE VARIABLES flag.

***************************************Q433.
tit Q433.
temporary.
sel if (any(qcountry,7,17,2058) and (miss(Q433) or ~range(Q433,1,5,98,99))) or (~any(qcountry,7,17,2058) and ~miss(Q433)).
list respid, qcountry Q433.

if Q433=98 and (Q433_98_other='' or char.len(Q433_98_other)>20) flag=1.
if Sum(Q433,0)<>98 and Q433_98_other<>'' flag=2.
freq flag.
DELETE VARIABLES flag.

***************************************Q440.
tit Q440.
temporary.
sel if (~any(qcountry,3081) and (miss(Q440) or ~range(Q440,1,3))) or (any(qcountry,3081) and ~miss(Q440)).
list respid, Q440.

***************************************Q441.
tit Q441.
if Q440=1 Q441_F=1.
filter by Q441_F.
temporary.
!MULTI_A svar=Q441_1 evar=Q441_98 qnt=Q441 ctr= 4 .
filter off.

if sum(Q441_F,0)<>1 and nmiss(Q441_1 to Q441_98)<>4 flag=1.
if Q441_98=1 and (Q441_98_other='' or char.len(Q441_98_other)>20) flag=2.
if Sum(Q441_98,0)<>1 and Q441_98_other<>'' flag=3.
freq flag.
DELETE VARIABLES flag Q441_F.

***************************************Q442.
tit Q442.
Do repeat x1=Q442x1_1 Q442x2_1/x2=Q442x1_2 Q442x2_2/y1=Q430x1_1 Q430x2_1/y2=Q430x1_2 Q430x2_2/z1=Q220x1_1 Q220x2_1/z2=Q220x1_2 Q220x2_2.
if Q440=1 and  (miss(x1) or ~range(x1,0,100)) flag=1.
if Q440=1 and (miss(x2) or ~range(x2,0,100)) flag=2.
if (any(Q440,2,3) and any(qcountry,7,17,2058)) and (miss(x1) or x1<>y1) flag=3.
if (any(Q440,2,3) and any(qcountry,7,17,2058)) and (miss(x2) or x2<>y2) flag=4.
if (any(Q440,2,3) and any(qcountry,12,1033,1046,11274)) and (miss(x1) or x1<>z1) flag=5.
if (any(Q440,2,3) and any(qcountry,12,1033,1046,11274)) and (miss(x2) or x2<>z2) flag=6.
if miss(Q440) and (~miss(x1) or ~miss(x2)) flag=7.
if Sum(x1,x2)<>100 flag=8.
end repeat.
TEMPORARY.
Sel if flag>0.
list respid flag.
DELETE VARIABLES flag.

***************************************Q448.
tit Q448.
Do repeat x1=Q448x1_1 Q448x2_1/x2=Q448x1_2 Q448x2_2/y1=Q432x1_1 Q432x2_1/y2=Q432x1_2 Q432x2_2/z1=Q222x1_1 Q222x2_1/z2=Q222x1_2 Q222x2_2.
if Q440=1 and  (miss(x1) or ~range(x1,0,100)) flag=1.
if Q440=1 and (miss(x2) or ~range(x2,0,100)) flag=2.
if (any(Q440,2,3) and any(qcountry,7,17,2058)) and (miss(x1) or x1<>y1) flag=3.
if (any(Q440,2,3) and any(qcountry,7,17,2058)) and (miss(x2) or x2<>y2) flag=4.
if (any(Q440,2,3) and any(qcountry,12,1033,1046,11274)) and (miss(x1) or x1<>z1) flag=5.
if (any(Q440,2,3) and any(qcountry,12,1033,1046,11274)) and (miss(x2) or x2<>z2) flag=6.
if miss(Q440) and (~miss(x1) or ~miss(x2)) flag=7.
if Sum(x1,x2)<>100 flag=8.
end repeat.
TEMPORARY.
Sel if flag>0.
list respid flag.
DELETE VARIABLES flag.

***************************************Q450.
tit Q450.
temporary.
sel if (Q440=1 and (miss(Q450) or ~range(Q450,1,6,99,99))) or (Sum(Q440,0)<>1 and ~miss(Q450)).
list respid, qcountry Q450.

if Q450=6 and (Q450_6_other='' or char.len(Q450_6_other)>20) flag=1.
if Sum(Q450,0)<>6 and Q450_6_other<>'' flag=2.
TEMPORARY.
Sel if flag>0.
list respid flag Q450 Q450_6_other.
DELETE VARIABLES flag.

***************************************HPIPEOPTN15.
tit hpipeOptn15.
temporary.
sel if miss(hpipeOptn15) or ~any(hpipeOptn15,7, 12, 17, 1033, 1046, 2058, 3081, 11274) or hpipeOptn15<>qcountry.
list respid, hpipeOptn15.

*************************************************************************Section V – ABRYSVO Performance and mAb Impact.
***************************************Q501.
tit Q501.
do repeat x = q501_1 q501_2 q501_3 q501_4 q501_5 q501_6 q501_7 q501_9 q501_10 q501_13 q501_15 q501_16 q501_17 q501_18 q501_19 q501_22 q501_23.
if(miss(x) or ~range(x,1,7)) flag1 = 1.
end repeat.
if(any(qcountry,7,1033) AND (miss(q501_8) or ~range(q501_8, 1,7))) flag2 = 1.
if((~any(qcountry,7,1033) OR miss(qcountry)) AND ~miss(q501_8)) flag3 = 1.
if(~any(qcountry,12,1046,11274) AND (miss(q501_11) or ~range(q501_11, 1,7))) flag4 = 1.
if((any(qcountry,12,1046,11274) OR miss(qcountry)) AND ~miss(q501_11)) flag5 = 1.
if(~any(qcountry,1046,11274) AND (miss(q501_12) or ~range(q501_12, 1,7))) flag6 = 1.
if((any(qcountry,1046,11274) OR miss(qcountry)) AND ~miss(q501_12)) flag7 = 1.
if(any(qcountry,12,11274) AND (miss(q501_21) or ~range(q501_21, 1,7))) flag8 = 1.
if((~any(qcountry,12,11274) OR miss(qcountry)) AND ~miss(q501_21)) flag9 = 1.
do repeat x = q501_20 q501_24 q501_25.
if(~miss(x)) flag10 = 1.
end repeat.
temporary.
sel if SUM(flag1 to flag10) GT 0.
list respid flag1 to flag10.
del var flag1 to flag10.
exe.

***************************************Q250 to Q275.
tit Q250 to Q275.
Do repeat x=Q250_1 to Q275x2_2.
if ~miss(x) flag=1.
end repeat.
freq flag.
DELETE VARIABLES flag.

***************************************Q502.
tit Q502.
temporary.
sel if (qcountry = 1046 and (miss(Q502) or ~range(Q502,1,3))) or ((qcountry NE 1046 or miss(qcountry)) and ~miss(Q502)).
list respid, Q502.
exe.

***************************************Q505.
tit Q505.
do repeat x = q505_2 to q505_23.
if(qcountry NE 2058 AND (miss(x) or ~range(x,1,7,99,99))) flag1 = 1.
if((qcountry = 2058 OR miss(qcountry)) AND ~miss(x)) flag2 = 1.
end repeat.
temporary.
sel if SUM(flag1, flag2) GT 0.
list respid flag1 flag2.
del var flag1 flag2.
exe.

***************************************Q500.
tit Q500.
temporary.
sel if (hids2b NE 1 and (miss(Q500) or ~range(Q500, 1,3))) or ((hids2b=1 or miss(hids2b)) and ~miss(Q500)).
list respid Q500 hids2b.
exe.

***************************************Q510.     /* Yet to check with SP regarding which variables need to be used.
tit Q510.
do repeat x = q510x1 q510x2.
if(miss(x) or ~range(x,1,3)) flag1 = 1.
end repeat.
temporary.
sel if SUM(flag1, 0) GT 0.
list respid flag1.
del var flag1.
exe.

***************************************Q515.
tit Q515.
temporary.
sel if miss(Q515) or ~range(Q515, 1,2).
list respid, Q515.
exe.

***************************************Q516.
tit Q516.
if(Q515 = 1) Q515_FIL = 1.
filter by Q515_FIL.
temporary.
!MULTI_A svar=Q516_1 evar=Q516_98 qnt=Q516 ctr= 13 .
filter off.

if((Q515_FIL NE 1 or miss(Q515_FIL)) AND nmiss(Q516_1 to Q516_98) NE 13) flag1 = 1.
if(Q516_98 = 1 and (Q516_98_other = " " or char.len(Q516_98_other)>20)) flag2 = 1.
if((Q516_98 NE 1 or miss(Q516_98)) and Q516_98_other ~= " ") flag3 = 1.
temporary.
sel if SUM(flag1 to flag3) GT 0.
list respid flag1 to flag3.
del var flag1 to flag3 Q515_FIL.
exe.

***************************************Q517.
tit Q517.
if(Q515 = 2) Q515_FIL1 = 1.
filter by Q515_FIL1.
temporary.
!MULTI_A svar=Q517_1 evar=Q517_98 qnt=Q517 ctr= 12.
filter off.

if((Q515_FIL1 NE 1 or miss(Q515_FIL1)) AND nmiss(Q517_1 to Q517_98) NE 12) flag1 = 1.
if(Q517_98 = 1 and (Q517_98_other = " " or char.len(Q517_98_other)>20)) flag2 = 1.
if((Q517_98 NE 1 or miss(Q517_98)) and Q517_98_other ~= " ") flag3 = 1.
temporary.
sel if SUM(flag1 to flag3) GT 0.
list respid flag1 to flag3.
del var flag1 to flag3 Q515_FIL1.
exe.

***************************************Q520.
tit Q520.
temporary.
sel if miss(Q520) or ~range(Q520,1,3).
list respid, Q520.
exe.

***************************************Q525.
tit Q525.
temporary.
sel if miss(Q525) or ~range(Q525,1,2).
list respid, Q525.
exe.

***************************************Q530.
tit Q530.
temporary.
sel if miss(Q530_1) or ~range(Q530_1,1,3).
list respid, Q530_1.
exe.

**********************************************************Section VI – Demographic Questions.
***************************************Q900.
tit Q900.
if(qcountry = 1033 AND S2b = 1 AND S8a = 6) QC_S2B_8A_FIL = 1.
exe.
temporary.
sel if (QC_S2B_8A_FIL = 1 and (miss(Q900) or ~range(Q900, 1,3))) or ((QC_S2B_8A_FIL NE 1 or miss(QC_S2B_8A_FIL)) and ~miss(Q900)).
list respid, Q900.
del var QC_S2B_8A_FIL.
exe.

***************************************Q912_1.
tit Q912_1.
if(qcountry = 1033) QC_FIL1 = 1.
filter by QC_FIL1.
temporary.
!MULTI_A svar=Q912_1_1 evar=Q912_1_6 qnt=Q912_1 ctr= 6.
filter off.

temporary.
sel if ((QC_FIL1 NE 1 or miss(QC_FIL1)) AND nmiss(Q912_1_1 to Q912_1_6) NE 6).
list respid Q912_1_1 to Q912_1_6.
del var QC_FIL1.
exe.

***************************************Q912_2.
tit Q912_2.
if(qcountry = 1033 AND s15_99 NE 1) QC_FIL2 = 1.
filter by QC_FIL2.
temporary.
!MULTI_A svar=Q912_2_1 evar=Q912_2_6 qnt=Q912_2 ctr= 6.
filter off.

temporary.
sel if ((QC_FIL2 NE 1 or miss(QC_FIL2)) AND nmiss(Q912_2_1 to Q912_2_6) NE 6).
list respid Q912_2_1 to Q912_2_6.
exe.

***************************************Q912_3.
tit Q912_3.
filter by QC_FIL2.
temporary.
!MULTI_A svar=Q912_3_1 evar=Q912_3_6 qnt=Q912_3 ctr= 6 .
filter off.

temporary.
sel if ((QC_FIL2 NE 1 or miss(QC_FIL2)) AND nmiss(Q912_3_1 to Q912_3_6) NE 6).
list respid Q912_3_1 to Q912_3_6.
exe.

***************************************Q912_4.
tit Q912_4.
filter by QC_FIL2.
temporary.
!MULTI_A svar=Q912_4_1 evar=Q912_4_6 qnt=Q912_4 ctr= 6 .
filter off.

temporary.
sel if ((QC_FIL2 NE 1 or miss(QC_FIL2)) AND nmiss(Q912_4_1 to Q912_4_6) NE 6).
list respid Q912_4_1 to q912_4_6.
del var QC_FIL2.
exe.

***************************************Q940.
tit Q940.
Do repeat x = q940_1 q940_2 q940_4 q940_6 q940_98.
if(qcountry NE 1033 and (miss(x) or ~range(x, 0,1))) flag1 = 1.
if((qcountry= 1033 or miss(qcountry)) and ~miss(x)) flag2 = 1.
end repeat.
if(~any(qcountry, 1033, 2058, 1046, 17) and (miss(q940_5) or ~range(q940_5, 0,1))) flag3 = 1.
if((any(qcountry, 1033, 2058, 1046, 17) or miss(qcountry)) and ~miss(q940_5)) flag4 = 1.
if(SUM(q940_1 to q940_98) LT 1) flag5 = 1.
if(q940_98 = 1 and (q940_98_other = " " or char.len(q940_98_other)>20)) flag6 = 1.
if((q940_98 NE 1 or miss(q940_98)) and q940_98_other ~= " ") flag7 = 1.
temporary.
sel if SUM(flag1 to flag7) GT 0.
list respid flag1 to flag7.
del var flag1 to flag7.
exe.

***************************************Q950.
tit Q950.
Do repeat x = q950_1 q950_2 q950_4 q950_6 q950_98.
if(~any(qcountry, 1033, 1046) and (miss(x) or ~range(x, 0,1))) flag1 = 1.
if((any(qcountry, 1033, 1046) or miss(qcountry)) and ~miss(x)) flag2 = 1.
end repeat.
if(~any(qcountry, 1033, 1046, 2058) and (miss(q950_5) or ~range(q950_5, 0,1))) flag3 = 1.
if((any(qcountry, 1033, 1046, 2058) or miss(qcountry)) and ~miss(q950_5)) flag4 = 1.
if(SUM(q950_1 to q950_98) LT 1) flag5 = 1.
if(q950_98 = 1 and (q950_98_other = " " or char.len(q950_98_other)>20)) flag6 = 1.
if((q950_98 NE 1 or miss(q950_98)) and q950_98_other ~= " ") flag7 = 1.
temporary.
sel if SUM(flag1 to flag7) GT 0.
list respid flag1 to flag7.
del var flag1 to flag7.
exe.

***************************************Q960.
tit Q960.
temporary.
sel if (qcountry NE 1033 and (miss(Q960) or ~range(Q960, 1,4))) or ((qcountry = 1033 or miss(qcountry)) and ~miss(Q960)).
list respid, Q960.
exe.

***************************************Q965.
tit Q965.
temporary.
sel if (qcountry = 1033 and (miss(Q965) or ~range(Q965, 1,3))) or ((qcountry NE 1033 or miss(qcountry)) and ~miss(Q965)).
list respid, Q965.
exe.

***************************************Q975.
tit Q975.
temporary.
sel if (qcountry = 1033 and (miss(Q975) or ~range(Q975, 1,2, 99,99))) or ((qcountry NE 1033 or miss(qcountry)) and ~miss(Q975)).
list respid, Q975.
exe.

***************************************Q955.
tit Q955.
temporary.
sel if (qcountry = 17 and (miss(Q955) or ~range(Q955, 1,2))) or ((qcountry NE 17 or miss(qcountry)) and ~miss(Q955)).
list respid, Q955.
exe.

***************************************HIDQ955.
tit hidQ955.
temporary.
sel if (range(Q955, 1,2) and (miss(hidQ955) or ~range(hidQ955,1,2))) or ((~range(Q955, 1,2) or miss(Q955)) and ~miss(hidQ955)) or (Q955 NE hidQ955).
list respid, hidQ955.
exe.

***************************************Q980.
tit Q980.
do repeat x = q980_1 q980_2.
if(S2b = 1 AND (miss(x) or ~range(x, 0,100))) flag1 = 1.
if((S2b NE 1 OR miss(S2b)) AND ~miss(x)) flag2 = 1.
end repeat.
if(S2b = 1 AND SUM(q980_1, q980_2) NE 100) flag4 = 1.
temporary.
sel if SUM(flag1 to flag4) GT 0.
list respid flag1 to flag4.
del var flag1 to flag4.
exe.

***************************************Q985.
tit Q985.
temporary.
sel if miss(Q985) or ~range(Q985,1,3).
list respid, Q985.
exe.

***************************************Q990.
tit Q990.
temporary.
sel if miss(Q990) or ~range(Q990, 1,4).
list respid, Q990.
exe.

***************************************SURVEYLOI.
tit surveyLOI.
temporary.
sel if miss(surveyLOI) or surveyLOI < 0.
list respid,surveyLOI.

***************************************HIDOEBATCH.
tit hidOEBatch.
temporary.
sel if miss(hidOEBatch) or hidOEBatch NE 99.
list respid,hidOEBatch.

***************************************HIDDVBATCH.
tit hidDVBatch.
temporary.
sel if miss(hidDVBatch) or hidDVBatch NE 99.
list respid,hidDVBatch.



