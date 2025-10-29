* Encoding: UTF-8.
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

/************************************************SECTION D – PRODUCT PERCEPTIONS AND DRIVERS FOR USE / BRAND EQUITY******.

***************************************DESIGNARRAY.
tit DesignArray.
 * tit designarray_1 to designarray_80.
 * do repeat x=designarray_1 to designarray_80.
 * if(~miss(x))flg=1.
 * end repeat.
 * freq flg.
 * DELETE VARIABLES flg.

tit hidordloop.

!Rank_ALL_CHK svar=hidordloop_1 evar=hidordloop_8 qnt=hidordloop rank=8  opr= ~=.    

do repeat x=hidordloop_1 to hidordloop_8.
if(miss(x) or ~range(x,1,8))flg=1.
end repeat.
freq flg.
DELETE VARIABLES flg.

***************************************HIDVERSION.
tit hidVersion.
temporary.
sel if miss(hidVersion) or ~range(hidVersion,1,10).
list respid, hidVersion.

/*******************************Maxdiff syntax***************.

VARSTOCASES
/make	hidc1st_1_1	from	hidc1st_1_1	hidc1st_1_2	hidc1st_1_3	hidc1st_1_4	hidc1st_1_5	hidc1st_1_6	hidc1st_1_7	hidc1st_1_8
/make	hidc1st_2_1	from	hidc1st_2_1	hidc1st_2_2	hidc1st_2_3	hidc1st_2_4	hidc1st_2_5	hidc1st_2_6	hidc1st_2_7	hidc1st_2_8
/make	hidc1st_3_1	from	hidc1st_3_1	hidc1st_3_2	hidc1st_3_3	hidc1st_3_4	hidc1st_3_5	hidc1st_3_6	hidc1st_3_7	hidc1st_3_8
/make	hidc1st_4_1	from	hidc1st_4_1	hidc1st_4_2	hidc1st_4_3	hidc1st_4_4	hidc1st_4_5	hidc1st_4_6	hidc1st_4_7	hidc1st_4_8
/make	hidc1st_5_1	from	hidc1st_5_1	hidc1st_5_2	hidc1st_5_3	hidc1st_5_4	hidc1st_5_5	hidc1st_5_6	hidc1st_5_7	hidc1st_5_8
/make	hbegintime_1	from	hbegintime_1	hbegintime_2	hbegintime_3	hbegintime_4	hbegintime_5	hbegintime_6	hbegintime_7	hbegintime_8
/make	hleast_1	from	hleast_1	hleast_2	hleast_3	hleast_4	hleast_5	hleast_6	hleast_7	hleast_8
/make	hmost_1	from	hmost_1	hmost_2	hmost_3	hmost_4	hmost_5	hmost_6	hmost_7	hmost_8
/make	hendtime_1	from	hendtime_1	hendtime_2	hendtime_3	hendtime_4	hendtime_5	hendtime_6	hendtime_7	hendtime_8
/make	hidelapsedtime_1_1	from	hidelapsedtime_1_1	hidelapsedtime_1_2	hidelapsedtime_1_3	hidelapsedtime_1_4	hidelapsedtime_1_5	hidelapsedtime_1_6	hidelapsedtime_1_7	hidelapsedtime_1_8
/make	d1mostcode_1	from	d1mostcode_1	d1mostcode_2	d1mostcode_3	d1mostcode_4	d1mostcode_5	d1mostcode_6	d1mostcode_7	d1mostcode_8
/make	d1leastcode_1	from	d1leastcode_1	d1leastcode_2	d1leastcode_3	d1leastcode_4	d1leastcode_5	d1leastcode_6	d1leastcode_7	d1leastcode_8
/index  chart(8)
/keep = all.


do repeat
x=1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 7 7 7 7 7 7 7 7 8 8 8 8 8 8 8 8 9 9 9 9 9 9 9 9 10 10 10 10 10 10 10 10
/x1=1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
/x2=10 6 4 9 1 7 13 11 1 7 12 3 5 11 8 2 12 3 8 6 9 10 5 4 4 9 10 2 6 13 11 8 13 11 1 5 2 12 3 7 12 6 10 2 4 1 5 7 4 8 2 9 3 1 13 5 3 11 9 10 2 8 7 12 8 12 4 10 7 13 6 9 1 13 3 11 12 6 5 5
/x3=2 1 13 12 11 5 8 6 13 8 9 5 4 3 10 9 10 9 7 12 11 4 1 6 6 7 2 11 5 3 1 12 7 8 2 3 13 5 2 4 3 8 13 4 10 2 11 10 7 6 7 4 1 5 12 9 9 1 10 11 4 3 6 13 13 11 2 8 8 12 12 5 11 6 1 10 3 13 7 9
/x4=11 7 2 10 3 12 5 1 10 9 1 6 7 6 13 4 8 5 13 4 7 11 9 2 3 8 13 3 4 12 9 5 10 3 6 12 8 11 10 2 1 2 9 11 8 7 13 5 8 1 10 12 6 4 3 6 2 13 7 12 9 11 4 5 6 1 3 5 2 1 10 11 4 12 8 13 7 9 1 3
/x5=12 5 7 8 4 10 4 2 6 3 13 8 11 9 1 5 2 10 6 3 2 8 13 7 7 12 5 1 9 11 10 7 11 4 13 10 6 1 1 9 4 12 1 3 9 5 3 6 13 12 11 2 9 8 10 12 6 4 13 8 1 5 12 2 3 7 7 6 4 5 11 3 10 7 9 2 8 11 2 10
/x6=13 9 3 6 8 3 9 5 4 2 11 2 12 10 7 12 1 13 11 1 10 5 3 12 10 1 4 7 8 6 2 13 6 9 5 7 9 4 8 12 13 11 7 6 12 8 9 4 11 3 5 13 7 10 2 11 5 8 6 3 10 7 1 8 10 9 13 1 9 3 2 4 6 5 2 4 4 8 11 12
.
if (hidversion=x and chart=x1 and (hidc1st_1_1~=x2 or hidc1st_2_1~=x3 or hidc1st_3_1~=x4 or hidc1st_4_1~=x5 or 
hidc1st_5_1~=x6 )) flag=1.
if (hidversion=x and chart=x1 and (miss(hidc1st_1_1) or miss(hidc1st_2_1) or miss(hidc1st_3_1) or miss(hidc1st_4_1) or 
miss(hidc1st_5_1) or ~any(d1mostcode_1,x2,x3,x4,x5,x6) or ~any(d1leastcode_1,x2,x3,x4,x5,x6))) flag=2.
end repeat.

TEMPORARY.
SELECT IF flag>0.
list respid flag.
DELETE VARIABLES flag.

 * /*checking wih SP.

 * do repeat
x=1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 7 7 7 7 7 7 7 7 8 8 8 8 8 8 8 8 9 9 9 9 9 9 9 9 10 10 10 10 10 10 10 10
/x1=1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
/x2=10 6 4 9 1 7 13 11 1 7 12 3 5 11 8 2 12 3 8 6 9 10 5 4 4 9 10 2 6 13 11 8 13 11 1 5 2 12 3 7 12 6 10 2 4 1 5 7 4 8 2 9 3 1 13 5 3 11 9 10 2 8 7 12 8 12 4 10 7 13 6 9 1 13 3 11 12 6 5 5
/x3=2 1 13 12 11 5 8 6 13 8 9 5 4 3 10 9 10 9 7 12 11 4 1 6 6 7 2 11 5 3 1 12 7 8 2 3 13 5 2 4 3 8 13 4 10 2 11 10 7 6 7 4 1 5 12 9 9 1 10 11 4 3 6 13 13 11 2 8 8 12 12 5 11 6 1 10 3 13 7 9
/x4=11 7 2 10 3 12 5 1 10 9 1 6 7 6 13 4 8 5 13 4 7 11 9 2 3 8 13 3 4 12 9 5 10 3 6 12 8 11 10 2 1 2 9 11 8 7 13 5 8 1 10 12 6 4 3 6 2 13 7 12 9 11 4 5 6 1 3 5 2 1 10 11 4 12 8 13 7 9 1 3
/x5=12 5 7 8 4 10 4 2 6 3 13 8 11 9 1 5 2 10 6 3 2 8 13 7 7 12 5 1 9 11 10 7 11 4 13 10 6 1 1 9 4 12 1 3 9 5 3 6 13 12 11 2 9 8 10 12 6 4 13 8 1 5 12 2 3 7 7 6 4 5 11 3 10 7 9 2 8 11 2 10
/x6=13 9 3 6 8 3 9 5 4 2 11 2 12 10 7 12 1 13 11 1 10 5 3 12 10 1 4 7 8 6 2 13 6 9 5 7 9 4 8 12 13 11 7 6 12 8 9 4 11 3 5 13 7 10 2 11 5 8 6 3 10 7 1 8 10 9 13 1 9 3 2 4 6 5 2 4 4 8 11 12
.
 * if (hidversion=x and chart=x1 and (~any(hleast_1,x2,x3,x4,x5,x6) or ~any(hmost_1,x2,x3,x4,x5,x6))) flag=1.
 * end repeat.
 * freq flag.
 * DELETE VARIABLES flag.

tit hleast to d1leastcode_1.
if(miss(hleast_1) or ~range(hleast_1,1,5))flg=1.
if(miss(hmost_1) or ~range(hmost_1,1,5))flg=2.
if(hbegintime_1='')flg=4.
if(hendtime_1='')flg=5.
if(miss(hidelapsedtime_1_1) or hidelapsedtime_1_1<0)flg=6.
if(miss(d1mostcode_1) or miss(d1leastcode_1))flg=7.
if(d1leastcode_1=d1mostcode_1)flg=8.
if(hleast_1=hmost_1)flg=9.
freq flg.
DELETE VARIABLES flg.


***************************************D2.
tit D2.
if(a2a_6>3)flg1=1.
if(a2a_2>3)flg2=1.
if(a2a_3>3 and qcountry<>1046)flg3=1.

do repeat x=D2_1 to D2_3/y=flg1 to flg3.
if(y>0 and (miss(x) or ~range(x,0,10)))fil1=1.
if(sum(y,0)=0 and (~miss(x) or range(x,0,10)))fil2=1.
end repeat.
freq fil1,fil2.
DELETE VARIABLES fil1,fil2 flg1 to flg3.

temporary.
sel if miss(D2_4) or ~range(D2_4,0,10).
list respid, D2_4.

***************************************HD2.
tit HD2.
do repeat x=d2_1 to d2_4/y=hd2_1 to hd2_4.
if(range(x,9,10) and (miss(y) or y<>1))flg1=1.
 if(range(x,7,8) and (miss(y) or y<>2))flg2=1.
if(range(x,0,6) and (miss(y) or y<>3))flg3=1.
if(miss(x) and ~miss(y))flg4=1.
end repeat.
freq flg1 to flg4.
DELETE VARIABLES flg1 to flg4.

***************************************D3.
tit D3.

if(sum(ha2a_6_2,ha2a_6_3)>0)flg1=1.
if(sum(ha2a_2_2,ha2a_2_3)>0)flg2=1.
if(sum(ha2a_3_2,ha2a_3_3)>0 and qcountry<>1046)flg3=1.
exe.

do repeat x=D3_1 to D3_3/y=flg1 to flg3.
if(y>0 and (miss(x) or ~range(x,0,10)))fil1=1.
if(sum(y,0)=0 and (~miss(x) or range(x,0,10)))fil2=1.
end repeat.
freq fil1,fil2.
DELETE VARIABLES fil1,fil2 flg1 to flg3.


temporary.
sel if miss(D3_4) or ~range(D3_4,0,10).
list respid, D3_4.

***************************************D5.
tit D5.
if(a2a_6>1)flg1=1.
if(a2a_2>1)flg2=1.
if(a2a_3>1 and qcountry<>1046)flg3=1.

do repeat x=d5_1_1 d5_2_1 d5_3_1 d5_1_2 d5_2_2 d5_3_2 d5_1_5 d5_2_5 d5_3_5 d5_1_6 d5_2_6 d5_3_6 d5_1_7 d5_2_7 d5_3_7 d5_1_8 d5_2_8 d5_3_8 d5_1_9 d5_2_9 d5_3_9 d5_1_10
d5_2_10 d5_3_10 d5_1_11 d5_2_11 d5_3_11 d5_1_12 d5_2_12 d5_3_12 d5_1_13 d5_2_13 d5_3_13 d5_1_14 d5_2_14 d5_3_14 d5_1_4 d5_2_4 d5_3_4 
/y=flg1 flg2 flg3 flg1  flg2 flg3 flg1  flg2 flg3 flg1  flg2 flg3 flg1  flg2 flg3 flg1  flg2 flg3 flg1  flg2 flg3 flg1  flg2 flg3 flg1  flg2 flg3 flg1  flg2 flg3 flg1  flg2 
flg3 flg1  flg2 flg3 flg1 flg2 flg3.
if(y>0 and (miss(x) or ~range(x,1,7)))fil1=1.
if(sum(y,0)=0 and (~miss(x) or range(x,1,7)))fil2=1.
end repeat.
freq fil1,fil2.
DELETE VARIABLES fil1,fil2 flg1 to flg3.

do repeat x=d5_4_1 d5_4_2  d5_4_4 d5_4_5 d5_4_6 d5_4_7 d5_4_8 d5_4_9 d5_4_10 d5_4_11 d5_4_12 d5_4_13 d5_4_14.
if(miss(x) or ~range(x,1,7))flg=1.
end repeat.
freq flg.
DELETE VARIABLES flg.



/******************************SECTION 7 – PRF Section************.

***************************************HP0A.
tit hP0a.
do repeat x=hp0a_1 to hp0a_3/y=b1bx1_1 b1bx2_1 b1bx3_1.
if(y>0 and (miss(x) or x<>y))flg1=1.
if(sum(y,0)=0 and ~miss(x))flg2=1.
end repeat.
freq flg1 to flg2.
DELETE VARIABLES flg1 to flg2.

***************************************P0A.
tit P0a.
do repeat z=hp0a_1 to hp0a_3/y=b1bx1_1 b1bx2_1 b1bx3_1/x=p0a_1 to p0a_3.
if(y>0 and (miss(x) or ~range(x,0,y)))flg1=1.
if(sum(y,0)=0 and ~miss(x))flg2=1.
end repeat.
 * if(sum(p0a_1 to p0a_3)=0)flg2=2.
freq flg1 to flg2.
DELETE VARIABLES flg1 to flg2.

***************************************HP0.
tit HP0.
temporary.
sel if miss(HP0) or ~range(HP0,1,4).
list respid, HP0.

if(sum(p0a_1 to p0a_3)=0 and  HP0<>1)flg=1.
if(sum(p0a_1 to p0a_3)=1 and  HP0<>2)flg=2.
if(sum(p0a_1 to p0a_3)=2 and  HP0<>3)flg=3.
if(sum(p0a_1 to p0a_3)>=3 and  HP0<>4)flg=4.
freq flg.
DELETE VARIABLES flg.

***************************************HPTS.
tit hPTs.
temporary.
sel if rang(HP0,2,4) and (miss(hPTs) or ~range(hPTs,1,3)) or (~range(HP0,2,4) and ~miss(hPTs) ).
list respid, hPTs.

if(HP0=2 and hPTs<>1)flg=1.
if(HP0=3 and hPTs<>2)flg=2.
if(HP0=4 and hPTs<>3)flg=3.
freq flg.
DELETE VARIABLES flg.

do repeat x=qbegintimeloop_1 loop_id_1/y=qbegintimeloop_2 loop_id_2/z=qbegintimeloop_3 loop_id_3.
if((hPTs=1 and x='') or (sum(hPTs,0)<>1 and x<>''))flg1=1.
if((hPTs=2 and y='') or (sum(hPTs,0)<>2 and y<>''))flg2=1.
if((hPTs=3 and z='') or (sum(hPTs,0)<>3 and z<>''))flg3=1.
end repeat.
freq flg1 to flg3.
DELETE VARIABLES flg1 to flg3.




/***********************************************Stacking***********************************************.

VARSTOCASES
/make	hp0a_1	from 	hp0a_1	hp0a_2	hp0a_3
/make	p0a_1	from 	p0a_1	p0a_2	p0a_3
/make	qbegintimeloop_1	from 	qbegintimeloop_1	qbegintimeloop_2	qbegintimeloop_3
/make	loop_id_1	from 	loop_id_1	loop_id_2	loop_id_3
/make	p1a_1	from 	p1a_1	p1a_2	p1a_3
/make	p1a1_1	from 	p1a1_1	p1a1_2	p1a1_3
/make	p1b_1	from 	p1b_1	p1b_2	p1b_3
/make	p1b_4_other_1	from 	p1b_4_other_1	p1b_4_other_2	p1b_4_other_3
/make	p1_1	from 	p1_1	p1_2	p1_3
/make	p2_1	from 	p2_1	p2_2	p2_3
/make	p3_1_1	from 	p3_1_1	p3_1_2	p3_1_3
/make	p3_2_1	from 	p3_2_1	p3_2_2	p3_2_3
/make	p3_3_1	from 	p3_3_1	p3_3_2	p3_3_3
/make	p3_4_1	from 	p3_4_1	p3_4_2	p3_4_3
/make	p3_5_1	from 	p3_5_1	p3_5_2	p3_5_3
/make	p3_6_1	from 	p3_6_1	p3_6_2	p3_6_3
/make	p3_7_1	from 	p3_7_1	p3_7_2	p3_7_3
/make	p3_8_1	from 	p3_8_1	p3_8_2	p3_8_3
/make	p3_9_1	from 	p3_9_1	p3_9_2	p3_9_3
/make	p3_98_1	from 	p3_98_1	p3_98_2	p3_98_3
/make	p3_99_1	from 	p3_99_1	p3_99_2	p3_99_3
/make	p3_98_other_1	from 	p3_98_other_1	p3_98_other_2	p3_98_other_3
/make	p4_1	from 	p4_1	p4_2	p4_3
/make	p5m_1_1	from 	p5m_1_1	p5m_1_2	p5m_1_3
/make	p5y_1_1	from 	p5y_1_1	p5y_1_2	p5y_1_3
/make	hp8_1	from 	hp8_1	hp8_2	hp8_3
/make	ndate_1_1	from 	ndate_1_1	ndate_1_2	ndate_1_3
/make	p7_1	from 	p7_1	p7_2	p7_3
/make	p7_6_other_1	from 	p7_6_other_1	p7_6_other_2	p7_6_other_3
/make	p8_1_1	from 	p8_1_1	p8_1_2	p8_1_3
/make	p8_2_1	from 	p8_2_1	p8_2_2	p8_2_3
/make	p8_3_1	from 	p8_3_1	p8_3_2	p8_3_3
/make	p8_4_1	from 	p8_4_1	p8_4_2	p8_4_3
/make	p8_5_1	from 	p8_5_1	p8_5_2	p8_5_3
/make	p9_1_1	from 	p9_1_1	p9_1_2	p9_1_3
/make	p10_1	from 	p10_1	p10_2	p10_3
/make	p11_1_1	from 	p11_1_1	p11_1_2	p11_1_3
/make	p12_1_1	from 	p12_1_1	p12_1_2	p12_1_3
/make	p12_2_1	from 	p12_2_1	p12_2_2	p12_2_3
/make	p12_3_1	from 	p12_3_1	p12_3_2	p12_3_3
/make	p12_4_1	from 	p12_4_1	p12_4_2	p12_4_3
/make	p12_6_1	from 	p12_6_1	p12_6_2	p12_6_3
/make	p12_7_1	from 	p12_7_1	p12_7_2	p12_7_3
/make	p12_8_1	from 	p12_8_1	p12_8_2	p12_8_3
/make	p12_9_1	from 	p12_9_1	p12_9_2	p12_9_3
/make	p12_10_1	from 	p12_10_1	p12_10_2	p12_10_3
/make	p12a_1_1	from 	p12a_1_1	p12a_1_2	p12a_1_3
/make	p12a_2_1	from 	p12a_2_1	p12a_2_2	p12a_2_3
/make	p12a_3_1	from 	p12a_3_1	p12a_3_2	p12a_3_3
/make	p12a_4_1	from 	p12a_4_1	p12a_4_2	p12a_4_3
/make	p12a_6_1	from 	p12a_6_1	p12a_6_2	p12a_6_3
/make	p12a_7_1	from 	p12a_7_1	p12a_7_2	p12a_7_3
/make	p12a_8_1	from 	p12a_8_1	p12a_8_2	p12a_8_3
/make	p12a_9_1	from 	p12a_9_1	p12a_9_2	p12a_9_3
/make	p12a_10_1	from 	p12a_10_1	p12a_10_2	p12a_10_3
/make	p12a_11_1	from 	p12a_11_1	p12a_11_2	p12a_11_3
/make	p12b_1_1	from 	p12b_1_1	p12b_1_2	p12b_1_3
/make	p12b_2_1	from 	p12b_2_1	p12b_2_2	p12b_2_3
/make	p12b_3_1	from 	p12b_3_1	p12b_3_2	p12b_3_3
/make	p12b_4_1	from 	p12b_4_1	p12b_4_2	p12b_4_3
/make	p12b_6_1	from 	p12b_6_1	p12b_6_2	p12b_6_3
/make	p12b_7_1	from 	p12b_7_1	p12b_7_2	p12b_7_3
/make	p12b_8_1	from 	p12b_8_1	p12b_8_2	p12b_8_3
/make	p12b_9_1	from 	p12b_9_1	p12b_9_2	p12b_9_3
/make	p12b_10_1	from 	p12b_10_1	p12b_10_2	p12b_10_3
/make	p12b_11_1	from 	p12b_11_1	p12b_11_2	p12b_11_3
/make	p13_1	from 	p13_1	p13_2	p13_3
/make	p13oe_1_1	from 	p13oe_1_1	p13oe_1_2	p13oe_1_3
/make	p13s_1_1	from 	p13s_1_1	p13s_1_2	p13s_1_3
/make	p13s_2_1	from 	p13s_2_1	p13s_2_2	p13s_2_3
/make	p13s_3_1	from 	p13s_3_1	p13s_3_2	p13s_3_3
/make	p13s_4_1	from 	p13s_4_1	p13s_4_2	p13s_4_3
/make	p13s_5_1	from 	p13s_5_1	p13s_5_2	p13s_5_3
/make	p13s_6_1	from 	p13s_6_1	p13s_6_2	p13s_6_3
/make	p13s_98_1	from 	p13s_98_1	p13s_98_2	p13s_98_3
/make	p13s_98_other_1	from 	p13s_98_other_1	p13s_98_other_2	p13s_98_other_3
/make	p14_1_1	from 	p14_1_1	p14_1_2	p14_1_3
/make	p14dk_1_1	from 	p14dk_1_1	p14dk_1_2	p14dk_1_3
/make	p16_1	from 	p16_1	p16_2	p16_3
/make	p16oe_1_1	from 	p16oe_1_1	p16oe_1_2	p16oe_1_3
/make	p17_1_1	from 	p17_1_1	p17_1_2	p17_1_3
/make	p17dk_1_1	from 	p17dk_1_1	p17dk_1_2	p17dk_1_3
/make	p18_1_1	from 	p18_1_1	p18_1_2	p18_1_3
/make	p18_2_1	from 	p18_2_1	p18_2_2	p18_2_3
/make	p18_3_1	from 	p18_3_1	p18_3_2	p18_3_3
/make	p18_4_1	from 	p18_4_1	p18_4_2	p18_4_3
/make	p18_5_1	from 	p18_5_1	p18_5_2	p18_5_3
/make	p18_6_1	from 	p18_6_1	p18_6_2	p18_6_3
/make	p18_7_1	from 	p18_7_1	p18_7_2	p18_7_3
/make	p18_15_1	from 	p18_15_1	p18_15_2	p18_15_3
/make	p18_10_1	from 	p18_10_1	p18_10_2	p18_10_3
/make	p18_12_1	from 	p18_12_1	p18_12_2	p18_12_3
/make	p18_98_1	from 	p18_98_1	p18_98_2	p18_98_3
/make	p18_99_1	from 	p18_99_1	p18_99_2	p18_99_3
/make	p18_98_other_1	from 	p18_98_other_1	p18_98_other_2	p18_98_other_3
/make	p19_1	from 	p19_1	p19_2	p19_3
/make	p19oe_1_1	from 	p19oe_1_1	p19oe_1_2	p19oe_1_3
/make	p20_1_1	from 	p20_1_1	p20_1_2	p20_1_3
/make	p20dk_1_1	from 	p20dk_1_1	p20dk_1_2	p20dk_1_3
/make	p20a_1_1	from 	p20a_1_1	p20a_1_2	p20a_1_3
/make	p20a_2_1	from 	p20a_2_1	p20a_2_2	p20a_2_3
/make	p20a_3_1	from 	p20a_3_1	p20a_3_2	p20a_3_3
/make	p20a_4_1	from 	p20a_4_1	p20a_4_2	p20a_4_3
/make	p20a_5_1	from 	p20a_5_1	p20a_5_2	p20a_5_3
/make	p20a_6_1	from 	p20a_6_1	p20a_6_2	p20a_6_3
/make	p20a_7_1	from 	p20a_7_1	p20a_7_2	p20a_7_3
/make	p20a_8_1	from 	p20a_8_1	p20a_8_2	p20a_8_3
/make	p20a_9_1	from 	p20a_9_1	p20a_9_2	p20a_9_3
/make	p20a_10_1	from 	p20a_10_1	p20a_10_2	p20a_10_3
/make	p20a_11_1	from 	p20a_11_1	p20a_11_2	p20a_11_3
/make	p20a_12_1	from 	p20a_12_1	p20a_12_2	p20a_12_3
/make	p20a_13_1	from 	p20a_13_1	p20a_13_2	p20a_13_3
/make	p20a_14_1	from 	p20a_14_1	p20a_14_2	p20a_14_3
/make	p20a_98_1	from 	p20a_98_1	p20a_98_2	p20a_98_3
/make	p20a_14_other_1	from 	p20a_14_other_1	p20a_14_other_2	p20a_14_other_3
/make	p20a_98_other_1	from 	p20a_98_other_1	p20a_98_other_2	p20a_98_other_3
/make	p21_1	from 	p21_1	p21_2	p21_3
/make	countchart_1	from 	countchart_1	countchart_2	countchart_3
/make	qendtimeloop_1	from 	qendtimeloop_1	qendtimeloop_2	qendtimeloop_3
/index=chart(3)
/keep=all.
exe.

if(p0a_1=1)flt=1.
exe.

***************************************QBEGINTIMELOOP.
tit QBeginTimeLoop.
temporary.
sel if (flt>0 and QBeginTimeLoop_1='') or sum(flt,0)=0 and QBeginTimeLoop_1<>''.
list respid, QBeginTimeLoop_1.

***************************************LOOP_ID.
tit Loop_ID.
temporary.
sel if (flt>0 and Loop_ID_1='') or (sum(flt,0)=0 and QBeginTimeLoop_1<>'').
list respid, Loop_ID_1.

/*checking data if p0a_1 is missing then below variables data should be miss and pste here if any new variabls/questions addd.
/**PRF section all numeric variables.
do repeat x=p1a_1 p1a1_1 p1b_1 p1_1 p2_1 p3_1_1 p3_2_1 p3_3_1 p3_4_1 p3_5_1 p3_6_1 p3_7_1 p3_8_1 p3_9_1 p3_98_1 p3_99_1 p4_1 p5m_1_1 p5y_1_1 hp8_1 ndate_1_1 p7_1 p8_1_1 p8_2_1
p8_3_1 p8_4_1 p8_5_1 p9_1_1 p10_1 p11_1_1 p12_1_1 p12_2_1 p12_3_1 p12_4_1 p12_6_1 p12_7_1 p12_8_1 p12_9_1 p12_10_1 p12a_1_1 p12a_2_1 p12a_3_1 p12a_4_1 p12a_6_1 p12a_7_1 p12a_8_1 
p12a_9_1 p12a_10_1 p12a_11_1 p12b_1_1 p12b_2_1 p12b_3_1 p12b_4_1 p12b_6_1 p12b_7_1 p12b_8_1 p12b_9_1 p12b_10_1 p12b_11_1 p13_1 p13s_1_1 p13s_2_1 p13s_3_1 p13s_4_1 p13s_5_1 p13s_6_1 
p13s_98_1 p14_1_1 p14dk_1_1 p16_1 p17_1_1 p17dk_1_1 p18_1_1 p18_2_1 p18_3_1 p18_4_1 p18_5_1 p18_6_1 p18_7_1 p18_15_1 p18_10_1 p18_12_1 p18_98_1 p18_99_1 p19_1 p20_1_1 p20dk_1_1 p20a_1_1 
p20a_2_1 p20a_3_1 p20a_4_1 p20a_5_1 p20a_6_1 p20a_7_1 p20a_8_1 p20a_9_1 p20a_10_1 p20a_11_1 p20a_12_1 p20a_13_1 p20a_14_1 p20a_98_1 p21_1 countchart_1.
if(sum(flt,0)=0 and ~miss(x))flg1=1.
end repeat.
/**PRF section all string variables.
do repeat x=p1b_4_other_1 p3_98_other_1 p7_6_other_1 p13oe_1_1 p13s_98_other_1 p16oe_1_1 p18_98_other_1 p19oe_1_1 p20a_14_other_1 p20a_98_other_1 qendtimeloop_1.
if(sum(flt,0)=0 and char.len(x)>0)flg2=1.
end repeat.
freq flg1 to flg2.
DELETE VARIABLES flg1 to flg2 flt.

/****Keeping only if p0a_1 answered data***.
sel if p0a_1=1.
exe.

***************************************P1A.
tit P1a.
temporary.
sel if miss(P1a_1) or ~range(P1a_1,1,4).
list respid, P1a_1.

***************************************P1A1.
tit P1a1.
temporary.
sel if miss(P1a1_1) or ~range(P1a1_1,1,2) or ( P1a_1=1 and P1a1_1<>1) or  ( P1a_1=4 and P1a1_1<>2).
list respid, P1a1_1.

***************************************P1B.
tit P1b.
temporary.
sel if miss(P1b_1) or ~range(P1b_1,1,2,4,5).
list respid, P1b_1.


temporary.
sel if (P1b_1=4 and P1b_4_other_1='') or (P1b_1<>4 and P1b_4_other_1<>'').
list respid, P1b_4_other_1.

***************************************P1.
tit P1.
temporary.
sel if miss(P1_1) or ~range(P1_1,1,4).
list respid, P1_1.

***************************************P2.
tit P2.
temporary.
sel if miss(P2_1) or ~range(P2_1,1,4).
list respid, P2_1.

***************************************P3.
tit P3.
temporary.
!MULTI_B svar=P3_1_1 evar=P3_99_1 qnt=P3 ctr= 11 .

temporary.
sel if (p3_98_1=1 and p3_98_other_1='') or (p3_98_1=0 and p3_98_other_1<>'').
list respid,p3_98_other_1.

***************************************P4.
tit P4.
temporary.
sel if miss(P4_1) or ~range(P4_1,0,4).
list respid, P4_1.

***************************************P5M.
tit P5M.
temporary.
sel if miss(P5M_1_1) or ~range(P5M_1_1,1,12).
list respid, P5M_1_1.

***************************************P5Y.
tit P5Y.
temporary.
sel if miss(P5Y_1_1) or ~range(P5Y_1_1,1990,2025).
list respid, P5Y_1_1.

* Date and Time Wizard: hk.
COMPUTE Interview_month=XDATE.month(interview_end).
VARIABLE LABELS Interview_month.
VARIABLE LEVEL Interview_month(NOMINAL).
FORMATS Interview_month(F8.0).
VARIABLE WIDTH Interview_month(8).
EXECUTE.

/*If year 2025 range months = January to month of completion.
if(P5Y_1_1=2025 and Interview_month>P5M_1_1)flg=1.
freq flg.
DELETE VARIABLES flg.

***************************************HP8.
tit HP8.
temporary.
sel if miss(HP8_1) or ~range(HP8_1,1,3).
list respid, HP8_1.


COMPUTE  Temp=DATE.DMY(1,p5m_1_1,p5y_1_1).
VARIABLE LEVEL  Temp (SCALE).
FORMATS  Temp (MOYR6).
VARIABLE WIDTH  Temp(6).
EXECUTE.

compute diff = datediff(interview_end,Temp,"months" ).
Execute.

if(diff<6 and HP8_1<>3)flg1=1.
if(range(diff,6,12) and HP8_1<>2)flg2=1.
if(diff>12 and HP8_1<>1)flg3=1.
freq flg1 to flg3.
DELETE VARIABLES flg1 to flg3.



***************************************NDATE.
tit Ndate.
temporary.
sel if miss(Ndate_1_1) or (diff<>ndate_1_1).
list respid, Ndate_1_1.

DELETE VARIABLES diff.

***************************************P7.
tit P7.
temporary.
sel if miss(P7_1) or ~range(P7_1,1,6).
list respid, P7_1.

temporary.
sel if (P7_1=6 and P7_6_other_1='') or (P7_1<>6 and P7_6_other_1<>'').
list respid, P7_6_other_1.

***************************************P8.
tit P8.
do repeat x=p8_1_1 to p8_4_1.
if(miss(x) or ~range(x,0,1))flg1=1.
end repeat.
if(p1a1_1=2 and (miss(p8_5_1) or ~range(p8_5_1,0,1)))flg2=1.
if(sum(p1a1_1,0)<>2 and (~miss(p8_5_1) or range(p8_5_1,0,1)))flg3=1.
if(sum(p8_1_1 to p8_5_1)=0)flg4=1.
freq flg1 to flg4.
DELETE VARIABLES    flg1 to flg4.

***************************************P9.
tit P9.
temporary.
sel if (p8_2_1>0 and (miss(P9_1_1) or ~range(P9_1_1,1,15)) or (sum(p8_2_1,0)=0 and ~miss(P9_1_1))).
list respid, P9_1_1.

***************************************P10.
tit P10.
temporary.
sel if miss(P10_1) or ~range(P10_1,1,4,99,99).
list respid, P10_1.

***************************************P11.
tit P11.
temporary.
sel if miss(P11_1_1) or ~range(P11_1_1,1,365).
list respid, P11_1_1.

if( P11_1_1>30)flg=1./*Fine this is soft error only.
freq flg.
DELETE VARIABLES flg.

***************************************P12.
tit P12.

do repeat x=p12_1_1 to p12_10_1.
if(~miss(x))flg=1.
end repeat.
freq flg.
DELETE VARIABLES flg.

***************************************P12A.
tit P12A.
temporary.
!MULTI_B svar=P12A_1_1 evar=P12A_11_1 qnt=P12A ctr= 10 .

***************************************P12B.
tit P12B.
temporary.
!MULTI_B svar=P12B_1_1 evar=P12B_11_1 qnt=P12B ctr= 10 .

do repeat x=p12a_1_1 to p12a_10_1/y=p12b_1_1 to p12b_10_1.
if(y=1 and x<>1)flg=1.
end repeat.
if(p12a_11_1=1 and p12b_11_1=1)flg=2.
freq flg.
DELETE VARIABLES flg.

***************************************P13.
tit P13.
temporary.
sel if miss(P13_1) or ~range(P13_1,1,7,9,9,14,14,98,98).
list respid, P13_1.

if(P13_1=3 and any(Qcountry,2057,1046))flg=1.
 if(P13_1=6 and any(Qcountry,2057))flg=2.
if(P13_1=9 and any(Qcountry,1046))flg=3.
freq flg.
DELETE VARIABLES flg.

***************************************P13OE.
tit P13OE.
temporary.
sel if (P13_1=98 and P13OE_1_1='') or (P13_1<>98 and P13OE_1_1<>'').
list respid, P13OE_1_1.

***************************************P13S.
if(any(P13_1,1,2,13))flg=1.
filter by flg.
tit P13s.
temporary.
!MULTI_A svar=P13s_1_1 evar=P13s_98_1 qnt=P13s ctr= 7 .
filter off.
if(sum(flg,0)=0 and nmiss(p13s_1_1 to p13s_98_1)<>7)fil=1.
if(p13s_98_1>0 and p13s_98_other_1='')fil=2.
if(sum(p13s_98_1,0)=0 and p13s_98_other_1<>'')fil=3.
freq fil.
DELETE VARIABLES fil,flg.

***************************************P14.
tit P14.
temporary.
sel if (P14DK_1_1=0 and (miss(P14_1_1) or ~range(P14_1_1,1,12)) or (P14DK_1_1=1 and ~miss(P14_1_1))).
list respid, P14_1_1.



compute notify_date = datesum(interview_end,-P14_1_1,'months').
execute.
formats notify_date(date11).

if(notify_date <Temp)flg=1.
freq flg.
freq flg.
DELETE VARIABLES flg.



***************************************P14DK.
tit P14DK.
temporary.
sel if miss(P14DK_1_1) or ~range(P14DK_1_1,0,1).
list respid, P14DK_1_1.

***************************************P16.
tit P16.
temporary.
sel if miss(P16_1) or ~range(P16_1,1,7,10,10,12,12,15,15,98,98).
list respid, P16_1.

if(P16_1=3 and any(Qcountry,2057,1046))flg=1.
 if(P16_1=6 and any(Qcountry,2057))flg=2.
freq flg.
DELETE VARIABLES flg.

***************************************P16OE.
tit P16OE.
temporary.
sel if (P16_1=98 and P16OE_1_1='') or (P16_1<>98 and P16OE_1_1<>'').
list respid, P16OE_1_1.

***************************************P17.
tit P17.
temporary.
sel if (P17DK_1_1=0 and (miss(P17_1_1) or ~range(P17_1_1,1,21))) or (P17DK_1_1=1 and ~miss(P17_1_1)).
list respid, P17_1_1.

***************************************P17DK.
tit P17DK.
temporary.
sel if miss(P17DK_1_1) or ~range(P17DK_1_1,0,1).
list respid, P17DK_1_1.

if(p1a_1=1 and (sum(p14_1_1,p17_1_1)<>p5m_1_1))flg1=1./*checking.
if((any(p1a_1,2,3) and p1a1_1=1) and (sum(p14_1_1,p17_1_1)<>p5m_1_1))flg2=1.
if((any(p1a_1,2,3) and p1a1_1=2) and (sum(p14_1_1,p17_1_1)>=p5m_1_1))flg3=1.
if(p1a_1=4 and (sum(p14_1_1,p17_1_1)>=p5m_1_1))flg4=1.
freq flg1 to flg4.
DELETE VARIABLES flg1 to flg4.

DELETE VARIABLES notify_date.

compute chk1=((sum(p14_1_1,p17_1_1))).
 * compute notify_date = datesum(interview_end,-chk1,'months').
 * execute.
 * formats notify_date(date11).

if(p1a_1=1 and p17dk_1_1=0 and chk1<>ndate_1_1)flg=1.
freq flg.
DELETE VARIABLES flg.

if(p1a_1=1 and p17dk_1_1=0 and (chk1<>ndate_1_1))flg1=1.
if((any(p1a_1,2,3) and p1a1_1=1 and p17dk_1_1=0) and (chk1<>ndate_1_1))flg2=1.
if((any(p1a_1,2,3) and p1a1_1=2 and p17dk_1_1=0) and (chk1>=ndate_1_1))flg3=1.
if(p1a_1=4 and  p17dk_1_1=0 and (sum(chk1>=ndate_1_1)))flg4=1.
freq flg1 to flg4.
DELETE VARIABLES flg1 to flg4 chk1.

***************************************P18.
tit P18.
do repeat x=p18_1_1,p18_2_1,p18_4_1,p18_5_1,p18_7_1,p18_15_1,p18_12_1,p18_98_1,p18_99_1    .
if(p1a_1=1 and (miss(x) or ~range(x,0,1)))flg1=1.
if(sum(p1a_1,0)<>1 and (~miss(x) or range(x,0,1)))flg2=1.
end repeat.
do repeat x=p18_3_1.
if((p1a_1=1 and ~any(qcountry,2057,1046)) and (miss(x) or ~range(x,0,1)))flg3=1.
if((sum(p1a_1,0)<>1 or ~any(qcountry,2057,1046)) and (~miss(x) or range(x,0,1)))flg4=1.
end repeat.
do repeat x=p18_6_1.
if((p1a_1=1 and ~any(qcountry,2057)) and (miss(x) or ~range(x,0,1)))flg5=1.
if((sum(p1a_1,0)<>1 or ~any(qcountry,2057)) and (~miss(x) or range(x,0,1)))flg6=1.
end repeat.
do repeat x=p18_10_1.
if((p1a_1=1 and sum(p16_1,0)<>10) and (miss(x) or ~range(x,0,1)))flg7=1.
if((sum(p1a_1,0)<>1 or sum(p16_1,0)=10) and (~miss(x) or range(x,0,1)))flg8=1.
end repeat.
if(sum(p18_1_1 to p18_99_1)=0)flg9=1.
if(sum(p18_1_1 to p18_98_1)>0 and p18_99_1>0)flg10=1.
if(p18_98_1>0 and p18_98_other_1='')flg11=1.
if(sum(p18_98_1,0)=0 and p18_98_other_1<>'')flg12=1.
temp.
sel if sum(flg1 to flg12)>0.
list flg1 to flg12 respid.
DELETE VARIABLES flg1 to flg12.



*********************************************************P19.
tit p19_1.
if(range(p1a_1, 2,3) AND p1a_1 = 2) or (P1a_1=4) P1_a_FIL = 1.


if(P1_a_FIL =1 and (miss(p19_1) or ~range(p19_1, 1,7, 10,10, 12,12, 15,15, 98,98))) flag1 = 1.
if((P1_a_FIL <>1 or miss(P1_a_FIL)) and ~miss(p19_1)) flag2 = 1.

if(any(qcountry,1046,2057) AND p19_1 = 3) flag3 = 1.
if(any(qcountry, 2057) AND p19_1 = 6) flag4 = 1.
if(qcountry NE 2057 AND p19_1 = 15) flag5 = 1.
if(p16_1 = 10 AND p19_1 = 10) flag6 = 1.

if((p19_1 = 98 AND p19oe_1_1 = " ") OR ((p19_1 NE 98 OR miss(p19_1)) AND p19oe_1_1 ~= " ")) flag7 = 1.
TEMPORARY.
sel if SUM(flag1 to flag7) GT 0.
list respid flag1 to flag7.
del var flag1 to flag7 P1_a_FIL.
exe.

*********************************************************P20.
tit p20.
if(range(p1a_1, 2,3) AND p1a_1 = 2) or (P1a_1=4) P1_a_FIL1 = 1.
exe.

if(P1_a_FIL1 = 1 and (miss(p20_1_1) or ~range(p20_1_1, 1,12))) flag1 = 1.
if((P1_a_FIL1 <>1) and ~miss(p20_1_1)) flag2 = 1.
TEMPORARY.
sel if SUM(flag1, flag2) GT 0.
list respid flag1 flag2.
del var flag1 flag2 P1_a_FIL1.
exe.


compute chk1=sum(p14_1_1,p17_1_1,p20_1_1).

if((any(p1a_1,2,3) and p1a1_1=2 and sum(p20_1_1,0)=0) and (chk1<>ndate_1_1))flg2=1.
if((p1a_1=4 and  sum(p20_1_1,0)=0) and (chk1<>ndate_1_1))flg4=1.
freq flg2 to flg4.
DELETE VARIABLES flg2 to flg4 chk1.


********************************************************** P20a.
tit p20a.
if(p16_1 NE 10 AND p3_99_1 = 0) P3_16_FIL = 1.
if(p16_1 NE 10 AND SUM(p12b_1_1 to p12b_11_1) GT 0) P16_12b_FIL = 1.

Do repeat x = p20a_1_1 p20a_4_1 p20a_5_1 p20a_6_1 p20a_7_1 p20a_8_1 p20a_9_1 p20a_10_1 p20a_11_1 p20a_12_1 p20a_13_1 p20a_14_1 p20a_98_1.
if(p16_1 NE 10 and (miss(x) or ~range(x, 0,1))) flag1 = 1.
if((p16_1 = 10 or miss(p16_1)) and ~miss(x)) flag2 = 1.
end repeat.
if(P3_16_FIL = 1 AND (miss(p20a_2_1) or ~range(p20a_2_1, 0,1))) flag3 = 1.
if((P3_16_FIL NE 1 or miss(P3_16_FIL)) and ~miss(p20a_2_1)) flag4 = 1.
if(P16_12b_FIL = 1 AND (miss(p20a_3_1) or ~range(p20a_3_1, 0,1))) flag5 = 1.
if((P16_12b_FIL NE 1 or miss(P16_12b_FIL)) and ~miss(p20a_3_1)) flag6 = 1.

if(p16_1 = 10 AND SUM(p20a_1_1 to p20a_98_1) LT 1) flag7 = 1.

if((p20a_14_1 = 1 AND p20a_14_other_1 = " ") OR ((p20a_14_1 NE 1 OR miss(p20a_14_1)) AND p20a_14_other_1 ~= " ")) flag8 = 1.
if((p20a_98_1 = 1 AND p20a_98_other_1 = " ") OR ((p20a_98_1 NE 1 OR miss(p20a_98_1)) AND p20a_98_other_1 ~= " ")) flag9 = 1.

temp.
sel if SUM(flag1 to flag9) GT 0.
list respid flag1 to flag9.
del var flag1 to flag9 P3_16_FIL P16_12b_FIL.
exe.


***************************************P21.
if(b1bx1_1>=3 and p0a_1=1)flg=1.
if(b1bx1_1=3 and p0a_1=1)flg2=1.
tit P21.
temporary.
sel if (flg>0 and (miss(P21_1) or ~range(P21_1,1,2))) or (sum(flg,0)=0 and ~miss(P21_1) ).
list respid, P21_1.

if(P21_1=2 and sum(flg2,0)=0)flg1=1.
freq flg1.
DELETE VARIABLES flg flg1 flg2.

***************************************COUNTCHART.
tit countChart.
temporary.
sel if miss(countChart_1) or ~range(countChart_1,1,2).
list respid, countChart_1.

***************************************QENDTIMELOOP.
tit QEndTimeLoop.
temporary.
sel if (QEndTimeLoop_1='').
list respid, QEndTimeLoop_1.


/***********************************SECTION E – MESSAGE RECALL*******************.

***********************************************HIDF1ORDER.
tit hidf1.
COUNT hidf1_Count1 = hidf1order_1 hidf1order_2 hidf1order_3 (1).
COUNT hidf1_Count2 = hidf1order_1 hidf1order_2 hidf1order_3 (2).
COUNT hidf1_Count3 = hidf1order_1 hidf1order_2 hidf1order_3 (3).
exe.

do repeat x = hidf1order_1 hidf1order_2 hidf1order_3.
if(~range(x, 1, 3)) flag1 = 1.
end repeat.

do repeat y = hidf1_Count1 hidf1_Count2 hidf1_Count3.
if(y <>1) flag2 = 1.
end repeat.

if(a2a_6 <>1 AND (miss(hidf1order_1) or ~range(hidf1order_1,1,3))) flag3 = 1.
if((a2a_6 = 1 OR miss(a2a_6)) AND ~miss(hidf1order_1)) flag4 = 1.

if(a2a_2 <> 1 AND (miss(hidf1order_2) or ~range(hidf1order_2,1,3))) flag5 = 1.
if((a2a_2 = 1 OR miss(a2a_2)) AND ~miss(hidf1order_2)) flag6 = 1.

if(qcountry = 2057 AND (miss(hidf1order_3) or ~range(hidf1order_3,1,3))) flag7 = 1.
if((qcountry NE 2057 OR miss(qcountry)) AND ~miss(hidf1order_3)) flag8 = 1.
TEMPORARY.
SELECT IF SUM(flag1 to flag8) > 0.
list respid, flag1 to flag8.
DELETE VARIABLES flag1 to flag8 hidf1_Count1 to hidf1_Count3.
exe.

***********************************************F1.
tit f1_1.
if(a2a_6 NE 1) A2a_6_FIL = 1.
filter by A2a_6_FIL.
temporary.
!MULTI_B svar=f1_1_1 evar=f1_99_1 qnt=F1_1 ctr=16.
filter off.
temporary.
sel if ((A2a_6_FIL NE 1 or miss(A2a_6_FIL)) and nmiss(f1_1_1 to f1_99_1)<>16).
list respid a2a_6 f1_1_1 to f1_99_1.
del var A2a_6_FIL.
exe.

tit f1_2.
if(a2a_2 NE 1) A2a_2_FIL = 1.
filter by A2a_2_FIL.
temporary.
!MULTI_B svar=f1_1_2 evar=f1_99_2 qnt=F1_2 ctr=16.
filter off.
temporary.
sel if ((A2a_2_FIL NE 1 or miss(A2a_2_FIL)) and nmiss(f1_1_2 to f1_99_2)<>16).
list respid a2a_2 f1_1_2 to f1_99_2.
del var A2a_2_FIL.
exe.

tit f1_3.
if(qcountry = 2057) QC_FIL = 1.
filter by QC_FIL.
temporary.
!MULTI_B svar=f1_1_3 evar=f1_99_3 qnt=F1_3 ctr=16.
filter off.
temporary.
sel if ((QC_FIL NE 1 OR miss(QC_FIL)) AND nmiss(f1_1_3 to f1_99_3) NE 16).
list respid qcountry f1_1_3 to f1_99_3.
del var QC_FIL.
exe.

***************************************************F3a.
tit f3ax1.
do repeat x = f3ax1_1 f3ax1_2.
if(f3adkx1_1 = 0 AND (miss(x) OR ~range(x, 0,99))) flag1 = 1.
if((f3adkx1_1 NE 0 OR miss(f3adkx1_1)) AND ~miss(x)) flag2 = 1.
end repeat.
if((qcountry = 2057 AND f3adkx1_1 = 0) and (miss(f3ax1_4) OR ~range(f3ax1_4, 0,99))) flag3 = 1.
if(((qcountry NE 2057 OR  f3adkx1_1 NE 0) OR (miss(qcountry) OR miss(f3adkx2_1))) AND ~miss(f3ax2_4)) flag4 = 1.

if(miss(f3adkx1_1) OR ~range(f3adkx1_1, 0,1)) flag4 = 1.
temporary.
sel if sum(flag1 to flag4) GT 0.
list respid flag1 to flag4.
del var flag1 to flag4.
exe.


tit f3ax2.
do repeat x = f3ax2_1 f3ax2_2.
if(f3adkx2_1 = 0 AND (miss(x) OR ~range(x, 0,99))) flag1 = 1.
if((f3adkx2_1 NE 0 OR miss(f3adkx2_1)) AND ~miss(x)) flag2 = 1.
end repeat.
if((qcountry = 2057 AND f3adkx2_1 = 0) and (miss(f3ax2_4) OR ~range(f3ax2_4, 0,99))) flag3 = 1.
if(((qcountry NE 2057 OR  f3adkx2_1 NE 0) OR (miss(qcountry) OR miss(f3adkx2_1))) AND ~miss(f3ax2_4)) flag4 = 1.
if(miss(f3adkx2_1) OR ~range(f3adkx2_1, 0,1)) flag5 = 1.
temporary.
sel if sum(flag1 to flag5) GT 0.
list respid flag1 to flag5.
del var flag1 to flag5.
exe.

**********************************************************F4b.
tit f4b.
do repeat x = f4b_1 f4b_2 f4b_3 f4b_4 f4b_5 f4b_6.
if(miss(x) OR ~range(x, 1,4, 99,99)) flag1 = 1.

if((a2a_6 = 1 OR miss(a2a_6)) AND x = 1)flag2 = 1.
if((a2a_2 = 1 OR miss(a2a_2)) AND x = 2)flag3 = 1.

if((qcountry = 2057 AND a2a_3 NE 1) AND (miss(x) OR ~range(x, 1,4, 99,99))) flag4 = 1.
if(((qcountry NE 2057 OR a2a_3 = 1) OR (miss(qcountry) OR miss(a2a_3))) AND x = 4) flag5 = 1.
end repeat.
temporary.
sel if sum(flag1 to flag5) GT 0.
list respid flag1 to flag5.
del var flag1 to flag5.
exe.
/*checking with SP.

count cnt1=A2a_3, A2a_6,A2a_2(2 thru hi).
exe.
count cnt2=A2a_6,A2a_2(2 thru hi).
exe.

if(qcountry=2057 and cnt1>1)flg=1.
if(qcountry=2057 and cnt1>1)flgh=1.
if(qcountry<>2057 and cnt2>1)flgk=1.

do repeat x=f4b_1 to f4b_6.
if(x=1 and a2a_6=1)flg1=1.
if(x=2 and a2a_2=1)flg2=1.
 * if(qcountry<>2057 and a2a_3=4)flg3=1.
 * if((cnt2>=2 and qcountry=2057) and x<>3)flg4=1.
 * if(x=3 and sum(flg,0)=0)flg5=1.
 * if(x=3 and sum(flgh,0)=0)flg6=1.
 *    if(qcountry=1046 and x=3)flg6=1.
 * if(x=3 and sum(flgk,0)=0)flg7=1. 
end repeat.
freq flg1 to flg2.
DELETE VARIABLES flg1 to flg2.
DELETE VARIABLES cnt1,cnt2,flg flgh flgk.

************************************ HIDOEBATCH.
tit hidoebatch.
temporary.
sel if miss(hidoebatch) or hidoebatch NE 99.
list respid hidoebatch.
exe.

************************************* HIDDVBATCH.
tit hiddvbatch.
temporary.
sel if miss(hiddvbatch) or hiddvbatch NE 99.
list respid hiddvbatch.
exe.

************************************************** SURVEYLOI.
tit surveyloi.
temporary.
sel if miss(surveyloi) or surveyloi<0.
list respid surveyloi.
EXECUTE.




