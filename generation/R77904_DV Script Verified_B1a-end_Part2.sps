* Encoding: UTF-8.

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


***************************************HIDSEC3SCNORDER.
do repeat x=hidsec3scnorder_1 hidsec3scnorder_4 hidsec3scnorder_5.
if (miss(x)) flag1=1.
end repeat.
do repeat x=hidsec3scnorder_2 hidsec3scnorder_3.
if (any(qcountry,7,10,12,16,2057)) and (miss(x)) flag2=1.
if (~any(qcountry,7,10,12,16,2057)) and (~miss(x)) flag3=1.
end repeat.
freq flag1 to flag3.
del var flag1 to flag3.
exe.

!Rank_ALL_CHK svar=hidsec3scnorder_1 evar=hidsec3scnorder_5 qnt=hidsec3scnorder rank=5  opr= >.     

***************************************HIDSCN4BN4CORDER.
do repeat x=hidscn4bn4corder_1 to hidscn5dn5eorder_2.
if (miss(x) or ~range(x,1,2)) flag1=1.
end repeat.
freq flag1.
del var flag1.
exe.

***************************************B1A2.
tit B1a2.
temporary.
sel if miss(B1a2) or ~range(B1a2,1,5).
list respid, B1a2.

***************************************B1BA.
tit B1ba.
temporary.
sel if miss(B1ba_1) or ~range(B1ba_1,0,10).
list respid, B1ba_1.

temporary.
sel if (b1a2=5 and b1ba_1 NE 10).
list respid, b1ba_1.

***************************************B1BB.
if (b1ba_1>=5) and (miss(B1bb) or ~range(B1bb,1,6)) flag1=1.
if (b1ba_1<5) and (~miss(B1bb)) flag2=1.
if (B1a2=5 and B1bb NE 1) flag3=1.
Freq flag1 to flag3.
del var flag1 to flag3.
exe.

***************************************B1CX1.
do repeat x=B1CX1_51 B1CX1_1 B1CX1_52 B1CX1_53 B1CX1_7 B1CX1_2 B1CX1_3 B1CX1_4 B1CX1_56 B1CX1_5 B1CX1_6 B1CX1_8 B1CX1_9 B1Cdkx1_99.
if ((s7_1>0)) and (miss(x) or ~range(x,0,s7_1)) flag1=1.
if (sum(s7_1,0)=0) and (~miss(x)) flag2=1.
if (~range(B1Cdkx1_99,0,1)) flag3=1.
end repeat.
do repeat x= B1CX1_54.
if (s7_1>0) and (~range(x,0,s7_1)) flag4=1.
if (sum(s7_1,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_1>0) and (sum(B1CX1_51 to B1CX1_9) NE s7_1) flag6=1.
do repeat x=b1cx1_51 b1cx1_1 b1cx1_52 b1cx1_54 b1cx1_53 b1cx1_7 b1cx1_2 b1cx1_3 b1cx1_4 b1cx1_56 b1cx1_5 b1cx1_6 b1cx1_8 b1cx1_9
/y=a1x1_51 a1x1_1 a1x1_52 a1x1_54 a1x1_53 a1x1_7 a1x1_2 a1x1_3 a1x1_4 a1x1_56 a1x1_5 a1x1_6 a1x1_8 a1x1_9.
if (b1cdkx1_99=1) and (x NE y) flag7=1.
end repeat.
Freq  flag1 to  flag7.
del var  flag1 to  flag7.
exe.


***************************************B1CX2.
do repeat x=B1CX2_1 B1CX2_7 B1CX2_2 B1CX2_3 B1CX2_4 B1CX2_5 B1CX2_6 B1CX2_8 B1CX2_9 B1Cdkx2_99.
if ((s7_2>0)) and (miss(x) or ~range(x,0,s7_2)) flag1=1.
if (sum(s7_2,0)=0) and (~miss(x)) flag2=1.
if (~range(B1Cdkx2_99,0,1)) flag3=1.
end repeat.
do repeat x= B1CX2_54.
if (s7_2>0) and (~range(x,0,s7_2)) flag4=1.
if (sum(s7_2,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_2>0) and (sum(B1CX2_51 to B1CX2_9) NE s7_2) flag6=1.
do repeat x=B1CX2_51 B1CX2_52 B1CX2_53 B1CX2_56.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b1cx2_51 b1cx2_1 b1cx2_52 b1cx2_54 b1cx2_53 b1cx2_7 b1cx2_2 b1cx2_3 b1cx2_4 b1cx2_56 b1cx2_5 b1cx2_6 b1cx2_8 b1cx2_9
/y=a1x2_51 a1x2_1 a1x2_52 a1x2_54 a1x2_53 a1x2_7 a1x2_2 a1x2_3 a1x2_4 a1x2_56 a1x2_5 a1x2_6 a1x2_8 a1x2_9.
if (b1cdkx2_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.



***************************************B1CX3.
do repeat x=B1CX3_1 B1CX3_7 B1CX3_3 B1CX3_4 B1CX3_5 B1CX3_6 B1CX3_8 B1CX3_9 B1Cdkx3_99.
if ((s7_3>0)) and (miss(x) or ~range(x,0,s7_3)) flag1=1.
if (sum(s7_3,0)=0) and (~miss(x)) flag2=1.
if (~range(B1Cdkx3_99,0,1)) flag3=1.
end repeat.
do repeat x= B1CX3_54.
if (s7_3>0) and (~range(x,0,s7_3)) flag4=1.
if (sum(s7_3,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_3>0) and (sum(B1CX3_51 to B1CX3_9) NE s7_3) flag6=1.
do repeat x=B1CX3_51 B1CX3_52 B1CX3_53 B1CX3_56 B1CX3_2.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b1cx3_51 b1cx3_1 b1cx3_52 b1cx3_54 b1cx3_53 b1cx3_7 b1cx3_2 b1cx3_3 b1cx3_4 b1cx3_56 b1cx3_5 b1cx3_6 b1cx3_8 b1cx3_9
/y=a1x3_51 a1x3_1 a1x3_52 a1x3_54 a1x3_53 a1x3_7 a1x3_2 a1x3_3 a1x3_4 a1x3_56 a1x3_5 a1x3_6 a1x3_8 a1x3_9.
if (b1cdkx3_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.


***************************************B1CX4.
do repeat x=B1CX4_1 B1CX4_7 B1CX4_3 B1CX4_4 B1CX4_5 B1CX4_6 B1CX4_8 B1CX4_9 B1Cdkx4_99.
if ((s7_4>0)) and (miss(x) or ~range(x,0,s7_4)) flag1=1.
if (sum(s7_4,0)=0) and (~miss(x)) flag2=1.
if (~range(B1Cdkx4_99,0,1)) flag3=1.
end repeat.
do repeat x= B1CX4_54.
if (s7_4>0) and (~range(x,0,s7_4)) flag4=1.
if (sum(s7_4,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_4>0) and (sum(B1CX4_51 to B1CX4_9) NE s7_4) flag6=1.
do repeat x=B1CX4_51 B1CX4_52 B1CX4_53 B1CX4_56 B1CX4_2.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b1cx4_51 b1cx4_1 b1cx4_52 b1cx4_54 b1cx4_53 b1cx4_7 b1cx4_2 b1cx4_3 b1cx4_4 b1cx4_56 b1cx4_5 b1cx4_6 b1cx4_8 b1cx4_9
/y=a1x4_51 a1x4_1 a1x4_52 a1x4_54 a1x4_53 a1x4_7 a1x4_2 a1x4_3 a1x4_4 a1x4_56 a1x4_5 a1x4_6 a1x4_8 a1x4_9.
if (b1cdkx4_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.


***************************************B1CX5.
do repeat x=B1CX5_1 B1CX5_7 B1CX5_3 B1CX5_4 B1CX5_5 B1CX5_6 B1CX5_8 B1CX5_9 B1Cdkx5_99.
if ((s7_5>0)) and (miss(x) or ~range(x,0,s7_5)) flag1=1.
if (sum(s7_5,0)=0) and (~miss(x)) flag2=1.
if (~range(B1Cdkx5_99,0,1)) flag3=1.
end repeat.
do repeat x= B1CX5_54.
if (s7_5>0) and (~range(x,0,s7_5)) flag4=1.
if (sum(s7_5,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_5>0) and (sum(B1CX5_51 to B1CX5_9) NE s7_5) flag6=1.
do repeat x=B1CX5_51 B1CX5_52 B1CX5_53 B1CX5_56 B1CX5_2.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b1cx5_51 b1cx5_1 b1cx5_52 b1cx5_54 b1cx5_53 b1cx5_7 b1cx5_2 b1cx5_3 b1cx5_4 b1cx5_56 b1cx5_5 b1cx5_6 b1cx5_8 b1cx5_9
/y=a1x5_51 a1x5_1 a1x5_52 a1x5_54 a1x5_53 a1x5_7 a1x5_2 a1x5_3 a1x5_4 a1x5_56 a1x5_5 a1x5_6 a1x5_8 a1x5_9.
if (b1cdkx5_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.


***************************************B2B.
do repeat x= B2b_1.
if (any(qcountry,7,10,12,16,2057)) and (miss(x) or ~range(x,0,10)) flag1=1.
if (~any(qcountry,7,10,12,16,2057)) and (~miss(x)) flag2=1.
end repeat.
Freq flag1 to flag2.
del var flag1 to flag2.
exe.

***************************************B2BA.
if (b2b_1>=5) and (miss(B2ba) or ~range(B2ba,1,6)) flag1=1.
if (b2b_1<5) and (~miss(B2ba)) flag2=1.
Freq flag1 to flag2.
del var flag1 to flag2.
exe.

***************************************B2CX1.
do repeat x=B2cX1_51 B2cX1_1 B2cX1_52 B2cX1_53 B2cX1_7 B2cX1_2 B2cX1_3 B2cX1_4 B2cX1_56 B2cX1_5 B2cX1_6 B2cX1_8 B2cX1_9 B2cdkx1_99.
if (any(qcountry,7,10,12,16,2057) and (s7_1>0)) and (miss(x) or ~range(x,0,s7_1)) flag1=1.
if ~(any(qcountry,7,10,12,16,2057) or (sum(s7_1,0)=0)) and (~miss(x)) flag2=1.
if (~range(b2cdkx1_99,0,1)) flag3=1.
end repeat.
do repeat x= B2cX1_54.
if (s7_1>0) and (~range(x,0,s7_1)) flag4=1.
if (sum(s7_1,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_1>0) and (sum(B2cX1_51 to B2cX1_9) NE s7_1) flag6=1.
do repeat x=b2cx1_51 b2cx1_1 b2cx1_52 b2cx1_54 b2cx1_53 b2cx1_7 b2cx1_2 b2cx1_3 b2cx1_4 b2cx1_56 b2cx1_5 b2cx1_6 b2cx1_8 b2cx1_9
/y=a1x1_51 a1x1_1 a1x1_52 a1x1_54 a1x1_53 a1x1_7 a1x1_2 a1x1_3 a1x1_4 a1x1_56 a1x1_5 a1x1_6 a1x1_8 a1x1_9.
if (b2cdkx1_99=1) and (x NE y) flag7=1.
end repeat.
Freq  flag1 to  flag7.
del var  flag1 to  flag7.
exe.

***************************************B2cX2.
do repeat x=B2cX2_1 B2cX2_7 B2cX2_2 B2cX2_3 B2cX2_4 B2cX2_5 B2cX2_6 B2cX2_8 B2cX2_9 B2cdkx2_99.
if (any(qcountry,7,10,12,16,2057) and (s7_2>0)) and (miss(x) or ~range(x,0,s7_2)) flag1=1.
if ~(any(qcountry,7,10,12,16,2057) or (sum(s7_2,0)=0)) and (~miss(x)) flag2=1.
if (~range(b2cdkx2_99,0,1)) flag3=1.
end repeat.
do repeat x= B2cX2_54.
if (s7_2>0) and (~range(x,0,s7_2)) flag4=1.
if (sum(s7_2,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_2>0) and (sum(B2cX2_51 to B2cX2_9) NE s7_2) flag6=1.
do repeat x=B2cX2_51 B2cX2_52 B2cX2_53 B2cX2_56.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b2cx2_51 b2cx2_1 b2cx2_52 b2cx2_54 b2cx2_53 b2cx2_7 b2cx2_2 b2cx2_3 b2cx2_4 b2cx2_56 b2cx2_5 b2cx2_6 b2cx2_8 b2cx2_9
/y=a1x2_51 a1x2_1 a1x2_52 a1x2_54 a1x2_53 a1x2_7 a1x2_2 a1x2_3 a1x2_4 a1x2_56 a1x2_5 a1x2_6 a1x2_8 a1x2_9.
if (b2cdkx2_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
EXECUTE.

***************************************B2cX3.
do repeat x=B2cX3_1 B2cX3_7 B2cX3_3 B2cX3_4 B2cX3_5 B2cX3_6 B2cX3_8 B2cX3_9 B2cdkx3_99.
if (any(qcountry,7,10,12,16,2057) and (s7_3>0)) and (miss(x) or ~range(x,0,s7_3)) flag1=1.
if ~(any(qcountry,7,10,12,16,2057) or (sum(s7_3,0)=0)) and (~miss(x)) flag2=1.
if (~range(b2cdkx3_99,0,1)) flag3=1.
end repeat.
do repeat x= B2cX3_54.
if (s7_3>0) and (~range(x,0,s7_3)) flag4=1.
if (sum(s7_3,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_3>0) and (sum(B2cX3_51 to B2cX3_9) NE s7_3) flag6=1.
do repeat x=B2cX3_51 B2cX3_52 B2cX3_53 B2cX3_56 B2cX3_2.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b2cx3_51 b2cx3_1 b2cx3_52 b2cx3_54 b2cx3_53 b2cx3_7 b2cx3_2 b2cx3_3 b2cx3_4 b2cx3_56 b2cx3_5 b2cx3_6 b2cx3_8 b2cx3_9
/y=a1x3_51 a1x3_1 a1x3_52 a1x3_54 a1x3_53 a1x3_7 a1x3_2 a1x3_3 a1x3_4 a1x3_56 a1x3_5 a1x3_6 a1x3_8 a1x3_9.
if (b2cdkx3_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.

***************************************B2cX4.
do repeat x=B2cX4_1 B2cX4_7 B2cX4_3 B2cX4_4 B2cX4_5 B2cX4_6 B2cX4_8 B2cX4_9 B2cdkx4_99.
if (any(qcountry,7,10,12,16,2057) and (s7_4>0)) and (miss(x) or ~range(x,0,s7_4)) flag1=1.
if ~(any(qcountry,7,10,12,16,2057) or (sum(s7_4,0)=0)) and (~miss(x)) flag2=1.
if (~range(b2cdkx4_99,0,1)) flag3=1.
end repeat.
do repeat x= B2cX4_54.
if (s7_4>0) and (~range(x,0,s7_4)) flag4=1.
if (sum(s7_4,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_4>0) and (sum(B2cX4_51 to B2cX4_9) NE s7_4) flag6=1.
do repeat x=B2cX4_51 B2cX4_52 B2cX4_53 B2cX4_56 B2cX4_2.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b2cx4_51 b2cx4_1 b2cx4_52 b2cx4_54 b2cx4_53 b2cx4_7 b2cx4_2 b2cx4_3 b2cx4_4 b2cx4_56 b2cx4_5 b2cx4_6 b2cx4_8 b2cx4_9
/y=a1x4_51 a1x4_1 a1x4_52 a1x4_54 a1x4_53 a1x4_7 a1x4_2 a1x4_3 a1x4_4 a1x4_56 a1x4_5 a1x4_6 a1x4_8 a1x4_9.
if (b2cdkx4_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.

***************************************B2cX5.
do repeat x=B2cX5_1 B2cX5_7 B2cX5_3 B2cX5_4 B2cX5_5 B2cX5_6 B2cX5_8 B2cX5_9 B2cdkx5_99.
if (any(qcountry,7,10,12,16,2057) and (s7_5>0)) and (miss(x) or ~range(x,0,s7_5)) flag1=1.
if ~(any(qcountry,7,10,12,16,2057) or (sum(s7_5,0)=0)) and (~miss(x)) flag2=1.
if (~range(b2cdkx5_99,0,1)) flag3=1.
end repeat.
do repeat x= B2cX5_54.
if (s7_5>0) and (~range(x,0,s7_5)) flag4=1.
if (sum(s7_5,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_5>0) and (sum(B2cX5_51 to B2cX5_9) NE s7_5) flag6=1.
do repeat x=B2cX5_51 B2cX5_52 B2cX5_53 B2cX5_56 B2cX5_2.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b2cx5_51 b2cx5_1 b2cx5_52 b2cx5_54 b2cx5_53 b2cx5_7 b2cx5_2 b2cx5_3 b2cx5_4 b2cx5_56 b2cx5_5 b2cx5_6 b2cx5_8 b2cx5_9
/y=a1x5_51 a1x5_1 a1x5_52 a1x5_54 a1x5_53 a1x5_7 a1x5_2 a1x5_3 a1x5_4 a1x5_56 a1x5_5 a1x5_6 a1x5_8 a1x5_9.
if (b2cdkx5_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.

***************************************B3BB.
do repeat x= B3bb_1 to  B3bb_3.
if (any(qcountry,7,10,12,16,2057)) and (miss(x) or ~range(x,0,10)) flag1=1.
if (~any(qcountry,7,10,12,16,2057)) and (~miss(x)) flag2=1.
end repeat.
Freq flag1 to flag2.
del var flag1 to flag2.
exe.

***************************************B3BC.
if (b3bb_2>=5) and (miss(B3bc) or ~range(B3bc,1,6)) flag1=1.
if (b3bb_2<5) and (~miss(B3bc)) flag2=1.
Freq flag1 to flag2.
del var flag1 to flag2.
exe.

***************************************B3CX1.
do repeat x=B3cX1_51 B3cX1_1 B3cX1_52 B3cX1_53 B3cX1_7 B3cX1_2 B3cX1_3 B3cX1_4 B3cX1_56 B3cX1_5 B3cX1_6 B3cX1_8 B3cX1_9 b3cdkx1_99.
if (any(qcountry,7,10,12,16,2057) and (s7_1>0)) and (miss(x) or ~range(x,0,s7_1)) flag1=1.
if ~(any(qcountry,7,10,12,16,2057) or (sum(s7_1,0)=0)) and (~miss(x)) flag2=1.
if (~range(b3cdkx1_99,0,1)) flag3=1.
end repeat.
do repeat x= B3cX1_54.
if (s7_1>0) and (~range(x,0,s7_1)) flag4=1.
if (sum(s7_1,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_1>0) and (sum(B3cX1_51 to B3cX1_9) NE s7_1) flag6=1.
do repeat x=b3cx1_51 b3cx1_1 b3cx1_52 b3cx1_54 b3cx1_53 b3cx1_7 b3cx1_2 b3cx1_3 b3cx1_4 b3cx1_56 b3cx1_5 b3cx1_6 b3cx1_8 b3cx1_9
/y=a1x1_51 a1x1_1 a1x1_52 a1x1_54 a1x1_53 a1x1_7 a1x1_2 a1x1_3 a1x1_4 a1x1_56 a1x1_5 a1x1_6 a1x1_8 a1x1_9.
if (b3cdkx1_99=1) and (x NE y) flag7=1.
end repeat.
Freq  flag1 to  flag7.
del var  flag1 to  flag7.
exe.

***************************************B3CX2.
do repeat x=B3CX2_1 B3CX2_7 B3CX2_2 B3CX2_3 B3CX2_4 B3CX2_5 B3CX2_6 B3CX2_8 B3CX2_9 b3cdkx2_99.
if (any(qcountry,7,10,12,16,2057) and (s7_2>0)) and (miss(x) or ~range(x,0,s7_2)) flag1=1.
if ~(any(qcountry,7,10,12,16,2057) or (sum(s7_2,0)=0)) and (~miss(x)) flag2=1.
if (~range(b3cdkx2_99,0,1)) flag3=1.
end repeat.
do repeat x= B3CX2_54.
if (s7_2>0) and (~range(x,0,s7_2)) flag4=1.
if (sum(s7_2,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_2>0) and (sum(B3CX2_51 to B3CX2_9) NE s7_2) flag6=1.
do repeat x=B3CX2_51 B3CX2_52 B3CX2_53 B3CX2_56.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b3cx2_51 b3cx2_1 b3cx2_52 b3cx2_54 b3cx2_53 b3cx2_7 b3cx2_2 b3cx2_3 b3cx2_4 b3cx2_56 b3cx2_5 b3cx2_6 b3cx2_8 b3cx2_9
/y=a1x2_51 a1x2_1 a1x2_52 a1x2_54 a1x2_53 a1x2_7 a1x2_2 a1x2_3 a1x2_4 a1x2_56 a1x2_5 a1x2_6 a1x2_8 a1x2_9.
if (b3cdkx2_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.

***************************************B3CX3.
do repeat x=B3CX3_1 B3CX3_7 B3CX3_3 B3CX3_4 B3CX3_5 B3CX3_6 B3CX3_8 B3CX3_9 b3cdkx3_99.
if (any(qcountry,7,10,12,16,2057) and (s7_3>0)) and (miss(x) or ~range(x,0,s7_3)) flag1=1.
if ~(any(qcountry,7,10,12,16,2057) or (sum(s7_3,0)=0)) and (~miss(x)) flag2=1.
if (~range(b3cdkx3_99,0,1)) flag3=1.
end repeat.
do repeat x= B3CX3_54.
if (s7_3>0) and (~range(x,0,s7_3)) flag4=1.
if (sum(s7_3,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_3>0) and (sum(B3CX3_51 to B3CX3_9) NE s7_3) flag6=1.
do repeat x=B3CX3_51 B3CX3_52 B3CX3_53 B3CX3_56 B3CX3_2.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b3cx3_51 b3cx3_1 b3cx3_52 b3cx3_54 b3cx3_53 b3cx3_7 b3cx3_2 b3cx3_3 b3cx3_4 b3cx3_56 b3cx3_5 b3cx3_6 b3cx3_8 b3cx3_9
/y=a1x3_51 a1x3_1 a1x3_52 a1x3_54 a1x3_53 a1x3_7 a1x3_2 a1x3_3 a1x3_4 a1x3_56 a1x3_5 a1x3_6 a1x3_8 a1x3_9.
if (b3cdkx3_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
EXECUTE.

***************************************B3CX4.
do repeat x=B3CX4_1 B3CX4_7 B3CX4_3 B3CX4_4 B3CX4_5 B3CX4_6 B3CX4_8 B3CX4_9 b3cdkx4_99.
if (any(qcountry,7,10,12,16,2057) and (s7_4>0)) and (miss(x) or ~range(x,0,s7_4)) flag1=1.
if ~(any(qcountry,7,10,12,16,2057) or (sum(s7_4,0)=0)) and (~miss(x)) flag2=1.
if (~range(b3cdkx4_99,0,1)) flag3=1.
end repeat.
do repeat x= B3CX4_54.
if (s7_4>0) and (~range(x,0,s7_4)) flag4=1.
if (sum(s7_4,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_4>0) and (sum(B3CX4_51 to B3CX4_9) NE s7_4) flag6=1.
do repeat x=B3CX4_51 B3CX4_52 B3CX4_53 B3CX4_56 B3CX4_2.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b3cx4_51 b3cx4_1 b3cx4_52 b3cx4_54 b3cx4_53 b3cx4_7 b3cx4_2 b3cx4_3 b3cx4_4 b3cx4_56 b3cx4_5 b3cx4_6 b3cx4_8 b3cx4_9
/y=a1x4_51 a1x4_1 a1x4_52 a1x4_54 a1x4_53 a1x4_7 a1x4_2 a1x4_3 a1x4_4 a1x4_56 a1x4_5 a1x4_6 a1x4_8 a1x4_9.
if (b3cdkx4_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
EXECUTE.

***************************************B3CX5.
do repeat x=B3CX5_1 B3CX5_7 B3CX5_3 B3CX5_4 B3CX5_5 B3CX5_6 B3CX5_8 B3CX5_9 b3cdkx5_99.
if (any(qcountry,7,10,12,16,2057) and (s7_5>0)) and (miss(x) or ~range(x,0,s7_5)) flag1=1.
if ~(any(qcountry,7,10,12,16,2057) or (sum(s7_5,0)=0)) and (~miss(x)) flag2=1.
if (~range(b3cdkx5_99,0,1)) flag3=1.
end repeat.
do repeat x= B3CX5_54.
if (s7_5>0) and (~range(x,0,s7_5)) flag4=1.
if (sum(s7_5,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_5>0) and (sum(B3CX5_51 to B3CX5_9) NE s7_5) flag6=1.
do repeat x=B3CX5_51 B3CX5_52 B3CX5_53 B3CX5_56 B3CX5_2.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b3cx5_51 b3cx5_1 b3cx5_52 b3cx5_54 b3cx5_53 b3cx5_7 b3cx5_2 b3cx5_3 b3cx5_4 b3cx5_56 b3cx5_5 b3cx5_6 b3cx5_8 b3cx5_9
/y=a1x5_51 a1x5_1 a1x5_52 a1x5_54 a1x5_53 a1x5_7 a1x5_2 a1x5_3 a1x5_4 a1x5_56 a1x5_5 a1x5_6 a1x5_8 a1x5_9.
if (b3cdkx5_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.

***************************************B4BA.
tit B4ba.
temporary.
sel if miss(B4ba_1) or ~range(B4ba_1,0,10).
list respid, B4ba_1.

***************************************B4BBX1.
tit B4bbx1.
temporary.
!MULTI_A svar=B4bbx1_1 evar=B4bbx1_9 qnt=B4bbx1 ctr= 9 .

***************************************B4BBX2.
do repeat x=b4bbx1_1 to b4bbx1_8 /y=b4bbx2_1 to b4bbx2_8.
if (x=1) and (miss(y) or ~range(y,1,9)) flag1=1.
if (x NE 1) and (~miss(y)) flag2=1.
If b4bbx1_9=1 and ~mis(y) flag3=1.
end repeat.
If b4bbx1_9=1 and ~mis(b4bbx2_9) flag4=1.
Freq flag1 to flag4.
del var flag1 to flag4.
exe.

Count B4BB_cnt=b4bbx1_1 to b4bbx1_8(1).
exe.

If(B4BB_cnt=1)B4BB_F=1.
Filt by B4BB_F.
!Rank_ALL_CHK svar=b4bbx2_1 evar=b4bbx2_8 qnt=b4bbx1 rank=1  opr=~=.
Filt off.
Del var B4BB_F.
exe.

If(B4BB_cnt=2)B4BB_F=1.
Filt by B4BB_F.
!Rank_ALL_CHK svar=b4bbx2_1 evar=b4bbx2_8 qnt=b4bbx2 rank=2  opr=~=.
Filt off.
Del var B4BB_F.
exe.

If(B4BB_cnt=3)B4BB_F=1.
Filt by B4BB_F.
!Rank_ALL_CHK svar=b4bbx2_1 evar=b4bbx2_8 qnt=b4bbx3 rank=3  opr=~=.
Filt off.
Del var B4BB_F.
exe.

If(B4BB_cnt=4)B4BB_F=1.
Filt by B4BB_F.
!Rank_ALL_CHK svar=b4bbx2_1 evar=b4bbx2_8 qnt=b4bbx4 rank=4  opr=~=.
Filt off.
Del var B4BB_F.
exe.

If(B4BB_cnt=5)B4BB_F=1.
Filt by B4BB_F.
!Rank_ALL_CHK svar=b4bbx2_1 evar=b4bbx2_8 qnt=b4bbx5 rank=5  opr=~=.
Filt off.
Del var B4BB_F.
exe.

If(B4BB_cnt=6)B4BB_F=1.
Filt by B4BB_F.
!Rank_ALL_CHK svar=b4bbx2_1 evar=b4bbx2_8 qnt=b4bbx6 rank=6  opr=~=.
Filt off.
Del var B4BB_F.
exe.

If(B4BB_cnt=7)B4BB_F=1.
Filt by B4BB_F.
!Rank_ALL_CHK svar=b4bbx2_1 evar=b4bbx2_8 qnt=b4bbx7 rank=7  opr=~=.
Filt off.
Del var B4BB_F.
exe.

If(B4BB_cnt=8)B4BB_F=1.
Filt by B4BB_F.
!Rank_ALL_CHK svar=b4bbx2_1 evar=b4bbx2_8 qnt=b4bbx8 rank=8  opr=~=.
Filt off.
Del var B4BB_F.
exe.

!Rank_ALL_CHK svar=b4bbx2_1 evar=b4bbx2_8 qnt=b4bbx8 rank=8  opr=>.
Del var B4BB_cnt.
exe.

***************************************B4BC.
if (b4ba_1>=5) and (miss(B4bc) or ~range(B4bc,1,6)) flag1=1.
if (b4ba_1<5) and (~miss(B4bc)) flag2=1.
Freq flag1 to flag2.
del var flag1 to flag2.
exe.

***************************************B4DX1.
do repeat x=b4dx1_98 b4dx1_1 b4dx1_7 b4dx1_2 b4dx1_3 b4dx1_4 b4dx1_5 b4dx1_6 b4dx1_8 b4dx1_9 b4ddkx1_99.
if (s7_1>0) and (miss(x) or ~range(x,0,s7_1)) flag1=1.
if (sum(s7_1,0)=0) and (~miss(x)) flag2=1.
if (~range(b4ddkx1_99,0,1)) flag3=1.
end repeat.
do repeat x= b4dx1_54.
if (s7_1>0) and (~range(x,0,s7_1)) flag4=1.
if (sum(s7_1,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_1>0) and (sum(b4dx1_98 to b4dx1_9) NE s7_1) flag6=1.
do repeat x=b4dx1_51 b4dx1_1 b4dx1_52 b4dx1_54 b4dx1_53 b4dx1_7 b4dx1_2 b4dx1_3 b4dx1_4 b4dx1_56 b4dx1_5 b4dx1_6 b4dx1_8 b4dx1_9
/y=a1x1_51 a1x1_1 a1x1_52 a1x1_54 a1x1_53 a1x1_7 a1x1_2 a1x1_3 a1x1_4 a1x1_56 a1x1_5 a1x1_6 a1x1_8 a1x1_9.
if (b4ddkx1_99=1) and (x NE y) flag7=1.
end repeat.
Freq  flag1 to  flag7.
del var  flag1 to  flag7.
exe.

***************************************B4DX2.
do repeat x=B4DX2_98  B4DX2_1 B4DX2_7 B4DX2_2 B4DX2_3 B4DX2_4 B4DX2_5 B4DX2_6 B4DX2_8 B4DX2_9 b4ddkx2_99.
if (s7_2>0) and (miss(x) or ~range(x,0,s7_2)) flag1=1.
if (sum(s7_2,0)=0) and (~miss(x)) flag2=1.
if (~range(b4ddkx2_99,0,1)) flag3=1.
end repeat.
do repeat x= B4DX2_54.
if (s7_2>0) and (~range(x,0,s7_2)) flag4=1.
if (sum(s7_2,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_2>0) and (sum(B4DX2_98 to B4DX2_9) NE s7_2) flag6=1.
do repeat x=B4DX2_51 B4DX2_52 B4DX2_53  B4DX2_56.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b4dx2_51 b4dx2_1 b4dx2_52 b4dx2_54 b4dx2_53 b4dx2_7 b4dx2_2 b4dx2_3 b4dx2_4 b4dx2_56 b4dx2_5 b4dx2_6 b4dx2_8 b4dx2_9
/y=a1x2_51 a1x2_1 a1x2_52 a1x2_54 a1x2_53 a1x2_7 a1x2_2 a1x2_3 a1x2_4 a1x2_56 a1x2_5 a1x2_6 a1x2_8 a1x2_9.
if (b4ddkx2_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.

***************************************B4DX3.
do repeat x=B4DX3_98  B4DX3_1 B4DX3_7 B4DX3_3 B4DX3_4 B4DX3_5 B4DX3_6 B4DX3_8 B4DX3_9 b4ddkx3_99.
if (s7_3>0) and (miss(x) or ~range(x,0,s7_3)) flag1=1.
if (sum(s7_3,0)=0) and (~miss(x)) flag2=1.
if (~range(b4ddkx3_99,0,1)) flag3=1.
end repeat.
do repeat x= B4DX3_54.
if (s7_3>0) and (~range(x,0,s7_3)) flag4=1.
if (sum(s7_3,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_3>0) and (sum(B4DX3_98 to B4DX3_9) NE s7_3) flag6=1.
do repeat x=B4DX3_51 B4DX3_52 B4DX3_53  B4DX3_56 B4DX3_2 .
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b4dx3_51 b4dx3_1 b4dx3_52 b4dx3_54 b4dx3_53 b4dx3_7 b4dx3_2 b4dx3_3 b4dx3_4 b4dx3_56 b4dx3_5 b4dx3_6 b4dx3_8 b4dx3_9
/y=a1x3_51 a1x3_1 a1x3_52 a1x3_54 a1x3_53 a1x3_7 a1x3_2 a1x3_3 a1x3_4 a1x3_56 a1x3_5 a1x3_6 a1x3_8 a1x3_9.
if (b4ddkx3_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.


***************************************B4DX4.
do repeat x=B4DX4_98  B4DX4_1 B4DX4_7 B4DX4_3 B4DX4_4 B4DX4_5 B4DX4_6 B4DX4_8 B4DX4_9 b4ddkx4_99.
if (s7_4>0) and (miss(x) or ~range(x,0,s7_4)) flag1=1.
if (sum(s7_4,0)=0) and (~miss(x)) flag2=1.
if (~range(b4ddkx4_99,0,1)) flag3=1.
end repeat.
do repeat x= B4DX4_54.
if (s7_4>0) and (~range(x,0,s7_4)) flag4=1.
if (sum(s7_4,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_4>0) and (sum(B4DX4_98 to B4DX4_9) NE s7_4) flag6=1.
do repeat x=B4DX4_51 B4DX4_52 B4DX4_53  B4DX4_56 B4DX4_2.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b4dx4_51 b4dx4_1 b4dx4_52 b4dx4_54 b4dx4_53 b4dx4_7 b4dx4_2 b4dx4_3 b4dx4_4 b4dx4_56 b4dx4_5 b4dx4_6 b4dx4_8 b4dx4_9
/y=a1x4_51 a1x4_1 a1x4_52 a1x4_54 a1x4_53 a1x4_7 a1x4_2 a1x4_3 a1x4_4 a1x4_56 a1x4_5 a1x4_6 a1x4_8 a1x4_9.
if (b4ddkx4_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.


***************************************B4DX5.
do repeat x=B4DX5_98  B4DX5_1 B4DX5_7 B4DX5_3 B4DX5_4 B4DX5_5 B4DX5_6 B4DX5_8 B4DX5_9 b4ddkx5_99.
if (s7_5>0) and (miss(x) or ~range(x,0,s7_5)) flag1=1.
if (sum(s7_5,0)=0) and (~miss(x)) flag2=1.
if (~range(b4ddkx5_99,0,1)) flag3=1.
end repeat.
do repeat x= B4DX5_54.
if (s7_5>0) and (~range(x,0,s7_5)) flag4=1.
if (sum(s7_5,0)=0) and (~miss(x)) flag5=1.
end repeat.
if (s7_5>0) and (sum(B4DX5_98 to B4DX5_9) NE s7_5) flag6=1.
do repeat x=B4DX5_51 B4DX5_52 B4DX5_53  B4DX5_56 B4DX5_2.
if (~miss(x)) flag7=1.
end repeat.
do repeat x=b4dx5_51 b4dx5_1 b4dx5_52 b4dx5_54 b4dx5_53 b4dx5_7 b4dx5_2 b4dx5_3 b4dx5_4 b4dx5_56 b4dx5_5 b4dx5_6 b4dx5_8 b4dx5_9
/y=a1x5_51 a1x5_1 a1x5_52 a1x5_54 a1x5_53 a1x5_7 a1x5_2 a1x5_3 a1x5_4 a1x5_56 a1x5_5 a1x5_6 a1x5_8 a1x5_9.
if (b4ddkx5_99=1) and (x NE y) flag8=1.
end repeat.
Freq  flag1 to  flag8.
del var  flag1 to  flag8.
exe.

***************************************B4f.
do repeat x= b4f_1 b4f_2.
if (miss(x) or ~range(x,0,10)) flag1=1.
end repeat.
Freq flag1.
del var flag1.
exe.

***************************************B4g.
if (s7_1>0) and (b4dx1_98 NE b4g_1) flag1=1.
if (sum(s7_1,0)=0) and (~miss(b4g_1) or ~range(b4g_1,0,s7_1)) flag2=1.
if (s7_1>0) and (miss(b4g_2)) flag3=1.
Freq flag1 to flag3.
del var flag1 to flag3.
exe.

***************************************B4i.
do repeat x= b4i_1 b4i_2.
if (miss(x) or ~range(x,0,10)) flag1=1.
if (b4i_2>b4i_1) flag2=1.
end repeat.
Freq flag1 to flag2.
del var flag1 to flag2.
exe.

***************************************B4j.
if (s7_1>0) and (b4dx1_98 NE b4j_1) flag1=1.
if (s7_1=0) and ~miss(b4j_1)flag2=1.
if (s7_1>0 and b4dx1_98>0)  and (mis(b4j_2) or ~range(b4j_2,0,b4dx1_98)) flag3=1.
if (b4dx1_98=0) and (b4j_2<>0) flag4=1.
If(mis(s7_1) or s7_1=0) and ~mis(b4j_2)flag5=1.
Freq flag1 to flag5.
del var flag1 to flag5.
exe.

***************************************B4k.
do repeat x= b4k_1 b4k_2.
if (miss(x) or ~range(x,0,10)) flag1=1.
end repeat.
Freq flag1.
del var flag1.
exe.

***************************************B4Lx1.
if (s7_1>0) and (b4dx1_98 NE b4lx1_1) flag1=1.
if (s7_1>0) and (miss(b4dx1_98) and miss(b4lx1_1)) flag2=1.
if (s7_1>0) and (sum(b4dx1_2,b4dx1_3) NE b4lx1_2) flag3=1.
if (s7_1>0) and (sum(b4lx1_1,b4lx1_2) NE b4lx1_3) flag4=1.
if (s7_1>0) and (miss(b4lx1_4) or ~range(b4lx1_4,0,s7_1)) flag5=1.
if (sum(s7_1,0)=0) and (~miss(b4lx1_4)) flag6=1.
if (s7_1>0) and (miss(b4ldkx1_5) or ~range(b4ldkx1_5,0,1)) flag7=1.
if (sum(s7_1,0)=0) and (~miss(b4ldkx1_5)) flag8=1.
if (b4lx1_4<b4lx1_2) flag9=1.
Freq flag1 to flag9.
del var flag1 to flag9.
exe.

***************************************B4Lx2.
if (s7_2>0) and (b4dx2_98 NE B4Lx2_1) flag1=1.
if (s7_2>0) and (miss(b4dx2_98) and miss(B4Lx2_1)) flag2=1.
if (s7_2>0) and (sum(b4dx2_2,b4dx2_3) NE B4Lx2_2) flag3=1.
if (s7_2>0) and (sum(B4Lx2_1,B4Lx2_2) NE B4Lx2_3) flag4=1.
if (s7_2>0) and (miss(B4Lx2_4) or ~range(B4Lx2_4,0,s7_2)) flag5=1.
if (sum(s7_2,0)=0) and (~miss(B4Lx2_4)) flag6=1.
if (s7_2>0) and (miss(b4ldkx2_5) or ~range(b4ldkx2_5,0,1)) flag7=1.
if (sum(s7_2,0)=0) and (~miss(b4ldkx2_5)) flag8=1.
if (B4Lx2_4<B4Lx2_2) flag9=1.
Freq flag1 to flag9.
del var flag1 to flag9.
exe.

***************************************B4Lx3.
if (s7_3>0) and (b4dx3_98 NE B4Lx3_1) flag1=1.
if (s7_3>0) and (miss(b4dx3_98) and miss(B4Lx3_1)) flag2=1.
if (s7_3>0) and (sum(b4dx3_2,b4dx3_3) NE B4Lx3_2) flag3=1.
if (s7_3>0) and (sum(B4Lx3_1,B4Lx3_2) NE B4Lx3_3) flag4=1.
if (s7_3>0) and (miss(B4Lx3_4) or ~range(B4Lx3_4,0,s7_3)) flag5=1.
if (sum(s7_3,0)=0) and (~miss(B4Lx3_4)) flag6=1.
if (s7_3>0) and (miss(b4ldkx3_5) or ~range(b4ldkx3_5,0,1)) flag7=1.
if (sum(s7_3,0)=0) and (~miss(b4ldkx3_5)) flag8=1.
if (B4Lx3_4<B4Lx3_2) flag9=1.
Freq flag1 to flag9.
del var flag1 to flag9.
exe.


***************************************B4m.
do repeat x= b4m_1 b4m_2.
if (miss(x) or ~range(x,0,10)) flag1=1.
end repeat.
Freq flag1.
del var flag1.
exe.

***************************************B4n.
if (s7_1>0) and (b4dx1_98 NE b4nx1_1) flag1=1.
if (s7_1>0) and (miss(b4dx1_98) and miss(b4nx1_1)) flag2=1.
if (s7_1>0) and (b4dx1_4 NE b4nx1_2) flag3=1.
if (s7_1>0) and (miss(b4dx1_4) and miss(b4nx1_2)) flag4=1.
if (s7_1>0) and (sum(b4nx1_1,b4nx1_2) NE b4nx1_3) flag5=1.
if (sum(s7_1,0)=0) and (~miss(b4nx1_3)) flag6=1.
if (s7_1>0 and b4ndkx1_5=0) and (miss(b4nx1_4) or ~range(b4nx1_4,0,s7_1)) flag7=1.
if (sum(s7_1,0)=0 or b4ndkx1_5=1) and (~miss(b4nx1_4)) flag8=1.
if (s7_1>0) and (miss(b4ndkx1_5) or ~range(b4ndkx1_5,0,1)) flag9=1.
if (sum(s7_1,0)=0) and (~miss(b4ndkx1_5)) flag10=1.
Freq flag1 to flag10.
del var flag1 to flag10.
exe.

***************************************B4nx2.
if (s7_2>0) and (b4dx2_98 NE b4nx2_1) flag1=1.
if (s7_2>0) and (miss(b4dx2_98) and miss(b4nx2_1)) flag2=1.
if (s7_2>0) and (b4dx2_4 NE b4nx2_2) flag3=1.
if (s7_2>0) and (miss(b4dx2_4) and miss(b4nx2_2)) flag4=1.
if (s7_2>0) and (sum(b4nx2_1,b4nx2_2) NE b4nx2_3) flag5=1.
if (sum(s7_2,0)=0) and (~miss(b4nx2_3)) flag6=1.
if (s7_2>0 and b4ndkx2_5=0) and (miss(b4nx2_4) or ~range(b4nx2_4,0,s7_2)) flag7=1.
if (sum(s7_2,0)=0 or b4ndkx2_5=1) and (~miss(b4nx2_4)) flag8=1.
if (s7_2>0) and (miss(b4ndkx2_5) or ~range(b4ndkx2_5,0,1)) flag9=1.
if (sum(s7_2,0)=0) and (~miss(b4ndkx2_5)) flag10=1.
Freq flag1 to flag10.
del var flag1 to flag10.
exe.

***************************************B4nx3.
if (s7_3>0) and (b4dx3_98 NE b4nx3_1) flag1=1.
if (s7_3>0) and (miss(b4dx3_98) and miss(b4nx3_1)) flag2=1.
if (s7_3>0) and (b4dx3_4 NE b4nx3_2) flag3=1.
if (s7_3>0) and (miss(b4dx3_4) and miss(b4nx3_2)) flag4=1.
if (s7_3>0) and (sum(b4nx3_1,b4nx3_2) NE b4nx3_3) flag5=1.
if (sum(s7_3,0)=0) and (~miss(b4nx3_3)) flag6=1.
if (s7_3>0 and b4ndkx3_5=0) and (miss(b4nx3_4) or ~range(b4nx3_4,0,s7_3)) flag7=1.
if (sum(s7_3,0)=0 or b4ndkx3_5=1) and (~miss(b4nx3_4)) flag8=1.
if (s7_3>0) and (miss(b4ndkx3_5) or ~range(b4ndkx3_5,0,1)) flag9=1.
if (sum(s7_3,0)=0) and (~miss(b4ndkx3_5)) flag10=1.
Freq flag1 to flag10.
del var flag1 to flag10.
exe.



***************************************B5BA.
tit B5ba.
temporary.
sel if miss(B5ba_1) or ~range(B5ba_1,0,10).
list respid, B5ba_1.
temporary.
sel if miss(B5ba_2) or ~range(B5ba_2,0,10).
list respid, B5ba_2.
temporary.
sel if miss(B5ba_3) or ~range(B5ba_3,0,10).
list respid, B5ba_3.

***************************************B5BB.
if (b5ba_1>=5 or b5ba_2>=5 or b5ba_3>=5) and (miss(B5bb) or ~range(B5bb,0,6)) flag1=1.
if (b5ba_1<5 and b5ba_2<5 and b5ba_3<5) and (~miss(B5bb)) flag2=1.
Freq  flag1 to  flag2.
del var  flag1 to  flag2.
exe.

***************************************B5CX1.
if (s7_1>0 and qcountry=3081) and (miss(b5cx1_98) or ~range(b5cx1_98,0,s7_1)) flag1=1.
if (sum(s7_1,0)=0 or qcountry NE 3081) and (~miss(b5cx1_98)) flag2=1.
do repeat x=b5cx1_51 b5cx1_1 b5cx1_52 b5cx1_53 b5cx1_7 b5cx1_2 b5cx1_3 b5cx1_4 b5cx1_56 b5cx1_5 b5cx1_6 b5cx1_8 b5cx1_9.
if (s7_1>0) and (miss(x) or ~range(x,0,s7_1)) flag3=1.
if (sum(s7_1,0)=0) and (~miss(x)) flag4=1.
end repeat.
do repeat x=b5cx1_54.
if (s7_1>0) and (~range(x,0,s7_1)) flag5=1.
if (sum(s7_1,0)=0) and (~miss(x)) flag6=1.
end repeat.
do repeat x=b5cdkx1_99.
if (s7_1>0) and (~range(x,0,1)) flag7=1.
if (sum(s7_1,0)=0) and (~miss(x)) flag8=1.
end repeat.
if (s7_1>0) and (sum(b5cx1_98 to b5cx1_9) NE s7_1) flag9=1.
do repeat x=b5cx1_51 b5cx1_1 b5cx1_52 b5cx1_54 b5cx1_53 b5cx1_7 b5cx1_2 b5cx1_3 b5cx1_4 b5cx1_56 b5cx1_5 b5cx1_6 b5cx1_8 b5cx1_9
/y=a1x1_51 a1x1_1 a1x1_52 a1x1_54 a1x1_53 a1x1_7 a1x1_2 a1x1_3 a1x1_4 a1x1_56 a1x1_5 a1x1_6 a1x1_8 a1x1_9.
if (b5cdkx1_99=1) and (x NE y) flag10=1.
end repeat.
Freq  flag1 to  flag10.
del var  flag1 to  flag10.
exe.
    

***************************************B5CX2.
if (s7_2>0 and qcountry=3081) and (miss(b5cx2_98) or ~range(b5cx2_98,0,s7_2)) flag1=1.
if (sum(s7_2,0)=0 or qcountry NE 3081) and (~miss(b5cx2_98)) flag2=1.
do repeat x= b5cx2_1 b5cx2_7 b5cx2_2 b5cx2_3 b5cx2_4 b5cx2_5 b5cx2_6 b5cx2_8 b5cx2_9.
if (s7_2>0) and (miss(x) or ~range(x,0,s7_2)) flag3=1.
if (sum(s7_2,0)=0) and (~miss(x)) flag4=1.
end repeat.
do repeat x=b5cx2_54.
if (s7_2>0) and (~range(x,0,s7_2)) flag5=1.
if (sum(s7_2,0)=0) and (~miss(x)) flag6=1.
end repeat.
do repeat x=b5cdkx2_99.
if (s7_2>0) and (~range(x,0,1)) flag7=1.
if (sum(s7_2,0)=0) and (~miss(x)) flag8=1.
end repeat.
do repeat x=b5cx2_51 b5cx2_52 b5cx2_53 b5cx2_56.
if (~miss(x)) flag9=1.
end repeat.
if (s7_2>0) and (sum(b5cx2_98 to b5cx2_9) NE s7_2) flag10=1.
do repeat x=b5cx2_51 b5cx2_1 b5cx2_52 b5cx2_54 b5cx2_53 b5cx2_7 b5cx2_2 b5cx2_3 b5cx2_4 b5cx2_56 b5cx2_5 b5cx2_6 b5cx2_8 b5cx2_9
/y=a1x2_51 a1x2_1 a1x2_52 a1x2_54 a1x2_53 a1x2_7 a1x2_2 a1x2_3 a1x2_4 a1x2_56 a1x2_5 a1x2_6 a1x2_8 a1x2_9.
if (b5cdkx2_99=1) and (x NE y) flag11=1.
end repeat.
Freq  flag1 to  flag11.
del var  flag1 to  flag11.
exe.
    

***************************************B5CX3.
if (s7_3>0 and qcountry=3081) and (miss(b5cx3_98) or ~range(b5cx3_98,0,s7_3)) flag1=1.
if (sum(s7_3,0)=0 or qcountry NE 3081) and (~miss(b5cx3_98)) flag2=1.
do repeat x= b5cx3_1 b5cx3_7 b5cx3_3 b5cx3_4 b5cx3_5 b5cx3_6 b5cx3_8 b5cx3_9.
if (s7_3>0) and (miss(x) or ~range(x,0,s7_3)) flag3=1.
if (sum(s7_3,0)=0) and (~miss(x)) flag4=1.
end repeat.
do repeat x=b5cx3_54.
if (s7_3>0) and (~range(x,0,s7_3)) flag5=1.
if (sum(s7_3,0)=0) and (~miss(x)) flag6=1.
end repeat.
do repeat x=b5cdkx3_99.
if (s7_3>0) and (~range(x,0,1)) flag7=1.
if (sum(s7_3,0)=0) and (~miss(x)) flag8=1.
end repeat.
do repeat x=b5cx3_51 b5cx3_52 b5cx3_53 b5cx3_56 b5cx3_2.
if (~miss(x)) flag9=1.
end repeat.
if (s7_3>0) and (sum(b5cx3_98 to b5cx3_9) NE s7_3) flag10=1.
do repeat x=b5cx3_51 b5cx3_1 b5cx3_52 b5cx3_54 b5cx3_53 b5cx3_7 b5cx3_2 b5cx3_3 b5cx3_4 b5cx3_56 b5cx3_5 b5cx3_6 b5cx3_8 b5cx3_9
/y=a1x3_51 a1x3_1 a1x3_52 a1x3_54 a1x3_53 a1x3_7 a1x3_2 a1x3_3 a1x3_4 a1x3_56 a1x3_5 a1x3_6 a1x3_8 a1x3_9.
if (b5cdkx3_99=1) and (x NE y) flag11=1.
end repeat.
Freq  flag1 to  flag11.
del var  flag1 to  flag11.
exe.

***************************************B5CX4.
if (s7_4>0 and qcountry=3081) and (miss(b5cx4_98) or ~range(b5cx4_98,0,s7_4)) flag1=1.
if (sum(s7_4,0)=0 or qcountry NE 3081) and (~miss(b5cx4_98)) flag2=1.
do repeat x= b5cx4_1 b5cx4_7 b5cx4_3 b5cx4_4 b5cx4_5 b5cx4_6 b5cx4_8 b5cx4_9.
if (s7_4>0) and (miss(x) or ~range(x,0,s7_4)) flag3=1.
if (sum(s7_4,0)=0) and (~miss(x)) flag4=1.
end repeat.
do repeat x=b5cx4_54.
if (s7_4>0) and (~range(x,0,s7_4)) flag5=1.
if (sum(s7_4,0)=0) and (~miss(x)) flag6=1.
end repeat.
do repeat x=b5cdkx4_99.
if (s7_4>0) and (~range(x,0,1)) flag7=1.
if (sum(s7_4,0)=0) and (~miss(x)) flag8=1.
end repeat.
do repeat x=b5cx4_51 b5cx4_52 b5cx4_53 b5cx4_56 b5cx4_2.
if (~miss(x)) flag9=1.
end repeat.
if (s7_4>0) and (sum(b5cx4_98 to b5cx4_9) NE s7_4) flag10=1.
do repeat x=b5cx4_51 b5cx4_1 b5cx4_52 b5cx4_54 b5cx4_53 b5cx4_7 b5cx4_2 b5cx4_3 b5cx4_4 b5cx4_56 b5cx4_5 b5cx4_6 b5cx4_8 b5cx4_9
/y=a1x4_51 a1x4_1 a1x4_52 a1x4_54 a1x4_53 a1x4_7 a1x4_2 a1x4_3 a1x4_4 a1x4_56 a1x4_5 a1x4_6 a1x4_8 a1x4_9.
if (b5cdkx4_99=1) and (x NE y) flag11=1.
end repeat.
Freq  flag1 to  flag11.
del var  flag1 to  flag11.
exe.

***************************************B5CX5.
if (s7_5>0 and qcountry=3081) and (miss(b5cx5_98) or ~range(b5cx5_98,0,s7_5)) flag1=1.
if (sum(s7_5,0)=0 or qcountry NE 3081) and (~miss(b5cx5_98)) flag2=1.
do repeat x= b5cx5_1 b5cx5_7 b5cx5_3 b5cx5_4 b5cx5_5 b5cx5_6 b5cx5_8 b5cx5_9.
if (s7_5>0) and (miss(x) or ~range(x,0,s7_5)) flag3=1.
if (sum(s7_5,0)=0) and (~miss(x)) flag4=1.
end repeat.
do repeat x=b5cx5_54.
if (s7_5>0) and (~range(x,0,s7_5)) flag5=1.
if (sum(s7_5,0)=0) and (~miss(x)) flag6=1.
end repeat.
do repeat x=b5cdkx5_99.
if (s7_5>0) and (~range(x,0,1)) flag7=1.
if (sum(s7_5,0)=0) and (~miss(x)) flag8=1.
end repeat.
do repeat x=b5cx5_51 b5cx5_52 b5cx5_53 b5cx5_56 b5cx5_2.
if (~miss(x)) flag9=1.
end repeat.
if (s7_5>0) and (sum(b5cx5_98 to b5cx5_9) NE s7_5) flag10=1.
do repeat x=b5cx5_51 b5cx5_1 b5cx5_52 b5cx5_54 b5cx5_53 b5cx5_7 b5cx5_2 b5cx5_3 b5cx5_4 b5cx5_56 b5cx5_5 b5cx5_6 b5cx5_8 b5cx5_9
/y=a1x5_51 a1x5_1 a1x5_52 a1x5_54 a1x5_53 a1x5_7 a1x5_2 a1x5_3 a1x5_4 a1x5_56 a1x5_5 a1x5_6 a1x5_8 a1x5_9.
if (b5cdkx5_99=1) and (x NE y) flag11=1.
end repeat.
Freq  flag1 to  flag11.
del var  flag1 to  flag11.
exe.

***************************************B5DX1.
if (qcountry=3081 and s7_1>0) and (b5cx1_98 NE b5dx1_1) flag1=1.
if (qcountry=3081 and s7_1>0) and (miss(b5cx1_98) and ~miss(b5dx1_1)) flag2=1.
if (qcountry=3081 and s7_1>0) and (~miss(b5cx1_98) and miss(b5dx1_1)) flag3=1.
if (qcountry=3081 and s7_1>0) and (sum(b5cx1_2,b5cx1_3) NE b5dx1_2) flag4=1.
if (qcountry=3081 and s7_1>0) and ((nmiss(b5cx1_2,b5cx1_3)=2) and ~miss(b5dx1_2)) flag5=1.
if (qcountry=3081 and s7_1>0) and ((nmiss(b5cx1_2,b5cx1_3) NE 2) and miss(b5dx1_2)) flag6=1.
if (qcountry=3081 and s7_1>0) and (sum(b5dx1_1,b5dx1_2) NE b5dx1_3) flag7=1.
if (qcountry=3081 and s7_1>0) and ((nmiss(b5dx1_1,b5dx1_2)=2) and ~miss(b5dx1_3)) flag8=1.
if (qcountry=3081 and s7_1>0) and ((nmiss(b5dx1_1,b5dx1_2) NE 2) and miss(b5dx1_3)) flag9=1.
if (qcountry=3081 and s7_1>0 and b5ddkx1_5=0) and (miss(b5dx1_4)) flag10=1.
if (qcountry=3081 and s7_1>0 and b5ddkx1_5=1) and (~miss(b5dx1_4)) flag11=1.
if (qcountry=3081 and s7_1>0) and (b5dx1_4<b5dx1_2) flag12=1.
if (qcountry=3081 and s7_1>0) and (miss(b5ddkx1_5) or ~range(b5ddkx1_5,0,1)) flag13=1.
if (qcountry NE 3081 or s7_1=0) and (~miss(b5ddkx1_5)) flag14=1.
Freq  flag1 to  flag14.
del var  flag1 to  flag14.
EXECUTE.

***************************************B5DX2.
if (qcountry=3081 and s7_2>0) and (b5cx2_98 NE B5DX2_1) flag1=1.
if (qcountry=3081 and s7_2>0) and (miss(b5cx2_98) and ~miss(B5DX2_1)) flag2=1.
if (qcountry=3081 and s7_2>0) and (~miss(b5cx2_98) and miss(B5DX2_1)) flag3=1.
if (qcountry=3081 and s7_2>0) and (sum(b5cx2_2,b5cx2_3) NE B5DX2_2) flag4=1.
if (qcountry=3081 and s7_2>0) and ((nmiss(b5cx2_2,b5cx2_3)=2) and ~miss(B5DX2_2)) flag5=1.
if (qcountry=3081 and s7_2>0) and ((nmiss(b5cx2_2,b5cx2_3) NE 2) and miss(B5DX2_2)) flag6=1.
if (qcountry=3081 and s7_2>0) and (sum(B5DX2_1,B5DX2_2) NE B5DX2_3) flag7=1.
if (qcountry=3081 and s7_2>0) and ((nmiss(B5DX2_1,B5DX2_2)=2) and ~miss(B5DX2_3)) flag8=1.
if (qcountry=3081 and s7_2>0) and ((nmiss(B5DX2_1,B5DX2_2) NE 2) and miss(B5DX2_3)) flag9=1.
if (qcountry=3081 and s7_2>0 and b5ddkx2_5=0) and (miss(B5DX2_4)) flag10=1.
if (qcountry=3081 and s7_2>0 and b5ddkx2_5=1) and (~miss(B5DX2_4)) flag11=1.
if (qcountry=3081 and s7_2>0) and (b5dx2_4<b5dx2_2) flag12=1.
if (qcountry=3081 and s7_2>0) and (miss(b5ddkx2_5) or ~range(b5ddkx2_5,0,1)) flag13=1.
if (qcountry NE 3081 or s7_2=0) and (~miss(b5ddkx2_5)) flag14=1.
Freq  flag1 to  flag14.
del var  flag1 to  flag14.
EXECUTE.

***************************************B5DX3.
if (qcountry=3081 and s7_3>0) and (b5cx3_98 NE B5DX3_1) flag1=1.
if (qcountry=3081 and s7_3>0) and (miss(b5cx3_98) and ~miss(B5DX3_1)) flag2=1.
if (qcountry=3081 and s7_3>0) and (~miss(b5cx3_98) and miss(B5DX3_1)) flag3=1.
if (qcountry=3081 and s7_3>0) and (sum(b5cx3_2,b5cx3_3) NE B5DX3_2) flag4=1.
if (qcountry=3081 and s7_3>0) and ((nmiss(b5cx3_2,b5cx3_3)=2) and ~miss(B5DX3_2)) flag5=1.
if (qcountry=3081 and s7_3>0) and ((nmiss(b5cx3_2,b5cx3_3) NE 2) and miss(B5DX3_2)) flag6=1.
if (qcountry=3081 and s7_3>0) and (sum(B5DX3_1,B5DX3_2) NE B5DX3_3) flag7=1.
if (qcountry=3081 and s7_3>0) and ((nmiss(B5DX3_1,B5DX3_2)=2) and ~miss(B5DX3_3)) flag8=1.
if (qcountry=3081 and s7_3>0) and ((nmiss(B5DX3_1,B5DX3_2) NE 2) and miss(B5DX3_3)) flag9=1.
if (qcountry=3081 and s7_3>0 and b5ddkx3_5=0) and (miss(B5DX3_4)) flag10=1.
if (qcountry=3081 and s7_3>0 and b5ddkx3_5=1) and (~miss(B5DX3_4)) flag11=1.
if (qcountry=3081 and s7_3>0) and (B5DX3_4<B5DX3_2) flag12=1.
if (qcountry=3081 and s7_3>0) and (miss(b5ddkx3_5) or ~range(b5ddkx3_5,0,1)) flag13=1.
if (qcountry NE 3081 or s7_3=0) and (~miss(b5ddkx3_5)) flag14=1.
Freq  flag1 to  flag14.
del var  flag1 to  flag14.
EXECUTE.


***************************************B5DX4.
if (qcountry=3081 and s7_4>0) and (b5cx4_98 NE B5DX4_1) flag1=1.
if (qcountry=3081 and s7_4>0) and (miss(b5cx4_98) and ~miss(B5DX4_1)) flag2=1.
if (qcountry=3081 and s7_4>0) and (~miss(b5cx4_98) and miss(B5DX4_1)) flag3=1.
if (qcountry=3081 and s7_4>0) and (sum(b5cx4_2,b5cx4_3) NE B5DX4_2) flag4=1.
if (qcountry=3081 and s7_4>0) and ((nmiss(b5cx4_2,b5cx4_3)=2) and ~miss(B5DX4_2)) flag5=1.
if (qcountry=3081 and s7_4>0) and ((nmiss(b5cx4_2,b5cx4_3) NE 2) and miss(B5DX4_2)) flag6=1.
if (qcountry=3081 and s7_4>0) and (sum(B5DX4_1,B5DX4_2) NE B5DX4_3) flag7=1.
if (qcountry=3081 and s7_4>0) and ((nmiss(B5DX4_1,B5DX4_2)=2) and ~miss(B5DX4_3)) flag8=1.
if (qcountry=3081 and s7_4>0) and ((nmiss(B5DX4_1,B5DX4_2) NE 2) and miss(B5DX4_3)) flag9=1.
if (qcountry=3081 and s7_4>0 and b5ddkx4_5=0) and (miss(B5DX4_4)) flag10=1.
if (qcountry=3081 and s7_4>0 and b5ddkx4_5=1) and (~miss(B5DX4_4)) flag11=1.
if (qcountry=3081 and s7_4>0) and (B5DX4_4<B5DX4_2) flag12=1.
if (qcountry=3081 and s7_4>0) and (miss(b5ddkx4_5) or ~range(b5ddkx4_5,0,1)) flag13=1.
if (qcountry NE 3081 or s7_4=0) and (~miss(b5ddkx4_5)) flag14=1.
Freq  flag1 to  flag14.
del var  flag1 to  flag14.
EXECUTE.

***************************************B5DX5.
if (qcountry=3081 and s7_5>0) and (b5cx5_98 NE B5DX5_1) flag1=1.
if (qcountry=3081 and s7_5>0) and (miss(b5cx5_98) and ~miss(B5DX5_1)) flag2=1.
if (qcountry=3081 and s7_5>0) and (~miss(b5cx5_98) and miss(B5DX5_1)) flag3=1.
if (qcountry=3081 and s7_5>0) and (sum(b5cx5_2,b5cx5_3) NE B5DX5_2) flag4=1.
if (qcountry=3081 and s7_5>0) and ((nmiss(b5cx5_2,b5cx5_3)=2) and ~miss(B5DX5_2)) flag5=1.
if (qcountry=3081 and s7_5>0) and ((nmiss(b5cx5_2,b5cx5_3) NE 2) and miss(B5DX5_2)) flag6=1.
if (qcountry=3081 and s7_5>0) and (sum(B5DX5_1,B5DX5_2) NE B5DX5_3) flag7=1.
if (qcountry=3081 and s7_5>0) and ((nmiss(B5DX5_1,B5DX5_2)=2) and ~miss(B5DX5_3)) flag8=1.
if (qcountry=3081 and s7_5>0) and ((nmiss(B5DX5_1,B5DX5_2) NE 2) and miss(B5DX5_3)) flag9=1.
if (qcountry=3081 and s7_5>0 and b5ddkx4_5=0) and (miss(B5DX5_4)) flag10=1.
if (qcountry=3081 and s7_5>0 and b5ddkx4_5=1) and (~miss(B5DX5_4)) flag11=1.
if (qcountry=3081 and s7_5>0) and (B5DX5_4<B5DX5_2) flag12=1.
if (qcountry=3081 and s7_5>0) and (miss(b5ddkx5_5) or ~range(b5ddkx5_5,0,1)) flag13=1.
if (qcountry NE 3081 or s7_5=0) and (~miss(b5ddkx5_5)) flag14=1.
Freq  flag1 to  flag14.
del var  flag1 to  flag14.
EXECUTE.

***************************************B5EX1.
if (qcountry=3081 and s7_1>0) and (b5cx1_98 NE B5Ex1_1) flag1=1.
if (qcountry=3081 and s7_1>0) and (miss(b5cx1_98) and ~miss(B5Ex1_1)) flag2=1.
if (qcountry=3081 and s7_1>0) and (~miss(b5cx1_98) and miss(B5Ex1_1)) flag3=1.
if (qcountry=3081 and s7_1>0) and (sum(b5cx1_4,0) NE B5Ex1_2) flag4=1.
if (qcountry=3081 and s7_1>0) and ((miss(b5cx1_4)) and ~miss(B5Ex1_2)) flag5=1.
if (qcountry=3081 and s7_1>0) and ((~miss(b5cx1_4)) and miss(B5Ex1_2)) flag6=1.
if (qcountry=3081 and s7_1>0) and (sum(B5Ex1_1,B5Ex1_2) NE B5Ex1_3) flag7=1.
if (qcountry=3081 and s7_1>0) and ((nmiss(B5Ex1_1,B5Ex1_2)=2) and ~miss(B5Ex1_3)) flag8=1.
if (qcountry=3081 and s7_1>0) and ((nmiss(B5Ex1_1,B5Ex1_2) NE 2) and miss(B5Ex1_3)) flag9=1.
if (qcountry=3081 and s7_1>0 and B5Edkx1_5=0) and (miss(B5Ex1_4)) flag10=1.
if (qcountry=3081 and s7_1>0 and B5Edkx1_5=1) and (~miss(B5Ex1_4)) flag11=1.
if (qcountry=3081 and s7_1>0) and (B5Ex1_4<B5Ex1_2) flag12=1.
if (qcountry=3081 and s7_1>0) and (miss(B5Edkx1_5) or ~range(B5Edkx1_5,0,1)) flag13=1.
if (qcountry NE 3081 or s7_1=0) and (~miss(B5Edkx1_5)) flag14=1.
Freq  flag1 to  flag14.
del var  flag1 to  flag14.
EXECUTE.

***************************************B5EX2.
if (qcountry=3081 and s7_2>0) and (b5cx2_98 NE B5EX2_1) flag1=1.
if (qcountry=3081 and s7_2>0) and (miss(b5cx2_98) and ~miss(B5EX2_1)) flag2=1.
if (qcountry=3081 and s7_2>0) and (~miss(b5cx2_98) and miss(B5EX2_1)) flag3=1.
if (qcountry=3081 and s7_2>0) and (sum(b5cx2_4,0) NE B5EX2_2) flag4=1.
if (qcountry=3081 and s7_2>0) and ((miss(b5cx2_4)) and ~miss(B5EX2_2)) flag5=1.
if (qcountry=3081 and s7_2>0) and ((~miss(b5cx2_4)) and miss(B5EX2_2)) flag6=1.
if (qcountry=3081 and s7_2>0) and (sum(B5EX2_1,B5EX2_2) NE B5EX2_3) flag7=1.
if (qcountry=3081 and s7_2>0) and ((nmiss(B5EX2_1,B5EX2_2)=2) and ~miss(B5EX2_3)) flag8=1.
if (qcountry=3081 and s7_2>0) and ((nmiss(B5EX2_1,B5EX2_2) NE 2) and miss(B5EX2_3)) flag9=1.
if (qcountry=3081 and s7_2>0 and b5edkx2_5=0) and (miss(b5ex2_4)) flag10=1.
if (qcountry=3081 and s7_2>0 and b5edkx2_5=1) and (~miss(b5ex2_4)) flag11=1.
if (qcountry=3081 and s7_2>0) and (B5EX2_4<B5EX2_2) flag12=1.
if (qcountry=3081 and s7_2>0) and (miss(b5edkx2_5) or ~range(b5edkx2_5,0,1)) flag13=1.
if (qcountry NE 3081 or s7_2=0) and (~miss(B5Edkx2_5)) flag14=1.
Freq  flag1 to  flag14.
del var  flag1 to  flag14.
EXECUTE.


***************************************B5EX3.
if (qcountry=3081 and s7_3>0) and (b5cx3_98 NE B5EX3_1) flag1=1.
if (qcountry=3081 and s7_3>0) and (miss(b5cx3_98) and ~miss(B5EX3_1)) flag2=1.
if (qcountry=3081 and s7_3>0) and (~miss(b5cx3_98) and miss(B5EX3_1)) flag3=1.
if (qcountry=3081 and s7_3>0) and (sum(b5cx3_4,0) NE B5EX3_2) flag4=1.
if (qcountry=3081 and s7_3>0) and ((miss(b5cx3_4)) and ~miss(B5EX3_2)) flag5=1.
if (qcountry=3081 and s7_3>0) and ((~miss(b5cx3_4)) and miss(B5EX3_2)) flag6=1.
if (qcountry=3081 and s7_3>0) and (sum(B5EX3_1,B5EX3_2) NE B5EX3_3) flag7=1.
if (qcountry=3081 and s7_3>0) and ((nmiss(B5EX3_1,B5EX3_2)=2) and ~miss(B5EX3_3)) flag8=1.
if (qcountry=3081 and s7_3>0) and ((nmiss(B5EX3_1,B5EX3_2) NE 2) and miss(B5EX3_3)) flag9=1.
if (qcountry=3081 and s7_3>0 and b5edkx3_5=0) and (miss(B5EX3_4)) flag10=1.
if (qcountry=3081 and s7_3>0 and b5edkx3_5=1) and (~miss(B5EX3_4)) flag11=1.
if (qcountry=3081 and s7_3>0) and (B5EX3_4<B5EX3_2) flag12=1.
if (qcountry=3081 and s7_3>0) and (miss(b5edkx3_5) or ~range(b5edkx3_5,0,1)) flag13=1.
if (qcountry NE 3081 or s7_3=0) and (~miss(B5Edkx3_5)) flag14=1.
Freq  flag1 to  flag14.
del var  flag1 to  flag14.
EXECUTE.


***************************************B5EX4.
if (qcountry=3081 and s7_4>0) and (b5cx4_98 NE B5EX4_1) flag1=1.
if (qcountry=3081 and s7_4>0) and (miss(b5cx4_98) and ~miss(B5EX4_1)) flag2=1.
if (qcountry=3081 and s7_4>0) and (~miss(b5cx4_98) and miss(B5EX4_1)) flag3=1.
if (qcountry=3081 and s7_4>0) and (sum(b5cx4_4,0) NE B5EX4_2) flag4=1.
if (qcountry=3081 and s7_4>0) and ((miss(b5cx4_4)) and ~miss(B5EX4_2)) flag5=1.
if (qcountry=3081 and s7_4>0) and ((~miss(b5cx4_4)) and miss(B5EX4_2)) flag6=1.
if (qcountry=3081 and s7_4>0) and (sum(B5EX4_1,B5EX4_2) NE B5EX4_3) flag7=1.
if (qcountry=3081 and s7_4>0) and ((nmiss(B5EX4_1,B5EX4_2)=2) and ~miss(B5EX4_3)) flag8=1.
if (qcountry=3081 and s7_4>0) and ((nmiss(B5EX4_1,B5EX4_2) NE 2) and miss(B5EX4_3)) flag9=1.
if (qcountry=3081 and s7_4>0 and b5edkx4_5=0) and (miss(B5EX4_4)) flag10=1.
if (qcountry=3081 and s7_4>0 and b5edkx4_5=1) and (~miss(B5EX4_4)) flag11=1.
if (qcountry=3081 and s7_4>0) and (B5EX4_4<B5EX4_2) flag12=1.
if (qcountry=3081 and s7_4>0) and (miss(b5edkx4_5) or ~range(b5edkx4_5,0,1)) flag13=1.
if (qcountry NE 3081 or s7_4=0) and (~miss(B5Edkx4_5)) flag14=1.
Freq  flag1 to  flag14.
del var  flag1 to  flag14.
EXECUTE.

***************************************B5EX5.
if (qcountry=3081 and s7_5>0) and (b5cx5_98 NE B5EX5_1) flag1=1.
if (qcountry=3081 and s7_5>0) and (miss(b5cx5_98) and ~miss(B5EX5_1)) flag2=1.
if (qcountry=3081 and s7_5>0) and (~miss(b5cx5_98) and miss(B5EX5_1)) flag3=1.
if (qcountry=3081 and s7_5>0) and (sum(b5cx5_4,0) NE B5EX5_2) flag4=1.
if (qcountry=3081 and s7_5>0) and ((miss(b5cx5_4)) and ~miss(B5EX5_2)) flag5=1.
if (qcountry=3081 and s7_5>0) and ((~miss(b5cx5_4)) and miss(B5EX5_2)) flag6=1.
if (qcountry=3081 and s7_5>0) and (sum(B5EX5_1,B5EX5_2) NE B5EX5_3) flag7=1.
if (qcountry=3081 and s7_5>0) and ((nmiss(B5EX5_1,B5EX5_2)=2) and ~miss(B5EX5_3)) flag8=1.
if (qcountry=3081 and s7_5>0) and ((nmiss(B5EX5_1,B5EX5_2) NE 2) and miss(B5EX5_3)) flag9=1.
if (qcountry=3081 and s7_5>0 and b5edkx5_5=0) and (miss(B5EX5_4)) flag10=1.
if (qcountry=3081 and s7_5>0 and b5edkx5_5=1) and (~miss(B5EX5_4)) flag11=1.
if (qcountry=3081 and s7_5>0) and (B5EX5_4<B5EX5_2) flag12=1.
if (qcountry=3081 and s7_5>0) and (miss(b5edkx5_5) or ~range(b5edkx5_5,0,1)) flag13=1.
if (qcountry NE 3081 or s7_5=0) and (~miss(b5edkx5_5)) flag14=1.
Freq  flag1 to  flag14.
del var  flag1 to  flag14.
EXECUTE.

***************************************SURVEYLOI.
tit surveyLOI.
temporary.
sel if miss(surveyLOI) or surveyLOI < 0.
list respid,surveyLOI.

