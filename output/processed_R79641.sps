* ============================================================.
* SPSS Validation Script
* Generated: 2025-10-10 00:23:31
* Source: R79641.md
* Model: gpt-5
* ============================================================.

* ============================================================.
* Question ID: qCountry
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'qCountry', 'Question Label': 'qCountry - In which country are you currently living?', 'question_type': 'Single', 'entry_conditions': ["f('qSurveyType').none('2') //SCREENER"], 'conditions': [], 'Variable ID': 'qCountry', 'answers': [{'Answer Code': '1033', 'Answer Label': 'United States', 'answer_attributes': {'ListSource': 'list_yesno'}}, {'Answer Code': '99', 'Answer Label': 'Other', 'answer_attributes': {'KeepPosition': 'true'}}], 'question_attributes': {'HierarchyMode': 'Drilldown', 'AutoCheckOther': 'true', 'FieldWidth': '5', 'EntityId': '2753912961'}}
* -----------------------------------------------------------

tit qCountry.
temporary.
sel if miss(qCountry) or ~range(qCountry,1033,1033).
list respid, qCountry.

* ============================================================.
* Question ID: QB002
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'QB002', 'Question Label': "QB002 - ^f('qCountry').text()^", 'question_type': 'Open', 'entry_conditions': ["f('qSurveyType').none('2') //SCREENER"], 'conditions': [], 'Variable ID': 'QB002', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'EntityId': '4896'}}
* -----------------------------------------------------------

tit QB002.
temporary.
sel if (QB002="").
list respid, QB002.

* ============================================================.
* Question ID: SPECIALTY
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'SPECIALTY', 'question_type': 'Single', 'entry_conditions': ['false'], 'conditions': ["f('SPECIALTY').any('99') //screen SPECIALITY"], 'Question Label': 'SPECIALTY - What is your primary medical specialty?', 'question_attributes': {'ValidationCode': 'checkOS()', 'AutoCheckOther': 'true', 'EntityId': '967'}, 'sub_questions': [{'Variable ID': 'SPECIALTY', 'answers': [{'Answer Code': '1', 'Answer Label': 'Total'}, {'Answer Code': '99', 'Answer Label': 'Other', 'answer_attributes': {'KeepPosition': 'true', 'Other': 'true'}}]}, {'Variable ID': 'SPECIALTY_99_other', 'answers': [{'Answer Code': '99', 'Answer Label': '', 'answer_attributes': {'KeepPosition': 'true', 'Other': 'true'}}]}]}
* -----------------------------------------------------------

tit SPECIALTY.
temporary.
sel if miss(SPECIALTY) or ~any(SPECIALTY,1).
list respid, SPECIALTY.
temporary.
sel if (SPECIALTY_99_other<>"").
list respid, SPECIALTY_99_other.

* ============================================================.
* Question ID: S0
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'S0', 'question_type': 'Multi', 'entry_conditions': ["f('qSurveyType').none('2') //SCREENER"], 'conditions': ["f('S0').any('3')"], 'Question Label': 'S0 - Welcome and thank you for participating in this market research survey. This survey is being conducted by Ipsos, an independent market research agency based in the US, on behalf of a technology company.   We are conducting research about your experiences as a patient and would like to ask you some questions on this topic. The survey will take 10 minutes of your time.  With your consent, your information will only be collected and used for market research and analysis. Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis.  As a member of EphMRA, Ipsos is bound by EphMRA Code of Conduct and all applicable laws protecting your personal data and responses. The study is conducted in compliance with ESOMAR/ EphMRA guidelines.  You have the right to withdraw from the interview at any time. For more information about your rights please see our privacy notice, it is available at here.  Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis. You will receive an honorarium for your participation.   Please confirm that:', 'question_attributes': {'ValidationCode': "if(f('S0').isect(nset(2)).size()==1)\n{\nerrorMsg('S0'); \n}", 'AnswerRequiredType': 'Required', 'AutoCheckOther': 'true', 'EntityId': '5854'}, 'sub_questions': [{'Variable ID': 'S0_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'I have read, understood and accept the points above and am happy to proceed with the market research survey on those basis'}]}, {'Variable ID': 'S0_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'I consent to providing information relating to my health/condition for the purpose of this research'}]}, {'Variable ID': 'S0_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'No, I do not want to participate in this research', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}]}
* -----------------------------------------------------------

tit S0.
temporary.
!MULTI_B svar=S0_1 evar=S0_3 qnt=S0 ctr= 3 .

* ============================================================.
* Question ID: S5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'S5', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': ["f('S5').any('97','99') || f('S5').toBoolean() && f('S5').none('1','2','3','4','5','6') //soft-screen S5"], 'Question Label': 'S5 - Which, if any, of the following conditions have you been diagnosed with by a healthcare provider?', 'question_attributes': {'AnswerRequiredType': 'Required', 'AutoCheckOther': 'true', 'AnswerlistOrder': 'Randomize', 'Randomize': 'true', 'EntityId': '5867'}, 'sub_questions': [{'Variable ID': 'S5_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Asthma'}]}, {'Variable ID': 'S5_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Chronic Obstructive Pulmonary Disease (COPD)'}]}, {'Variable ID': 'S5_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Type 2 Diabetes'}]}, {'Variable ID': 'S5_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Psoriasis'}]}, {'Variable ID': 'S5_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'Eczema/Atopic Dermatitis'}]}, {'Variable ID': 'S5_6', 'answers': [{'Answer Code': '6', 'Answer Label': 'Heart Disease (e.g., coronary artery disease, congenital heart disease, arrhythmia)'}]}, {'Variable ID': 'S5_7', 'answers': [{'Answer Code': '7', 'Answer Label': 'High Blood Pressure/ Hypertension'}]}, {'Variable ID': 'S5_8', 'answers': [{'Answer Code': '8', 'Answer Label': 'Parkinson’s Disease'}]}, {'Variable ID': 'S5_9', 'answers': [{'Answer Code': '9', 'Answer Label': 'Stroke'}]}, {'Variable ID': 'S5_10', 'answers': [{'Answer Code': '10', 'Answer Label': 'Anemia'}]}, {'Variable ID': 'S5_11', 'answers': [{'Answer Code': '11', 'Answer Label': 'Chronic Kidney Disease'}]}, {'Variable ID': 'S5_97', 'answers': [{'Answer Code': '97', 'Answer Label': 'Prefer not to answer', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}, {'Variable ID': 'S5_99', 'answers': [{'Answer Code': '99', 'Answer Label': 'None of the above', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}]}
* -----------------------------------------------------------

tit S5.
temporary.
!MULTI_B svar=S5_1 evar=S5_99 qnt=S5 ctr= 13 .

if sum(s5_1 to s5_11) > 0 and sum(s5_97,s5_99) > 0 flag=1.
if sum(s5_1 to s5_11) = 0 and sum(s5_97,s5_99) = 0 flag=2.
if s5_97 > 0 and s5_99 > 0 flag=3.
FREQUENCIES flag.
DELETE VARIABLES flag.

* ============================================================.
* Question ID: hidS5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'hidS5', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hidS5 - //hidden to classify below based on S5 response.', 'question_attributes': {'AnswerRequiredType': 'NotRequired', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'Disabled': 'true', 'EntityId': '5872'}, 'sub_questions': [{'Variable ID': 'hidS5_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Respiratory Conditions'}]}, {'Variable ID': 'hidS5_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Type 2 Diabetes'}]}, {'Variable ID': 'hidS5_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Heart Disease'}]}, {'Variable ID': 'hidS5_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Dermatologic Conditions'}]}]}
* -----------------------------------------------------------

tit hidS5.

DO REPEAT v = hidS5_1 hidS5_2 hidS5_3 hidS5_4.

temporary.

sel if not missing(v) and not any(v,0,1).

list respid v.

END REPEAT.

* ============================================================.
* Question ID: hidS5Final
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'hidS5Final', 'Question Label': 'hidS5Final - //hidden to classify below based on S5 response.', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidS5Final', 'answers': [{'Answer Code': '1', 'Answer Label': 'Respiratory Conditions'}, {'Answer Code': '2', 'Answer Label': 'Type 2 Diabetes'}, {'Answer Code': '3', 'Answer Label': 'Heart Disease'}, {'Answer Code': '4', 'Answer Label': 'Dermatologic Conditions'}], 'question_attributes': {'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'Disabled': 'true', 'EntityId': '5993'}}
* -----------------------------------------------------------

tit hidS5Final.

temporary.

sel if not missing(hidS5Final) and not range(hidS5Final,1,4).

list respid hidS5Final.

* ============================================================.
* Question ID: hidS5x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'hidS5x2', 'Question Label': 'hidS5x2 - //hidden to classify below based on S5 response.', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidS5x2', 'answers': [{'Answer Code': '1', 'Answer Label': 'Asthma'}, {'Answer Code': '2', 'Answer Label': 'COPD'}, {'Answer Code': '4', 'Answer Label': 'Psoriasis'}, {'Answer Code': '5', 'Answer Label': 'Atopic Dermatitis'}], 'question_attributes': {'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'Disabled': 'true', 'EntityId': '5994'}}
* -----------------------------------------------------------

tit hidS5x2.

temporary.

sel if not missing(hidS5x2) and not any(hidS5x2,1,2,4,5).

list respid hidS5x2.

* ============================================================.
* Question ID: hidS5FinalNew
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'hidS5FinalNew', 'Question Label': 'hidS5FinalNew - //hidden to classify below based on S5 response.', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidS5FinalNew', 'answers': [{'Answer Code': '1', 'Answer Label': 'Respiratory Conditions - Asthma'}, {'Answer Code': '2', 'Answer Label': 'Respiratory Conditions - COPD'}, {'Answer Code': '3', 'Answer Label': 'Type 2 Diabetes'}, {'Answer Code': '6', 'Answer Label': 'Heart Disease'}, {'Answer Code': '4', 'Answer Label': 'Dermatologic Conditions - Psoriasis'}, {'Answer Code': '5', 'Answer Label': 'Dermatologic Conditions - Atopic Dermatitis'}], 'question_attributes': {'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'Disabled': 'true', 'EntityId': '6018'}}
* -----------------------------------------------------------

tit hidS5FinalNew.

temporary.

sel if not missing(hidS5FinalNew) and not range(hidS5FinalNew,1,6).

list respid hidS5FinalNew.

* ============================================================.
* Question ID: S10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'S10', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': ["f('S10').any('99','97') //soft-screen S10"], 'Question Label': 'S10 - In the past 12 months, how if at all, have you interacted with the healthcare system?', 'question_attributes': {'AnswerRequiredType': 'Required', 'AutoCheckOther': 'true', 'AnswerlistOrder': 'Randomize', 'Randomize': 'true', 'EntityId': '5876'}, 'sub_questions': [{'Variable ID': 'S10_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'I had a video call with my usual healthcare provider'}]}, {'Variable ID': 'S10_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'I used a patient portal offered by my healthcare providers’ office to request refills, schedule appointments or upload labs'}]}, {'Variable ID': 'S10_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'I exchanged messages (text, pictures, video, etc.) with a healthcare provider digitally'}]}, {'Variable ID': 'S10_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'I shared wearable data (e.g., Apple Watch, Garmin, Fitbit, Oura Ring) with my healthcare provider'}]}, {'Variable ID': 'S10_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'I used virtual care/telehealth services (e.g., One Medical, MDLIVE, Teladoc)'}]}, {'Variable ID': 'S10_6', 'answers': [{'Answer Code': '6', 'Answer Label': 'I used retail healthcare services (e.g., Hims/Hers, Nurx, Ro)'}]}, {'Variable ID': 'S10_7', 'answers': [{'Answer Code': '7', 'Answer Label': 'I used a mobile health app for chronic disease management (e.g., Dario, Hinge Health, Livongo, Omada Health, Sword Health)'}]}, {'Variable ID': 'S10_8', 'answers': [{'Answer Code': '8', 'Answer Label': 'I used a digital based tool that helped treat or manage my condition (e.g., Calm, EndeavorRx, Headspace, Talkspace)'}]}, {'Variable ID': 'S10_9', 'answers': [{'Answer Code': '9', 'Answer Label': 'I used a digital solution to help me stay on track with my treatment & condition (e.g., Propeller Health, Kaiku Health)'}]}, {'Variable ID': 'S10_10', 'answers': [{'Answer Code': '10', 'Answer Label': 'I saw my provider in their office face-to-face'}]}, {'Variable ID': 'S10_11', 'answers': [{'Answer Code': '11', 'Answer Label': 'I used a pharma solution (e.g., brand  website, digital medication coupons / rebates, patient assistance programs)'}]}, {'Variable ID': 'S10_99', 'answers': [{'Answer Code': '99', 'Answer Label': 'I have not sought medical care in the past 12 months', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}, {'Variable ID': 'S10_97', 'answers': [{'Answer Code': '97', 'Answer Label': 'Prefer not to disclose', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}]}
* -----------------------------------------------------------

tit S10.

DO REPEAT v = S10_1 S10_2 S10_3 S10_4 S10_5 S10_6 S10_7 S10_8 S10_9 S10_10 S10_11 S10_99 S10_97.

temporary.

sel if (S10_99 <> 1 and S10_97 <> 1) and (missing(v) or not any(v,0,1)).

list respid v.

END REPEAT.

* ============================================================.
* End of Script - Total Questions Processed: 10
* ============================================================.
