* ============================================================.
* SPSS Validation Script
* Generated: 2025-10-02 07:30:30
* Source: R79641.md
* Model: gpt-5
* ============================================================.

* ============================================================.
* Question ID: qCountry
* ============================================================.

tit qCountry.
temporary.
sel if miss(qCountry) or ~range(qCountry,1033,1033).
list respid, qCountry.

* ============================================================.
* Question ID: QB002
* ============================================================.

tit QB002.
temporary.
sel if (qCountry=99 and QB002="") or (qCountry<>99 and QB002<>"").
list respid, qCountry QB002.

* ============================================================.
* Question ID: SPECIALTY
* ============================================================.

tit SPECIALTY.
temporary.
sel if miss(SPECIALTY) or ~any(SPECIALTY,1).
list respid, SPECIALTY.
temporary.
sel if (SPECIALTY=99 and SPECIALTY_99_other="") or (SPECIALTY<>99 and SPECIALTY_99_other<>"").
list respid, SPECIALTY SPECIALTY_99_other.

* ============================================================.
* Question ID: S0
* ============================================================.

tit S0.
temporary.
!MULTI_B svar=S0_1 evar=S0_3 qnt=S0 ctr= 3 .
temporary.
sel if S0_3=1.
list respid, S0_1 to S0_3.

* ============================================================.
* Question ID: S5
* ============================================================.

tit S5.
temporary.
!MULTI_B svar=S5_1 evar=S5_99 qnt=S5 ctr= 13 .

if sum(S5_1 to S5_11) > 0 and sum(S5_97,S5_99) > 0 flag=1.
if sum(S5_1 to S5_11) = 0 and sum(S5_97,S5_99) = 0 flag=2.
if S5_97 > 0 and S5_99 > 0 flag=3.
FREQUENCIES flag.
DELETE VARIABLES flag.

temporary.
sel if S5_97=1 or S5_99=1 or (sum(S5_1 to S5_6)=0 and sum(S5_7 to S5_11)>0).
list respid, S5_1 to S5_11 S5_97 S5_99.

* ============================================================.
* Question ID: hidS5
* ============================================================.

tit hidS5.
temporary.
!MULTI_A svar=hidS5_1 evar=hidS5_4 qnt=hidS5 ctr= 4 .

* ============================================================.
* Question ID: hidS5Final
* ============================================================.

tit hidS5Final.
temporary.
sel if miss(hidS5Final) or ~range(hidS5Final,1,4).
list respid, hidS5Final.

* ============================================================.
* Question ID: hidS5x2
* ============================================================.

tit hidS5x2.
temporary.
sel if miss(hidS5x2) or ~any(hidS5x2,1,2,4,5).
list respid, hidS5x2.

* ============================================================.
* Question ID: hidS5FinalNew
* ============================================================.

tit hidS5FinalNew.
temporary.
sel if miss(hidS5FinalNew) or ~range(hidS5FinalNew,1,6).
list respid, hidS5FinalNew.

* ============================================================.
* Question ID: S10
* ============================================================.

tit S10.
temporary.
!MULTI_B svar=S10_1 evar=S10_99 qnt=S10 ctr= 12 .

if sum(S10_1 to S10_11)>0 and sum(S10_97,S10_99)>0 flag=1.
if sum(S10_1 to S10_11)=0 and S10_97=0 and S10_99=0 flag=2.
if S10_97>0 and S10_99>0 flag=3.
FREQUENCIES flag.
DELETE VARIABLES flag.

* ============================================================.
* Question ID: hidS10
* ============================================================.

tit hidS10.
temporary.
sel if miss(hidS10) or ~range(hidS10,1,3).
list respid, hidS10.

* ============================================================.
* Question ID: S15
* ============================================================.

tit S15.
temporary.
sel if miss(S15_1) or ~range(S15_1,18,79).
list respid, S15_1.

* ============================================================.
* Question ID: hidS15
* ============================================================.

tit hidS15.
temporary.
sel if miss(hidS15) or ~range(hidS15,1,4).
list respid, hidS15.

* ============================================================.
* Question ID: S20
* ============================================================.

tit S20.
temporary.
sel if miss(S20) or ~any(S20,1,2,3,97).
list respid, S20.

* ============================================================.
* Question ID: S25
* ============================================================.

tit S25.
temporary.
sel if miss(S25) or ~range(S25,1,51).
list respid, S25.

* ============================================================.
* Question ID: qtRegion1
* ============================================================.

tit qtRegion1.
temporary.
sel if miss(qtRegion1) or ~range(qtRegion1,1,4).
list respid, qtRegion1.

* ============================================================.
* Question ID: Qual
* ============================================================.

tit Qual.
temporary.
sel if miss(Qual) or ~range(Qual,1,1).
list respid, Qual.

* ============================================================.
* Question ID: A5
* ============================================================.

tit A5.
DO REPEAT v=A5_1 to A5_12.
temporary.
sel if miss(v) or (~range(v,1,5) and v<>97).
list respid, v.
END REPEAT.

* ============================================================.
* Question ID: A10
* ============================================================.

tit A10.
DO REPEAT v=A10_1 to A10_5.
temporary.
sel if miss(v) or (~range(v,1,5) and v<>97).
list respid, v.
END REPEAT.

* ============================================================.
* Question ID: A15
* ============================================================.

tit A15.
DO REPEAT v=A15_1 to A15_13 A15_98.
temporary.
sel if miss(v) or ~range(v,1,3).
list respid, v.
END REPEAT.
temporary.
sel if A15_98=1.
list respid, A15_98.
!String ask=A15_98 opr=> value=1 myvars= A15_98_other.

* ============================================================.
* Question ID: A15xDK
* ============================================================.

tit A15xDK.
temporary.
sel if miss(A15xDK_99) or ~range(A15xDK_99,0,1).
list respid, A15xDK_99.

* ============================================================.
* Question ID: A20
* ============================================================.

tit A20.
do repeat x=A20_1 to A20_13 A20_98
/ask=A15_1 to A15_13 A15_98.
if (ask>0 and (miss(x) or ~range(x,1,5))) flag=1.
if ((ask=0 or miss(ask) or A15xDK_99=1) and ~miss(x)) flag=2.
end repeat.
FREQUENCIES flag.
DELETE VARIABLES flag.

TEMPORARY.
sel if A15xDK_99=1 and nvalid(A20_1 to A20_98)>0.
list respid A15xDK_99 A20_1 to A20_98.

* ============================================================.
* Question ID: A25
* ============================================================.

tit A25.
temporary.
!MULTI_A svar=A25_1 evar=A25_98 qnt=A25 ctr= 10 .

if A25_98>0 and A25_98_other eq '' flag=1.
if (A25_98=0 or miss(A25_98)) and A25_98_other ne '' flag=2.
FREQUENCIES flag.
DELETE VARIABLES flag.

* ============================================================.
* Question ID: A30
* ============================================================.

tit A30.
temporary.
!MULTI_A svar=A30_1 evar=A30_98 qnt=A30 ctr= 10 .

if A30_98>0 and A30_98_other eq '' flag=1.
if (A30_98=0 or miss(A30_98)) and A30_98_other ne '' flag=2.
FREQUENCIES flag.
DELETE VARIABLES flag.

* ============================================================.
* Question ID: A35
* ============================================================.

tit A35.
temporary.
sel if miss(A35) or (~range(A35,1,5) and A35<>97).
list respid, A35.

* ============================================================.
* Question ID: A40
* ============================================================.

tit A40.
DO REPEAT v=A40_1 to A40_8.
temporary.
sel if miss(v) or (~range(v,1,5) and v<>97).
list respid, v.
END REPEAT.

* ============================================================.
* Question ID: B5
* ============================================================.

tit B5.
temporary.
!MULTI_B svar=B5_1 evar=B5_99 qnt=B5 ctr= 14 .

COUNT numb=B5_1 to B5_12 B5_98 (1).
temporary.
sel if ( (miss(B5_99) or B5_99=0) and numb<3 ).
list respid, B5_1 to B5_12 B5_98 B5_99.
del var numb.

if B5_98>0 and B5_98_other eq '' flag=1.
if (B5_98=0 or miss(B5_98)) and B5_98_other ne '' flag=2.
FREQUENCIES flag.
DELETE VARIABLES flag.

* ============================================================.
* Question ID: B10x1
* ============================================================.

tit B10x1.
if (sum(B5_1 to B5_12,B5_98)>0 and (miss(B5_99) or B5_99=0)) flt=1.
temporary.
sel if (flt=1 and (miss(B10x1) or (~range(B10x1,1,12) and B10x1<>98)))
    or (miss(flt) and ~miss(B10x1)).
list respid, B10x1.

compute dup=0.
if flt=1 and ((B10x1=B10x2 and ~miss(B10x1) and ~miss(B10x2)) or (B10x1=B10x3 and ~miss(B10x1) and ~miss(B10x3)) or (B10x2=B10x3 and ~miss(B10x2) and ~miss(B10x3))) dup=1.
temporary.
sel if dup=1.
list respid, B10x1 B10x2 B10x3.
del var flt dup.

* ============================================================.
* Question ID: B10x2
* ============================================================.

tit B10x2.
if (sum(B5_1 to B5_12,B5_98)>0 and (miss(B5_99) or B5_99=0)) flt=1.
temporary.
sel if (flt=1 and (miss(B10x2) or (~range(B10x2,1,12) and B10x2<>98)))
    or (miss(flt) and ~miss(B10x2)).
list respid, B10x2.
del var flt.

* ============================================================.
* Question ID: B10x3
* ============================================================.

tit B10x3.
if (sum(B5_1 to B5_12,B5_98)>0 and (miss(B5_99) or B5_99=0)) flt=1.
temporary.
sel if (flt=1 and (miss(B10x3) or (~range(B10x3,1,12) and B10x3<>98)))
    or (miss(flt) and ~miss(B10x3)).
list respid, B10x3.
del var flt.

* ============================================================.
* Question ID: B10xDK
* ============================================================.

tit B10xDK.
temporary.
sel if miss(B10xDK_99) or ~range(B10xDK_99,0,1).
list respid, B10xDK_99.

* ============================================================.
* Question ID: B15
* ============================================================.

tit B15.
temporary.
!MULTI_B svar=B15_1 evar=B15_99 qnt=B15 ctr= 16 .

COUNT numb=B15_1 to B15_99 (1).
compute numb=numb - B15_99.
if B15_99=0 and numb<3 flag=1.
FREQUENCIES flag.
DELETE VARIABLES flag numb.

if B15_98>0 and B15_98_other eq '' flag=1.
if (B15_98=0 or miss(B15_98)) and B15_98_other ne '' flag=2.
FREQUENCIES flag.
DELETE VARIABLES flag.

* ============================================================.
* End of Script - Total Questions Processed: 32
* ============================================================.
