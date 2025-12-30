* Encoding: windows-1252.
***************************************************Quota.
If(specialty=1)dspec=1.
If any(specialty,2,3)dspec=2.
Val lab dspec
1 "Oncologist"
2 "Gastroenterologist/hepatologist".
exe.

CROSSTABS
  /TABLES=qcountry BY dspec
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.
Del var dspec.
exe.

Freq hids3afr hids3ade hids3ait s3axbr hs8fr hs8de s8uk hs8br s8it.
exe.

***************************************************DV Script.
COUNT QTEST_CASE = user_id s3axbr_6_other a1a_1 a1a_2 a1a_3 a1a_4 a1a_5 a1a_6 a1a_7 a1a_8 a1a_9 a1a_10 a1a_11 a1a_12 a1a_13 a1a_14 a1a_15 a1b_1 a1b_2 a1b_3 a1b_4 a1b_5
 a1b_6 a1b_7 a1b_8 a1b_9 a1b_10 a1b_11 a1b_12 a1b_13 a1b_14 a1b_15 a1c_1 a1c_2 a1c_3 a1c_4 a1c_5 a1c_6 a1c_7 a1c_8 a1c_9 a1c_10 a1c_11 a1c_12 a1c_13 a1c_14 a1c_15 
 b10b2_98_other_1 b10b2_98_other_2 b5g_98_other b7c_98_other b8_98_other c4g_98_other c5ag_98_other c5bg_98_other c10a_98_other c11a_98_other hbegintime_1 hendtime_1 
 hbegintime_2 hendtime_2 hbegintime_3 hendtime_3 hbegintime_4 hendtime_4 hbegintime_5 hendtime_5 hbegintime_6 hendtime_6 hbegintime_7 hendtime_7 hbegintime_8 hendtime_8
 qbegintimeloop_1 loop_id_1 p1b_4_other_1 p3_98_other_1 p7_6_other_1 p13oe_1_1 p13s_98_other_1 p16oe_1_1 p18_98_other_1 p19oe_1_1 p20a_14_other_1 p20a_98_other_1
 qendtimeloop_1 qbegintimeloop_2 loop_id_2 p1b_4_other_2 p3_98_other_2 p7_6_other_2 p13oe_1_2 p13s_98_other_2 p16oe_1_2 p18_98_other_2 p19oe_1_2 p20a_14_other_2
 p20a_98_other_2 qendtimeloop_2 qbegintimeloop_3 loop_id_3 p1b_4_other_3 p3_98_other_3 p7_6_other_3 p13oe_1_3 p13s_98_other_3 p16oe_1_3 p18_98_other_3 p19oe_1_3
 p20a_14_other_3 p20a_98_other_3 qendtimeloop_3 ('test','TEST', 'Test','TEst', 'TESt','tEST' '?','.').
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
sel if miss(respid).
list respid.

***************************************USER_ID.
tit user_id.
temporary.
sel if user_id =''.
list respid.

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

***************************************HIDCHANGE.
tit hidChange.
temporary.
sel if miss(hidChange) or ~range(hidChange,2,10).
list respid, hidChange.

***************************************QCOUNTRY.
tit qCountry.
temporary.
sel if miss(qCountry) or ~any(qCountry,7,12,16,1046,2057).
list respid, qCountry.

***************************************FRAE.
If(qcountry=12) and (mis(FRAE) or ~range(FRAE,1,2))Flag1=1.
If(mis(qcountry) or qcountry<>12) and ~mis(FRAE)Flag2=1.
temporary.
sel if sum(Flag1,Flag2)>0.
list respid.
Del var Flag1 Flag2.
exe.

***************************************DAAE.
If(qcountry=7) and (mis(DAAE) or DAAE<>1)Flag1=1.
If(mis(qcountry) or qcountry<>7) and ~mis(DAAE)Flag2=1.
temporary.
sel if sum(Flag1,Flag2)>0.
list respid.
Del var Flag1 Flag2.
exe.

***************************************UKAE.
If(qcountry=2057) and (mis(UKAE) or ~range(UKAE,3,4))Flag1=1.
If(mis(qcountry) or qcountry<>2057) and ~mis(UKAE)Flag2=1.
temporary.
sel if sum(Flag1,Flag2)>0.
list respid.
Del var Flag1 Flag2.
exe.

***************************************ITAE.
If(qcountry=16) and (mis(ITAE) or ~range(ITAE,5,6))Flag1=1.
If(mis(qcountry) or qcountry<>16) and ~mis(ITAE)Flag2=1.
temporary.
sel if sum(Flag1,Flag2)>0.
list respid.
Del var Flag1 Flag2.
EXECUTE.

***************************************BRAE.
If(qcountry=1046) and (mis(BRAE) or ~range(BRAE,7,8))Flag1=1.
If(mis(qcountry) or qcountry<>1046) and ~mis(BRAE)Flag2=1.
temporary.
sel if sum(Flag1,Flag2)>0.
list respid.
Del var Flag1 Flag2.
EXECUTE.

***************************************S0D.
tit S0d.
temporary.
sel if miss(S0d) or ~range(S0d,1,2).
list respid, S0d.

***************************************SPECIALTY.
If mis(specialty) or ~range(specialty,1,3) Flag1=1.
If(qcountry=12) and (mis(specialty) or ~range(specialty,1,3))Flag2=1.
If any(qcountry,16,1046,2057) and (mis(specialty) or specialty<>1)Flag3=1.
If(qcountry=7) and (mis(specialty) or ~range(specialty,1,2))Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

***************************************S2.
tit S2.
temporary.
sel if miss(S2_1) or ~range(S2_1,3,35).
list respid, S2_1.

***************************************S3AFR.
If(qcountry=12) and (mis(S3aFR) or ~range(S3aFR,1,4))Flag1=1.
If(mis(qcountry) or qcountry<>12) and ~mis(S3aFR)Flag2=1.
temporary.
sel if sum(Flag1,Flag2)>0.
list respid.
Del var Flag1 Flag2.
EXECUTE.

***************************************HIDS3AFR.
If(qcountry=12) and (mis(HidS3aFR) or ~range(HidS3aFR,1,3))Flag1=1.
If(qcountry=12 and any(s3afr,1,4)) and (mis(HidS3aFR) or HidS3aFR<>1)Flag2=1.
If(qcountry=12 and s3afr=2) and (mis(HidS3aFR) or HidS3aFR<>2)Flag3=1.
If(qcountry=12 and s3afr=3) and (mis(HidS3aFR) or HidS3aFR<>3)Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

***************************************S3ADE.
If(qcountry=7) and (mis(S3ADE) or ~range(S3ADE,1,4))Flag1=1.
If(mis(qcountry) or qcountry<>7) and ~mis(S3ADE)Flag2=1.
temporary.
sel if sum(Flag1,Flag2)>0.
list respid.
Del var Flag1 Flag2.
EXECUTE.

***************************************HIDS3ADE.
If(qcountry=7) and (mis(HIDS3ADE) or ~range(HIDS3ADE,1,3))Flag1=1.
If(qcountry=7 and s3ade=1) and (mis(HIDS3ADE) or HIDS3ADE<>1)Flag2=1.
If(qcountry=7 and any(s3ade,2,4)) and (mis(HIDS3ADE) or HIDS3ADE<>2)Flag3=1.
If(qcountry=7 and s3ade=3) and (mis(HIDS3ADE) or HIDS3ADE<>3)Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

***************************************S3AIT.
If(qcountry=16) and (mis(S3aIT) or ~range(S3aIT,1,6))Flag1=1.
If(mis(qcountry) or qcountry<>16) and ~mis(S3aIT)Flag2=1.
temporary.
sel if sum(Flag1,Flag2)>0.
list respid.
Del var Flag1 Flag2.
EXECUTE.

***************************************HIDS3AIT.
If(qcountry=16) and (mis(HidS3aIT) or ~range(HidS3aIT,1,2))Flag1=1.
If(qcountry=16 and range(S3aIT,1,2)) and (mis(HIDS3AIT) or HIDS3AIT<>1)Flag2=1.
If(qcountry=16 and range(S3aIT,3,6)) and (mis(HIDS3AIT) or HIDS3AIT<>2)Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************S3AXBR.
If(qcountry=1046) and (mis(s3axbr) or ~range(s3axbr,1,6))Flag1=1.
If(mis(qcountry) or qcountry<>1046) and ~mis(s3axbr)Flag2=1.
If(s3axbr=6 and s3axbr_6_other='') or ((mis(s3axbr) or s3axbr<>6) and s3axbr_6_other<>'')Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************S3AUK.
If(qcountry=2057) and (mis(s3auk_1) or ~range(s3auk_1,0,49))Flag1=1.
If(qcountry=2057) and (mis(s3auk_2) or ~range(s3auk_2,0,100))Flag2=1.
If(qcountry=2057) and sum(s3auk_1,s3auk_2)<>100 Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************S3ABR.
If(qcountry=1046) and (mis(s3abr_1) or ~range(s3abr_1,50,100))Flag1=1.
If(mis(qcountry) or qcountry<>1046) and ~mis(s3abr_1)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************S3B.
If(qcountry=7) and any(s3ade,1,2,4)S3b_F=1.
If(S3b_F=1) and (mis(S3b) or ~range(S3b,1,3))Flag1=1.
If mis(S3b_F) and ~mis(S3b)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var S3b_F to Flag2.
EXECUTE.

***************************************S4.
If mis(S4_1) or ~range(S4_1,0,100)Flag1=1.
If(qcountry=2057 and ~range(S4_1,60,100))Flag2=1.
If(~any(s3afr,1,2) and ~range(S4_1,60,100)) or (any(s3afr,1,2) and ~range(S4_1,50,100))Flag3=1.
If(~any(s3axbr,1,2) and ~range(S4_1,60,100)) or (any(s3axbr,1,2) and ~range(S4_1,50,100))Flag4=1.
If(~any(s3ait,1,2) and ~range(S4_1,60,100)) or (any(s3ait,1,2) and ~range(S4_1,50,100))Flag5=1.
If(~any(s3ade,1,2,4) and ~range(S4_1,60,100))Flag6=1.
If(any(s3ade,1,2,4) and (s3b=1) and ~range(S4_1,50,100))Flag7=1.
If(any(s3ade,1,2,4) and any(s3b,2,3) and ~range(S4_1,70,100))Flag8=1.
temporary.
sel if sum(Flag1 to Flag8)>0.
list respid.
Del var Flag1 to Flag8.
EXECUTE.

***************************************S5.
tit S5.
temporary.
sel if miss(S5) or ~range(S5,1,2).
list respid, S5.

***************************************S6A.
If mis(S6a_1) or ~range(S6a_1,1,100)Flag1=1.
If any(qcountry,7,12,16,2057) and ~range(S6a_1,5,100)Flag2=1.
If(qcountry=1046) and ~range(S6a_1,3,100)Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************S6B.
If mis(s6b_1) or ~range(s6b_1,0,S6a_1)Flag1=1.
If mis(s6b_2) or ~range(s6b_2,1,S6a_1)Flag2=1.
If sum(s6b_1,s6b_2)<>S6a_1 Flag3=1.
If any(qcountry,7,12,16,2057) and ~range(s6b_2,5,s6a_1)Flag4=1.
If(qcountry=1046) and ~range(s6b_2,3,s6a_1)Flag5=1.
temporary.
sel if sum(Flag1 to Flag5)>0.
list respid.
Del var Flag1 to Flag5.
EXECUTE.

***************************************S6C.
Do repeat x=s6c_1 to s6c_3.
If mis(x) or ~range(x,0,s6b_2)Flag1=1.
end repeat.
If sum(s6c_1 to s6c_3)<>s6b_2 Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************S6D.
Do repeat x=s6d_1 s6d_2.
If mis(x) or ~range(x,0,s6b_2)Flag1=1.
end repeat.
If sum(s6d_1 to s6d_2)<>s6b_2 Flag2=1.
If ~range(s6d_1,1,s6b_2)Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************S6E.
Do repeat x=s6e_1 to s6e_5.
If mis(x) or ~range(x,0,s6d_1)Flag1=1.
end repeat.
If sum(s6e_1 to s6e_5)<>s6d_1 Flag2=1.
If any(qcountry,7,12,16,2057) and ~range(s6e_2,3,s6d_1)Flag3=1.
If(qcountry=1046) and ~range(s6e_2,2,s6d_1)Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

***************************************HVAR6.
If (sum(s6e_2 to s6e_5)<>hvar6_1) Flag1=1.
If (sum(s6e_4 to s6e_5)<>hvar6_2) Flag2=1.
If (sum(s6e_2 to s6e_4)<>hvar6_3) Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************S7.
tit S7.
temporary.
sel if miss(S7) or S7<>2.
list respid, S7.

***************************************S8FR.
If(qcountry=12) and (mis(S8FR) or ~range(S8FR,1,13))Flag1=1.
If(mis(qcountry) or qcountry<>12) and ~mis(S8FR)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************HS8FR.
If(s8fr=1) and (mis(hs8fr) or hs8fr<>1)Flag1=1.
If(s8fr=2) and (mis(hs8fr) or hs8fr<>2)Flag2=1.
If range(s8fr,4,6) and (mis(hs8fr) or hs8fr<>3)Flag3=1.
If any(s8fr,3,8) and (mis(hs8fr) or hs8fr<>4)Flag4=1.
If(s8fr=7) and (mis(hs8fr) or hs8fr<>5)Flag5=1.
If(s8fr=10) and (mis(hs8fr) or hs8fr<>6)Flag6=1.
If any(s8fr,12,13) and (mis(hs8fr) or hs8fr<>7)Flag7=1.
If any(s8fr,9,11) and (mis(hs8fr) or hs8fr<>8)Flag8=1.
If(qcountry=12) and (mis(HS8FR) or ~range(HS8FR,1,8))Flag9=1.
If(mis(qcountry) or qcountry<>12) and ~mis(HS8FR)Flag10=1.
temporary.
sel if sum(Flag1 to Flag10)>0.
list respid.
Del var Flag1 to Flag10.
EXECUTE.

***************************************S8DE.
If(qcountry=7) and (mis(S8DE) or ~range(S8DE,41,56))Flag1=1.
If(mis(qcountry) or qcountry<>7) and ~mis(S8DE)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************HS8DE.
If any(s8de,45,46,48,55) and (mis(hs8de) or hs8de<>1)Flag1=1.
If any(s8de,50,47,52,51) and (mis(hs8de) or hs8de<>2)Flag2=1.
If any(s8de,41,42) and (mis(hs8de) or hs8de<>3)Flag3=1.
If any(s8de,43,44,49,54,53,56) and (mis(hs8de) or hs8de<>4)Flag4=1.
If(qcountry=7) and (mis(hs8de) or ~range(hs8de,1,4))Flag5=1.
If(mis(qcountry) or qcountry<>7) and ~mis(hs8de)Flag6=1.
temporary.
sel if sum(Flag1 to Flag6)>0.
list respid.
Del var Flag1 to Flag6.
EXECUTE.

***************************************S8UK.
If(qcountry=2057) and (mis(S8UK) or ~range(S8UK,1,12))Flag1=1.
If(mis(qcountry) or qcountry<>2057) and ~mis(S8UK)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************S8BR.
If(qcountry=1046) and (mis(S8BR) or ~range(S8BR,1,10))Flag1=1.
If(mis(qcountry) or qcountry<>1046) and ~mis(S8BR)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************HS8BR.
If(S8BR=1) and (mis(hs8br) or hs8br<>1)Flag1=1.
If(S8BR=2) and (mis(hs8br) or hs8br<>2)Flag2=1.
If range(S8BR,3,10) and (mis(hs8br) or hs8br<>3)Flag3=1.
If(qcountry=1046) and (mis(hs8br) or ~range(hs8br,1,3))Flag4=1.
If(mis(qcountry) or qcountry<>1046) and ~mis(hs8br)Flag5=1.
temporary.
sel if sum(Flag1 to Flag5)>0.
list respid.
Del var Flag1 to Flag5.
EXECUTE.

***************************************S8IT.
If(qcountry=16) and (mis(S8IT) or ~range(S8IT,1,5))Flag1=1.
If(mis(qcountry) or qcountry<>16) and ~mis(S8IT)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************HS9.
If(s5=1) and (mis(hs9) or hs9<>1)Flag1=1.
If(mis(s5) or s5<>1) and (mis(hs9) or hs9<>2)Flag2=1.
If mis(hs9) or ~any(hs9,1,2)Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************A1A.
Do repeat x=a1a_1 to a1a_14/ y=a1a_2 to a1a_15.
If (a1a_1='')Flag1=1.
If x="" and y<>""Flag2=1.
end repeat.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************A1B.
Do repeat x=a1b_1 to a1b_14/ y=a1b_2 to a1b_15.
If (a1bdk_99=0) and (a1b_1='')Flag1=1.
If (a1bdk_99=0) and (x="" and y<>"")Flag2=1.
end repeat.
Do repeat x=a1b_1 to a1b_15.
If(a1bdk_99=1) and x<>'' Flag3=1.
end repeat.
If mis(a1bdk_99) or ~any(a1bdk_99,0,1)Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

***************************************A1C.
Do repeat x=a1c_1 to a1c_14/y=a1c_2 to a1c_15.
If (a1c_1='')Flag1=1.
If x="" and y<>""Flag2=1.
end repeat.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************A2A.
Do repeat x=a2a_1 a2a_2 a2a_6 a2a_7.
If mis(x) or ~range(x,1,9)Flag1=1.
end repeat.
If any(qcountry,7,12,16,2057) and (mis(a2a_3) or ~range(a2a_3,1,9))Flag2=1.
If(qcountry=1046) and ~mis(a2a_3)Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************HA2A_1.
If range(a2a_1,1,4) and (mis(ha2a_1_1) or ha2a_1_1<>1)Flag1=1.
If any(a2a_1,5,6,9) and (mis(ha2a_1_2) or ha2a_1_2<>1)Flag2=1.
If(a2a_1=5) and (mis(ha2a_1_5) or ha2a_1_5<>1)Flag3=1.
If any(a2a_1,6,9) and (mis(ha2a_1_6) or ha2a_1_6<>1)Flag4=1.
If any(a2a_1,7,8) and (mis(ha2a_1_3) or ha2a_1_3<>1)Flag5=1.
If(a2a_1=1) and (mis(ha2a_1_4) or ha2a_1_4<>1)Flag6=1.
If sum(ha2a_1_1 to ha2a_1_4)=0 Flag7=1.
temporary.
sel if sum(Flag1 to Flag7)>0.
list respid.
Del var Flag1 to Flag7.
EXECUTE.

***************************************HA2A_2.
If range(a2a_2,1,4) and (mis(ha2a_2_1) or ha2a_2_1<>1)Flag1=1.
If any(a2a_2,5,6,9) and (mis(ha2a_2_2) or ha2a_2_2<>1)Flag2=1.
If(a2a_2=5) and (mis(ha2a_2_5) or ha2a_2_5<>1)Flag3=1.
If any(a2a_2,6,9) and (mis(ha2a_2_6) or ha2a_2_6<>1)Flag4=1.
If any(a2a_2,7,8) and (mis(ha2a_2_3) or ha2a_2_3<>1)Flag5=1.
If(a2a_2=1) and (mis(ha2a_2_4) or ha2a_2_4<>1)Flag6=1.
If sum(ha2a_2_1 to ha2a_2_4)=0 Flag7=1.
temporary.
sel if sum(Flag1 to Flag7)>0.
list respid.
Del var Flag1 to Flag7.
EXECUTE.

***************************************HA2A_3.
If range(a2a_3,1,4) and (mis(ha2a_3_1) or ha2a_3_1<>1)Flag1=1.
If any(a2a_3,5,6,9) and (mis(ha2a_3_2) or ha2a_3_2<>1)Flag2=1.
If(a2a_3=5) and (mis(ha2a_3_5) or ha2a_3_5<>1)Flag3=1.
If any(a2a_3,6,9) and (mis(ha2a_3_6) or ha2a_3_6<>1)Flag4=1.
If any(a2a_3,7,8) and (mis(ha2a_3_3) or ha2a_3_3<>1)Flag5=1.
If(a2a_3=1) and (mis(ha2a_3_4) or ha2a_3_4<>1)Flag6=1.
If sum(ha2a_3_1 to ha2a_3_4)=0 Flag7=1.
temporary.
sel if sum(Flag1 to Flag7)>0.
list respid.
Del var Flag1 to Flag7.
EXECUTE.

***************************************HA2A_6.
If range(a2a_6,1,4) and (mis(ha2a_6_1) or ha2a_6_1<>1)Flag1=1.
If any(a2a_6,5,6,9) and (mis(ha2a_6_2) or ha2a_6_2<>1)Flag2=1.
If(a2a_6=5) and (mis(ha2a_6_5) or ha2a_6_5<>1)Flag3=1.
If any(a2a_6,6,9) and (mis(ha2a_6_6) or ha2a_6_6<>1)Flag4=1.
If any(a2a_6,7,8) and (mis(ha2a_6_3) or ha2a_6_3<>1)Flag5=1.
If(a2a_6=1) and (mis(ha2a_6_4) or ha2a_6_4<>1)Flag6=1.
If sum(ha2a_6_1 to ha2a_6_4)=0 Flag7=1.
temporary.
sel if sum(Flag1 to Flag7)>0.
list respid.
Del var Flag1 to Flag7.
EXECUTE.

***************************************HA2A_7.
If range(a2a_7,1,4) and (mis(ha2a_7_1) or ha2a_7_1<>1)Flag1=1.
If any(a2a_7,5,6,9) and (mis(ha2a_7_2) or ha2a_7_2<>1)Flag2=1.
If(a2a_7=5) and (mis(ha2a_7_5) or ha2a_7_5<>1)Flag3=1.
If any(a2a_7,6,9) and (mis(ha2a_7_6) or ha2a_7_6<>1)Flag4=1.
If any(a2a_7,7,8) and (mis(ha2a_7_3) or ha2a_7_3<>1)Flag5=1.
If(a2a_7=1) and (mis(ha2a_7_4) or ha2a_7_4<>1)Flag6=1.
If sum(ha2a_7_1 to ha2a_7_4)=0 Flag7=1.
temporary.
sel if sum(Flag1 to Flag7)>0.
list respid.
Del var Flag1 to Flag7.
EXECUTE.

***************************************B4.
Comp s6e_45=sum(s6e_4,s6e_5).
exe.

Do repeat x=b4x1_1 b4x1_2.
If(s6e_2>0) and (mis(x) or ~range(x,0,s6e_2))Flag1=1.
If(mis(s6e_2) or s6e_2<=0) and ~mis(x)Flag2=1.
end repeat.
Do repeat x=b4x2_1 b4x2_2.
If(s6e_3>0) and (mis(x) or ~range(x,0,s6e_3))Flag3=1.
If(mis(s6e_3) or s6e_3<=0) and ~mis(x)Flag4=1.
end repeat.
Do repeat x=b4x3_1 b4x3_2.
If(s6e_45>0) and (mis(x) or ~range(x,0,s6e_45))Flag5=1.
If(mis(s6e_45) or s6e_45<=0) and ~mis(x)Flag6=1.
end repeat.
If(sum(s6e_2,s6e_3,s6e_45)>0) and (sum(b4x1_1,b4x2_1,b4x3_1)<>b4xtot_1)Flag7=1.
If(sum(s6e_2,s6e_3,s6e_45)>0) and (sum(b4x1_2,b4x2_2,b4x3_2)<>b4xtot_2)Flag8=1.
temporary.
sel if sum(Flag1 to Flag8)>0.
list respid.
Del var s6e_45 to Flag8.
EXECUTE.

***************************************HVAR.
If (sum(s6e_2 to s6e_5) - b4xtot_1) <> hvar1_1 Flag1=1.
If (sum(s6e_2 to s6e_5) - b4xtot_2) <> hvar2_1 Flag2=1.
If (b4xtot_1<>hvar3_1) or (mis(b4xtot_1) and ~mis(hvar3_1)) or (~mis(b4xtot_1) and mis(hvar3_1))Flag3=1.
If (b4xtot_2<>hvar4_1) or (mis(b4xtot_2) and ~mis(hvar4_1)) or (~mis(b4xtot_2) and mis(hvar4_1))Flag4=1.
If ~mis(hvar5_1)Flag5=1.
temporary.
sel if sum(Flag1 to Flag5)>0.
list respid.
Del var Flag1 to Flag5.
EXECUTE.

***************************************B1b.
Do repeat x=b4x1_1 b4x1_2 b4x2_1 b4x2_2 b4x3_1 b4x3_2/y=hb1bx1_1 hb1bx1_2 hb1bx2_1 hb1bx2_2 hb1bx3_1 hb1bx3_2.
If(x>0) and ((x<>y) or (mis(x) and ~mis(y)) or (~mis(x) and mis(y)))Flag1=1.
If(mis(x) or x<=0) and ~mis(y)Flag2=1.
end repeat.
Do repeat x=b4x1_1 b4x1_2 b4x2_1 b4x2_2 b4x3_1 b4x3_2/y=b1bx1_1 b1bx1_2 b1bx2_1 b1bx2_2 b1bx3_1 b1bx3_2.
If(x>0) and (mis(y) or ~range(y,0,x))Flag3=1.
If(mis(x) or x<=0) and ~mis(y)Flag4=1.
end repeat.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

***************************************B10B2.
If(b4xtot_1<hvar6_1)B10B2_F1=1.
Filt by B10B2_F1.
!Rank_ALL_CHK svar=b10b2_1_1 evar=b10b2_98_1 qnt=B10B2F1 rank=1  opr=<.
!Rank_ALL_CHK svar=b10b2_1_1 evar=b10b2_98_1 qnt=B10B2F1 rank=5  opr=>.
Filt off.
Do repeat x=b10b2_1_1 to b10b2_98_1.
If mis(B10B2_F1) and ~mis(x)Flag1=1.
end repeat.
If range(b10b2_8_1,1,5) and (qcountry=7 and s3ade=3)Flag2=1.
If(range(b10b2_98_1,1,5) and b10b2_98_other_1='') or ((mis(b10b2_98_1) or ~range(b10b2_98_1,1,5)) and b10b2_98_other_1<>'')Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var B10B2_F1 to Flag3.
EXECUTE.

If(b4xtot_2<hvar6_1)B10B2_F2=1.
Filt by B10B2_F2.
!Rank_ALL_CHK svar=b10b2_1_2 evar=b10b2_98_2 qnt=B10B2F2 rank=1  opr=<.
!Rank_ALL_CHK svar=b10b2_1_2 evar=b10b2_98_2 qnt=B10B2F2 rank=5  opr=>.
Filt off.
Do repeat x=b10b2_1_2 to b10b2_98_2.
If mis(B10B2_F2) and ~mis(x)Flag1=1.
end repeat.
If range(b10b2_8_2,1,5) and (qcountry=7 and s3ade=3)Flag2=1.
If(range(b10b2_98_2,1,5) and b10b2_98_other_2='') or ((mis(b10b2_98_2) or ~range(b10b2_98_2,1,5)) and b10b2_98_other_2<>'')Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var B10B2_F2 to Flag3.
EXECUTE.

***************************************B5.
Do repeat x=b5_1 to b5_98.
If mis(x) or ~range(x,0,100)Flag1=1.
end repeat.
If sum(b5_1 to b5_98)<>100 Flag2=1.
If(range(b5_98,1,100) and b5g_98_other='') or ((mis(b5_98) or ~range(b5_98,1,100)) and b5g_98_other<>'')Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************B6A.
Do repeat x=b6a_1 to b6a_98.
If mis(x) or ~range(x,0,100)Flag1=1.
end repeat.
If sum(b6a_1 to b6a_98)<>100 Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var Flag1 to Flag2.
EXECUTE.

***************************************B6B.
tit B6b.
temporary.
sel if miss(B6b) or ~range(B6b,1,4).
list respid, B6b.

***************************************B7A.
tit B7a.
temporary.
sel if miss(B7a_1) or ~range(B7a_1,0,100).
list respid, B7a_1.

***************************************B7B.
Do repeat x=b7b_1 to b7b_3.
If range(b7a_1,0,99) and (mis(x) or ~range(x,0,100))Flag1=1.
If(mis(b7a_1) or ~range(b7a_1,0,99)) and ~mis(x)Flag2=1.
end repeat.
If range(b7a_1,0,99) and sum(b7b_1 to b7b_3)<>100 Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************B7C.
If(b7b_3>0)B7c_F=1.
Filt by B7c_F.
tit B7c.
temporary.
!MULTI_A svar=B7c_1 evar=B7c_98 qnt=B7c ctr= 6.
Filt off.
Do repeat x=B7c_1 to B7c_98.
If mis(B7c_F) and ~mis(x)Flag1=1.
end repeat.
If(B7c_98=1 and B7c_98_other='') or ((mis(B7c_98) or B7c_98<>1) and B7c_98_other<>'')Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var B7c_F to Flag2.
EXECUTE.

***************************************B8.
If any(qcountry,16,1046) and (b4xtot_1>0)B8_F=1.
If(B8_F=1) and (mis(B8) or ~range(B8,1,3,98,98))Flag1=1.
If mis(B8_F) and ~mis(B8)Flag2=1.
If(B8=3 and qcountry <>1046)Flag3=1.
If(B8=98 and B8_98_other='') or ((mis(B8) or B8<>98) and B8_98_other<>'')Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var B8_F to Flag4.
EXECUTE.

***************************************B10B.
If(b4xtot_1>0 and b10bdkx1_99=0)B10B_F=1.
Do repeat x=b10bx1_1 to b10bx1_4.
If(B10B_F=1) and (mis(x) or ~range(x,0,b4xtot_1))Flag1=1.
If mis(B10B_F) and ~mis(x)Flag2=1.
end repeat.
If(b4xtot_1>0) and (mis(b10bdkx1_99) or ~any(b10bdkx1_99,0,1))Flag3=1.
If(mis(b4xtot_1) or b4xtot_1<=0) and ~mis(b10bdkx1_99)Flag4=1.
If(B10B_F=1) and (sum(b10bx1_1 to b10bx1_4)<>b4xtot_1)Flag5=1.
temporary.
sel if sum(Flag1 to Flag5)>0.
list respid.
Del var B10B_F to Flag5.
EXECUTE.

If(b4xtot_2>0 and b10bdkx2_99=0)B10B_F=1.
Do repeat x=b10bx2_1 to b10bx2_4.
If(B10B_F=1) and (mis(x) or ~range(x,0,b4xtot_2))Flag1=1.
If mis(B10B_F) and ~mis(x)Flag2=1.
end repeat.
If(b4xtot_2>0) and (mis(b10bdkx2_99) or ~any(b10bdkx2_99,0,1))Flag3=1.
If(mis(b4xtot_2) or b4xtot_2<=0) and ~mis(b10bdkx2_99)Flag4=1.
If(B10B_F=1) and (sum(b10bx2_1 to b10bx2_4)<>b4xtot_2)Flag5=1.
temporary.
sel if sum(Flag1 to Flag5)>0.
list respid.
Del var B10B_F to Flag5.
EXECUTE.

***************************************HC4ORDER.
If(s6e_1>0)hc4order_F=1.
Filt by hc4order_F.
!Rank_ALL_CHK svar=hc4order_1 evar=hc4order_3 qnt=hc4order rank=3  opr= ~=.
Filt off.
Do repeat x=hc4order_1 to hc4order_3.
If mis(hc4order_F) and ~mis(x)Flag=1.
end repeat.
temporary.
sel if Flag=1.
list respid.
Del var hc4order_F to Flag.
EXECUTE.

***************************************C4.
If(s6e_1>0 and ~any(qcountry,1046,2057))C4_F1=1.
If(s6e_1>0 and qcountry<>2057)C4_F2=1.
If(s6e_1>0 and qcountry<>1046)C4_F3=1.
exe.

Do repeat x=c4_1 c4_2 c4_4 c4_5 c4_7 c4_14 c4_12 c4_98.
If(s6e_1>0) and (mis(x) or ~range(x,0,s6e_1))Flag1=1.
If(mis(s6e_1) or s6e_1<=0) and ~mis(x)Flag2=1.
end repeat.
If(C4_F1=1) and (mis(c4_3) or ~range(c4_3,0,s6e_1))Flag3=1.
If mis(C4_F1) and ~mis(c4_3)Flag4=1.
If(C4_F2=1) and (mis(c4_6) or ~range(c4_6,0,s6e_1))Flag5=1.
If mis(C4_F2) and ~mis(c4_6)Flag6=1.
If(C4_F3=1) and (mis(c4_9) or ~range(c4_9,0,s6e_1))Flag7=1.
If mis(C4_F3) and ~mis(c4_9)Flag8=1.
If(s6e_1>0) and (sum(c4_1 to c4_98)<>s6e_1)Flag9=1.
If (range(c4_98,1,s6e_1) and c4g_98_other='') or ((mis(c4_98) or ~range(c4_98,1,s6e_1)) and c4g_98_other<>'')Flag10=1.
temporary.
sel if sum(Flag1 to Flag10)>0.
list respid.
Del var C4_F1 to Flag10.
EXECUTE.

***************************************C5a.
If(b1bx1_1>0 and ~any(qcountry,1046,2057))C5a_F1=1.
If(b1bx1_1>0 and qcountry<>2057)C5a_F2=1.
exe.
Do repeat x=c5ax1_1 c5ax1_2 c5ax1_4 c5ax1_5 c5ax1_7 to c5ax1_98.
If(b1bx1_1>0) and (mis(x) or ~range(x,0,b1bx1_1))Flag1=1.
If(mis(b1bx1_1) or b1bx1_1<=0) and ~mis(x)Flag2=1.
end repeat.
If(C5a_F1=1) and (mis(c5ax1_3) or ~range(c5ax1_3,0,b1bx1_1))Flag3=1.
If mis(C5a_F1) and ~mis(c5ax1_3)Flag4=1.
If(C5a_F2=1) and (mis(c5ax1_6) or ~range(c5ax1_6,0,b1bx1_1))Flag5=1.
If mis(C5a_F2) and ~mis(c5ax1_6)Flag6=1.
If(b1bx1_1>0) and (sum(c5ax1_1 to c5ax1_98)<>b1bx1_1)Flag7=1.
temporary.
sel if sum(Flag1 to Flag7)>0.
list respid.
Del var C5a_F1 to Flag7.
EXECUTE.

If(b1bx2_1>0 and ~any(qcountry,1046,2057))C5a_F1=1.
If(b1bx2_1>0 and qcountry<>2057)C5a_F2=1.
exe.
Do repeat x=c5ax2_1 c5ax2_2 c5ax2_4 c5ax2_5 c5ax2_7 to c5ax2_98.
If(b1bx2_1>0) and (mis(x) or ~range(x,0,b1bx2_1))Flag1=1.
If(mis(b1bx2_1) or b1bx2_1<=0) and ~mis(x)Flag2=1.
end repeat.
If(C5a_F1=1) and (mis(c5ax2_3) or ~range(c5ax2_3,0,b1bx2_1))Flag3=1.
If mis(C5a_F1) and ~mis(c5ax2_3)Flag4=1.
If(C5a_F2=1) and (mis(c5ax2_6) or ~range(c5ax2_6,0,b1bx2_1))Flag5=1.
If mis(C5a_F2) and ~mis(c5ax2_6)Flag6=1.
If(b1bx2_1>0) and (sum(c5ax2_1 to c5ax2_98)<>b1bx2_1)Flag7=1.
temporary.
sel if sum(Flag1 to Flag7)>0.
list respid.
Del var C5a_F1 to Flag7.
EXECUTE.

If(c5ax1_98>0 or c5ax2_98>0)C5a_Other=1.
If(C5a_Other=1 and c5ag_98_other='') or (mis(C5a_Other) and c5ag_98_other<>'')Flag=1.
temporary.
sel if Flag=1.
list respid.
Del var C5a_Other to Flag.
EXECUTE.

***************************************HC5ASOFT.
tit hC5asoft.
temporary.
sel if ~miss(hC5asoft_1).
list respid, hC5asoft_1.

***************************************ER1.
If(c5ax1_10>0 or c5ax2_10>0) and (a2a_6=2)ER1_F=1.
If(ER1_F=1) and (miss(ER1) or ~range(ER1,5,9))Flag1=1.
If mis(ER1_F) and ~mis(ER1)Flag2=1.
temporary.
sel if sum(Flag1 to Flag2)>0.
list respid.
Del var ER1_F to Flag2.
EXECUTE.

***************************************HIDPREA2A.
If range(er1,5,9) and (mis(hidprea2a) or ~range(hidprea2a,1,9))Flag1=1.
If(mis(er1) or ~range(er1,5,9)) and ~mis(hidprea2a)Flag2=1.
If range(er1,5,9) and ((a2a_6<>hidprea2a) or (mis(a2a_6) and ~mis(hidprea2a)) or (~mis(a2a_6) and mis(hidprea2a)))Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************HIDNEWA2A.
If range(er1,5,9) and (mis(hidnewa2a) or ~range(hidnewa2a,1,9))Flag1=1.
If(mis(er1) or ~range(er1,5,9)) and ~mis(hidnewa2a)Flag2=1.
If range(er1,5,9) and ((er1<>hidnewa2a) or (mis(er1) and ~mis(hidnewa2a)) or (~mis(er1) and mis(hidnewa2a)))Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************C5b.
If(b1bx1_2>0 and ~any(qcountry,2057,1046))C5b_F1=1.
If(b1bx1_2>0 and qcountry<>2057)C5b_F2=1.
If(b1bx1_2>0 and qcountry<>1046)C5b_F3=1.
exe.
Do repeat x=c5bx1_1 c5bx1_2 c5bx1_4 c5bx1_5 c5bx1_7 to c5bx1_98.
If(b1bx1_2>0) and (mis(x) or ~range(x,0,b1bx1_2))Flag1=1.
If(mis(b1bx1_2) or b1bx1_2<=0) and ~mis(x)Flag2=1.
end repeat.
If(C5b_F1=1) and (mis(c5bx1_3) or ~range(c5bx1_3,0,b1bx1_2))Flag3=1.
If mis(C5b_F1) and ~mis(c5bx1_3)Flag4=1.
If(C5b_F2=1) and (mis(c5bx1_6) or ~range(c5bx1_6,0,b1bx1_2))Flag5=1.
If mis(C5b_F2) and ~mis(c5bx1_6)Flag6=1.
If(C5b_F3=1) and (mis(c5bx1_11) or ~range(c5bx1_11,0,b1bx1_2))Flag7=1.
If mis(C5b_F3) and ~mis(c5bx1_11)Flag8=1.
If(b1bx1_1>0) and (sum(c5bx1_1 to c5bx1_98)<>b1bx1_2)Flag9=1.
temporary.
sel if sum(Flag1 to Flag9)>0.
list respid.
Del var C5b_F1 to Flag9.
EXECUTE.

If(b1bx2_2>0 and ~any(qcountry,2057,1046))C5a_F1=1.
If(b1bx2_2>0 and qcountry<>2057)C5a_F2=1.
If(b1bx2_2>0 and qcountry<>1046)C5a_F3=1.
exe.
Do repeat x=c5bx2_1 c5bx2_2 c5bx2_4 c5bx2_5 c5bx2_7 to c5bx2_98.
If(b1bx2_2>0) and (mis(x) or ~range(x,0,b1bx2_2))Flag1=1.
If(mis(b1bx2_2) or b1bx2_2<=0) and ~mis(x)Flag2=1.
end repeat.
If(C5a_F1=1) and (mis(c5bx2_3) or ~range(c5bx2_3,0,b1bx2_2))Flag3=1.
If mis(C5a_F1) and ~mis(c5bx2_3)Flag4=1.
If(C5a_F2=1) and (mis(c5bx2_6) or ~range(c5bx2_6,0,b1bx2_2))Flag5=1.
If mis(C5a_F2) and ~mis(c5bx2_6)Flag6=1.
If(C5a_F3=1) and (mis(c5bx2_11) or ~range(c5bx2_11,0,b1bx2_2))Flag7=1.
If mis(C5a_F3) and ~mis(c5bx2_11)Flag8=1.
If(b1bx2_2>0) and (sum(c5bx2_1 to c5bx2_98)<>b1bx2_2)Flag9=1.
temporary.
sel if sum(Flag1 to Flag9)>0.
list respid.
Del var C5a_F1 to Flag9.
EXECUTE.

If(c5bx1_98>0 or c5bx2_98>0)C5b_Other=1.
If(C5b_Other=1 and c5bg_98_other='') or (mis(C5b_Other) and c5bg_98_other<>'')Flag=1.
temporary.
sel if Flag=1.
list respid.
Del var C5b_Other to Flag.
EXECUTE.

***************************************C8.
If sum(b1bx1_1,b1bx2_1,b1bx3_1)>0 C8_F1=1.
If sum(b1bx1_2,b1bx2_2,b1bx3_2)>0 C8_F2=1.
If(C8_F1=1) and (mis(C8x1) or ~range(C8x1,1,3))Flag1=1.
If mis(C8_F1) and ~mis(C8x1)Flag2=1.
If(C8_F2=1) and (mis(C8x2) or ~range(C8x2,1,3))Flag3=1.
If mis(C8_F2) and ~mis(C8x2)Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var C8_F1 to Flag4.
EXECUTE.

***************************************C10A.
If mis(c10a) or ~any(c10a,1,5,6,7,10,15,98)Flag1=1.
If(c10a=6 and qcountry=2057)Flag2=1.
If(c10a=98 and c10a_98_other='') or ((mis(c10a) or c10a<>98) and c10a_98_other<>'')Flag3=1.
temporary.
sel if sum(Flag1 to Flag3)>0.
list respid.
Del var Flag1 to Flag3.
EXECUTE.

***************************************C11A.
If mis(c11a) or ~any(c11a,1,5,6,7,8,11,15,98)Flag1=1.
If(c11a=6 and qcountry=2057)Flag2=1.
If(c11a=11 and qcountry=1046)Flag3=1.
If(c11a=98 and c11a_98_other='') or ((mis(c11a) or c11a<>98) and c11a_98_other<>'')Flag4=1.
temporary.
sel if sum(Flag1 to Flag4)>0.
list respid.
Del var Flag1 to Flag4.
EXECUTE.

***************************************B15.
tit B15.
temporary.
sel if miss(B15_1) or ~range(B15_1,0,100).
list respid, B15_1.


