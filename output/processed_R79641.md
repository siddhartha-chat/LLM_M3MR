## Sheet1
```
Question ID:
qCountry

details_normalized:
{'Question ID': 'qCountry', 'Question Label': 'qCountry - In which country are you currently living?', 'question_type': 'Single', 'entry_conditions': ["f('qSurveyType').none('2') //SCREENER"], 'conditions': [], 'Variable ID': 'qCountry', 'answers': [{'Answer Code': '1033', 'Answer Label': 'United States', 'answer_attributes': {'ListSource': 'list_yesno'}}, {'Answer Code': '99', 'Answer Label': 'Other', 'answer_attributes': {'KeepPosition': 'true'}}], 'question_attributes': {'HierarchyMode': 'Drilldown', 'AutoCheckOther': 'true', 'FieldWidth': '5', 'EntityId': '2753912961'}}

output_spss_script:
* Define the variable for country.
VARIABLE LABELS qCountry 'In which country are you currently living?'.
VALUE LABELS qCountry
    1033 'United States'
    99 'Other'.
MISSING VALUES qCountry (99).
* Entry condition for survey type.
DO IF (qSurveyType NE 2).
    COMPUTE qCountry = 0.
END IF.
EXECUTE.


---

Question ID:
QB002

details_normalized:
{'Question ID': 'QB002', 'Question Label': "QB002 - ^f('qCountry').text()^", 'question_type': 'Open', 'entry_conditions': ["f('qSurveyType').none('2') //SCREENER"], 'conditions': [], 'Variable ID': 'QB002', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'EntityId': '4896'}}

output_spss_script:
* Define the variable for open-ended response.
VARIABLE LABELS QB002 'Open response based on country'.
MISSING VALUES QB002 (0).
* Entry condition for survey type.
DO IF (qSurveyType NE 2).
    COMPUTE QB002 = ''.
END IF.
EXECUTE.


---

Question ID:
SPECIALTY

details_normalized:
{'Question ID': 'SPECIALTY', 'question_type': 'Single', 'entry_conditions': ['false'], 'conditions': ["f('SPECIALTY').any('99') //screen SPECIALITY"], 'Question Label': 'SPECIALTY - What is your primary medical specialty?', 'question_attributes': {'ValidationCode': 'checkOS()', 'AutoCheckOther': 'true', 'EntityId': '967'}, 'sub_questions': [{'Variable ID': 'SPECIALTY', 'answers': [{'Answer Code': '1', 'Answer Label': 'Total'}, {'Answer Code': '99', 'Answer Label': 'Other', 'answer_attributes': {'KeepPosition': 'true', 'Other': 'true'}}]}, {'Variable ID': 'SPECIALTY_99_other', 'answers': [{'Answer Code': '99', 'Answer Label': '', 'answer_attributes': {'KeepPosition': 'true', 'Other': 'true'}}]}]}

output_spss_script:
* Define the variable for specialty.
VARIABLE LABELS SPECIALTY 'What is your primary medical specialty?'.
VALUE LABELS SPECIALTY
    1 'Total'
    99 'Other'.
MISSING VALUES SPECIALTY (99).
* Entry condition for specialty.
DO IF (SPECIALTY = 99).
    COMPUTE SPECIALTY_99_other = ''.
END IF.
EXECUTE.


---

Question ID:
S0

details_normalized:
{'Question ID': 'S0', 'question_type': 'Multi', 'entry_conditions': ["f('qSurveyType').none('2') //SCREENER"], 'conditions': ["f('S0').any('3')"], 'Question Label': 'S0 - Welcome and thank you for participating in this market research survey. This survey is being conducted by Ipsos, an independent market research agency based in the US, on behalf of a technology company.   We are conducting research about your experiences as a patient and would like to ask you some questions on this topic. The survey will take 10 minutes of your time.  With your consent, your information will only be collected and used for market research and analysis. Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis.  As a member of EphMRA, Ipsos is bound by EphMRA Code of Conduct and all applicable laws protecting your personal data and responses. The study is conducted in compliance with ESOMAR/ EphMRA guidelines.  You have the right to withdraw from the interview at any time. For more information about your rights please see our privacy notice, it is available at here.  Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis. You will receive an honorarium for your participation.   Please confirm that:', 'question_attributes': {'ValidationCode': "if(f('S0').isect(nset(2)).size()==1)\n{\nerrorMsg('S0'); \n}", 'AnswerRequiredType': 'Required', 'AutoCheckOther': 'true', 'EntityId': '5854'}, 'sub_questions': [{'Variable ID': 'S0_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'I have read, understood and accept the points above and am happy to proceed with the market research survey on those basis'}]}, {'Variable ID': 'S0_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'I consent to providing information relating to my health/condition for the purpose of this research'}]}, {'Variable ID': 'S0_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'No, I do not want to participate in this research', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}]}

output_spss_script:
* Define the variables for consent.
VARIABLE LABELS S0 'Consent to participate'.
VALUE LABELS S0
    1 'I have read, understood and accept the points above and am happy to proceed with the market research survey on those basis'
    2 'I consent to providing information relating to my health/condition for the purpose of this research'
    3 'No, I do not want to participate in this research'.
MISSING VALUES S0 (3).
* Entry condition for survey type.
DO IF (qSurveyType NE 2).
    COMPUTE S0 = 0.
END IF.
EXECUTE.


---

Question ID:
S5

details_normalized:
{'Question ID': 'S5', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': ["f('S5').any('97','99') || f('S5').toBoolean() && f('S5').none('1','2','3','4','5','6') //soft-screen S5"], 'Question Label': 'S5 - Which, if any, of the following conditions have you been diagnosed with by a healthcare provider?', 'question_attributes': {'AnswerRequiredType': 'Required', 'AutoCheckOther': 'true', 'AnswerlistOrder': 'Randomize', 'Randomize': 'true', 'EntityId': '5867'}, 'sub_questions': [{'Variable ID': 'S5_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Asthma'}]}, {'Variable ID': 'S5_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Chronic Obstructive Pulmonary Disease (COPD)'}]}, {'Variable ID': 'S5_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Type 2 Diabetes'}]}, {'Variable ID': 'S5_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Psoriasis'}]}, {'Variable ID': 'S5_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'Eczema/Atopic Dermatitis'}]}, {'Variable ID': 'S5_6', 'answers': [{'Answer Code': '6', 'Answer Label': 'Heart Disease (e.g., coronary artery disease, congenital heart disease, arrhythmia)'}]}, {'Variable ID': 'S5_7', 'answers': [{'Answer Code': '7', 'Answer Label': 'High Blood Pressure/ Hypertension'}]}, {'Variable ID': 'S5_8', 'answers': [{'Answer Code': '8', 'Answer Label': 'Parkinson’s Disease'}]}, {'Variable ID': 'S5_9', 'answers': [{'Answer Code': '9', 'Answer Label': 'Stroke'}]}, {'Variable ID': 'S5_10', 'answers': [{'Answer Code': '10', 'Answer Label': 'Anemia'}]}, {'Variable ID': 'S5_11', 'answers': [{'Answer Code': '11', 'Answer Label': 'Chronic Kidney Disease'}]}, {'Variable ID': 'S5_97', 'answers': [{'Answer Code': '97', 'Answer Label': 'Prefer not to answer', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}, {'Variable ID': 'S5_99', 'answers': [{'Answer Code': '99', 'Answer Label': 'None of the above', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}]}

output_spss_script:
* Define the variables for health conditions.
VARIABLE LABEL

---

```
Question ID:
hidS5

details_normalized:
{'Question ID': 'hidS5', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hidS5 - //hidden to classify below based on S5 response.', 'question_attributes': {'AnswerRequiredType': 'NotRequired', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'Disabled': 'true', 'EntityId': '5872'}, 'sub_questions': [{'Variable ID': 'hidS5_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Respiratory Conditions'}]}, {'Variable ID': 'hidS5_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Type 2 Diabetes'}]}, {'Variable ID': 'hidS5_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Heart Disease'}]}, {'Variable ID': 'hidS5_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Dermatologic Conditions'}]}]}

output_spss_script:
* Define the variable for hidS5.
VARIABLE LABELS hidS5 'hidS5 - //hidden to classify below based on S5 response.'.
VALUE LABELS hidS5
    1 'Respiratory Conditions'
    2 'Type 2 Diabetes'
    3 'Heart Disease'
    4 'Dermatologic Conditions'.
MISSING VALUES hidS5 (99).
EXECUTE.

---

Question ID:
hidS5Final

details_normalized:
{'Question ID': 'hidS5Final', 'Question Label': 'hidS5Final - //hidden to classify below based on S5 response.', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidS5Final', 'answers': [{'Answer Code': '1', 'Answer Label': 'Respiratory Conditions'}, {'Answer Code': '2', 'Answer Label': 'Type 2 Diabetes'}, {'Answer Code': '3', 'Answer Label': 'Heart Disease'}, {'Answer Code': '4', 'Answer Label': 'Dermatologic Conditions'}], 'question_attributes': {'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'Disabled': 'true', 'EntityId': '5993'}}

output_spss_script:
* Define the variable for hidS5Final.
VARIABLE LABELS hidS5Final 'hidS5Final - //hidden to classify below based on S5 response.'.
VALUE LABELS hidS5Final
    1 'Respiratory Conditions'
    2 'Type 2 Diabetes'
    3 'Heart Disease'
    4 'Dermatologic Conditions'.
MISSING VALUES hidS5Final (99).
EXECUTE.

---

Question ID:
hidS5x2

details_normalized:
{'Question ID': 'hidS5x2', 'Question Label': 'hidS5x2 - //hidden to classify below based on S5 response.', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidS5x2', 'answers': [{'Answer Code': '1', 'Answer Label': 'Asthma'}, {'Answer Code': '2', 'Answer Label': 'COPD'}, {'Answer Code': '4', 'Answer Label': 'Psoriasis'}, {'Answer Code': '5', 'Answer Label': 'Atopic Dermatitis'}], 'question_attributes': {'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'Disabled': 'true', 'EntityId': '5994'}}

output_spss_script:
* Define the variable for hidS5x2.
VARIABLE LABELS hidS5x2 'hidS5x2 - //hidden to classify below based on S5 response.'.
VALUE LABELS hidS5x2
    1 'Asthma'
    2 'COPD'
    4 'Psoriasis'
    5 'Atopic Dermatitis'.
MISSING VALUES hidS5x2 (99).
EXECUTE.

---

Question ID:
hidS5FinalNew

details_normalized:
{'Question ID': 'hidS5FinalNew', 'Question Label': 'hidS5FinalNew - //hidden to classify below based on S5 response.', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidS5FinalNew', 'answers': [{'Answer Code': '1', 'Answer Label': 'Respiratory Conditions - Asthma'}, {'Answer Code': '2', 'Answer Label': 'Respiratory Conditions - COPD'}, {'Answer Code': '3', 'Answer Label': 'Type 2 Diabetes'}, {'Answer Code': '6', 'Answer Label': 'Heart Disease'}, {'Answer Code': '4', 'Answer Label': 'Dermatologic Conditions - Psoriasis'}, {'Answer Code': '5', 'Answer Label': 'Dermatologic Conditions - Atopic Dermatitis'}], 'question_attributes': {'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'Disabled': 'true', 'EntityId': '6018'}}

output_spss_script:
* Define the variable for hidS5FinalNew.
VARIABLE LABELS hidS5FinalNew 'hidS5FinalNew - //hidden to classify below based on S5 response.'.
VALUE LABELS hidS5FinalNew
    1 'Respiratory Conditions - Asthma'
    2 'Respiratory Conditions - COPD'
    3 'Type 2 Diabetes'
    4 'Dermatologic Conditions - Psoriasis'
    5 'Dermatologic Conditions - Atopic Dermatitis'
    6 'Heart Disease'.
MISSING VALUES hidS5FinalNew (99).
EXECUTE.

---

Question ID:
S10

details_normalized:
{'Question ID': 'S10', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': ["f('S10').any('99','97') //soft-screen S10"], 'Question Label': 'S10 - In the past 12 months, how if at all, have you interacted with the healthcare system?', 'question_attributes': {'AnswerRequiredType': 'Required', 'AutoCheckOther': 'true', 'AnswerlistOrder': 'Randomize', 'Randomize': 'true', 'EntityId': '5876'}, 'sub_questions': [{'Variable ID': 'S10_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'I had a video call with my usual healthcare provider'}]}, {'Variable ID': 'S10_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'I used a patient portal offered by my healthcare providers’ office to request refills, schedule appointments or upload labs'}]}, {'Variable ID': 'S10_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'I exchanged messages (text, pictures, video, etc.) with a healthcare provider digitally'}]}, {'Variable ID': 'S10_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'I shared wearable data (e.g., Apple Watch, Garmin, Fitbit, Oura Ring) with my healthcare provider'}]}, {'Variable ID': 'S10_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'I used virtual care/telehealth services (e.g., One Medical, MDLIVE, Teladoc)'}]}, {'Variable ID': 'S10_6', 'answers': [{'Answer Code': '6', 'Answer Label': 'I used retail healthcare services (e.g., Hims/Hers, Nurx, Ro)'}]}, {'Variable ID': 'S10_7', 'answers': [{'Answer Code': '7', 'Answer Label': 'I used a mobile health app for chronic disease management (e.g., Dario, Hinge Health, Livongo, Omada Health, Sword Health)'}]}, {'Variable ID': 'S10_8', 'answers': [{'Answer Code': '8', 'Answer Label': 'I used a digital based tool that helped treat or manage my condition (e.g., Calm, EndeavorRx, Headspace, Talkspace)'}]}, {'Variable ID': 'S10_9', 'answers': [{'Answer Code': '9', 'Answer Label': 'I used a digital solution to help me stay on track with my treatment & condition (e.g., Propeller Health, Kaiku Health)'}]}, {'Variable ID': 'S10_10', 'answers': [{'Answer Code': '10', 'Answer Label': 'I saw my provider in their office face-to-face'}]}, {'Variable ID': 'S10_11', 'answers': [{'Answer Code': '11', 'Answer Label': 'I used a pharma solution (e.g., brand  website, digital medication coupons / rebates, patient assistance programs)'}]}, {'Variable ID': 'S10_99', 'answers': [{'Answer Code': '99', 'Answer Label': 'I have not sought medical care in the past 12 months', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}, {'Variable ID': 'S10_97', 'answers': [{'Answer Code': '97', 'Answer Label': 'Prefer not to disclose', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}]}

output_spss_script:
* Define the variable for S10.


---

```
Question ID:
hidS10

details_normalized:
{'Question ID': 'hidS10', 'Question Label': 'hidS10 - //hidden to classify below based on S10 response.', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidS10', 'answers': [{'Answer Code': '1', 'Answer Label': 'HIGH DIGITAL USER'}, {'Answer Code': '2', 'Answer Label': 'MODERATE DIGITAL USER'}, {'Answer Code': '3', 'Answer Label': 'LOW DIGITAL USER'}], 'question_attributes': {'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'Disabled': 'true', 'EntityId': '5881'}}

output_spss_script:
* Define the variable as hidden and set its attributes.
VARIABLE LABELS hidS10 'hidS10 - //hidden to classify below based on S10 response.'.
VALUE LABELS hidS10 1 'HIGH DIGITAL USER' 2 'MODERATE DIGITAL USER' 3 'LOW DIGITAL USER'.
MISSING VALUES hidS10 (99).
EXECUTE.

---

Question ID:
S15

details_normalized:
{'Question ID': 'S15', 'Question Label': 'S15 - How old are you?', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': ["GetNum('S15_1') < 18 || GetNum('S15_1') > 79 //soft-screen S15"], 'Variable ID': 'S15_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'S15_1 (S15 - How old are you?)'}], 'question_attributes': {'LowerLimitType': 'GreaterOrEqual', 'LowerLimit': '0', 'Numeric': 'true', 'UpperLimit': '99', 'AutoCheckOther': 'true', 'OpenText': 'true', 'EntityId': '5915', 'RightText': 'true', 'UpperLimitType': 'SmallerOrEqual'}}

output_spss_script:
* Define the variable and set its attributes.
VARIABLE LABELS S15_1 'S15 - How old are you?'.
VALUE LABELS S15_1 1 'S15_1 (S15 - How old are you?)'.
MISSING VALUES S15_1 (99).
* Apply entry conditions for age screening.
DO IF (S15_1 < 18 OR S15_1 > 79).
    COMPUTE S15_1 = 99.
END IF.
EXECUTE.

---

Question ID:
hidS15

details_normalized:
{'Question ID': 'hidS15', 'Question Label': 'hidS15 - //hidden clasify below based on S15 response.', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidS15', 'answers': [{'Answer Code': '1', 'Answer Label': 'GEN Z'}, {'Answer Code': '2', 'Answer Label': 'MILLENNIAL'}, {'Answer Code': '3', 'Answer Label': 'GEN X'}, {'Answer Code': '4', 'Answer Label': 'BOOMER'}], 'question_attributes': {'NotRequired': 'true', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'Disabled': 'true', 'EntityId': '5924'}}

output_spss_script:
* Define the variable as hidden and set its attributes.
VARIABLE LABELS hidS15 'hidS15 - //hidden clasify below based on S15 response.'.
VALUE LABELS hidS15 1 'GEN Z' 2 'MILLENNIAL' 3 'GEN X' 4 'BOOMER'.
MISSING VALUES hidS15 (99).
EXECUTE.

---

Question ID:
S20

details_normalized:
{'Question ID': 'S20', 'Question Label': 'S20 - What gender do you identify as?', 'question_type': 'Single', 'entry_conditions': ["f('qSurveyType').none('2') //SCREENER"], 'conditions': [], 'Variable ID': 'S20', 'answers': [{'Answer Code': '1', 'Answer Label': 'Man'}, {'Answer Code': '2', 'Answer Label': 'Woman'}, {'Answer Code': '3', 'Answer Label': 'Non-binary or other gender identity'}, {'Answer Code': '97', 'Answer Label': 'Prefer not to disclose'}], 'question_attributes': {'AutoCheckOther': 'true', 'EntityId': '5932'}}

output_spss_script:
* Define the variable and set its attributes.
VARIABLE LABELS S20 'S20 - What gender do you identify as?'.
VALUE LABELS S20 1 'Man' 2 'Woman' 3 'Non-binary or other gender identity' 97 'Prefer not to disclose'.
MISSING VALUES S20 (99).
* Apply entry conditions for screener.
DO IF (f('qSurveyType').none('2')).
    EXECUTE.
END IF.
EXECUTE.

---

Question ID:
S25

details_normalized:
{'Question ID': 'S25', 'Question Label': 'S25 - In which state do you currently live?', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'S25', 'answers': [{'Answer Code': '1', 'Answer Label': 'AL Alabama', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '2', 'Answer Label': 'AK Alaska', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '3', 'Answer Label': 'AZ Arizona', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '4', 'Answer Label': 'AR Arkansas', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '5', 'Answer Label': 'CA California', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '6', 'Answer Label': 'CO Colorado', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '7', 'Answer Label': 'CT Connecticut', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '8', 'Answer Label': 'DC District of Columbia', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '9', 'Answer Label': 'DE Delaware', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '10', 'Answer Label': 'FL Florida', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '11', 'Answer Label': 'GA Georgia', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '12', 'Answer Label': 'HI Hawaii', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '13', 'Answer Label': 'ID Idaho', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '14', 'Answer Label': 'IL Illinois', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '15', 'Answer Label': 'IN Indiana', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '16', 'Answer Label': 'IA Iowa', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '17', 'Answer Label': 'KS Kansas', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '18', 'Answer Label': 'KY Kentucky', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '19', 'Answer Label': 'LA Louisiana', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '20', 'Answer Label': 'ME Maine', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '21', 'Answer Label': 'MD Maryland', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '22', 'Answer Label': 'MA Massachusetts', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '23', 'Answer Label': 'MI Michigan', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '24', 'Answer Label': 'MN Minnesota', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '25', 'Answer Label': 'MS Mississippi', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '26', 'Answer Label': 'MO Missouri', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '27', 'Answer Label': 'MT Montana', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '28', 'Answer Label': 'NC North Carolina', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '29', 'Answer Label': 'ND North Dakota', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '30', 'Answer Label': 'NE Nebraska', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '31', 'Answer Label': 'NV Nevada', 'answer_attributes': {'ListSource': 'list_states'}

---

```
Question ID:
qtRegion1

details_normalized:
{'Question ID': 'qtRegion1', 'Question Label': 'qtRegion1 - // hidden question storing region for quota purposes', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'qtRegion1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Northeast'}, {'Answer Code': '2', 'Answer Label': 'Midwest'}, {'Answer Code': '3', 'Answer Label': 'South'}, {'Answer Code': '4', 'Answer Label': 'West'}], 'question_attributes': {'NotRequired': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'EntityId': '5935'}}

output_spss_script:
* Define the variable as hidden and set its attributes.
VARIABLE LABELS qtRegion1 'qtRegion1 - // hidden question storing region for quota purposes'.
VALUE LABELS qtRegion1
    1 'Northeast'
    2 'Midwest'
    3 'South'
    4 'West'.
MISSING VALUES qtRegion1 (99).
EXECUTE.

---

Question ID:
Qual

details_normalized:
{'Question ID': 'Qual', 'Question Label': 'Qual - Your responses have qualified you for this research. This survey should take approximately 10 minutes to complete.  Are you willing to participate?  ', 'question_type': 'Single', 'entry_conditions': ["f('qSurveyType').none('2') //SCREENER"], 'conditions': ["f('Qual').any('2') //soft-screen Qual"], 'Variable ID': 'Qual', 'answers': [{'Answer Code': '1', 'Answer Label': 'Yes', 'answer_attributes': {'ColumnWidth': '100', 'ListSource': 'list_yesno'}}, {'Answer Code': '2', 'Answer Label': 'No', 'answer_attributes': {'ColumnWidth': '100', 'ListSource': 'list_yesno'}}], 'question_attributes': {'AutoCheckOther': 'true', 'EntityId': '5940'}}

output_spss_script:
* Define the variable and its attributes.
VARIABLE LABELS Qual 'Qual - Your responses have qualified you for this research. This survey should take approximately 10 minutes to complete. Are you willing to participate?'.
VALUE LABELS Qual
    1 'Yes'
    2 'No'.
MISSING VALUES Qual (99).
* Entry conditions and validation.
DO IF (f('qSurveyType').none('2')).
    /* Additional logic for entry conditions can be added here */
END IF.
EXECUTE.

---

Question ID:
A5

details_normalized:
{'Question ID': 'A5', 'question_type': 'Grid', 'entry_conditions': [], 'conditions': [], 'question_attributes': {'SubHeaderOrder': 'Randomize', 'AnswerlistOrder': 'Randomize', 'Carousel': 'false', 'Randomize': 'true', 'EntityId': '5947'}, 'sub_questions': [{'Variable ID': 'A5_1', 'Question Label': 'Finding a primary healthcare provider online is easy (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)', 'answers': [{'Answer Code': '97', 'Answer Label': 'Does Not Apply'}, {'Answer Code': '1', 'Answer Label': 'Strongly Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Somewhat Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Neither Disagree or Agree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Somewhat Agree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Strongly Agree', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A5_2', 'Question Label': 'Finding a provider who specializes in my condition online is easy (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)', 'answers': [{'Answer Code': '97', 'Answer Label': 'Does Not Apply'}, {'Answer Code': '1', 'Answer Label': 'Strongly Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Somewhat Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Neither Disagree or Agree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Somewhat Agree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Strongly Agree', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A5_3', 'Question Label': 'I am able to schedule an appointment with my primary provider in a reasonable timeframe (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)', 'answers': [{'Answer Code': '97', 'Answer Label': 'Does Not Apply'}, {'Answer Code': '1', 'Answer Label': 'Strongly Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Somewhat Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Neither Disagree or Agree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Somewhat Agree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Strongly Agree', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A5_4', 'Question Label': 'I am able to schedule an appointment with a provider who specializes in my condition in a reasonable timeframe (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)', 'answers': [{'Answer Code': '97', 'Answer Label': 'Does Not Apply'}, {'Answer Code': '1', 'Answer Label': 'Strongly Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Somewhat Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Neither Disagree or Agree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Somewhat Agree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Strongly Agree', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A5_5', 'Question Label': 'The location of my healthcare facility is convenient for me (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)', 'answers': [{'Answer Code': '97', 'Answer Label': 'Does Not Apply'}, {'Answer Code': '1', 'Answer Label': 'Strongly Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Somewhat Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Neither Disagree or Agree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Somewhat Agree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Strongly Agree', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A5_6', 'Question Label': 'Accessing and completing necessary lab tests is convenient (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)', 'answers': [{'Answer Code': '97', 'Answer Label': 'Does Not Apply'}, {'Answer Code': '1', 'Answer Label': 'Strongly Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Somewhat Disagree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Neither Disagree or Agree', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Somewhat Agree', 'answer_attributes': {'FieldId': '0'}}, {'

---

```
Question ID:
A15xDK

details_normalized:
{'Question ID': 'A15xDK', 'Question Label': "  - -Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?", 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'A15xDK_99', 'answers': [{'Answer Code': '99', 'Answer Label': 'I have not used any digital health solutions'}], 'question_attributes': {'AnswerRequiredType': 'NotRequired', 'AutoCheckOther': 'true', 'EntityId': '6004'}}

output_spss_script:
* Define the variable for the question.
VARIABLE LABELS A15xDK_99 "A15xDK - Digital health solutions usage".
VALUE LABELS A15xDK_99 99 "I have not used any digital health solutions".
MISSING VALUES A15xDK_99 (99).
* Set answer required type.
IF (A15xDK_99 = 99) A15xDK_99 = SYSMIS.

---

Question ID:
A20

details_normalized:
{'Question ID': 'A20', 'question_type': 'Grid', 'entry_conditions': ["/*A20*/ GreaterThan('A15', 1).diff(set('99')).size()>0"], 'conditions': [], 'question_attributes': {'PrecodeMask': "GreaterThan('A15', 1).diff(set('99'))", 'Carousel': 'false', 'EntityId': '5964'}, 'sub_questions': [{'Variable ID': 'A20_1', 'Question Label': "Telehealth platforms for virtual consultations (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Very unsatisfied'}, {'Answer Code': '2', 'Answer Label': 'Somewhat unsatisfied'}, {'Answer Code': '3', 'Answer Label': 'Neither satisfied or unsatisfied'}, {'Answer Code': '4', 'Answer Label': 'Somewhat satisfied'}, {'Answer Code': '5', 'Answer Label': 'Very satisfied'}]}, {'Variable ID': 'A20_2', 'Question Label': "Mobile health apps for chronic disease management (e.g., diabetes, asthma) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Very unsatisfied'}, {'Answer Code': '2', 'Answer Label': 'Somewhat unsatisfied'}, {'Answer Code': '3', 'Answer Label': 'Neither satisfied or unsatisfied'}, {'Answer Code': '4', 'Answer Label': 'Somewhat satisfied'}, {'Answer Code': '5', 'Answer Label': 'Very satisfied'}]}, {'Variable ID': 'A20_3', 'Question Label': "Wearable devices for health (e.g., heart rate, oxygen level, sleep, steps) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Very unsatisfied'}, {'Answer Code': '2', 'Answer Label': 'Somewhat unsatisfied'}, {'Answer Code': '3', 'Answer Label': 'Neither satisfied or unsatisfied'}, {'Answer Code': '4', 'Answer Label': 'Somewhat satisfied'}, {'Answer Code': '5', 'Answer Label': 'Very satisfied'}]}, {'Variable ID': 'A20_4', 'Question Label': "Patient portals for accessing healthcare information and resources (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Very unsatisfied'}, {'Answer Code': '2', 'Answer Label': 'Somewhat unsatisfied'}, {'Answer Code': '3', 'Answer Label': 'Neither satisfied or unsatisfied'}, {'Answer Code': '4', 'Answer Label': 'Somewhat satisfied'}, {'Answer Code': '5', 'Answer Label': 'Very satisfied'}]}, {'Variable ID': 'A20_5', 'Question Label': "Websites for accessing healthcare information and resources (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Very unsatisfied'}, {'Answer Code': '2', 'Answer Label': 'Somewhat unsatisfied'}, {'Answer Code': '3', 'Answer Label': 'Neither satisfied or unsatisfied'}, {'Answer Code': '4', 'Answer Label': 'Somewhat satisfied'}, {'Answer Code': '5', 'Answer Label': 'Very satisfied'}]}, {'Variable ID': 'A20_6', 'Question Label': "At-home diagnostic testing kits for personalized health insights (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Very unsatisfied'}, {'Answer Code': '2', 'Answer Label': 'Somewhat unsatisfied'}, {'Answer Code': '3', 'Answer Label': 'Neither satisfied or unsatisfied'}, {'Answer Code': '4', 'Answer Label': 'Somewhat satisfied'}, {'Answer Code': '5', 'Answer Label': 'Very satisfied'}]}, {'Variable ID': 'A20_7', 'Question Label': "Digital therapeutics for mental health support (e.g., anxiety, depression) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Very unsatisfied'}, {'Answer Code': '2', 'Answer Label': 'Somewhat unsatisfied'}, {'Answer Code': '3', 'Answer Label': 'Neither satisfied or unsatisfied'}, {'Answer Code': '4', 'Answer Label': 'Somewhat satisfied'}, {'Answer Code': '5', 'Answer Label': 'Very satisfied'}]}, {'Variable ID': 'A20_8', 'Question Label': "Health management platforms that are integrated with my health provider’s electronic health records (EHR) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Very unsatisfied'}, {'Answer Code': '2', 'Answer Label': 'Somewhat unsatisfied'}, {'Answer Code': '3', 'Answer Label': 'Neither satisfied or unsatisfied'}, {'Answer Code': '4', 'Answer Label': 'Somewhat satisfied'}, {'Answer Code': '5', 'Answer Label': 'Very satisfied'}]}, {'Variable ID': 'A20_9', 'Question Label': "Remote health monitoring tools to keep track of your health conditions (e.g. blood sugar monitors, heart rate monitors etc.) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Very unsatisfied'}, {'Answer Code': '2', 'Answer Label': 'Somewhat unsatisfied'}, {'Answer Code': '3', 'Answer Label': 'Neither satisfied or unsatisfied'}, {'Answer Code': '4', 'Answer Label': 'Somewhat satisfied'}, {'Answer Code': '5', 'Answer Label': 'Very satisfied'}]}, {'Variable ID': 'A20_10', 'Question Label': "AI-driven health assistants for personalized health advice (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Very unsatisfied'}, {'Answer Code': '2', 'Answer Label': 'Somewhat unsatisfied'}, {'Answer Code': '3', 'Answer Label': 'Neither satisfied or unsatisfied'}, {'Answer Code': '4', 'Answer Label': 'Somewhat satisfied'}, {'Answer Code': '5', 'Answer Label': 'Very satisfied'}]}, {'Variable ID': 'A20_11', 'Question Label': "Pharma solutions (e.g., brand website, digital coupons, pharma physician finders, patient assistance programs) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Very unsatisfied'}, {'Answer Code': '2', 'Answer Label': 'Somewhat unsatisfied'}, {'Answer Code': '3', 'Answer Label': 'Neither satisfied or unsatisfied'}, {'Answer Code': '4', 'Answer Label': 'Somewhat satisfied'}, {'Answer Code': '5', 'Answer Label':

---

Here is the generated SPSS script for each question in the provided batch:

```
Question ID:
A40

details_normalized:
{'Question ID': 'A40', 'question_type': 'Grid', 'entry_conditions': [], 'conditions': [], 'question_attributes': {'AnswerlistOrder': 'Randomize', 'Carousel': 'false', 'Randomize': 'true', 'EntityId': '5974'}, 'sub_questions': [{'Variable ID': 'A40_1', 'Question Label': 'Helping me find a physician (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )', 'answers': [{'Answer Code': '97', 'Answer Label': 'I Don’t Know'}, {'Answer Code': '1', 'Answer Label': 'Not at all Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Slightly Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Moderately Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Very Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Extremely Beneficial', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A40_2', 'Question Label': 'Providing patient assistance programs to help those who cannot afford their medication (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )', 'answers': [{'Answer Code': '97', 'Answer Label': 'I Don’t Know'}, {'Answer Code': '1', 'Answer Label': 'Not at all Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Slightly Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Moderately Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Very Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Extremely Beneficial', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A40_3', 'Question Label': 'Providing tools or resources to help me access medication (e.g., delivery services, automatic reminders) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )', 'answers': [{'Answer Code': '97', 'Answer Label': 'I Don’t Know'}, {'Answer Code': '1', 'Answer Label': 'Not at all Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Slightly Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Moderately Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Very Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Extremely Beneficial', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A40_4', 'Question Label': 'Education about the conditions that medication treats (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )', 'answers': [{'Answer Code': '97', 'Answer Label': 'I Don’t Know'}, {'Answer Code': '1', 'Answer Label': 'Not at all Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Slightly Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Moderately Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Very Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Extremely Beneficial', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A40_5', 'Question Label': 'Support programs to help with adherence (e.g., medication reminders) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )', 'answers': [{'Answer Code': '97', 'Answer Label': 'I Don’t Know'}, {'Answer Code': '1', 'Answer Label': 'Not at all Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Slightly Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Moderately Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Very Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Extremely Beneficial', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A40_6', 'Question Label': 'Telehealth services to connect me to care (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )', 'answers': [{'Answer Code': '97', 'Answer Label': 'I Don’t Know'}, {'Answer Code': '1', 'Answer Label': 'Not at all Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Slightly Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Moderately Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Very Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Extremely Beneficial', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A40_7', 'Question Label': 'Easier access for lab testing; at home kits, or scheduling at service centers (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )', 'answers': [{'Answer Code': '97', 'Answer Label': 'I Don’t Know'}, {'Answer Code': '1', 'Answer Label': 'Not at all Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Slightly Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Moderately Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Very Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '5', 'Answer Label': 'Extremely Beneficial', 'answer_attributes': {'FieldId': '0'}}]}, {'Variable ID': 'A40_8', 'Question Label': 'Reduce the barriers to care that I experience with traditional healthcare process (e.g., long wait times, lack of convenience) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )', 'answers': [{'Answer Code': '97', 'Answer Label': 'I Don’t Know'}, {'Answer Code': '1', 'Answer Label': 'Not at all Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '2', 'Answer Label': 'Slightly Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '3', 'Answer Label': 'Moderately Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code': '4', 'Answer Label': 'Very Beneficial', 'answer_attributes': {'FieldId': '0'}}, {'Answer Code':

---

```
Question ID:
B10xDK

details_normalized:
{'Question ID': 'B10xDK', 'Question Label': '  - -Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?', 'question_type': 'Multi', 'entry_conditions': ["f('B5').toBoolean() && f('B5').none('99')"], 'conditions': [], 'Variable ID': 'B10xDK_99', 'answers': [{'Answer Code': '99', 'Answer Label': ''}], 'question_attributes': {'AnswerRequiredType': 'NotRequired', 'AutoCheckOther': 'true', 'EntityId': '6010'}}

output_spss_script:
* Define the variable for the question.
VARIABLE LABELS B10xDK_99 'Top 3 Motivations'.
VALUE LABELS B10xDK_99 99 'Not Applicable'.
* Apply entry conditions.
DO IF (f('B5').toBoolean() AND NOT f('B5').any('99')).
    * Logic for multi-select question can be added here.
END IF.

---

Question ID:
B15

details_normalized:
{'Question ID': 'B15', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': "B15 - What are the main barriers preventing you from using ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ more frequently?", 'question_attributes': {'ValidationCode': 'checkOS();', 'AnswerRequiredType': 'Required', 'MultiItemsSelectedMinimum': '3', 'AutoCheckOther': 'true', 'AnswerlistOrder': 'Randomize', 'Randomize': 'true', 'EntityId': '5916'}, 'sub_questions': [{'Variable ID': 'B15_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Current digital solutions don’t address my specific health needs'}]}, {'Variable ID': 'B15_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Concerns about privacy and data security'}]}, {'Variable ID': 'B15_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Find them hard to use'}]}, {'Variable ID': 'B15_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Cost of devices or subscriptions'}]}, {'Variable ID': 'B15_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'I don’t know enough about digital health solutions'}]}, {'Variable ID': 'B15_15', 'answers': [{'Answer Code': '15', 'Answer Label': 'Unsure how to find a digital health solution that meets my needs'}]}, {'Variable ID': 'B15_6', 'answers': [{'Answer Code': '6', 'Answer Label': 'Preference for in-person healthcare visits'}]}, {'Variable ID': 'B15_7', 'answers': [{'Answer Code': '7', 'Answer Label': 'Negative past experiences with digital solutions'}]}, {'Variable ID': 'B15_8', 'answers': [{'Answer Code': '8', 'Answer Label': 'Limited internet access or connectivity issues'}]}, {'Variable ID': 'B15_9', 'answers': [{'Answer Code': '9', 'Answer Label': 'Lack of endorsement by trusted healthcare professionals'}]}, {'Variable ID': 'B15_10', 'answers': [{'Answer Code': '10', 'Answer Label': 'Is not integrated with my healthcare provider’s system'}]}, {'Variable ID': 'B15_11', 'answers': [{'Answer Code': '11', 'Answer Label': 'Digital solutions do not provide the same level of care'}]}, {'Variable ID': 'B15_12', 'answers': [{'Answer Code': '12', 'Answer Label': 'Cause delays in care'}]}, {'Variable ID': 'B15_13', 'answers': [{'Answer Code': '13', 'Answer Label': 'There is not one app, platform or website that addresses all my healthcare needs'}]}, {'Variable ID': 'B15_98', 'answers': [{'Answer Code': '98', 'Answer Label': 'Other', 'answer_attributes': {'KeepPosition': 'true', 'Other': 'true'}}]}, {'Variable ID': 'B15_99', 'answers': [{'Answer Code': '99', 'Answer Label': 'None-No barriers ', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}, {'Variable ID': 'B15_98_other', 'answers': [{'Answer Code': '98', 'Answer Label': '', 'answer_attributes': {'KeepPosition': 'true', 'Other': 'true'}}]}]}

output_spss_script:
* Define variables for the multi-select question.
VARIABLE LABELS B15_1 'Barrier: Current digital solutions don’t address my specific health needs'.
VARIABLE LABELS B15_2 'Barrier: Concerns about privacy and data security'.
VARIABLE LABELS B15_3 'Barrier: Find them hard to use'.
VARIABLE LABELS B15_4 'Barrier: Cost of devices or subscriptions'.
VARIABLE LABELS B15_5 'Barrier: I don’t know enough about digital health solutions'.
VARIABLE LABELS B15_15 'Barrier: Unsure how to find a digital health solution that meets my needs'.
VARIABLE LABELS B15_6 'Barrier: Preference for in-person healthcare visits'.
VARIABLE LABELS B15_7 'Barrier: Negative past experiences with digital solutions'.
VARIABLE LABELS B15_8 'Barrier: Limited internet access or connectivity issues'.
VARIABLE LABELS B15_9 'Barrier: Lack of endorsement by trusted healthcare professionals'.
VARIABLE LABELS B15_10 'Barrier: Is not integrated with my healthcare provider’s system'.
VARIABLE LABELS B15_11 'Barrier: Digital solutions do not provide the same level of care'.
VARIABLE LABELS B15_12 'Barrier: Cause delays in care'.
VARIABLE LABELS B15_13 'Barrier: There is not one app, platform or website that addresses all my healthcare needs'.
VARIABLE LABELS B15_98 'Barrier: Other'.
VARIABLE LABELS B15_99 'Barrier: None-No barriers'.
* Set value labels for answers.
VALUE LABELS B15_1 1 'Current digital solutions don’t address my specific health needs'.
VALUE LABELS B15_2 2 'Concerns about privacy and data security'.
VALUE LABELS B15_3 3 'Find them hard to use'.
VALUE LABELS B15_4 4 'Cost of devices or subscriptions'.
VALUE LABELS B15_5 5 'I don’t know enough about digital health solutions'.
VALUE LABELS B15_15 15 'Unsure how to find a digital health solution that meets my needs'.
VALUE LABELS B15_6 6 'Preference for in-person healthcare visits'.
VALUE LABELS B15_7 7 'Negative past experiences with digital solutions'.
VALUE LABELS B15_8 8 'Limited internet access or connectivity issues'.
VALUE LABELS B15_9 9 'Lack of endorsement by trusted healthcare professionals'.
VALUE LABELS B15_10 10 'Is not integrated with my healthcare provider’s system'.
VALUE LABELS B15_11 11 'Digital solutions do not provide the same level of care'.
VALUE LABELS B15_12 12 'Cause delays in care'.
VALUE LABELS B15_13 13 'There is not one app, platform or website that addresses all my healthcare needs'.
VALUE LABELS B15_98 98 'Other'.
VALUE LABELS B15_99 99 'None-No barriers'.
* Apply validation code.
DO IF (f('B15').toBoolean() AND f('B15').none('99')).
    EXECUTE.
END IF.

---

Question ID:
B20x1

details_normalized:
{'Question ID': 'B20x1', 'Question Label': 'B20x1 - Most Important-Of the barriers you just chose, which of the following are the top 3 biggest barriers with 1 being the biggest barrier?', 'question_type': 'Single', 'entry_conditions': ["f('B15').toBoolean() && f('B15').none('99')"], 'conditions': [], 'Variable ID': 'B20x1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Current digital solutions don’t address my specific health needs'}, {'Answer Code': '2', 'Answer Label': 'Concerns about privacy and data security'}, {'Answer Code': '3', 'Answer Label': 'Find them hard to use'}, {'Answer Code': '4', 'Answer Label': 'Cost of devices or subscriptions'}, {'Answer Code': '5', 'Answer Label': 'I don’t know enough about digital health solutions'}, {'Answer Code': '15', 'Answer Label': 'Unsure how to find a digital health solution that meets my needs'}, {'Answer Code': '6', 'Answer Label': 'Preference for in-person healthcare visits'}, {'Answer Code': '7', 'Answer Label': 'Negative past experiences with digital solutions'}, {'Answer Code': '8', 'Answer Label': 'Limited internet access or connectivity issues'}, {'Answer Code': '9', 'Answer Label': 'Lack of endorsement by trusted healthcare professionals'}, {'Answer Code': '10', 'Answer Label': 'Is not integrated with my healthcare provider’s system'}, {'Answer Code': '11', 'Answer Label': 'Digital solutions do

---

```
Question ID:
B20xDK

details_normalized:
{'Question ID': 'B20xDK', 'Question Label': '  - -Of the barriers you just chose, which of the following are the top 3 biggest barriers with 1 being the biggest barrier?', 'question_type': 'Multi', 'entry_conditions': ["f('B15').toBoolean() && f('B15').none('99')"], 'conditions': [], 'Variable ID': 'B20xDK_99', 'answers': [{'Answer Code': '99', 'Answer Label': ''}], 'question_attributes': {'AnswerRequiredType': 'NotRequired', 'AutoCheckOther': 'true', 'EntityId': '6015'}}

output_spss_script:
* Define the variable for the question.
VARIABLE LABELS B20xDK_99 'Top 3 Biggest Barriers'.
VALUE LABELS B20xDK_99 99 'None of the above'.
* Set missing values.
MISSING VALUES B20xDK_99 (99).
* Apply entry conditions.
DO IF (B15 = 1 AND B15 NE 99).
    COMPUTE B20xDK_99 = 0.
END IF.

---

Question ID:
B25

details_normalized:
{'Question ID': 'B25', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': "B25 - From your perspective, what factors would be a success for a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^?", 'question_attributes': {'AnswerRequiredType': 'Required', 'AutoCheckOther': 'true', 'AnswerlistOrder': 'Randomize', 'Randomize': 'true', 'EntityId': '5923'}, 'sub_questions': [{'Variable ID': 'B25_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Helps me to better manage my condition(s)'}]}, {'Variable ID': 'B25_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Single website, platform or portal  for my entire healthcare experience'}]}, {'Variable ID': 'B25_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Reliable and secure management of personal health data'}]}, {'Variable ID': 'B25_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Cost-effective'}]}, {'Variable ID': 'B25_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'Addresses my specific healthcare need'}]}, {'Variable ID': 'B25_6', 'answers': [{'Answer Code': '6', 'Answer Label': 'Let’s me connect with a primary healthcare provider or specialist more quickly than in person care'}]}, {'Variable ID': 'B25_7', 'answers': [{'Answer Code': '7', 'Answer Label': 'Makes accessing health data more convenient'}]}, {'Variable ID': 'B25_8', 'answers': [{'Answer Code': '8', 'Answer Label': 'Has strong customer service'}]}, {'Variable ID': 'B25_9', 'answers': [{'Answer Code': '9', 'Answer Label': 'Improves access to prescription refills'}]}, {'Variable ID': 'B25_10', 'answers': [{'Answer Code': '10', 'Answer Label': 'Increases or improves my engagement with my healthcare'}]}, {'Variable ID': 'B25_98', 'answers': [{'Answer Code': '98', 'Answer Label': 'Other', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'B25_99', 'answers': [{'Answer Code': '99', 'Answer Label': 'None of the above', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}]}

output_spss_script:
* Define variables for sub-questions.
VARIABLE LABELS B25_1 'Helps me to better manage my condition(s)' 
                B25_2 'Single website, platform or portal for my entire healthcare experience'
                B25_3 'Reliable and secure management of personal health data'
                B25_4 'Cost-effective'
                B25_5 'Addresses my specific healthcare need'
                B25_6 'Let’s me connect with a primary healthcare provider or specialist more quickly than in person care'
                B25_7 'Makes accessing health data more convenient'
                B25_8 'Has strong customer service'
                B25_9 'Improves access to prescription refills'
                B25_10 'Increases or improves my engagement with my healthcare'
                B25_98 'Other'
                B25_99 'None of the above'.
VALUE LABELS B25_1 1 'Helps me to better manage my condition(s)' 
               B25_2 2 'Single website, platform or portal for my entire healthcare experience'
               B25_3 3 'Reliable and secure management of personal health data'
               B25_4 4 'Cost-effective'
               B25_5 5 'Addresses my specific healthcare need'
               B25_6 6 'Let’s me connect with a primary healthcare provider or specialist more quickly than in person care'
               B25_7 7 'Makes accessing health data more convenient'
               B25_8 8 'Has strong customer service'
               B25_9 9 'Improves access to prescription refills'
               B25_10 10 'Increases or improves my engagement with my healthcare'
               B25_98 98 'Other'
               B25_99 99 'None of the above'.
* Set missing values.
MISSING VALUES B25_1 TO B25_10 (99).

---

Question ID:
B35

details_normalized:
{'Question ID': 'B35', 'Question Label': "B35 - In your own words, what is the greatest challenge that a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ could solve for you?", 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'B35', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ValidationCode': 'blankcheckopen();', 'EntityId': '5926'}}

output_spss_script:
* Define the variable for the open-ended question.
VARIABLE LABELS B35 'Greatest challenge that a digital health solution could solve for you'.
* Set missing values.
MISSING VALUES B35 (0).
* Apply validation code.
DO IF (B35 = '').
    EXECUTE.
END IF.

---

Question ID:
hidC5Ord

details_normalized:
{'Question ID': 'hidC5Ord', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hidC5Ord - //hidden to store the order', 'question_attributes': {'Randomize': 'true', 'NotRequired': 'true', 'LowerLimitType': 'GreaterOrEqual', 'LowerLimit': '0', 'Numeric': 'true', 'UpperLimit': '99', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'OpenText': 'true', 'EntityId': '5884'}, 'sub_questions': [{'Variable ID': 'hidC5Ord_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Personalized health insights and recommendations based on your data (hidC5Ord - //hidden to store the order)'}]}, {'Variable ID': 'hidC5Ord_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Integration with your existing health records for a comprehensive view (hidC5Ord - //hidden to store the order)'}]}, {'Variable ID': 'hidC5Ord_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Ability to consult with healthcare professionals virtually or schedule in person (hidC5Ord - //hidden to store the order)'}]}, {'Variable ID': 'hidC5Ord_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'A digital platform to track and manage your health metrics over time (hidC5Ord - //hidden to store the order)'}]}, {'Variable ID': 'hidC5Ord_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'Educational content tailored to your health needs (hidC5Ord - //hidden to store the order)'}]}, {'Variable ID': 'hidC5Ord_6', 'answers': [{'Answer Code': '6', 'Answer Label': 'Secure options for sharing your health data (e.g., lab test results, notes, insurance cards etc..) with others including your healthcare provider (hidC5Ord - //hidden to store the order)'}]}, {'Variable ID': 'hidC5Ord_8', 'answers': [{'Answer Code': '8', 'Answer Label': 'Accepts my insurance coverage for services (hidC5Ord - //hidden to store the order)'}]}, {'Variable ID': 'hidC5Ord_9', 'answers': [{'Answer Code': '9', 'Answer Label': 'Provides access to insurance benefits, claims and payment support (hidC5Ord - //hidden to store the order)'}]}, {'Variable ID': 'hidC5Ord_10', 'answers': [{'Answer Code': '10', 'Answer Label':

---

```plaintext
Question ID:
hC5x2

details_normalized:
{'Question ID': 'hC5x2', 'question_type': 'Grid', 'entry_conditions': [], 'conditions': [], 'question_attributes': {'PrecodeMask': "GreaterThan('hidC5Ord', 6)", 'AnswerlistOrder': 'Randomize', 'Carousel': 'false', 'Randomize': 'true', 'EntityId': '5888'}, 'sub_questions': [{'Variable ID': 'hC5x2_1', 'Question Label': "Personalized health insights and recommendations based on your data (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Not at all likely'}, {'Answer Code': '2', 'Answer Label': 'Slightly likely'}, {'Answer Code': '3', 'Answer Label': 'Neither unlikely or likely'}, {'Answer Code': '4', 'Answer Label': 'Very likely'}, {'Answer Code': '5', 'Answer Label': 'Extremely Likely'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'hC5x2_2', 'Question Label': "Integration with your existing health records for a comprehensive view (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Not at all likely'}, {'Answer Code': '2', 'Answer Label': 'Slightly likely'}, {'Answer Code': '3', 'Answer Label': 'Neither unlikely or likely'}, {'Answer Code': '4', 'Answer Label': 'Very likely'}, {'Answer Code': '5', 'Answer Label': 'Extremely Likely'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'hC5x2_3', 'Question Label': "Ability to consult with healthcare professionals virtually or schedule in person (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Not at all likely'}, {'Answer Code': '2', 'Answer Label': 'Slightly likely'}, {'Answer Code': '3', 'Answer Label': 'Neither unlikely or likely'}, {'Answer Code': '4', 'Answer Label': 'Very likely'}, {'Answer Code': '5', 'Answer Label': 'Extremely Likely'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'hC5x2_4', 'Question Label': "A digital platform to track and manage your health metrics over time (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Not at all likely'}, {'Answer Code': '2', 'Answer Label': 'Slightly likely'}, {'Answer Code': '3', 'Answer Label': 'Neither unlikely or likely'}, {'Answer Code': '4', 'Answer Label': 'Very likely'}, {'Answer Code': '5', 'Answer Label': 'Extremely Likely'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'hC5x2_5', 'Question Label': "Educational content tailored to your health needs (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Not at all likely'}, {'Answer Code': '2', 'Answer Label': 'Slightly likely'}, {'Answer Code': '3', 'Answer Label': 'Neither unlikely or likely'}, {'Answer Code': '4', 'Answer Label': 'Very likely'}, {'Answer Code': '5', 'Answer Label': 'Extremely Likely'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'hC5x2_6', 'Question Label': "Secure options for sharing your health data (e.g., lab test results, notes, insurance cards etc..) with others including your healthcare provider (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Not at all likely'}, {'Answer Code': '2', 'Answer Label': 'Slightly likely'}, {'Answer Code': '3', 'Answer Label': 'Neither unlikely or likely'}, {'Answer Code': '4', 'Answer Label': 'Very likely'}, {'Answer Code': '5', 'Answer Label': 'Extremely Likely'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'hC5x2_8', 'Question Label': "Accepts my insurance coverage for services (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Not at all likely'}, {'Answer Code': '2', 'Answer Label': 'Slightly likely'}, {'Answer Code': '3', 'Answer Label': 'Neither unlikely or likely'}, {'Answer Code': '4', 'Answer Label': 'Very likely'}, {'Answer Code': '5', 'Answer Label': 'Extremely Likely'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'hC5x2_9', 'Question Label': "Provides access to insurance benefits, claims and payment support (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Not at all likely'}, {'Answer Code': '2', 'Answer Label': 'Slightly likely'}, {'Answer Code': '3', 'Answer Label': 'Neither unlikely or likely'}, {'Answer Code': '4', 'Answer Label': 'Very likely'}, {'Answer Code': '5', 'Answer Label': 'Extremely Likely'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'hC5x2_10', 'Question Label': "Provides digital pharmacy options (e.g., online ordering, prescription delivery) (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)", 'answers': [{'Answer Code': '1', 'Answer Label': 'Not at all likely'}, {'Answer Code': '2', 'Answer Label': 'Slightly likely'}, {'Answer Code': '3', 'Answer Label': 'Neither unlikely or likely'}, {'Answer Code': '4', 'Answer Label': 'Very likely'}, {'Answer Code': '5', 'Answer Label': 'Extremely Likely'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'hC5x2_11', 'Question Label': "Telehealth options

---

```
Question ID:
C10

details_normalized:
{'Question ID': 'C10', 'question_type': 'Grid', 'entry_conditions': [], 'conditions': [], 'question_attributes': {'NotRequired': 'true', 'VariableType': 'Hidden', 'AnswerlistOrder': 'Randomize', 'Disabled': 'true', 'Carousel': 'false', 'Randomize': 'true', 'EntityId': '5902'}, 'sub_questions': [{'Variable ID': 'C10_1', 'Question Label': 'Personalized health insights and recommendations based on your data (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)', 'answers': [{'Answer Code': '1', 'Answer Label': 'Much more negative'}, {'Answer Code': '2', 'Answer Label': 'Somewhat more negative'}, {'Answer Code': '3', 'Answer Label': 'No change'}, {'Answer Code': '4', 'Answer Label': 'Somewhat more positive'}, {'Answer Code': '5', 'Answer Label': 'Much more positive'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable'}]}, {'Variable ID': 'C10_3', 'Question Label': 'Ability to consult with healthcare professionals virtually or schedule in person (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)', 'answers': [{'Answer Code': '1', 'Answer Label': 'Much more negative'}, {'Answer Code': '2', 'Answer Label': 'Somewhat more negative'}, {'Answer Code': '3', 'Answer Label': 'No change'}, {'Answer Code': '4', 'Answer Label': 'Somewhat more positive'}, {'Answer Code': '5', 'Answer Label': 'Much more positive'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable'}]}, {'Variable ID': 'C10_4', 'Question Label': 'A digital platform to track and manage your health metrics over time (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)', 'answers': [{'Answer Code': '1', 'Answer Label': 'Much more negative'}, {'Answer Code': '2', 'Answer Label': 'Somewhat more negative'}, {'Answer Code': '3', 'Answer Label': 'No change'}, {'Answer Code': '4', 'Answer Label': 'Somewhat more positive'}, {'Answer Code': '5', 'Answer Label': 'Much more positive'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable'}]}, {'Variable ID': 'C10_5', 'Question Label': 'Educational content tailored to your health needs (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)', 'answers': [{'Answer Code': '1', 'Answer Label': 'Much more negative'}, {'Answer Code': '2', 'Answer Label': 'Somewhat more negative'}, {'Answer Code': '3', 'Answer Label': 'No change'}, {'Answer Code': '4', 'Answer Label': 'Somewhat more positive'}, {'Answer Code': '5', 'Answer Label': 'Much more positive'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable'}]}, {'Variable ID': 'C10_6', 'Question Label': 'Secure options for sharing your health data (e.g., lab test results, notes, insurance cards etc..) with others including your healthcare provider (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)', 'answers': [{'Answer Code': '1', 'Answer Label': 'Much more negative'}, {'Answer Code': '2', 'Answer Label': 'Somewhat more negative'}, {'Answer Code': '3', 'Answer Label': 'No change'}, {'Answer Code': '4', 'Answer Label': 'Somewhat more positive'}, {'Answer Code': '5', 'Answer Label': 'Much more positive'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable'}]}, {'Variable ID': 'C10_8', 'Question Label': 'Accepts my insurance coverage for services (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)', 'answers': [{'Answer Code': '1', 'Answer Label': 'Much more negative'}, {'Answer Code': '2', 'Answer Label': 'Somewhat more negative'}, {'Answer Code': '3', 'Answer Label': 'No change'}, {'Answer Code': '4', 'Answer Label': 'Somewhat more positive'}, {'Answer Code': '5', 'Answer Label': 'Much more positive'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable'}]}, {'Variable ID': 'C10_9', 'Question Label': 'Provides access to insurance benefits, claims and payment support (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)', 'answers': [{'Answer Code': '1', 'Answer Label': 'Much more negative'}, {'Answer Code': '2', 'Answer Label': 'Somewhat more negative'}, {'Answer Code': '3', 'Answer Label': 'No change'}, {'Answer Code': '4', 'Answer Label': 'Somewhat more positive'}, {'Answer Code': '5', 'Answer Label': 'Much more positive'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable'}]}, {'Variable ID': 'C10_10', 'Question Label': 'Provides digital pharmacy options (e.g., online ordering, prescription delivery) (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)', 'answers': [{'Answer Code': '1', 'Answer Label': 'Much more negative'}, {'Answer Code': '2', 'Answer Label': 'Somewhat more negative'}, {'Answer Code': '3', 'Answer Label': 'No change'}, {'Answer Code': '4', 'Answer Label': 'Somewhat more positive'}, {'Answer Code': '5', 'Answer Label': 'Much more positive'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable'}]}, {'Variable ID': 'C10_11', 'Question Label': 'Telehealth options for primary and specialist healthcare providers (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)', 'answers': [{'Answer Code': '1', 'Answer Label': 'Much more negative'}, {'Answer Code': '2', 'Answer Label': 'Somewhat more negative'}, {'Answer Code': '3', 'Answer Label': 'No change'}, {'Answer Code': '4', 'Answer Label': 'Somewhat more positive'}, {'Answer Code': '5', 'Answer Label': 'Much more positive'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable'}]}, {'Variable ID': 'C10_12', 'Question Label': 'Online physician finders and scheduling services (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)', 'answers': [{'Answer Code': '1', 'Answer Label': 'Much more negative'}, {'Answer Code': '2', 'Answer Label': 'Somewhat more negative'}, {'Answer Code': '3', 'Answer Label': 'No change'}, {'Answer Code': '4', 'Answer Label': 'Somewhat more positive'}, {'Answer Code': '5', 'Answer Label': 'Much more positive'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable'}]}, {'Variable ID': 'C10_13', 'Question Label': 'Easier access for lab testing; at home kits, or scheduling at service center (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)', 'answers': [{'Answer Code': '1', 'Answer Label': 'Much more negative'}, {'Answer Code': '2', 'Answer Label': 'Somewhat more negative'}, {'Answer Code': '3', 'Answer Label': 'No change'}, {'Answer Code': '4', 'Answer Label': 'Somewhat more positive'}, {'Answer Code': '5', 'Answer Label': 'Much more positive'}, {'Answer Code': '97', 'Answer Label': 'Not Applicable'}]}]}

output_spss_script:
* Define sub-question variables.
DEFINE !CreateGridQuestions() 
  !DO !i = 1 !TO 13
    STRING C10_!i (A100).
    VARIABLE LABELS C10_!i 'Sub-question !i'.
    VALUE LABELS C10_!i 
      1 'Much more negative'
      2 'Somewhat more negative'
      3 'No change'
      4 'Somewhat more positive'
      5 'Much more positive'
      97 'Not Applicable'.
  !DOEND
!ENDDEFINE.

!CreateGridQuestions.

* Set missing values for

---

```
Question ID:
E10

details_normalized:
{'Question ID': 'E10', 'Question Label': 'E10 - What is your current employment status? ', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'E10', 'answers': [{'Answer Code': '1', 'Answer Label': 'Full-time employee'}, {'Answer Code': '2', 'Answer Label': 'Working part-time'}, {'Answer Code': '3', 'Answer Label': 'Laid-off / looking for work'}, {'Answer Code': '4', 'Answer Label': 'Stay-at-home'}, {'Answer Code': '5', 'Answer Label': 'Full-time student'}, {'Answer Code': '6', 'Answer Label': 'Maternity leave'}, {'Answer Code': '7', 'Answer Label': 'Retired'}, {'Answer Code': '97', 'Answer Label': 'Prefer not to answer', 'answer_attributes': {'KeepPosition': 'true'}}], 'question_attributes': {'AutoCheckOther': 'true', 'EntityId': '5865'}}

output_spss_script:
* Define variable for employment status.
VARIABLE LABELS E10 'E10 - What is your current employment status?'.
VALUE LABELS E10
    1 'Full-time employee'
    2 'Working part-time'
    3 'Laid-off / looking for work'
    4 'Stay-at-home'
    5 'Full-time student'
    6 'Maternity leave'
    7 'Retired'
    97 'Prefer not to answer'.
MISSING VALUES E10 (99).
EXECUTE.

---

Question ID:
E15

details_normalized:
{'Question ID': 'E15', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Question Label': 'E15 - Please select the highest level of education you have completed to date.', 'question_attributes': {'ValidationCode': 'checkOS();', 'AutoCheckOther': 'true', 'EntityId': '5866'}, 'sub_questions': [{'Variable ID': 'E15', 'answers': [{'Answer Code': '1', 'Answer Label': 'High school or less'}, {'Answer Code': '2', 'Answer Label': 'Trade / technical / vocational training'}, {'Answer Code': '3', 'Answer Label': 'Some college, no degree'}, {'Answer Code': '4', 'Answer Label': 'Associate degree'}, {'Answer Code': '5', 'Answer Label': 'Bachelor’s degree'}, {'Answer Code': '6', 'Answer Label': 'Post-graduate degree'}, {'Answer Code': '98', 'Answer Label': 'Other (specify)', 'answer_attributes': {'KeepPosition': 'true', 'Other': 'true'}}, {'Answer Code': '97', 'Answer Label': 'Prefer not to answer', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'E15_98_other', 'answers': [{'Answer Code': '98', 'Answer Label': '', 'answer_attributes': {'KeepPosition': 'true', 'Other': 'true'}}]}]}

output_spss_script:
* Define variable for education level.
VARIABLE LABELS E15 'E15 - Please select the highest level of education you have completed to date.'.
VALUE LABELS E15
    1 'High school or less'
    2 'Trade / technical / vocational training'
    3 'Some college, no degree'
    4 'Associate degree'
    5 'Bachelor’s degree'
    6 'Post-graduate degree'
    98 'Other (specify)'
    97 'Prefer not to answer'.
MISSING VALUES E15 (99).
EXECUTE.

* Validation function call.
* Note: The actual implementation of checkOS() is not possible in SPSS syntax.
* This is a placeholder for validation logic.

---

Question ID:
E20

details_normalized:
{'Question ID': 'E20', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'E20 - Which of the following describes your racial identity?', 'question_attributes': {'AnswerRequiredType': 'Required', 'AutoCheckOther': 'true', 'AnswerlistOrder': 'Randomize', 'Randomize': 'true', 'EntityId': '5874'}, 'sub_questions': [{'Variable ID': 'E20_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'White/Caucasian'}]}, {'Variable ID': 'E20_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Black or African American'}]}, {'Variable ID': 'E20_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'American Indian or Alaska Native'}]}, {'Variable ID': 'E20_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Asian or Asian Indian'}]}, {'Variable ID': 'E20_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'Native Hawaiian'}]}, {'Variable ID': 'E20_6', 'answers': [{'Answer Code': '6', 'Answer Label': 'Other Asian or Pacific Islander'}]}, {'Variable ID': 'E20_98', 'answers': [{'Answer Code': '98', 'Answer Label': 'Another race', 'answer_attributes': {'KeepPosition': 'true'}}]}, {'Variable ID': 'E20_97', 'answers': [{'Answer Code': '97', 'Answer Label': 'Prefer not to answer', 'answer_attributes': {'KeepPosition': 'true', 'Punch': 'Single'}}]}]}

output_spss_script:
* Define variables for racial identity.
VARIABLE LABELS E20 'E20 - Which of the following describes your racial identity?'.
VALUE LABELS E20_1
    1 'White/Caucasian'.
VALUE LABELS E20_2
    2 'Black or African American'.
VALUE LABELS E20_3
    3 'American Indian or Alaska Native'.
VALUE LABELS E20_4
    4 'Asian or Asian Indian'.
VALUE LABELS E20_5
    5 'Native Hawaiian'.
VALUE LABELS E20_6
    6 'Other Asian or Pacific Islander'.
VALUE LABELS E20_98
    98 'Another race'.
VALUE LABELS E20_97
    97 'Prefer not to answer'.
MISSING VALUES E20_1 TO E20_6 (99).
EXECUTE.

---

Question ID:
E25

details_normalized:
{'Question ID': 'E25', 'Question Label': 'E25 - After this study concludes, we might find we have a few follow-up questions. If this occurs, may we contact you again? This may include a follow up survey or online conversation. ', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'E25', 'answers': [{'Answer Code': '1', 'Answer Label': 'Yes', 'answer_attributes': {'ColumnWidth': '100', 'ListSource': 'list_yesno'}}, {'Answer Code': '2', 'Answer Label': 'No', 'answer_attributes': {'ColumnWidth': '100', 'ListSource': 'list_yesno'}}], 'question_attributes': {'AutoCheckOther': 'true', 'EntityId': '5875'}}

output_spss_script:
* Define variable for follow-up contact permission.
VARIABLE LABELS E25 'E25 - After this study concludes, we might find we have a few follow-up questions. If this occurs, may we contact you again?'.
VALUE LABELS E25
    1 'Yes'
    2 'No'.
MISSING VALUES E25 (99).
EXECUTE.

---

Question ID:
ProgCountry

details_normalized:
{'Question ID': 'ProgCountry', 'Question Label': 'Country - Country:', 'question_type': 'Single', 'entry_conditions': ["f('gid')=='15'   //Update this condition as per requirement"], 'conditions': [], 'Variable ID': 'ProgCountry', 'answers': [{'Answer Code': '1', 'Answer Label': 'United States'}, {'Answer Code': '2', 'Answer Label': 'Canada'}, {'Answer Code': '3', 'Answer Label': 'United Kingdom'}, {'Answer Code': '4', 'Answer Label': 'Afghanistan'}, {'Answer Code': '5', 'Answer Label': 'Albania'}, {'Answer Code': '6', 'Answer Label': 'Algeria'}, {'Answer Code': '7', 'Answer Label': 'Andorra'}, {'Answer Code': '8', 'Answer Label': 'Angola'}, {'Answer Code': '9', 'Answer Label': 'Antigua and Barbuda'}, {'Answer Code': '10', 'Answer Label': 'Argentina'}, {'Answer Code': '11', 'Answer Label': 'Armenia'}, {'Answer Code': '12', 'Answer Label': 'Australia'}, {'Answer Code': '13', 'Answer Label': 'Austria'}, {'Answer Code': '14', 'Answer Label': 'Azerbaijan'}, {'Answer Code': '15', 'Answer Label': 'Bahamas, The'}, {'Answer Code': '16', 'Answer Label': 'Bahrain'}, {'Answer Code': '17', 'Answer Label': 'Bangladesh'}, {'Answer Code': '18', 'Answer Label': 'Barbados'}, {'Answer Code': '19', 'Answer Label': 'Bel

---

```
Question ID:
ProgSpecialty

details_normalized:
{'Question ID': 'ProgSpecialty', 'Question Label': 'Specialty - Specialty:', 'question_type': 'Single', 'entry_conditions': ["f('gid')=='15'   //Update this condition as per requirement"], 'conditions': [], 'Variable ID': 'ProgSpecialty', 'answers': [{'Answer Code': '1', 'Answer Label': 'Administration', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '2', 'Answer Label': 'Allergy & Immunology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '3', 'Answer Label': 'Allied Health Professional (AHP)', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '4', 'Answer Label': 'Anesthesiology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '5', 'Answer Label': 'Behavioral Medicine', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '6', 'Answer Label': 'Cardiology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '7', 'Answer Label': 'Clinical Pharmacology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '8', 'Answer Label': 'Community Medicine', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '9', 'Answer Label': 'Dentistry', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '10', 'Answer Label': 'Dermatology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '11', 'Answer Label': 'Emergency Medicine', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '12', 'Answer Label': 'Endocrinology, Diabetes & Metabolism', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '13', 'Answer Label': 'Family Medicine/General Practice', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '14', 'Answer Label': 'Gastroenterology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '15', 'Answer Label': 'Geriatrics', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '16', 'Answer Label': 'Gerontology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '17', 'Answer Label': 'Hospitalist', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '18', 'Answer Label': 'Infectious Diseases', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '19', 'Answer Label': 'Information Technology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '20', 'Answer Label': 'Internal Medicine', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '21', 'Answer Label': 'Legal Medicine', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '22', 'Answer Label': 'Medical Genetics', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '23', 'Answer Label': 'Medical Physics', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '24', 'Answer Label': 'Medical Scientist', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '25', 'Answer Label': 'Medical Student', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '26', 'Answer Label': 'Nephrology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '27', 'Answer Label': 'Neurological Surgery', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '28', 'Answer Label': 'Neurology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '29', 'Answer Label': 'Neuroscientist', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '30', 'Answer Label': 'Nuclear Medicine', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '31', 'Answer Label': 'Nurse', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '32', 'Answer Label': 'Nurse Practitioner ', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '33', 'Answer Label': 'Obstetrics & Gynecology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '34', 'Answer Label': 'Oncology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '35', 'Answer Label': 'Ophthalmology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '36', 'Answer Label': 'Orthopedics', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '37', 'Answer Label': 'Osteopathy', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '38', 'Answer Label': 'Otolaryngology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '39', 'Answer Label': 'Pathology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '40', 'Answer Label': 'Pediatrics', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '41', 'Answer Label': 'Pharmaceuticals', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '42', 'Answer Label': 'Pharmacy', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '43', 'Answer Label': 'Physical Medicine & Rehabilitation', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '44', 'Answer Label': 'Physician Assistant', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '45', 'Answer Label': 'Plastic Surgery', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '46', 'Answer Label': 'Podiatry', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '47', 'Answer Label': 'Preventive Medicine', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '48', 'Answer Label': 'Psychiatry', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '49', 'Answer Label': 'Psychology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '50', 'Answer Label': 'Psychotherapy', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '51', 'Answer Label': 'Pulmonology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '52', 'Answer Label': 'Radiology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '53', 'Answer Label': 'Rheumatology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '54', 'Answer Label': 'Surgery', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '55', 'Answer Label': 'Urology', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '56', 'Answer Label': 'Veterinary Medicine', 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '57', 'Answer Label': "Women's Health", 'answer_attributes': {'ListSource': 'listPriSpecialty'}}, {'Answer Code': '998', 'Answer Label': 'Other', 'answer_attributes': {'KeepPosition': 'true', 'ListSource': 'listPriSpecialty'}}], 'question_attributes': {'NotRequired': 'true', 'ValidationCode': "RequireCheck('ProgSpecialty')", 'HierarchyMode': 'Drilldown', 'ExcludeTranslation': 'true', 'Dropdown': 'true', 'EntityId': '4524'}}

output_spss_script:
```
*VARIABLE LABELS ProgSpecialty 'Specialty - Specialty:'.
*VALUE LABELS ProgSpecialty
1 'Administration'
2 'Allergy & Immunology'
3 'Allied Health Professional (AHP)'
4 'Anesthesiology'
5 'Behavioral Medicine'
6

---

```
Question ID:
ProgCity

details_normalized:
{'Question ID': 'ProgCity', 'Question Label': 'City - City:', 'question_type': 'Multi', 'entry_conditions': ["f('gid')=='15'   //Update this condition as per requirement"], 'conditions': [], 'Variable ID': 'ProgCity_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'ProgCity_1 (City - City:)'}], 'question_attributes': {'ValidationCode': "RequireCheck('ProgCity_1')", 'Columns': '20', 'OpenText': 'true', 'EntityId': '4529'}}

output_spss_script:
* Define the variable for ProgCity.
VARIABLE LABELS ProgCity_1 'City - City:'.
VALUE LABELS ProgCity_1
    1 'ProgCity_1 (City - City:)'.
* Set entry conditions.
DO IF (gid = 15).
    COMPUTE ProgCity_1 = 0.
END IF.
* Validation check.
EXECUTE.
* Apply validation code.
COMPUTE Validation_ProgCity_1 = RequireCheck('ProgCity_1').
EXECUTE.


---

Question ID:
ProgStateUS

details_normalized:
{'Question ID': 'ProgStateUS', 'Question Label': 'StateUS - State:', 'question_type': 'Single', 'entry_conditions': ["f('gid')=='15'   //Update this condition as per requirement"], 'conditions': [], 'Variable ID': 'ProgStateUS', 'answers': [{'Answer Code': '1', 'Answer Label': 'AL Alabama', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '2', 'Answer Label': 'AK Alaska', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '3', 'Answer Label': 'AZ Arizona', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '4', 'Answer Label': 'AR Arkansas', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '5', 'Answer Label': 'CA California', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '6', 'Answer Label': 'CO Colorado', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '7', 'Answer Label': 'CT Connecticut', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '8', 'Answer Label': 'DC District of Columbia', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '9', 'Answer Label': 'DE Delaware', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '10', 'Answer Label': 'FL Florida', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '11', 'Answer Label': 'GA Georgia', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '12', 'Answer Label': 'HI Hawaii', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '13', 'Answer Label': 'ID Idaho', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '14', 'Answer Label': 'IL Illinois', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '15', 'Answer Label': 'IN Indiana', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '16', 'Answer Label': 'IA Iowa', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '17', 'Answer Label': 'KS Kansas', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '18', 'Answer Label': 'KY Kentucky', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '19', 'Answer Label': 'LA Louisiana', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '20', 'Answer Label': 'ME Maine', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '21', 'Answer Label': 'MD Maryland', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '22', 'Answer Label': 'MA Massachusetts', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '23', 'Answer Label': 'MI Michigan', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '24', 'Answer Label': 'MN Minnesota', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '25', 'Answer Label': 'MS Mississippi', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '26', 'Answer Label': 'MO Missouri', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '27', 'Answer Label': 'MT Montana', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '28', 'Answer Label': 'NC North Carolina', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '29', 'Answer Label': 'ND North Dakota', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '30', 'Answer Label': 'NE Nebraska', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '31', 'Answer Label': 'NV Nevada', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '32', 'Answer Label': 'NH New Hampshire', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '33', 'Answer Label': 'NJ New Jersey', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '34', 'Answer Label': 'NM New Mexico', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '35', 'Answer Label': 'NY New York', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '36', 'Answer Label': 'OH Ohio', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '37', 'Answer Label': 'OK Oklahoma', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '38', 'Answer Label': 'OR Oregon', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '39', 'Answer Label': 'PA Pennsylvania', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '40', 'Answer Label': 'RI Rhode Island', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '41', 'Answer Label': 'SC South Carolina', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '42', 'Answer Label': 'SD South Dakota', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '43', 'Answer Label': 'TN Tennessee', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '44', 'Answer Label': 'TX Texas', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '45', 'Answer Label': 'UT Utah', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '46', 'Answer Label': 'VT Vermont', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '47', 'Answer Label': 'VA Virginia', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '48', 'Answer Label': 'WA Washington', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '49', 'Answer Label': 'WV West Virginia', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '50', 'Answer Label': 'WI Wisconsin', 'answer_attributes': {'ListSource': 'list_states'}}, {'Answer Code': '51', 'Answer Label': 'WY Wyoming', 'answer_attributes': {'ListSource': 'list_states'}}], 'question_attributes': {'HierarchyMode': 'Drilldown', 'ExcludeTranslation': 'true', 'Dropdown': 'true', 'EntityId': '4530'}}

output_spss_script:
* Define the variable for ProgStateUS.
VARIABLE LABELS ProgStateUS 'StateUS - State:'.
VALUE LABELS ProgStateUS
    1 'AL Alabama'
    2 'AK Alaska'
    3 'AZ Arizona'
    4 'AR Arkansas'
    5 'CA California'
    6 'CO Colorado'
    7 'CT Connecticut'
    8 'DC District of Columbia'
    9 'DE Delaware'
    10 'FL Florida'
    11 'GA Georgia'
    12 'HI Hawaii'
    13 'ID Idaho'
    14 'IL Illinois'
    15 'IN Indiana'
    16 'IA Iowa'
    17 'KS Kansas'
    18 'KY Kentucky'
    19 'LA Louisiana'
    20 'ME Maine'
    21 'MD Maryland'
    22 'MA Massachusetts'
    23 'MI Michigan'
    24 'MN

---

```
Question ID:
ProgEmail

details_normalized:
{'Question ID': 'ProgEmail', 'Question Label': 'Email - Email:', 'question_type': 'Multi', 'entry_conditions': ["f('gid')=='15'   //Update this condition as per requirement"], 'conditions': [], 'Variable ID': 'ProgEmail_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'ProgEmail_1 (Email - Email:)'}], 'question_attributes': {'ValidationCode': "RequireCheck('ProgEmail_1')", 'Columns': '40', 'OpenText': 'true', 'EntityId': '4534'}}

output_spss_script:
* Define variable for email input.
VARIABLE LABELS ProgEmail_1 'Email - Email:'.
VALUE LABELS ProgEmail_1 1 'ProgEmail_1 (Email - Email:)'.
MISSING VALUES ProgEmail_1 (99).
* Entry condition check.
DO IF (gid = 15).
    COMPUTE ProgEmail_1 = 0.
    EXECUTE.
END IF.
* Validation check.
COMPUTE Validation_ProgEmail = RequireCheck(ProgEmail_1).
EXECUTE.

---

Question ID:
hQualityScoreAnalyze

details_normalized:
{'Question ID': 'hQualityScoreAnalyze', 'question_type': 'Multi', 'entry_conditions': ['Forward() && !f("hQualityScoreAnalyze").toBoolean() && flag'], 'conditions': [], 'Question Label': "Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^", 'question_attributes': {'NotRequired': 'true', 'Columns': '50', 'AutoCheckOther': 'true', 'OpenText': 'true', 'EntityId': '4484', 'NotPerformDataCleaningOnMasking': 'true'}, 'sub_questions': [{'Variable ID': 'hQualityScoreAnalyze_1', 'answers': [{'Answer Code': '1', 'Answer Label': "hQualityScoreAnalyze_1 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_2', 'answers': [{'Answer Code': '2', 'Answer Label': "hQualityScoreAnalyze_2 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_3', 'answers': [{'Answer Code': '3', 'Answer Label': "hQualityScoreAnalyze_3 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_4', 'answers': [{'Answer Code': '4', 'Answer Label': "hQualityScoreAnalyze_4 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_5', 'answers': [{'Answer Code': '5', 'Answer Label': "hQualityScoreAnalyze_5 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_6', 'answers': [{'Answer Code': '6', 'Answer Label': "hQualityScoreAnalyze_6 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_7', 'answers': [{'Answer Code': '7', 'Answer Label': "hQualityScoreAnalyze_7 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_8', 'answers': [{'Answer Code': '8', 'Answer Label': "hQualityScoreAnalyze_8 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_9', 'answers': [{'Answer Code': '9', 'Answer Label': "hQualityScoreAnalyze_9 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_10', 'answers': [{'Answer Code': '10', 'Answer Label': "hQualityScoreAnalyze_10 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_11', 'answers': [{'Answer Code': '11', 'Answer Label': "hQualityScoreAnalyze_11 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_12', 'answers': [{'Answer Code': '12', 'Answer Label': "hQualityScoreAnalyze_12 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_13', 'answers': [{'Answer Code': '13', 'Answer Label': "hQualityScoreAnalyze_13 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_14', 'answers': [{'Answer Code': '14', 'Answer Label': "hQualityScoreAnalyze_14 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_15', 'answers': [{'Answer Code': '15', 'Answer Label': "hQualityScoreAnalyze_15 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_16', 'answers': [{'Answer Code': '16', 'Answer Label': "hQualityScoreAnalyze_16 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_17', 'answers': [{'Answer Code': '17', 'Answer Label': "hQualityScoreAnalyze_17 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_18', 'answers': [{'Answer Code': '18', 'Answer Label': "hQualityScoreAnalyze_18 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}, {'Variable ID': 'hQualityScoreAnalyze_19', 'answers': [{'Answer Code': '19', 'Answer Label': "hQualityScoreAnalyze_19 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"}]}]}

output_spss_script:
* Define variables for quality score responses.
VARIABLE LABELS hQualityScoreAnalyze_1 to hQualityScoreAnalyze_19 'Quality Score response'.
VALUE LABELS hQualityScoreAnalyze_1 to hQualityScoreAnalyze_19 1 'hQualityScoreAnalyze_1 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)'.
MISSING VALUES hQualityScoreAnalyze_1 to hQualityScoreAnalyze_19 (99).
* Entry condition check.
DO IF (Forward() AND NOT f("hQualityScoreAnalyze").toBoolean() AND flag).
    COMPUTE hQualityScoreAnalyze_1 to hQualityScoreAnalyze_19 = 0.
    EXECUTE.
END IF.
* Validation check.
COMPUTE Validation_hQualityScoreAnalyze = NOTRequired.
EXECUTE.

---

Question ID:
hInstrText

details_normalized:
{'Question ID': 'hInstrText', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hInstrText - //Question instructions', 'question_attributes': {'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'FieldWidth': '1', 'EntityId': '3030'}, 'sub_questions': [{'Variable ID': 'hInstrText_s', 'answers': [{'Answer Code': '0', 'Answer Label': 'Select one'}]}, {'Variable ID': 'hInstrText_s3', 'answers': [{'Answer Code': '0', 'Answer Label': 'Select one for each column'}]}, {'Variable ID': 'hInstrText_g', 'answers': [{'Answer Code': '0', 'Answer Label': 'Select one for each row'}]}, {'Variable ID': 'hInstrText_m', 'answers': [{'Answer Code': '0', 'Answer Label': 'Select all that apply'}]}, {'Variable ID': 'hInstrText_m3', 'answers': [{'Answer Code': '0', 'Answer Label': 'Select all that apply for each column'}]}, {'Variable ID': 'hInstrText_mg', 'answers': [{'Answer Code': '0', 'Answer Label': 'Select all that apply for each row'}]}, {'Variable ID': 'hInstrText_n', 'answers': [{'Answer Code': '0', 'Answer Label': 'Enter a whole number'}]}, {'Variable ID': 'hInstrText_nl', 'answers': [{'Answer Code': '0

---

```
Question ID:
ProductProfile

details_normalized:
{'Question ID': 'ProductProfile', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': "ProductProfile - [NOTE: TRANSLATION IS NOT NEEDED FOR THE FOLLOWING TEXT BUT DO TRANSLATE ANSWERS]  EXAMPLES....    Popup('linkcode[,contentcode]'[, 'params']) :  Popup with image element: No content code: ^popup('ProfYlink')^ With specified content code #1: ^popup('ProfYlink,ProfY')^ With specified content code #2: ^popup('LinkX,ImgX')^ With specified content code (dynamic text pop up): ^popup('ProfYlink,ProfZText')^  Tooltip (AKA mouse over popup) : Please move your mouse over to see description of  Default display : ^tooltip('Profile ABC','ProfABCv2')^ Code string: ^tooltip('Profile ABC','ProfABCv2', 'showIcon: true')^ Recalled label: ^tooltip('Prof ABCD',f('ProductProfile')['ProfABC'].label())^ Content as a string: ^tooltip('Prof ABC','This is a description of ABC','style: {'color': 'green'}')^", 'question_attributes': {'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'EntityId': '199'}, 'sub_questions': [{'Variable ID': 'ProductProfile_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'INSERT PRODUCT PROFILE'}]}, {'Variable ID': 'ProductProfile_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'This is a standard popup.'}]}, {'Variable ID': 'ProductProfile_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'This is a draggable popup.'}]}, {'Variable ID': 'ProductProfile_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'This is a scrolling popup.'}]}, {'Variable ID': 'ProductProfile_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'This is a larger font and wrapping popup.'}]}, {'Variable ID': 'ProductProfile_6', 'answers': [{'Answer Code': '6', 'Answer Label': 'This is a mouseover.'}]}, {'Variable ID': 'ProductProfile_ProfY', 'answers': [{'Answer Code': '0', 'Answer Label': 'https://hub.m3globalresearch.com/files/view/survey_images/884329/pharmacyShelf.jpg'}]}, {'Variable ID': 'ProductProfile_ProfYlink', 'answers': [{'Answer Code': '0', 'Answer Label': 'Please click here to see the profile again.'}]}, {'Variable ID': 'ProductProfile_ProfZText', 'answers': [{'Answer Code': '0', 'Answer Label': 'This is Profile-Z with dynamic text pipe-in.'}]}, {'Variable ID': 'ProductProfile_ImgX', 'answers': [{'Answer Code': '0', 'Answer Label': 'https://hub.m3globalresearch.com/files/view/survey_images/884329/prescription.png'}]}, {'Variable ID': 'ProductProfile_LinkX', 'answers': [{'Answer Code': '0', 'Answer Label': 'Please click here to see the profile X again.'}]}, {'Variable ID': 'ProductProfile_ProfABC', 'answers': [{'Answer Code': '0', 'Answer Label': 'This is ABC  description'}]}, {'Variable ID': 'ProductProfile_ProfABCv2', 'answers': [{'Answer Code': '0', 'Answer Label': 'This is ABC\'s  description called by content code "ProfABCv2"'}]}, {'Variable ID': 'ProductProfile_DHSdef', 'answers': [{'Answer Code': '0', 'Answer Label': 'Digital health solutions are technologies, websites or platforms that use connectivity, software and sensors for healthcare. This may include tools such as health websites, patient portals, mobile health, health information technology, wearable devices, online pharmacy,  and telehealth/telemedicine.'}]}]}

output_spss_script:
* Define the variable for ProductProfile.
VARIABLE LABELS ProductProfile "Product Profile - [NOTE: TRANSLATION IS NOT NEEDED FOR THE FOLLOWING TEXT BUT DO TRANSLATE ANSWERS]".
VALUE LABELS ProductProfile
    1 "INSERT PRODUCT PROFILE"
    2 "This is a standard popup."
    3 "This is a draggable popup."
    4 "This is a scrolling popup."
    5 "This is a larger font and wrapping popup."
    6 "This is a mouseover."
    0 "https://hub.m3globalresearch.com/files/view/survey_images/884329/pharmacyShelf.jpg"
    0 "Please click here to see the profile again."
    0 "This is Profile-Z with dynamic text pipe-in."
    0 "https://hub.m3globalresearch.com/files/view/survey_images/884329/prescription.png"
    0 "Please click here to see the profile X again."
    0 "This is ABC description"
    0 "This is ABC's description called by content code 'ProfABCv2'"
    0 "Digital health solutions are technologies, websites or platforms that use connectivity, software and sensors for healthcare. This may include tools such as health websites, patient portals, mobile health, health information technology, wearable devices, online pharmacy, and telehealth/telemedicine."
.

---

Question ID:
xhidDQ1

details_normalized:
{'Question ID': 'xhidDQ1', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'xhidDQ1 - Speeder - total tested', 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3089', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'xhidDQ1_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Speeder 1'}]}, {'Variable ID': 'xhidDQ1_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Speeder 2'}]}, {'Variable ID': 'xhidDQ1_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Speeder 3'}]}, {'Variable ID': 'xhidDQ1_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Speeder 4'}]}, {'Variable ID': 'xhidDQ1_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'Speeder 5'}]}]}

output_spss_script:
* Define the variable for xhidDQ1.
VARIABLE LABELS xhidDQ1 "xhidDQ1 - Speeder - total tested".
VALUE LABELS xhidDQ1
    1 "Speeder 1"
    2 "Speeder 2"
    3 "Speeder 3"
    4 "Speeder 4"
    5 "Speeder 5"
.
* Set variable attributes.
MISSING VALUES xhidDQ1 (99).
EXECUTE.

---

Question ID:
hidDQ1

details_normalized:
{'Question ID': 'hidDQ1', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hidDQ1 - Speeder - total failed', 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3090', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'hidDQ1_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Speeder 1'}]}, {'Variable ID': 'hidDQ1_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Speeder 2'}]}, {'Variable ID': 'hidDQ1_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Speeder 3'}]}, {'Variable ID': 'hidDQ1_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Speeder 4'}]}, {'Answer Code': '5', 'Answer Label': 'Speeder 5'}]}]}

output_spss_script:
* Define the variable for hidDQ1.
VARIABLE LABELS hidDQ1 "hidDQ1 - Speeder - total failed".
VALUE LABELS hidDQ1
    1 "Speeder 1"
    2 "Speeder 2"
    3 "Speeder 3"
    4 "Speeder 4"
    5 "Speeder 5"
.
* Set variable attributes.
MISSING VALUES hidDQ1 (99).
EXECUTE.

---

Question ID:
xhidDQ2

details_normalized:
{'Question ID': 'xhidDQ2', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'xhidDQ2 - Straightliner - total tested', 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType

---

```
Question ID:
xhidDQ3

details_normalized:
{'Question ID': 'xhidDQ3', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'xhidDQ3 - Poor OE - total tested', 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3093', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'xhidDQ3_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'OE1'}]}, {'Variable ID': 'xhidDQ3_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'OE2'}]}, {'Variable ID': 'xhidDQ3_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'OE3'}]}, {'Variable ID': 'xhidDQ3_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'OE4'}]}, {'Variable ID': 'xhidDQ3_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'OE5'}]}]}

output_spss_script:
* Define the variables for the sub-questions.
VARIABLE LABELS xhidDQ3_1 'OE1' xhidDQ3_2 'OE2' xhidDQ3_3 'OE3' xhidDQ3_4 'OE4' xhidDQ3_5 'OE5'.
VALUE LABELS xhidDQ3_1 1 'OE1' xhidDQ3_2 2 'OE2' xhidDQ3_3 3 'OE3' xhidDQ3_4 4 'OE4' xhidDQ3_5 5 'OE5'.
MISSING VALUES xhidDQ3_1 TO xhidDQ3_5 (99).
* Exclude from reporting.
IF (xhidDQ3_1 = 99 OR xhidDQ3_2 = 99 OR xhidDQ3_3 = 99 OR xhidDQ3_4 = 99 OR xhidDQ3_5 = 99) xhidDQ3_1 TO xhidDQ3_5 = MISSING.
EXECUTE.

---

Question ID:
hidDQ3

details_normalized:
{'Question ID': 'hidDQ3', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hidDQ3 - Poor OE - total failed', 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3094', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'hidDQ3_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'OE1'}]}, {'Variable ID': 'hidDQ3_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'OE2'}]}, {'Variable ID': 'hidDQ3_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'OE3'}]}, {'Variable ID': 'hidDQ3_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'OE4'}]}, {'Variable ID': 'hidDQ3_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'OE5'}]}]}

output_spss_script:
* Define the variables for the sub-questions.
VARIABLE LABELS hidDQ3_1 'OE1' hidDQ3_2 'OE2' hidDQ3_3 'OE3' hidDQ3_4 'OE4' hidDQ3_5 'OE5'.
VALUE LABELS hidDQ3_1 1 'OE1' hidDQ3_2 2 'OE2' hidDQ3_3 3 'OE3' hidDQ3_4 4 'OE4' hidDQ3_5 5 'OE5'.
MISSING VALUES hidDQ3_1 TO hidDQ3_5 (99).
* Exclude from reporting.
IF (hidDQ3_1 = 99 OR hidDQ3_2 = 99 OR hidDQ3_3 = 99 OR hidDQ3_4 = 99 OR hidDQ3_5 = 99) hidDQ3_1 TO hidDQ3_5 = MISSING.
EXECUTE.

---

Question ID:
xhidDQ4

details_normalized:
{'Question ID': 'xhidDQ4', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'xhidDQ4 - Inconsistent Answers - total tested', 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3095', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'xhidDQ4_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'IA1'}]}, {'Variable ID': 'xhidDQ4_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'IA2'}]}, {'Variable ID': 'xhidDQ4_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'IA3'}]}, {'Variable ID': 'xhidDQ4_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'IA4'}]}, {'Variable ID': 'xhidDQ4_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'IA5'}]}]}

output_spss_script:
* Define the variables for the sub-questions.
VARIABLE LABELS xhidDQ4_1 'IA1' xhidDQ4_2 'IA2' xhidDQ4_3 'IA3' xhidDQ4_4 'IA4' xhidDQ4_5 'IA5'.
VALUE LABELS xhidDQ4_1 1 'IA1' xhidDQ4_2 2 'IA2' xhidDQ4_3 3 'IA3' xhidDQ4_4 4 'IA4' xhidDQ4_5 5 'IA5'.
MISSING VALUES xhidDQ4_1 TO xhidDQ4_5 (99).
* Exclude from reporting.
IF (xhidDQ4_1 = 99 OR xhidDQ4_2 = 99 OR xhidDQ4_3 = 99 OR xhidDQ4_4 = 99 OR xhidDQ4_5 = 99) xhidDQ4_1 TO xhidDQ4_5 = MISSING.
EXECUTE.

---

Question ID:
hidDQ4

details_normalized:
{'Question ID': 'hidDQ4', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hidDQ4 - Inconsistent Answers - total failed', 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3096', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'hidDQ4_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'IA1'}]}, {'Variable ID': 'hidDQ4_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'IA2'}]}, {'Variable ID': 'hidDQ4_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'IA3'}]}, {'Variable ID': 'hidDQ4_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'IA4'}]}, {'Variable ID': 'hidDQ4_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'IA5'}]}]}

output_spss_script:
* Define the variables for the sub-questions.
VARIABLE LABELS hidDQ4_1 'IA1' hidDQ4_2 'IA2' hidDQ4_3 'IA3' hidDQ4_4 'IA4' hidDQ4_5 'IA5'.
VALUE LABELS hidDQ4_1 1 'IA1' hidDQ4_2 2 'IA2' hidDQ4_3 3 'IA3' hidDQ4_4 4 'IA4' hidDQ4_5 5 'IA5'.
MISSING VALUES hidDQ4_1 TO hidDQ4_5 (99).
* Exclude from reporting.
IF (hidDQ4_1 = 99 OR hidDQ4_2 = 99 OR hidDQ4_3 = 99 OR hidDQ4_4 = 99 OR hidDQ4_5 = 99) hidDQ4_1 TO hidDQ4_5 = MISSING.
EXECUTE.

---

Question ID:
xhidDQ5

details_normalized:
{'Question ID': 'x

---

```
Question ID:
hidDQ5

details_normalized:
{'Question ID': 'hidDQ5', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hidDQ5 - Red Herring - total failed', 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3098', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'hidDQ5_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'RH1'}]}, {'Variable ID': 'hidDQ5_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'RH2'}]}, {'Variable ID': 'hidDQ5_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'RH3'}]}, {'Variable ID': 'hidDQ5_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'RH4'}]}, {'Variable ID': 'hidDQ5_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'RH5'}]}]}

output_spss_script:
* Define the variable for the question.
VARIABLE LABELS hidDQ5 "hidDQ5 - Red Herring - total failed".
VALUE LABELS hidDQ5
    1 "RH1"
    2 "RH2"
    3 "RH3"
    4 "RH4"
    5 "RH5".
* Set variable properties.
MISSING VALUES hidDQ5 (99).
* Exclude from reporting.
EXECUTE.

---

Question ID:
tested1

details_normalized:
{'Question ID': 'tested1', 'Question Label': 'tested1 - Speeders - Total Tested', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'tested1', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3102'}}

output_spss_script:
* Define the variable for the question.
VARIABLE LABELS tested1 "tested1 - Speeders - Total Tested".
MISSING VALUES tested1 (99).
* Set numeric properties.
NUMERIC tested1 (F8.2).
* Exclude from reporting.
EXECUTE.

---

Question ID:
failed1

details_normalized:
{'Question ID': 'failed1', 'Question Label': 'failed1 - Speeders - Total failed', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'failed1', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3103'}}

output_spss_script:
* Define the variable for the question.
VARIABLE LABELS failed1 "failed1 - Speeders - Total failed".
MISSING VALUES failed1 (99).
* Set numeric properties.
NUMERIC failed1 (F8.2).
* Exclude from reporting.
EXECUTE.

---

Question ID:
tested2

details_normalized:
{'Question ID': 'tested2', 'Question Label': 'tested2 - Straightliners - Total Tested', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'tested2', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3104'}}

output_spss_script:
* Define the variable for the question.
VARIABLE LABELS tested2 "tested2 - Straightliners - Total Tested".
MISSING VALUES tested2 (99).
* Set numeric properties.
NUMERIC tested2 (F8.2).
* Exclude from reporting.
EXECUTE.

---

Question ID:
failed2

details_normalized:
{'Question ID': 'failed2', 'Question Label': 'failed2 - Straightliners - Total failed', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'failed2', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3105'}}

output_spss_script:
* Define the variable for the question.
VARIABLE LABELS failed2 "failed2 - Straightliners - Total failed".
MISSING VALUES failed2 (99).
* Set numeric properties.
NUMERIC failed2 (F8.2).
* Exclude from reporting.
EXECUTE.
```

---

```
Question ID:
tested3

details_normalized:
{'Question ID': 'tested3', 'Question Label': 'tested3 - OE - Total Tested', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'tested3', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3106'}}

output_spss_script:
* Define variable for total tested.
VARIABLE LABELS tested3 'tested3 - OE - Total Tested'.
VALUE LABELS tested3 0 ''.
MISSING VALUES tested3 (999).
* Set variable attributes.
COMPUTE tested3 = 0.
IF (tested3 >= 0) tested3 = tested3.
EXECUTE.

---

Question ID:
failed3

details_normalized:
{'Question ID': 'failed3', 'Question Label': 'failed3 - OE - Total failed', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'failed3', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3107'}}

output_spss_script:
* Define variable for total failed.
VARIABLE LABELS failed3 'failed3 - OE - Total failed'.
VALUE LABELS failed3 0 ''.
MISSING VALUES failed3 (999).
* Set variable attributes.
COMPUTE failed3 = 0.
IF (failed3 >= 0) failed3 = failed3.
EXECUTE.

---

Question ID:
tested4

details_normalized:
{'Question ID': 'tested4', 'Question Label': 'tested4 - Inconsistent Answers - Total Tested', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'tested4', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3108'}}

output_spss_script:
* Define variable for total tested with inconsistent answers.
VARIABLE LABELS tested4 'tested4 - Inconsistent Answers - Total Tested'.
VALUE LABELS tested4 0 ''.
MISSING VALUES tested4 (999).
* Set variable attributes.
COMPUTE tested4 = 0.
IF (tested4 >= 0) tested4 = tested4.
EXECUTE.

---

Question ID:
failed4

details_normalized:
{'Question ID': 'failed4', 'Question Label': 'failed4 - Inconsistent Answers - Total failed', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'failed4', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3109'}}

output_spss_script:
* Define variable for total failed with inconsistent answers.
VARIABLE LABELS failed4 'failed4 - Inconsistent Answers - Total failed'.
VALUE LABELS failed4 0 ''.
MISSING VALUES failed4 (999).
* Set variable attributes.
COMPUTE failed4 = 0.
IF (failed4 >= 0) failed4 = failed4.
EXECUTE.

---

Question ID:
tested5

details_normalized:
{'Question ID': 'tested5', 'Question Label': 'tested5 - Red herring - Total tested', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'tested5', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3110'}}

output_spss_script:
* Define variable for total tested with red herring.
VARIABLE LABELS tested5 'tested5 - Red herring - Total tested'.
VALUE LABELS tested5 0 ''.
MISSING VALUES tested5 (999).
* Set variable attributes.
COMPUTE tested5 = 0.
IF (tested5 >= 0) tested5 = tested5.
EXECUTE.
```

---

```
Question ID:
failed5

details_normalized:
{'Question ID': 'failed5', 'Question Label': 'failed5 - Red herring - Total failed', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'failed5', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3111'}}

output_spss_script:
* Define the variable for failed5.
VARIABLE LABELS failed5 'failed5 - Red herring - Total failed'.
VALUE LABELS failed5 0 'No response'.
MISSING VALUES failed5 (99).
* Set variable attributes.
VARIABLE TYPE failed5 (F8.2).
EXECUTE.

---

Question ID:
weighted

details_normalized:
{'Question ID': 'weighted', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'weighted - Weights applied', 'question_attributes': {'QuestionLayoutName': 'Numeric list', 'Precision': '10', 'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'Numeric': 'true', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'OpenText': 'true', 'EntityId': '3113', 'AutoSum': 'true', 'NotPerformDataCleaningOnMasking': 'true', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'weighted_1', 'answers': [{'Answer Code': '1', 'Answer Label': "Speeders tested (^f('tested1')^) X 1 (weighted - Weights applied)"}]}, {'Variable ID': 'weighted_2', 'answers': [{'Answer Code': '2', 'Answer Label': "Speeders failed (^f('failed1')^) X 3 (weighted - Weights applied)"}]}, {'Variable ID': 'weighted_3', 'answers': [{'Answer Code': '3', 'Answer Label': "Straightliners tested (^f('tested2')^) X 7 (weighted - Weights applied)"}]}, {'Variable ID': 'weighted_4', 'answers': [{'Answer Code': '4', 'Answer Label': "Straightliners failed (^f('failed2')^) X 9 (weighted - Weights applied)"}]}, {'Variable ID': 'weighted_5', 'answers': [{'Answer Code': '5', 'Answer Label': "OE tested (^f('tested3')^) X 1 (weighted - Weights applied)"}]}, {'Variable ID': 'weighted_6', 'answers': [{'Answer Code': '6', 'Answer Label': "OE failed (^f('failed3')^) X 3 (weighted - Weights applied)"}]}, {'Variable ID': 'weighted_7', 'answers': [{'Answer Code': '7', 'Answer Label': "Inconsistent tested (^f('tested4')^) X 7 (weighted - Weights applied)"}]}, {'Variable ID': 'weighted_8', 'answers': [{'Answer Code': '8', 'Answer Label': "Inconsistent failed (^f('failed4')^) X 9 (weighted - Weights applied)"}]}, {'Variable ID': 'weighted_9', 'answers': [{'Answer Code': '9', 'Answer Label': "Red herring tested (^f('tested5')^) X 1 (weighted - Weights applied)"}]}, {'Variable ID': 'weighted_10', 'answers': [{'Answer Code': '10', 'Answer Label': "Red herring failed (^f('failed5')^) X 3 (weighted - Weights applied)"}]}]}

output_spss_script:
* Define variables for weighted responses.
VARIABLE LABELS weighted_1 'Speeders tested'.
VARIABLE LABELS weighted_2 'Speeders failed'.
VARIABLE LABELS weighted_3 'Straightliners tested'.
VARIABLE LABELS weighted_4 'Straightliners failed'.
VARIABLE LABELS weighted_5 'OE tested'.
VARIABLE LABELS weighted_6 'OE failed'.
VARIABLE LABELS weighted_7 'Inconsistent tested'.
VARIABLE LABELS weighted_8 'Inconsistent failed'.
VARIABLE LABELS weighted_9 'Red herring tested'.
VARIABLE LABELS weighted_10 'Red herring failed'.
* Set variable attributes.
VARIABLE TYPE weighted_1 (F10.2).
VARIABLE TYPE weighted_2 (F10.2).
VARIABLE TYPE weighted_3 (F10.2).
VARIABLE TYPE weighted_4 (F10.2).
VARIABLE TYPE weighted_5 (F10.2).
VARIABLE TYPE weighted_6 (F10.2).
VARIABLE TYPE weighted_7 (F10.2).
VARIABLE TYPE weighted_8 (F10.2).
VARIABLE TYPE weighted_9 (F10.2).
VARIABLE TYPE weighted_10 (F10.2).
EXECUTE.

---

Question ID:
totweight

details_normalized:
{'Question ID': 'totweight', 'Question Label': 'totweight - Total of 10 weighted variables', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'totweight', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Rows': '1', 'Precision': '9', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3124'}}

output_spss_script:
* Define the variable for totweight.
VARIABLE LABELS totweight 'totweight - Total of 10 weighted variables'.
VALUE LABELS totweight 0 'No response'.
MISSING VALUES totweight (99).
* Set variable attributes.
VARIABLE TYPE totweight (F9.2).
EXECUTE.

---

Question ID:
checksum

details_normalized:
{'Question ID': 'checksum', 'Question Label': "checksum - totweight (^f('totweight')^) divided by 10.", 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'checksum', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'Scale': '2', 'Precision': '9', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'EntityId': '3125'}}

output_spss_script:
* Define the variable for checksum.
VARIABLE LABELS checksum 'checksum - totweight divided by 10'.
VALUE LABELS checksum 0 'No response'.
MISSING VALUES checksum (99).
* Compute checksum.
COMPUTE checksum = totweight / 10.
* Set variable attributes.
VARIABLE TYPE checksum (F9.2).
EXECUTE.

---

Question ID:
QOF

details_normalized:
{'Question ID': 'QOF', 'Question Label': 'QOF - Override flag', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'QOF', 'answers': [{'Answer Code': '0', 'Answer Label': 0}, {'Answer Code': '1', 'Answer Label': 1}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'NotPerformDataCleaningOnMasking': 'true', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3126'}}

output_spss_script:
* Define the variable for QOF.
VARIABLE LABELS QOF 'QOF - Override flag'.
VALUE LABELS QOF 0 'No' 1 'Yes'.
MISSING VALUES QOF (99).
* Set variable attributes.
VARIABLE TYPE QOF (F8.0).
EXECUTE.
```

---

```
Question ID:
hQLOI

details_normalized:
{'Question ID': 'hQLOI', 'Question Label': 'hQLOI', 'question_type': 'Open', 'entry_conditions': ['false //LOI vars ans scripts'], 'conditions': [], 'Variable ID': 'hQLOI', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '3913'}}

output_spss_script:
* Set variable attributes for hQLOI.
VARIABLE LABELS hQLOI 'hQLOI'.
VALUE LABELS hQLOI 0 ''.
MISSING VALUES hQLOI (999).
EXECUTE.

---

Question ID:
respLOI

details_normalized:
{'Question ID': 'respLOI', 'question_type': 'Multi', 'entry_conditions': ['false //LOI vars ans scripts'], 'conditions': [], 'Question Label': 'respLOI', 'question_attributes': {'Scale': '2', 'Precision': '13', 'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'Numeric': 'true', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'OpenText': 'true', 'EntityId': '3914'}, 'sub_questions': [{'Variable ID': 'respLOI_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'screener LOI (respLOI)'}]}, {'Variable ID': 'respLOI_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'main part LOI (respLOI)'}]}, {'Variable ID': 'respLOI_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'total survey LOI in seconds (respLOI)'}]}]}

output_spss_script:
* Set variable attributes for respLOI and its sub-questions.
VARIABLE LABELS respLOI_1 'screener LOI (respLOI)'.
VALUE LABELS respLOI_1 1 'screener LOI (respLOI)'.
VARIABLE LABELS respLOI_2 'main part LOI (respLOI)'.
VALUE LABELS respLOI_2 2 'main part LOI (respLOI)'.
VARIABLE LABELS respLOI_3 'total survey LOI in seconds (respLOI)'.
VALUE LABELS respLOI_3 3 'total survey LOI in seconds (respLOI)'.
MISSING VALUES respLOI_1 (999) respLOI_2 (999) respLOI_3 (999).
EXECUTE.

---

Question ID:
surveyLOI

details_normalized:
{'Question ID': 'surveyLOI', 'Question Label': "surveyLOI - This question holds the LOI in minutes, for each respondent.  THE VARIABLE TYPE FOR THIS QUESTION MUST BE SET TO 'HIDDEN'.", 'question_type': 'Open', 'entry_conditions': ['false //LOI vars ans scripts'], 'conditions': [], 'Variable ID': 'surveyLOI', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'Columns': '20', 'Scale': '2', 'LowerLimit': '0', 'Rows': '1', 'Precision': '20', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '2753912551'}}

output_spss_script:
* Set variable attributes for surveyLOI.
VARIABLE LABELS surveyLOI 'surveyLOI - This question holds the LOI in minutes, for each respondent.'.
VALUE LABELS surveyLOI 0 ''.
MISSING VALUES surveyLOI (999).
EXECUTE.

---

Question ID:
hLOIupdated

details_normalized:
{'Question ID': 'hLOIupdated', 'Question Label': 'hLOIupdated', 'question_type': 'Single', 'entry_conditions': ['false //LOI vars ans scripts'], 'conditions': [], 'Variable ID': 'hLOIupdated', 'answers': [{'Answer Code': '1', 'Answer Label': 1}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3916'}}

output_spss_script:
* Set variable attributes for hLOIupdated.
VARIABLE LABELS hLOIupdated 'hLOIupdated'.
VALUE LABELS hLOIupdated 1 '1'.
MISSING VALUES hLOIupdated (999).
EXECUTE.

---

Question ID:
RespondentLOI

details_normalized:
{'Question ID': 'RespondentLOI', 'Question Label': 'RespondentLOI - This question holds the LOI in minutes, for each respondent.  [Hold data using Traditional LOI calculations]', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'RespondentLOI', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'Columns': '20', 'Scale': '2', 'Rows': '1', 'Precision': '20', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3915'}}

output_spss_script:
* Set variable attributes for RespondentLOI.
VARIABLE LABELS RespondentLOI 'RespondentLOI - This question holds the LOI in minutes, for each respondent.  [Hold data using Traditional LOI calculations]'.
VALUE LABELS RespondentLOI 0 ''.
MISSING VALUES RespondentLOI (999).
EXECUTE.
```

---

```
Question ID:
qTimeStamp

details_normalized:
{'Question ID': 'qTimeStamp', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'qTimeStamp - //Stores start timestamps of each section', 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'OpenText': 'true', 'EntityId': '2865', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'qTimeStamp_start', 'answers': [{'Answer Code': '0', 'Answer Label': 'Start Time (qTimeStamp - //Stores start timestamps of each section)'}]}, {'Variable ID': 'qTimeStamp_screener', 'answers': [{'Answer Code': '0', 'Answer Label': 'Screener (qTimeStamp - //Stores start timestamps of each section)'}]}, {'Variable ID': 'qTimeStamp_sec1', 'answers': [{'Answer Code': '0', 'Answer Label': 'Section 1 (qTimeStamp - //Stores start timestamps of each section)'}]}, {'Variable ID': 'qTimeStamp_sec2', 'answers': [{'Answer Code': '0', 'Answer Label': 'Section 2 (qTimeStamp - //Stores start timestamps of each section)'}]}, {'Variable ID': 'qTimeStamp_sec3', 'answers': [{'Answer Code': '0', 'Answer Label': 'Section 3 (qTimeStamp - //Stores start timestamps of each section)'}]}, {'Variable ID': 'qTimeStamp_Sec4', 'answers': [{'Answer Code': '0', 'Answer Label': 'Section 4 (qTimeStamp - //Stores start timestamps of each section)'}]}, {'Variable ID': 'qTimeStamp_main', 'answers': [{'Answer Code': '0', 'Answer Label': 'Main (qTimeStamp - //Stores start timestamps of each section)'}]}, {'Variable ID': 'qTimeStamp_surveyLOI', 'answers': [{'Answer Code': '0', 'Answer Label': 'Survey length of interview (qTimeStamp - //Stores start timestamps of each section)'}]}]}

output_spss_script:
* Define the variable for timestamps.
VARIABLE LABELS qTimeStamp "qTimeStamp - Stores start timestamps of each section".
VALUE LABELS qTimeStamp 0 "Start Time" 1 "Screener" 2 "Section 1" 3 "Section 2" 4 "Section 3" 5 "Section 4" 6 "Main" 7 "Survey length of interview".
MISSING VALUES qTimeStamp (99).
COMPUTE qTimeStamp = 0.
EXECUTE.

---

Question ID:
qIntLen

details_normalized:
{'Question ID': 'qIntLen', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': '//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI)', 'question_attributes': {'Precision': '10', 'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'LowerLimit': '0', 'Numeric': 'true', 'UpperLimit': '9999999999', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'OpenText': 'true', 'EntityId': '2866', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'qIntLen_start', 'answers': [{'Answer Code': '0', 'Answer Label': 'Start Time (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))'}]}, {'Variable ID': 'qIntLen_screener', 'answers': [{'Answer Code': '0', 'Answer Label': 'Screener (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))'}]}, {'Variable ID': 'qIntLen_sec1', 'answers': [{'Answer Code': '0', 'Answer Label': 'Section 1 (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))'}]}, {'Variable ID': 'qIntLen_sec2', 'answers': [{'Answer Code': '0', 'Answer Label': 'Section 2 (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))'}]}, {'Variable ID': 'qIntLen_sec3', 'answers': [{'Answer Code': '0', 'Answer Label': 'Section 3 (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))'}]}, {'Variable ID': 'qIntLen_Sec4', 'answers': [{'Answer Code': '0', 'Answer Label': 'Section 4 (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))'}]}, {'Variable ID': 'qIntLen_main', 'answers': [{'Answer Code': '0', 'Answer Label': 'Main (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))'}]}, {'Variable ID': 'qIntLen_surveyLOI', 'answers': [{'Answer Code': '0', 'Answer Label': 'Survey length of interview (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))'}]}]}

output_spss_script:
* Define the variable for interview length.
VARIABLE LABELS qIntLen "//Stores length of time per section (rounds up LOI)".
VALUE LABELS qIntLen 0 "Start Time" 1 "Screener" 2 "Section 1" 3 "Section 2" 4 "Section 3" 5 "Section 4" 6 "Main" 7 "Survey length of interview".
MISSING VALUES qIntLen (99).
COMPUTE qIntLen = 0.
EXECUTE.

---

Question ID:
hidTimeOutMin

details_normalized:
{'Question ID': 'hidTimeOutMin', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hidTimeOutMin - //time out in minutes', 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'LowerLimit': '0', 'Numeric': 'true', 'UpperLimit': '99', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'OpenText': 'true', 'EntityId': '3194', 'NotPerformDataCleaningOnMasking': 'true', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'hidTimeOutMin_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'minutes for warning (hidTimeOutMin - //time out in minutes)'}]}, {'Variable ID': 'hidTimeOutMin_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'minutes for redirect (hidTimeOutMin - //time out in minutes)'}]}]}

output_spss_script:
* Define the variable for timeout minutes.
VARIABLE LABELS hidTimeOutMin "hidTimeOutMin - time out in minutes".
VALUE LABELS hidTimeOutMin 1 "minutes for warning" 2 "minutes for redirect".
MISSING VALUES hidTimeOutMin (99).
COMPUTE hidTimeOutMin = 0.
EXECUTE.

---

Question ID:
hSType

details_normalized:
{'Question ID': 'hSType', 'Question Label': 'hSType', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hSType', 'answers': [{'Answer Code': '1', 'Answer Label': 'Normal'}, {'Answer Code': '2', 'Answer Label': 'Patient Chart'}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3199'}}

output_spss_script:
* Define the variable for hSType.
VARIABLE LABELS hSType "hSType".
VALUE LABELS hSType 1 "Normal" 2 "Patient Chart".
MISSING VALUES hSType (99).
COMPUTE hSType = 0.
EXECUTE.

---

Question ID:
hidSessionsCount

details_normalized:
{'Question ID': 'hidSessionsCount', 'Question Label': 'hidSessionsCount', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidSessionsCount_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Number of sessions (hidSessionsCount)'}], 'question_attributes': {'Precision': '3', 'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual',

---

```
Question ID:
id

details_normalized:
{'Question ID': 'id', 'Question Label': '//background: used in sample upload  - //background: used in sample upload ', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'id', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Background', 'ExcludeTranslation': 'true', 'EntityId': '2753912805'}}

output_spss_script:
* Define variable for background question.
VARIABLE LABELS id '//background: used in sample upload'.
VALUE LABELS id 0 ''.
MISSING VALUES id (99).
EXECUTE.


---

Question ID:
SurveyID

details_normalized:
{'Question ID': 'SurveyID', 'Question Label': '//hidden: stores survey R number - //hidden: stores survey R number', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'SurveyID', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'FieldWidth': '30', 'ExcludeTranslation': 'true', 'EntityId': '2753912813'}}

output_spss_script:
* Define variable for hidden survey ID.
VARIABLE LABELS SurveyID '//hidden: stores survey R number'.
VALUE LABELS SurveyID 0 ''.
MISSING VALUES SurveyID (99).
EXECUTE.


---

Question ID:
prepwd

details_normalized:
{'Question ID': 'prepwd', 'Question Label': 'prepwd - //hidden: stores pretest password', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'prepwd', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'FieldWidth': '30', 'ExcludeTranslation': 'true', 'EntityId': '5378'}}

output_spss_script:
* Define variable for hidden pretest password.
VARIABLE LABELS prepwd 'prepwd - //hidden: stores pretest password'.
VALUE LABELS prepwd 0 ''.
MISSING VALUES prepwd (99).
EXECUTE.


---

Question ID:
QRedirect

details_normalized:
{'Question ID': 'QRedirect', 'Question Label': 'QRedirect - Stores actual link they were redirected to', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'QRedirect', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '2753912870'}}

output_spss_script:
* Define variable for redirect link.
VARIABLE LABELS QRedirect 'QRedirect - Stores actual link they were redirected to'.
VALUE LABELS QRedirect 0 ''.
MISSING VALUES QRedirect (99).
EXECUTE.


---

Question ID:
qSupport

details_normalized:
{'Question ID': 'qSupport', 'Question Label': 'qSupport - //Hidden var to show support email text', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'qSupport', 'answers': [{'Answer Code': '0', 'Answer Label': 0}, {'Answer Code': '1', 'Answer Label': 'If you have questions or issues with this survey, please contact Help/Support using the link in your survey invitation.'}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'HierarchyMode': 'Drilldown', 'AutoCheckOther': 'true', 'FieldWidth': '8', 'EntityId': '2753912889'}}

output_spss_script:
* Define variable for support email text.
VARIABLE LABELS qSupport 'qSupport - //Hidden var to show support email text'.
VALUE LABELS qSupport 0 '0' 1 'If you have questions or issues with this survey, please contact Help/Support using the link in your survey invitation.'.
MISSING VALUES qSupport (99).
EXECUTE.
```

---

```
Question ID:
QBrowser

details_normalized:
{'Question ID': 'QBrowser', 'Question Label': "QBrowser - Respondent's Browser type and version", 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'QBrowser', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '2753912931'}}

output_spss_script:
* Define the variable for browser type.
VARIABLE LABELS QBrowser "QBrowser - Respondent's Browser type and version".
MISSING VALUES QBrowser (99).
* Exclude from reporting.
EXECUTE.

---

Question ID:
QDevice

details_normalized:
{'Question ID': 'QDevice', 'Question Label': "QDevice - Respondent's Device Type", 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'QDevice', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '2753912939'}}

output_spss_script:
* Define the variable for device type.
VARIABLE LABELS QDevice "QDevice - Respondent's Device Type".
MISSING VALUES QDevice (99).
* Exclude from reporting.
EXECUTE.

---

Question ID:
QStr

details_normalized:
{'Question ID': 'QStr', 'Question Label': 'QStr', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'QStr', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '2753912950'}}

output_spss_script:
* Define the variable for open-ended response.
VARIABLE LABELS QStr "QStr".
MISSING VALUES QStr (99).
* Exclude from reporting.
EXECUTE.

---

Question ID:
qHidMode

details_normalized:
{'Question ID': 'qHidMode', 'Question Label': 'qHidMode', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'qHidMode', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '2753912923'}}

output_spss_script:
* Define the hidden variable for mode.
VARIABLE LABELS qHidMode "qHidMode".
MISSING VALUES qHidMode (99).
* Exclude from reporting.
EXECUTE.

---

Question ID:
qIPs

details_normalized:
{'Question ID': 'qIPs', 'Question Label': 'qIPs', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'qIPs_1', 'answers': [{'Answer Code': '1', 'Answer Label': '24.193.125.121'}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '2862'}}

output_spss_script:
* Define the variable for IP addresses.
VARIABLE LABELS qIPs_1 "qIPs".
MISSING VALUES qIPs_1 (99).
* Exclude from reporting.
EXECUTE.
```


---

```
Question ID:
hidOEBatch

details_normalized:
{'Question ID': 'hidOEBatch', 'Question Label': 'hidOEBatch', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidOEBatch', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3254'}}

output_spss_script:
* Define variable attributes for hidOEBatch.
VARIABLE LABELS hidOEBatch 'hidOEBatch - Hidden variable for tracking'.
VALUE LABELS hidOEBatch 0 ''.
MISSING VALUES hidOEBatch (999).
* Set variable properties.
SET MISSING = (999).
* Exclude from reporting.
EXECUTE.

---

Question ID:
hidDVBatch

details_normalized:
{'Question ID': 'hidDVBatch', 'Question Label': 'hidDVBatch', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidDVBatch', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3255'}}

output_spss_script:
* Define variable attributes for hidDVBatch.
VARIABLE LABELS hidDVBatch 'hidDVBatch - Hidden variable for tracking'.
VALUE LABELS hidDVBatch 0 ''.
MISSING VALUES hidDVBatch (999).
* Set variable properties.
SET MISSING = (999).
* Exclude from reporting.
EXECUTE.

---

Question ID:
isLiveTest

details_normalized:
{'Question ID': 'isLiveTest', 'Question Label': 'isLiveTest - //Hidden to track if a test link was used for testing', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'isLiveTest', 'answers': [{'Answer Code': '1', 'Answer Label': 'Yes'}], 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3171'}}

output_spss_script:
* Define variable attributes for isLiveTest.
VARIABLE LABELS isLiveTest 'isLiveTest - Hidden variable to track test link usage'.
VALUE LABELS isLiveTest 1 'Yes'.
MISSING VALUES isLiveTest (999).
* Set variable properties.
SET MISSING = (999).
* Exclude from reporting.
EXECUTE.

---

Question ID:
hrespid

details_normalized:
{'Question ID': 'hrespid', 'Question Label': '//hidden to store respid for further reference  - //hidden to store respid for further reference ', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hrespid', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'Disabled': 'true', 'Rows': '1', 'Precision': '20', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3213'}}

output_spss_script:
* Define variable attributes for hrespid.
VARIABLE LABELS hrespid 'hrespid - Hidden variable to store respondent ID'.
VALUE LABELS hrespid 0 ''.
MISSING VALUES hrespid (999).
* Set variable properties.
SET MISSING = (999).
* Exclude from reporting.
EXECUTE.

---

Question ID:
hsid

details_normalized:
{'Question ID': 'hsid', 'Question Label': '//sid - //hidden to store sid for further reference ', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hsid', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'Disabled': 'true', 'Precision': '20', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'EntityId': '4487'}}

output_spss_script:
* Define variable attributes for hsid.
VARIABLE LABELS hsid 'hsid - Hidden variable to store session ID'.
VALUE LABELS hsid 0 ''.
MISSING VALUES hsid (999).
* Set variable properties.
SET MISSING = (999).
* Exclude from reporting.
EXECUTE.
```

---

```
Question ID:
hScrAnswered

details_normalized:
{'Question ID': 'hScrAnswered', 'Question Label': 'hScrAnswered', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hScrAnswered', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3276'}}

output_spss_script:
* Define the variable as hidden and set attributes.
VARIABLE LABELS hScrAnswered 'hScrAnswered'.
VALUE LABELS hScrAnswered 0 ''.
MISSING VALUES hScrAnswered (999).
EXECUTE.


---

Question ID:
hScrCount

details_normalized:
{'Question ID': 'hScrCount', 'Question Label': '//hidden to store respid for further reference  - //hidden to store respid for further reference ', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hScrCount', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'Disabled': 'true', 'Rows': '1', 'Precision': '20', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '3275'}}

output_spss_script:
* Define the variable as hidden and set attributes.
VARIABLE LABELS hScrCount 'Hidden variable to store response ID'.
VALUE LABELS hScrCount 0 ''.
MISSING VALUES hScrCount (999).
EXECUTE.


---

Question ID:
qHardQuota

details_normalized:
{'Question ID': 'qHardQuota', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': '// hidden question add all quotas to this question - // hidden question add all quotas to this question', 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3164'}, 'sub_questions': [{'Variable ID': 'qHardQuota_quotaPretest', 'answers': [{'Answer Code': '0', 'Answer Label': 'quotaPretest'}]}, {'Variable ID': 'qHardQuota_OVERQUOTA_quota1', 'answers': [{'Answer Code': '0', 'Answer Label': 'OVERQUOTA_quota1'}]}, {'Variable ID': 'qHardQuota_OVERQUOTA_quota3', 'answers': [{'Answer Code': '0', 'Answer Label': 'OVERQUOTA_quota3'}]}, {'Variable ID': 'qHardQuota_OVERQUOTA_quota5', 'answers': [{'Answer Code': '0', 'Answer Label': 'OVERQUOTA_quota5'}]}, {'Variable ID': 'qHardQuota_OVERQUOTA_quota6', 'answers': [{'Answer Code': '0', 'Answer Label': 'OVERQUOTA_quota6'}]}, {'Variable ID': 'qHardQuota_OVERQUOTA_qhidS10', 'answers': [{'Answer Code': '0', 'Answer Label': 'OVERQUOTA_qhidS10'}]}, {'Variable ID': 'qHardQuota_OVERQUOTA_qqCountry', 'answers': [{'Answer Code': '0', 'Answer Label': 'OVERQUOTA_qqCountry'}]}, {'Variable ID': 'qHardQuota_OVERQUOTA_qS5', 'answers': [{'Answer Code': '0', 'Answer Label': 'OVERQUOTA_qS5'}]}, {'Variable ID': 'qHardQuota_OVERQUOTA_qS5x2', 'answers': [{'Answer Code': '0', 'Answer Label': 'OVERQUOTA_qS5x2'}]}, {'Variable ID': 'qHardQuota_OVERQUOTA_qS5Final', 'answers': [{'Answer Code': '0', 'Answer Label': 'OVERQUOTA_qS5Final'}]}]}

output_spss_script:
* Define the main quota variable and its sub-questions.
VARIABLE LABELS qHardQuota 'Hidden question to manage quotas'.
VALUE LABELS qHardQuota 0 ''.
MISSING VALUES qHardQuota (999).
EXECUTE.

* Define sub-questions.
VARIABLE LABELS qHardQuota_quotaPretest 'Quota Pretest'.
VALUE LABELS qHardQuota_quotaPretest 0 'quotaPretest'.
VARIABLE LABELS qHardQuota_OVERQUOTA_quota1 'Overquota 1'.
VALUE LABELS qHardQuota_OVERQUOTA_quota1 0 'OVERQUOTA_quota1'.
VARIABLE LABELS qHardQuota_OVERQUOTA_quota3 'Overquota 3'.
VALUE LABELS qHardQuota_OVERQUOTA_quota3 0 'OVERQUOTA_quota3'.
VARIABLE LABELS qHardQuota_OVERQUOTA_quota5 'Overquota 5'.
VALUE LABELS qHardQuota_OVERQUOTA_quota5 0 'OVERQUOTA_quota5'.
VARIABLE LABELS qHardQuota_OVERQUOTA_quota6 'Overquota 6'.
VALUE LABELS qHardQuota_OVERQUOTA_quota6 0 'OVERQUOTA_quota6'.
VARIABLE LABELS qHardQuota_OVERQUOTA_qhidS10 'Overquota qhidS10'.
VALUE LABELS qHardQuota_OVERQUOTA_qhidS10 0 'OVERQUOTA_qhidS10'.
VARIABLE LABELS qHardQuota_OVERQUOTA_qqCountry 'Overquota qqCountry'.
VALUE LABELS qHardQuota_OVERQUOTA_qqCountry 0 'OVERQUOTA_qqCountry'.
VARIABLE LABELS qHardQuota_OVERQUOTA_qS5 'Overquota qS5'.
VALUE LABELS qHardQuota_OVERQUOTA_qS5 0 'OVERQUOTA_qS5'.
VARIABLE LABELS qHardQuota_OVERQUOTA_qS5x2 'Overquota qS5x2'.
VALUE LABELS qHardQuota_OVERQUOTA_qS5x2 0 'OVERQUOTA_qS5x2'.
VARIABLE LABELS qHardQuota_OVERQUOTA_qS5Final 'Overquota qS5Final'.
VALUE LABELS qHardQuota_OVERQUOTA_qS5Final 0 'OVERQUOTA_qS5Final'.
EXECUTE.


---

Question ID:
hElapse

details_normalized:
{'Question ID': 'hElapse', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hElapse', 'question_attributes': {'Precision': '6', 'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'OpenText': 'true', 'EntityId': '3032', 'NotPerformDataCleaningOnMasking': 'true', 'UpperLimitType': 'SmallerOrEqual'}, 'sub_questions': [{'Variable ID': 'hElapse_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Start'}]}, {'Variable ID': 'hElapse_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'End'}]}]}

output_spss_script:
* Define the main elapse variable and its sub-questions.
VARIABLE LABELS hElapse 'Hidden variable for elapsed time'.
VALUE LABELS hElapse 1 'Start' 2 'End'.
MISSING VALUES hElapse (999).
EXECUTE.

* Define sub-questions.
VARIABLE LABELS hElapse_1 'Start'.
VALUE LABELS hElapse_1 1 'Start'.
VARIABLE LABELS hElapse_2 'End'.
VALUE LABELS hElapse_2 2 'End'.
EXECUTE.


---

Question ID:
hSLFlags

details_normalized:
{'Question ID': 'hSLFlags', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hSLFlags - Hidden : used to drive Logo, Backbutton, Jumplink and qids/Titles', 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '3595', 'Disabled': 'true'}, 'sub_questions': [{'Variable ID': 'hSLFlags_l', 'answers': [{'Answer Code': '0', 'Answer Label': 'Hide Logo'}]}, {'Variable ID': 'hSLFlags_b', 'answers': [{'Answer Code': '0', 'Answer Label': 'Hide BackButton'}]}, {'Variable ID': 'hSLFlags_t', 'answers': [{'Answer Code': '0', 'Answer Label': 'Hide Titles/QIDs'}]}, {'Variable ID': 'hSLFlags_j', 'answers': [{'Answer Code': '0', 'Answer Label': 'Hide Jump links and Dropdown'}]}, {'Variable ID': 'hSLFlags_s', 'answers': [{'Answer Code': '0', 'Answer Label': 'Hide Support Text from bottom of the page'}]}]}

output_spss_script:
* Define the main flags variable and its sub-questions.
VARIABLE LABELS hSLFlags 'Hidden flags for survey controls'.
VALUE LABELS hSLFlags 0 'Hide Logo' 1 'Hide BackButton'

---

```
Question ID:
hCountry

details_normalized:
{'Question ID': 'hCountry', 'Question Label': 'hCountry - In which country are you currently practicing? ', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hCountry', 'answers': [{'Answer Code': '1033', 'Answer Label': 'United States', 'answer_attributes': {'ListSource': 'list_yesno'}}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'HierarchyMode': 'Drilldown', 'AutoCheckOther': 'true', 'FieldWidth': '5', 'ExcludeTranslation': 'true', 'EntityId': '3073'}}

output_spss_script:
* Define the variable for country.
VARIABLE LABELS hCountry 'In which country are you currently practicing?'.
VALUE LABELS hCountry
    1033 'United States'.
MISSING VALUES hCountry (999).
* Set variable attributes.
VARIABLE LEVEL hCountry (SCALE).
EXECUTE.


---

Question ID:
qErrNum

details_normalized:
{'Question ID': 'qErrNum', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'qErrNum', 'question_attributes': {'Precision': '20', 'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'OpenText': 'true', 'EntityId': '189'}, 'sub_questions': [{'Variable ID': 'qErrNum_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Num 1 (qErrNum)'}]}, {'Variable ID': 'qErrNum_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Num 2 (qErrNum)'}]}, {'Variable ID': 'qErrNum_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Column Text (CompareNum) (qErrNum)'}]}]}

output_spss_script:
* Define sub-question variables.
VARIABLE LABELS qErrNum_1 'Num 1 (qErrNum)'.
VALUE LABELS qErrNum_1
    1 'Num 1'.
MISSING VALUES qErrNum_1 (999).

VARIABLE LABELS qErrNum_2 'Num 2 (qErrNum)'.
VALUE LABELS qErrNum_2
    2 'Num 2'.
MISSING VALUES qErrNum_2 (999).

VARIABLE LABELS qErrNum_3 'Column Text (CompareNum) (qErrNum)'.
VALUE LABELS qErrNum_3
    3 'Column Text'.
MISSING VALUES qErrNum_3 (999).

* Set variable attributes.
VARIABLE LEVEL qErrNum_1 (SCALE).
VARIABLE LEVEL qErrNum_2 (SCALE).
VARIABLE LEVEL qErrNum_3 (SCALE).
EXECUTE.


---

Question ID:
hRawLink

details_normalized:
{'Question ID': 'hRawLink', 'Question Label': 'hRawLink - hRawLink', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hRawLink', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '184'}}

output_spss_script:
* Define the variable for raw link.
VARIABLE LABELS hRawLink 'hRawLink - hRawLink'.
VALUE LABELS hRawLink
    0 ''.
MISSING VALUES hRawLink (999).
* Set variable attributes.
VARIABLE LEVEL hRawLink (SCALE).
EXECUTE.


---

Question ID:
hULink

details_normalized:
{'Question ID': 'hULink', 'Question Label': 'hULink - hULink', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hULink', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '2948'}}

output_spss_script:
* Define the variable for U link.
VARIABLE LABELS hULink 'hULink - hULink'.
VALUE LABELS hULink
    0 ''.
MISSING VALUES hULink (999).
* Set variable attributes.
VARIABLE LEVEL hULink (SCALE).
EXECUTE.


---

Question ID:
hCurrQid

details_normalized:
{'Question ID': 'hCurrQid', 'Question Label': 'hCurrQid - ****Hidden question used to store current question respondent is on.****', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hCurrQid', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'EntityId': '179'}}

output_spss_script:
* Define the variable for current question ID.
VARIABLE LABELS hCurrQid '****Hidden question used to store current question respondent is on.****'.
VALUE LABELS hCurrQid
    0 ''.
MISSING VALUES hCurrQid (999).
* Set variable attributes.
VARIABLE LEVEL hCurrQid (SCALE).
EXECUTE.
```

---

```
Question ID:
hPrevQid

details_normalized:
{'Question ID': 'hPrevQid', 'Question Label': 'hPrevQid - ****Hidden question used to store previous question respondent seen.****', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hPrevQid', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'EntityId': '180'}}

output_spss_script:
* Define the variable for storing previous question ID.
VARIABLE LABELS hPrevQid 'hPrevQid - Hidden question used to store previous question respondent seen.'.
VALUE LABELS hPrevQid 0 ''.
MISSING VALUES hPrevQid (999).
EXECUTE.


---

Question ID:
hAllQids

details_normalized:
{'Question ID': 'hAllQids', 'Question Label': 'hAllQids - ****Hidden question used to store all question seen by respondent.****', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hAllQids', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'EntityId': '181'}}

output_spss_script:
* Define the variable for storing all question IDs seen.
VARIABLE LABELS hAllQids 'hAllQids - Hidden question used to store all question seen by respondent.'.
VALUE LABELS hAllQids 0 ''.
MISSING VALUES hAllQids (999).
EXECUTE.


---

Question ID:
showJumpLinks

details_normalized:
{'Question ID': 'showJumpLinks', 'Question Label': 'showJumpLinks - ***Hidden question used to display jump links***', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'showJumpLinks', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'EntityId': '182'}}

output_spss_script:
* Define the variable for displaying jump links.
VARIABLE LABELS showJumpLinks 'showJumpLinks - Hidden question used to display jump links.'.
VALUE LABELS showJumpLinks 0 ''.
MISSING VALUES showJumpLinks (999).
EXECUTE.


---

Question ID:
interviewStartUTC

details_normalized:
{'Question ID': 'interviewStartUTC', 'Question Label': 'interviewStartUTC', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'interviewStartUTC', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'UpperLimit': '-1.7976931348623157E+308', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'LowerLimit': '-1.7976931348623157E+308', 'IsDate': 'true', 'ExcludeTranslation': 'true', 'EntityId': '4797'}}

output_spss_script:
* Define the variable for interview start time in UTC.
VARIABLE LABELS interviewStartUTC 'interviewStartUTC'.
VALUE LABELS interviewStartUTC 0 ''.
MISSING VALUES interviewStartUTC (-1.7976931348623157E+308).
EXECUTE.


---

Question ID:
interviewEndUTC

details_normalized:
{'Question ID': 'interviewEndUTC', 'Question Label': 'interviewEndUTC', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'interviewEndUTC', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'UpperLimit': '-1.7976931348623157E+308', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'LowerLimit': '-1.7976931348623157E+308', 'IsDate': 'true', 'ExcludeTranslation': 'true', 'EntityId': '4798'}}

output_spss_script:
* Define the variable for interview end time in UTC.
VARIABLE LABELS interviewEndUTC 'interviewEndUTC'.
VALUE LABELS interviewEndUTC 0 ''.
MISSING VALUES interviewEndUTC (-1.7976931348623157E+308).
EXECUTE.
```

---

```
Question ID:
interviewStartAEST

details_normalized:
{'Question ID': 'interviewStartAEST', 'Question Label': 'interviewStartAEST', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'interviewStartAEST', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'UpperLimit': '-1.7976931348623157E+308', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'LowerLimit': '-1.7976931348623157E+308', 'IsDate': 'true', 'ExcludeTranslation': 'true', 'EntityId': '4799'}}

output_spss_script:
* Define the variable for interview start time.
VARIABLE LABELS interviewStartAEST 'Interview Start Time (AEST)'.
VALUE LABELS interviewStartAEST 0 'No response'.
MISSING VALUES interviewStartAEST (999).
EXECUTE.

---

Question ID:
interviewEndAEST

details_normalized:
{'Question ID': 'interviewEndAEST', 'Question Label': 'interviewEndAEST', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'interviewEndAEST', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'UpperLimit': '-1.7976931348623157E+308', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'LowerLimit': '-1.7976931348623157E+308', 'IsDate': 'true', 'ExcludeTranslation': 'true', 'EntityId': '4800'}}

output_spss_script:
* Define the variable for interview end time.
VARIABLE LABELS interviewEndAEST 'Interview End Time (AEST)'.
VALUE LABELS interviewEndAEST 0 'No response'.
MISSING VALUES interviewEndAEST (999).
EXECUTE.

---

Question ID:
IQSvars

details_normalized:
{'Question ID': 'IQSvars', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'will be hidden - hidden: to store data for Imperium usage', 'question_attributes': {'NotRequired': 'true', 'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'OpenText': 'true', 'EntityId': '4481', 'Disabled': 'true'}, 'sub_questions': [{'Variable ID': 'IQSvars_client_id', 'answers': [{'Answer Code': '0', 'Answer Label': 'client-id (will be hidden - hidden: to store data for Imperium usage)'}]}, {'Variable ID': 'IQSvars_response_id', 'answers': [{'Answer Code': '0', 'Answer Label': 'response-id (will be hidden - hidden: to store data for Imperium usage)'}]}, {'Variable ID': 'IQSvars_survey_id', 'answers': [{'Answer Code': '0', 'Answer Label': 'survey-id (will be hidden - hidden: to store data for Imperium usage)'}]}, {'Variable ID': 'IQSvars_geocode', 'answers': [{'Answer Code': '0', 'Answer Label': 'geocode (will be hidden - hidden: to store data for Imperium usage)'}]}, {'Variable ID': 'IQSvars_langcode', 'answers': [{'Answer Code': '0', 'Answer Label': 'langcode (will be hidden - hidden: to store data for Imperium usage)'}]}]}

output_spss_script:
* Define hidden variables for IQS.
VARIABLE LABELS IQSvars_client_id 'Client ID'.
VARIABLE LABELS IQSvars_response_id 'Response ID'.
VARIABLE LABELS IQSvars_survey_id 'Survey ID'.
VARIABLE LABELS IQSvars_geocode 'Geocode'.
VARIABLE LABELS IQSvars_langcode 'Language Code'.
MISSING VALUES IQSvars_client_id (999).
MISSING VALUES IQSvars_response_id (999).
MISSING VALUES IQSvars_survey_id (999).
MISSING VALUES IQSvars_geocode (999).
MISSING VALUES IQSvars_langcode (999).
EXECUTE.

---

Question ID:
IQSenable

details_normalized:
{'Question ID': 'IQSenable', 'Question Label': 'IQSenable - hidden: to record whether quality score script is enabled or not', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'IQSenable', 'answers': [{'Answer Code': '1', 'Answer Label': 'IQS turned on from MR'}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '4794'}}

output_spss_script:
* Define variable for IQS enable status.
VARIABLE LABELS IQSenable 'IQS Enable Status'.
VALUE LABELS IQSenable 1 'IQS turned on from MR'.
MISSING VALUES IQSenable (999).
EXECUTE.

---

Question ID:
hRecordeOn

details_normalized:
{'Question ID': 'hRecordeOn', 'Question Label': 'hRecordeOn - //used to prevent multiple recordings in survey settings->Validation & XSS', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hRecordeOn', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'Rows': '1', 'Precision': '16', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '4807'}}

output_spss_script:
* Define variable for recording status.
VARIABLE LABELS hRecordeOn 'Recording Status'.
VALUE LABELS hRecordeOn 0 'No response'.
MISSING VALUES hRecordeOn (999).
EXECUTE.
```

---

```
Question ID:
RAflags

details_normalized:
{'Question ID': 'RAflags', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'RAflags - IQS RA flags for DP', 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '4810'}, 'sub_questions': [{'Variable ID': 'RAflags_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Pasted text', 'answer_attributes': {'Other': 'true'}}]}, {'Variable ID': 'RAflags_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Robot text ', 'answer_attributes': {'Other': 'true'}}]}, {'Variable ID': 'RAflags_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Not matching survey language', 'answer_attributes': {'Other': 'true'}}]}, {'Variable ID': 'RAflags_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Garbage words', 'answer_attributes': {'Other': 'true'}}]}, {'Variable ID': 'RAflags_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'Bad Words Flag', 'answer_attributes': {'Other': 'true'}}]}, {'Variable ID': 'RAflags_1_other', 'answers': [{'Answer Code': '1', 'Answer Label': '', 'answer_attributes': {'Other': 'true'}}]}, {'Variable ID': 'RAflags_2_other', 'answers': [{'Answer Code': '2', 'Answer Label': '', 'answer_attributes': {'Other': 'true'}}]}, {'Variable ID': 'RAflags_3_other', 'answers': [{'Answer Code': '3', 'Answer Label': '', 'answer_attributes': {'Other': 'true'}}]}, {'Variable ID': 'RAflags_4_other', 'answers': [{'Answer Code': '4', 'Answer Label': '', 'answer_attributes': {'Other': 'true'}}]}, {'Variable ID': 'RAflags_5_other', 'answers': [{'Answer Code': '5', 'Answer Label': '', 'answer_attributes': {'Other': 'true'}}]}]}

output_spss_script:
* Define the RAflags variable as hidden and exclude from reporting.
VARIABLE LABELS RAflags "RAflags - IQS RA flags for DP".
MISSING VALUES RAflags (999).
VALUE LABELS RAflags_1 1 "Pasted text" / RAflags_2 2 "Robot text" / RAflags_3 3 "Not matching survey language" / RAflags_4 4 "Garbage words" / RAflags_5 5 "Bad Words Flag".
EXECUTE.

---

Question ID:
hRAResult

details_normalized:
{'Question ID': 'hRAResult', 'Question Label': 'hRAResult - hidden: to store raw RealAnswer data', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hRAResult', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '4809'}}

output_spss_script:
* Define the hRAResult variable as hidden and exclude from reporting.
VARIABLE LABELS hRAResult "hRAResult - hidden: to store raw RealAnswer data".
MISSING VALUES hRAResult (999).
EXECUTE.

---

Question ID:
hidQSlevel

details_normalized:
{'Question ID': 'hidQSlevel', 'Question Label': 'hidQSlevel', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidQSlevel', 'answers': [{'Answer Code': '1', 'Answer Label': 'Poor'}, {'Answer Code': '2', 'Answer Label': 'Suspect'}, {'Answer Code': '3', 'Answer Label': 'Likely good'}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'ExcludeTranslation': 'true', 'EntityId': '4885'}}

output_spss_script:
* Define the hidQSlevel variable as hidden and exclude from reporting.
VARIABLE LABELS hidQSlevel "hidQSlevel".
MISSING VALUES hidQSlevel (999).
VALUE LABELS hidQSlevel 1 "Poor" 2 "Suspect" 3 "Likely good".
EXECUTE.

---

Question ID:
hidCAPstr

details_normalized:
{'Question ID': 'hidCAPstr', 'Question Label': 'hidCAPstr', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hidCAPstr', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'VariableType': 'Hidden', 'ExcludeTranslation': 'true', 'EntityId': '4858'}}

output_spss_script:
* Define the hidCAPstr variable as hidden and exclude from reporting.
VARIABLE LABELS hidCAPstr "hidCAPstr".
MISSING VALUES hidCAPstr (999).
EXECUTE.

---

Question ID:
hCAPinv

details_normalized:
{'Question ID': 'hCAPinv', 'Question Label': 'hCAPinv', 'question_type': 'Open', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hCAPinv', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ExcludeFromReporting': 'true', 'LowerLimitType': 'GreaterOrEqual', 'VariableType': 'Hidden', 'Rows': '1', 'ExcludeTranslation': 'true', 'UpperLimitType': 'SmallerOrEqual', 'Numeric': 'true', 'EntityId': '4859'}}

output_spss_script:
* Define the hCAPinv variable as hidden and exclude from reporting.
VARIABLE LABELS hCAPinv "hCAPinv".
MISSING VALUES hCAPinv (999).
EXECUTE.
```

---

```
Question ID:
qPassword

details_normalized:
{'Question ID': 'qPassword', 'Question Label': '  - Please enter the password provided to you by M3.', 'question_type': 'Open', 'entry_conditions': ["f('qSurveyType').any('2') //Pretest Interview Link"], 'conditions': [], 'Variable ID': 'qPassword', 'answers': [{'Answer Code': '0', 'Answer Label': ''}], 'question_attributes': {'ValidationCode': 'if ( f(\'prepwd\').get().toUpperCase() != f(\'qPassword\').get().toUpperCase() )\n errorMsg("password");', 'Rows': '1', 'Columns': '10', 'EntityId': '2954'}}

output_spss_script:
* Define the variable for password input.
VARIABLE LABELS qPassword 'Please enter the password provided to you by M3.'.
MISSING VALUES qPassword (99).
* Validation for password entry.
DO IF (UPPER(qPassword) NE UPPER(prepwd)).
    COMPUTE errorMsg = 'password'.
END IF.

---

Question ID:
hInterviewMode

details_normalized:
{'Question ID': 'hInterviewMode', 'Question Label': 'hInterviewMode - //HIDDEN - to store Interview Mode (Online, Telephonic)', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hInterviewMode', 'answers': [{'Answer Code': '1', 'Answer Label': 'Online'}, {'Answer Code': '2', 'Answer Label': 'Telephonic'}], 'question_attributes': {'NotRequired': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3598'}}

output_spss_script:
* Define the variable for interview mode.
VARIABLE LABELS hInterviewMode 'Interview Mode (Online, Telephonic)'.
VALUE LABELS hInterviewMode
    1 'Online'
    2 'Telephonic'.
MISSING VALUES hInterviewMode (99).

---

Question ID:
hWave

details_normalized:
{'Question ID': 'hWave', 'Question Label': 'hWave - //HIDDEN - to store if Adhoc study or Wave with wave number', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hWave', 'answers': [{'Answer Code': '999', 'Answer Label': 'Adhoc Study'}, {'Answer Code': '1', 'Answer Label': 1}, {'Answer Code': '2', 'Answer Label': 2}, {'Answer Code': '3', 'Answer Label': 3}, {'Answer Code': '4', 'Answer Label': 4}, {'Answer Code': '5', 'Answer Label': 5}, {'Answer Code': '6', 'Answer Label': 6}, {'Answer Code': '7', 'Answer Label': 7}, {'Answer Code': '8', 'Answer Label': 8}, {'Answer Code': '9', 'Answer Label': 9}, {'Answer Code': '10', 'Answer Label': 10}, {'Answer Code': '11', 'Answer Label': 11}, {'Answer Code': '12', 'Answer Label': 12}, {'Answer Code': '13', 'Answer Label': 13}, {'Answer Code': '14', 'Answer Label': 14}, {'Answer Code': '15', 'Answer Label': 15}, {'Answer Code': '16', 'Answer Label': 16}, {'Answer Code': '17', 'Answer Label': 17}, {'Answer Code': '18', 'Answer Label': 18}, {'Answer Code': '19', 'Answer Label': 19}, {'Answer Code': '20', 'Answer Label': 20}, {'Answer Code': '21', 'Answer Label': 21}, {'Answer Code': '22', 'Answer Label': 22}, {'Answer Code': '23', 'Answer Label': 23}, {'Answer Code': '24', 'Answer Label': 24}, {'Answer Code': '25', 'Answer Label': 25}, {'Answer Code': '26', 'Answer Label': 26}, {'Answer Code': '27', 'Answer Label': 27}, {'Answer Code': '28', 'Answer Label': 28}, {'Answer Code': '29', 'Answer Label': 29}, {'Answer Code': '30', 'Answer Label': 30}, {'Answer Code': '31', 'Answer Label': 31}, {'Answer Code': '32', 'Answer Label': 32}, {'Answer Code': '33', 'Answer Label': 33}, {'Answer Code': '34', 'Answer Label': 34}, {'Answer Code': '35', 'Answer Label': 35}, {'Answer Code': '36', 'Answer Label': 36}, {'Answer Code': '37', 'Answer Label': 37}, {'Answer Code': '38', 'Answer Label': 38}, {'Answer Code': '39', 'Answer Label': 39}, {'Answer Code': '40', 'Answer Label': 40}, {'Answer Code': '41', 'Answer Label': 41}, {'Answer Code': '42', 'Answer Label': 42}, {'Answer Code': '43', 'Answer Label': 43}, {'Answer Code': '44', 'Answer Label': 44}, {'Answer Code': '45', 'Answer Label': 45}, {'Answer Code': '46', 'Answer Label': 46}, {'Answer Code': '47', 'Answer Label': 47}, {'Answer Code': '48', 'Answer Label': 48}, {'Answer Code': '49', 'Answer Label': 49}, {'Answer Code': '50', 'Answer Label': 50}, {'Answer Code': '51', 'Answer Label': 51}, {'Answer Code': '52', 'Answer Label': 52}, {'Answer Code': '53', 'Answer Label': 53}, {'Answer Code': '54', 'Answer Label': 54}, {'Answer Code': '55', 'Answer Label': 55}, {'Answer Code': '56', 'Answer Label': 56}, {'Answer Code': '57', 'Answer Label': 57}, {'Answer Code': '58', 'Answer Label': 58}, {'Answer Code': '59', 'Answer Label': 59}, {'Answer Code': '60', 'Answer Label': 60}, {'Answer Code': '61', 'Answer Label': 61}, {'Answer Code': '62', 'Answer Label': 62}, {'Answer Code': '63', 'Answer Label': 63}, {'Answer Code': '64', 'Answer Label': 64}, {'Answer Code': '65', 'Answer Label': 65}, {'Answer Code': '66', 'Answer Label': 66}, {'Answer Code': '67', 'Answer Label': 67}, {'Answer Code': '68', 'Answer Label': 68}, {'Answer Code': '69', 'Answer Label': 69}, {'Answer Code': '70', 'Answer Label': 70}, {'Answer Code': '71', 'Answer Label': 71}, {'Answer Code': '72', 'Answer Label': 72}, {'Answer Code': '73', 'Answer Label': 73}, {'Answer Code': '74', 'Answer Label': 74}, {'Answer Code': '75', 'Answer Label': 75}, {'Answer Code': '76', 'Answer Label': 76}, {'Answer Code': '77', 'Answer Label': 77}, {'Answer Code': '78', 'Answer Label': 78}, {'Answer Code': '79', 'Answer Label': 79}, {'Answer Code': '80', 'Answer Label': 80}, {'Answer Code': '81', 'Answer Label': 81}, {'Answer Code': '82', 'Answer Label': 82}, {'Answer Code': '83', 'Answer Label': 83}, {'Answer Code': '84', 'Answer Label': 84}, {'Answer Code': '85', 'Answer Label': 85}, {'Answer Code': '86', 'Answer Label': 86}, {'Answer Code': '87', 'Answer Label': 87}, {'Answer Code': '88', 'Answer Label': 88}, {'Answer Code': '89', 'Answer Label': 89}, {'Answer Code': '90', 'Answer Label': 90}, {'Answer Code': '91', 'Answer Label': 91}, {'Answer Code': '92', 'Answer Label': 92}, {'Answer Code': '93', 'Answer Label': 93}, {'Answer Code': '94', 'Answer Label': 94}, {'Answer Code': '95', 'Answer Label': 95}, {'Answer Code': '96', 'Answer Label': 96}, {'Answer Code': '97', 'Answer Label': 97}, {'Answer Code': '98', 'Answer Label': 98}, {'Answer Code': '99', 'Answer Label': 99}], 'question_attributes': {'NotRequired': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'Dropdown': 'true', 'EntityId': '3599'}}

output_spss_script:
* Define the variable for wave information.
VARIABLE LABELS hWave 'Adhoc study or Wave with wave number'.
VALUE LABELS hWave
    999 'Adhoc Study'
    1 '1'


---

```
Question ID:
hYear

details_normalized:
{'Question ID': 'hYear', 'Question Label': 'hYear - //HIDDEN - to store the Year interview was started', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hYear', 'answers': [{'Answer Code': '2016', 'Answer Label': 2016}, {'Answer Code': '2017', 'Answer Label': 2017}, {'Answer Code': '2018', 'Answer Label': 2018}, {'Answer Code': '2019', 'Answer Label': 2019}, {'Answer Code': '2020', 'Answer Label': 2020}, {'Answer Code': '2021', 'Answer Label': 2021}, {'Answer Code': '2022', 'Answer Label': 2022}, {'Answer Code': '2023', 'Answer Label': 2023}, {'Answer Code': '2024', 'Answer Label': 2024}, {'Answer Code': '2025', 'Answer Label': 2025}, {'Answer Code': '2026', 'Answer Label': 2026}, {'Answer Code': '2027', 'Answer Label': 2027}, {'Answer Code': '2028', 'Answer Label': 2028}, {'Answer Code': '2029', 'Answer Label': 2029}, {'Answer Code': '2030', 'Answer Label': 2030}, {'Answer Code': '2031', 'Answer Label': 2031}, {'Answer Code': '2032', 'Answer Label': 2032}, {'Answer Code': '2033', 'Answer Label': 2033}, {'Answer Code': '2034', 'Answer Label': 2034}, {'Answer Code': '2035', 'Answer Label': 2035}, {'Answer Code': '2036', 'Answer Label': 2036}, {'Answer Code': '2037', 'Answer Label': 2037}, {'Answer Code': '2038', 'Answer Label': 2038}, {'Answer Code': '2039', 'Answer Label': 2039}, {'Answer Code': '2040', 'Answer Label': 2040}, {'Answer Code': '2041', 'Answer Label': 2041}, {'Answer Code': '2042', 'Answer Label': 2042}, {'Answer Code': '2043', 'Answer Label': 2043}, {'Answer Code': '2044', 'Answer Label': 2044}, {'Answer Code': '2045', 'Answer Label': 2045}, {'Answer Code': '2046', 'Answer Label': 2046}, {'Answer Code': '2047', 'Answer Label': 2047}, {'Answer Code': '2048', 'Answer Label': 2048}, {'Answer Code': '2049', 'Answer Label': 2049}, {'Answer Code': '2050', 'Answer Label': 2050}], 'question_attributes': {'NotRequired': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'Dropdown': 'true', 'EntityId': '3606'}}

output_spss_script:
* Define the variable for the year of the interview.
VARIABLE LABELS hYear 'hYear - //HIDDEN - to store the Year interview was started'.
VALUE LABELS hYear
    2016 '2016'
    2017 '2017'
    2018 '2018'
    2019 '2019'
    2020 '2020'
    2021 '2021'
    2022 '2022'
    2023 '2023'
    2024 '2024'
    2025 '2025'
    2026 '2026'
    2027 '2027'
    2028 '2028'
    2029 '2029'
    2030 '2030'
    2031 '2031'
    2032 '2032'
    2033 '2033'
    2034 '2034'
    2035 '2035'
    2036 '2036'
    2037 '2037'
    2038 '2038'
    2039 '2039'
    2040 '2040'
    2041 '2041'
    2042 '2042'
    2043 '2043'
    2044 '2044'
    2045 '2045'
    2046 '2046'
    2047 '2047'
    2048 '2048'
    2049 '2049'
    2050 '2050'.
MISSING VALUES hYear (999).

---

Question ID:
hMonth

details_normalized:
{'Question ID': 'hMonth', 'Question Label': 'hMonth - //HIDDEN - to store the Month interview was started', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hMonth', 'answers': [{'Answer Code': '1', 'Answer Label': 'January'}, {'Answer Code': '2', 'Answer Label': 'February'}, {'Answer Code': '3', 'Answer Label': 'March'}, {'Answer Code': '4', 'Answer Label': 'April'}, {'Answer Code': '5', 'Answer Label': 'May'}, {'Answer Code': '6', 'Answer Label': 'June'}, {'Answer Code': '7', 'Answer Label': 'July'}, {'Answer Code': '8', 'Answer Label': 'August'}, {'Answer Code': '9', 'Answer Label': 'September'}, {'Answer Code': '10', 'Answer Label': 'October'}, {'Answer Code': '11', 'Answer Label': 'November'}, {'Answer Code': '12', 'Answer Label': 'December'}], 'question_attributes': {'NotRequired': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'Dropdown': 'true', 'EntityId': '3607'}}

output_spss_script:
* Define the variable for the month of the interview.
VARIABLE LABELS hMonth 'hMonth - //HIDDEN - to store the Month interview was started'.
VALUE LABELS hMonth
    1 'January'
    2 'February'
    3 'March'
    4 'April'
    5 'May'
    6 'June'
    7 'July'
    8 'August'
    9 'September'
    10 'October'
    11 'November'
    12 'December'.
MISSING VALUES hMonth (999).

---

Question ID:
hWeek

details_normalized:
{'Question ID': 'hWeek', 'Question Label': 'hWeek - //HIDDEN - to store the Week interview was started', 'question_type': 'Single', 'entry_conditions': [], 'conditions': [], 'Variable ID': 'hWeek', 'answers': [{'Answer Code': '0', 'Answer Label': 0}, {'Answer Code': '1', 'Answer Label': 1}, {'Answer Code': '2', 'Answer Label': 2}, {'Answer Code': '3', 'Answer Label': 3}, {'Answer Code': '4', 'Answer Label': 4}, {'Answer Code': '5', 'Answer Label': 5}, {'Answer Code': '6', 'Answer Label': 6}, {'Answer Code': '7', 'Answer Label': 7}, {'Answer Code': '8', 'Answer Label': 8}, {'Answer Code': '9', 'Answer Label': 9}, {'Answer Code': '10', 'Answer Label': 10}, {'Answer Code': '11', 'Answer Label': 11}, {'Answer Code': '12', 'Answer Label': 12}, {'Answer Code': '13', 'Answer Label': 13}, {'Answer Code': '14', 'Answer Label': 14}, {'Answer Code': '15', 'Answer Label': 15}, {'Answer Code': '16', 'Answer Label': 16}, {'Answer Code': '17', 'Answer Label': 17}, {'Answer Code': '18', 'Answer Label': 18}, {'Answer Code': '19', 'Answer Label': 19}, {'Answer Code': '20', 'Answer Label': 20}, {'Answer Code': '21', 'Answer Label': 21}, {'Answer Code': '22', 'Answer Label': 22}, {'Answer Code': '23', 'Answer Label': 23}, {'Answer Code': '24', 'Answer Label': 24}, {'Answer Code': '25', 'Answer Label': 25}, {'Answer Code': '26', 'Answer Label': 26}, {'Answer Code': '27', 'Answer Label': 27}, {'Answer Code': '28', 'Answer Label': 28}, {'Answer Code': '29', 'Answer Label': 29}, {'Answer Code': '30', 'Answer Label': 30}, {'Answer Code': '31', 'Answer Label': 31}, {'Answer Code': '32', 'Answer Label': 32}, {'Answer Code': '33', 'Answer Label': 33}, {'Answer Code': '34', 'Answer Label': 34}, {'Answer Code': '35', 'Answer Label': 35}, {'Answer Code': '36', 'Answer Label': 36}, {'Answer Code': '37

---

```
Question ID:
hDQFlag

details_normalized:
{'Question ID': 'hDQFlag', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hDQFlag - //HIDDEN - to capture if respondent was flagged for any Data Quality checks', 'question_attributes': {'NotRequired': 'true', 'VariableType': 'Hidden', 'Disabled': 'true', 'ExcludeTranslation': 'true', 'EntityId': '3614'}, 'sub_questions': [{'Variable ID': 'hDQFlag_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Speeder/Racer'}]}, {'Variable ID': 'hDQFlag_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Straightliner'}]}, {'Variable ID': 'hDQFlag_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Poor OE'}]}, {'Variable ID': 'hDQFlag_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Inconsistent Answers '}]}, {'Variable ID': 'hDQFlag_5', 'answers': [{'Answer Code': '5', 'Answer Label': 'Red Herring'}]}]}

output_spss_script:
* Define the variable for Data Quality Flag.
VARIABLE LABELS hDQFlag "hDQFlag - //HIDDEN - to capture if respondent was flagged for any Data Quality checks".
VALUE LABELS hDQFlag
    1 "Speeder/Racer"
    2 "Straightliner"
    3 "Poor OE"
    4 "Inconsistent Answers"
    5 "Red Herring".
    
* Set the variable as hidden and not required.
MISSING VALUES hDQFlag (99).
EXECUTE.
```


---

## function_def
Function Name:
ShowLogo

Function Definition:
function ShowLogo() {<br>  var logo = ''<br>  // add language codes that should not see M3 Logo in first IF condition. Hide for M360<br>  if(f('l').any('XX') || f('hSLFlags').any('l')) {<br>    logo = ''  //No logo displayed<br>  }

---

Function Name:
errorMsg

Function Definition:
function errorMsg(errCode) {<br>//<br><br>}

---

Function Name:
sethRawLink

Function Definition:
function sethRawLink() {<br>         // extract current URL components<br>}

---

Function Name:
getEndRedirects

Function Definition:
function getEndRedirects(sample, status) {<br>var retURL = "";<br><br><br><br>return retURL;<br>}

---

Function Name:
RoundANumber

Function Definition:
function RoundANumber(number, noofdecimalplaces) {<br><br>return "";<br>}

---

Function Name:
checkQtaMilestonesForDVAlert

Function Definition:
function checkQtaMilestonesForDVAlert() {<br>//<br>}

---

Function Name:
OEMinChars

Function Definition:
function OEMinChars() {<br>  var noofchar = 2; //default<br>  var lang = CurrentLang();<br>  <br>  //Chinese languages<br>  if (lang==4 || lang==3076 || lang==5124 || lang==43012 || lang==34820 || lang==44036 || lang==2052 || lang==32772 || lang==4100 || lang==1028 || lang==31748 )<br>    noofchar = 1; <br>  <br>  return noofchar;<br>}

---

Function Name:
validateOEs

Function Definition:
function validateOEs() {<br>var vArr = [];<br>var minChar = OEMinChars();<br><br>return vArr.join('\r\n');<br>}

---

Function Name:
getOEMsg

Function Definition:
function getOEMsg() {<br>return "";<br>}

---

Function Name:
CompareNum

Function Definition:
function CompareNum(qid,check,num,type) {<br><br>var bflag = false<br><br>return bflag;<br><br>}

---

Function Name:
CompareNum3D

Function Definition:
function CompareNum3D(qid,check,num,type) {<br>ClearForm('qErrNum');<br>f('qErrNum')[3].set(f(CurrentForm()).text());<br>CompareNum(qid,check,num,type) <br>f('qErrNum')[3].set(null);<br>}

---

Function Name:
CompareNumAnsw

Function Definition:
function CompareNumAnsw(qid,check,num) {<br>var bflag = false<br><br><br><br>return bflag;<br><br><br>}

---

Function Name:
CompareNumQues

Function Definition:
function CompareNumQues(qid1,check,qid2,qidcodes) {<br><br>var bflag = false;<br><br>return bflag;<br>}

---

Function Name:
CompareNumQues3D

Function Definition:
function CompareNumQues3D(qid1,check,qid2,qidcodes) {<br>ClearForm('qErrNum');<br>f('qErrNum')[3].set(f(CurrentForm()).text());<br>CompareNumQues(qid1,check,qid2,qidcodes) <br>f('qErrNum')[3].set(null)<br>}

---

Function Name:
runJSCheckOnEachPage

Function Definition:
function runJSCheckOnEachPage() {<br>  var flag = true; //Default setting<br><br>  return flag;<br>}

---

Function Name:
blockOnMobileDevices

Function Definition:
function blockOnMobileDevices() {<br>  return false; //default setting - change to 'true' if you want to block the survey on mobile devices<br>}

---

Function Name:
checkBrowserCompatibility

Function Definition:
function checkBrowserCompatibility() {<br><br>  var retStr="";<br>return retStr;<br>}

---

Function Name:
getLinkHowToEnableJS

Function Definition:
function getLinkHowToEnableJS() {<br>var sLink = "";<br><br>return sLink;<br>}

---

Function Name:
ClearForm

Function Definition:
function ClearForm(frmName) {<br>//<br>}

---

Function Name:
CheckDK

Function Definition:
function CheckDK(qid,qiddk) {<br>//<br>}

---

Function Name:
CheckDK3D

Function Definition:
function CheckDK3D(qid,qiddk) {<br>//<br>}

---

Function Name:
CheckDKRows

Function Definition:
function CheckDKRows(qid,qiddk) {<br>//<br>}

---

Function Name:
GetNum

Function Definition:
function GetNum(QID) {<br>  return 0;<br>}

---

Function Name:
GetNumLoop

Function Definition:
function GetNumLoop(QID,loop) {<br>  return 0;<br>}

---

Function Name:
GreaterThan

Function Definition:
function GreaterThan(qid, num) {<br>  var s = new Set();<br>  return s;<br>  <br>}

---

Function Name:
LessThan

Function Definition:
function LessThan(qid, num) {<br>  var s = new Set();<br>  return s;<br>  <br>}

---

Function Name:
EqualTo

Function Definition:
function EqualTo(qid, num) {<br>  var s = new Set();<br>  return s;<br>}

---

Function Name:
InBetween

Function Definition:
function InBetween(qid, lownum, highnum) {<br>return GreaterThan(qid, lownum).isect(LessThan(qid, highnum));<br>  <br>}

---

Function Name:
checkOS

Function Definition:
function checkOS(exc) {<br>//<br>}

---

Function Name:
TermSetup

Function Definition:
function TermSetup(code,ir) {<br>//<br>}

---

Function Name:
ClearSoftScreenID

Function Definition:
function ClearSoftScreenID(code) {<br>//<br>}

---

Function Name:
generatePretestPassword

Function Definition:
function generatePretestPassword() {<br>  var strRandomPwd = "";<br><br>return strRandomPwd;<br>}

---

Function Name:
CheckTestID

Function Definition:
function CheckTestID() {<br>var flag = false;<br><br>return flag;<br>}

---

Function Name:
checkOtherSpecify

Function Definition:
function checkOtherSpecify(aQIDs, aCodes, QID3d) {<br>//<br>}

---

Function Name:
checkMinCharsOEs

Function Definition:
function checkMinCharsOEs(input, labeloe) {<br><br>  var iMsg = "";<br><br>  return iMsg;<br>}

---

Function Name:
isTest

Function Definition:
function isTest() {<br>var iTest = false;<br><br>return iTest;<br>}

---

Function Name:
echo

Function Definition:
function echo(text) {<br>  return "";<br>}

---

Function Name:
isTestId

Function Definition:
function isTestId() {<br>  return "";<br>}

---

Function Name:
mincheckopen

Function Definition:
function mincheckopen(countstr) {<br>//<br> }

---

Function Name:
blankcheckopen

Function Definition:
function blankcheckopen() {<br>  <br>//<br>  <br>}

---

Function Name:
blankchecklist

Function Definition:
function blankchecklist() {<br>//<br>}

---

Function Name:
OtherSpecify

Function Definition:
function OtherSpecify(qid,code) {<br>//<br>}

---

Function Name:
NumericWithOE

Function Definition:
function NumericWithOE(qid,code) {<br>//<br>}

---

Function Name:
RankingWithOE

Function Definition:
function RankingWithOE(qid,code) {<br>//<br>}

---

Function Name:
OtherSpecifyGrid

Function Definition:
function OtherSpecifyGrid(qid,code) {<br>//<br>}

---

Function Name:
OtherSpecify3D

Function Definition:
function OtherSpecify3D(gID, qID, qType, code) {<br>//<br>    <br>}

---

Function Name:
MultiGridOther

Function Definition:
function MultiGridOther(qid,code) {<br>//<br>}

---

Function Name:
trim

Function Definition:
function trim(strText) { <br><br>return strText;<br>}

---

Function Name:
blankcheckotherNew

Function Definition:
function blankcheckotherNew(qid,code) {<br>  var val,lngstr;<br>  var flag; <br>  return flag;<br>}

---

Function Name:
CheckOpenLength

Function Definition:
function CheckOpenLength(qid,min,max,type) {<br>//<br>}

---

Function Name:
CheckOpenLengthMulti

Function Definition:
function CheckOpenLengthMulti(qid,min,max,type) {<br>//<br><br>}

---

Function Name:
mincheckopenMD

Function Definition:
function mincheckopenMD(countstr) {<br>//<br> }

---

Function Name:
showTerm

Function Definition:
function showTerm() {<br>  return true;<br>}

---

Function Name:
dynTermScript

Function Definition:
function dynTermScript() {<br>  return "";<br>}

---

Function Name:
isDynTerm

Function Definition:
function isDynTerm() {<br>  return "";<br>  //return Request.QueryString("bgterm")==1;<br>}

---

Function Name:
termJS

Function Definition:
function termJS() {<br><br>return ""; //JS;<br>}

---

Function Name:
CheckUsername

Function Definition:
function CheckUsername(qIDs,limit) {<br>var flag = true;<br><br><br><br>return flag;<br>     <br>}

---

Function Name:
CheckIPlist

Function Definition:
function CheckIPlist() {<br><br>var flag = false;<br><br><br>return flag;<br>  <br>}

---

Function Name:
CheckUniqueIP

Function Definition:
function CheckUniqueIP() {<br>var flag = true;<br><br><br>return flag;<br>     <br>}

---

Function Name:
setIntLength

Function Definition:
function setIntLength(code) {<br>//<br>}

---

Function Name:
setElapseTime

Function Definition:
function setElapseTime(qid) {<br>//<br>}

---

Function Name:
GetMinimum

Function Definition:
function GetMinimum(fset, fquota, fselection) {<br><br> return "";<br> <br><br>}

---

Function Name:
GetMinimumMulti

Function Definition:
function GetMinimumMulti(fset,n,fquota,fselection) {<br><br>	return "";<br>}

---

Function Name:
GetMinimumS

Function Definition:
function GetMinimumS(fset, fquota, fselection) {<br><br> return "";<br> <br>}

---

Function Name:
getInstLabel

Function Definition:
function getInstLabel(code) {<br>  return "";<br>}

---

Function Name:
getErrorLabel

Function Definition:
function getErrorLabel(code) {<br>  return "";<br>}

---

Function Name:
getTitleLabel

Function Definition:
function getTitleLabel(code) {<br>  return "";<br>}

---

Function Name:
replaceQuotes

Function Definition:
function replaceQuotes(txt) {<br>return "";<br>}

---

Function Name:
isQuotaFull

Function Definition:
function isQuotaFull() {<br><br><br>  return false;<br>}

---

Function Name:
captureScrQIDs

Function Definition:
function captureScrQIDs() {<br>  var JS="";<br>  return JS;<br>}

---

Function Name:
setLiveQids

Function Definition:
function setLiveQids() {<br>//<br>}

---

Function Name:
genLink

Function Definition:
function genLink() {<br>//<br>}

---

Function Name:
BackButton

Function Definition:
function BackButton() {<br><br> var txt = "";<br><br><br>return txt;	<br>}

---

Function Name:
timeOutMsg

Function Definition:
function timeOutMsg() {<br>var txt = "";<br><br><br>return txt;	<br><br>}

---

Function Name:
hideTitle

Function Definition:
function hideTitle() {<br><br>    return "";<br>  <br>}

---

Function Name:
getPixelContent

Function Definition:
function getPixelContent() {<br>var vArr = [];<br><br>  return vArr.join('\r\n');<br>}

---

Function Name:
blockResponsiveRenderingOnWholeSurvey

Function Definition:
function blockResponsiveRenderingOnWholeSurvey() {<br>  var flag = false; //default: false - change to true if no responsive rendering is needed<br><br>  var JS = "";<br><br>  if (flag) return JS;<br>}

---

Function Name:
buildTestScreen

Function Definition:
function buildTestScreen(qids) {<br>/***<br>Usage: Creates a html table to display results from questions for testing purposes.  Utilize for Singe, Multi, Number, Open questions, etc. that are not in 3D grids.<br> <br>Add to info node: ^buildTestScreen(new Array("Q101","Q102","Q103"))^<br>                          <br>***/<br>var str = "";<br><br>	return str;<br>}

---

Function Name:
RequireCheck

Function Definition:
function RequireCheck(qid) {<br>//<br>  <br>}

---

Function Name:
RequireCheck3D

Function Definition:
function RequireCheck3D(qid) {<br>//<br>  <br>}

---

Function Name:
findTheme

Function Definition:
function findTheme() {<br>//<br>  }

---

Function Name:
Setzero

Function Definition:
function Setzero(qid) { <br>//<br>}

---

Function Name:
Setzero2

Function Definition:
function Setzero2(qid) { <br><br>// (!f(qid)[x[i]].toBoolean()) { f(qid)[x[i]].set(0)}

---

Function Name:
Setzero3

Function Definition:
function Setzero3(qid) { <br>//<br>}

---

Function Name:
CopyForm

Function Definition:
function CopyForm(from,to) {<br><br>    return false;<br><br>  <br>}

---

Function Name:
zipcodeValidation

Function Definition:
function zipcodeValidation(qid,pre) {<br>  <br>//<br>}

---

Function Name:
CheckMultiOpen

Function Definition:
function CheckMultiOpen() {<br>//<br>  <br>}

---

Function Name:
CheckSequence

Function Definition:
function CheckSequence(precodesIn) {<br>  var valid = true;<br>  <br>  return valid;<br>  <br>//Used by CheckMultiOpen() function<br>}

---

Function Name:
CheckUnique

Function Definition:
function CheckUnique(precodesIn) {<br>  var valid = true;<br><br>  return valid;<br><br>//Used by CheckMultiOpen() function<br>}

---

Function Name:
CheckMultiOpen3D

Function Definition:
function CheckMultiOpen3D() {<br>//<br>}

---

Function Name:
HideFWDButton

Function Definition:
function HideFWDButton(iSec) {<br>//<br>}

---

Function Name:
showHideTitleSt

Function Definition:
function showHideTitleSt() {<br>return "";<br>}

---

Function Name:
showHideTitleEnd

Function Definition:
function showHideTitleEnd() {<br>return "";<br>}

---

Function Name:
getUniqueLink

Function Definition:
function getUniqueLink() {<br><br>var iULString = "";<br><br><br>return iULString;<br>}

---

Function Name:
callBlind

Function Definition:
function callBlind() {<br>//<br><br>}

---

Function Name:
getGoogleFont

Function Definition:
function getGoogleFont() {<br>//<br>}

---

Function Name:
PopulateFrom

Function Definition:
function PopulateFrom(qid,qid2) {<br>//<br>}

---

Function Name:
PopulateFromLoop

Function Definition:
function PopulateFromLoop(qid,qid2,iNum) {<br>//<br>}

---

Function Name:
storeRandOrder

Function Definition:
function storeRandOrder(qid) {<br>//<br>}

---

Function Name:
FindMinMax

Function Definition:
function FindMinMax(qid,find,numItems) {<br>  return "";   <br>}

---

Function Name:
SortVals

Function Definition:
function SortVals(a, b) {<br> 	 return 0;<br><br>//Used by FindMinMax function<br>}

---

Function Name:
popup

Function Definition:
function popup(code, params) {<br><br>  var JS=""<br><br>  return JS;<br>}

---

Function Name:
tooltip

Function Definition:
function tooltip(linkwording, content, params) {<br>  var JS=""<br><br>  return JS;<br>}

---

Function Name:
getLanguages

Function Definition:
function getLanguages() {<br>var sLang = new Set();<br><br>//Example for CAN<br>//if (f('hCountry').get()=='4105') { sLang = sLang.union(set(2057,12)) }

---

Function Name:
getOS

Function Definition:
function getOS() {<br>   var a = Request.ServerVariables("HTTP_USER_AGENT");<br> <br>   if (a.indexOf("Android") != -1)<br>      return "Android";<br>   else if (a.indexOf("iPhone") != -1)<br>      return "iPhone";<br>   else if (a.indexOf("iPad") != -1)<br>      return "iPad";<br>   else if (a.indexOf("iPod") != -1)<br>      return "iPod";<br>   else if (a.indexOf("BlackBerry") != -1)<br>      return "BlackBerry";<br>   else if (a.indexOf("Windows Phone") != -1)<br>      return "Windows Phone"; <br>   else if (a.indexOf("Windows") != -1)<br>      return "Windows"; <br>   else if (a.indexOf("Mac") != -1)<br>      return "MacOS";<br>   else if (a.indexOf("Linux") != -1)<br>      return "Linux";<br>   else<br>      return "Unknown OS";<br>}

---

Function Name:
enableIQS

Function Definition:
function enableIQS() {<br>  var flag = true; //set to false if Quality Score not needed.<br><br>  //now removed IQS switch from MR, setting IQSenable=1 for all<br>  if ( !isTest() ) f("IQSenable").set("1") <br><br>  if ( !IsInProductionMode() || f("IQSenable").none("1") ) flag = false; //disable in test mode   or  no trigger to enable  from MR<br><br>  return flag;  <br>}

---

Function Name:
enableIQSRAflags

Function Definition:
function enableIQSRAflags() {<br>  var flag = true; //set to false if RAResult flags not needed.<br><br>  if ( !enableIQS() ) flag =false<br>  return flag;  <br>}

---

Function Name:
iqsExcludeOEs

Function Definition:
function iqsExcludeOEs() {<br>  //specify OE IDs that should be exluded from quality check, eg: return ["Q15","D20"]<br>  //we should exlude OEs for zip codes, autofilled OEs, OEs used for numeric answers, etc.<br><br>   return []<br>}

---

Function Name:
iqsIsBrandQuestion

Function Definition:
function iqsIsBrandQuestion() {<br>  //specify OE IDs which are asked for brand names, eg: return  ["Q15","D20"]<br><br>   return [] <br>}

---

Function Name:
IQSlayout

Function Definition:
function IQSlayout() {<br>  if( enableIQS() ){<br>    var sc="";<br>    sc+="<input id=ClientID alt='' size=20 type=hidden value="+f('IQSvars')['client_id'].get()+" name=ClientID>\n";<br>    sc+="<input id=SurveyID alt='' size=20 type=hidden value="+f('IQSvars')['survey_id'].get()+" name=SurveyID>\n";<br>    sc+="<input id=PanelistID alt='' size=20 type=hidden value="+f('IQSvars')['response_id'].get()+" name=PanelistID>\n";<br>    sc+="<input id=LangCode alt='' size=20 type=hidden value="+f('IQSvars')['langcode'].get()+" name=LangCode>\n";<br>    sc+="<style>label[for*=ra__], input[id*=ra__]{ position: absolute}

---

Function Name:
RVID_ResponseTXT

Function Definition:
function RVID_ResponseTXT() {<br>  var txt="";<br>  txt+="<style>.cf-question__content, .footcontainer, #page_form{ display:none !important }

---

Function Name:
CallQSService

Function Definition:
function CallQSService(e) { try{ imperium_qualityscore.CollectData('first_survey_page_1', '', () => {}

---

Function Name:
RVIDResponseComplete

Function Definition:
function RVIDResponseComplete() {\n";<br>  txt+="  var currentQuestion = Confirmit.page.getQuestion('RVID_Response');\n";<br>  txt+="  currentQuestion.setValue('1', document.getElementById('Score').value);\n";<br>  txt+="  currentQuestion.setValue('2', document.getElementById('isNew').value);\n";<br>  txt+="  currentQuestion.setValue('3', document.getElementById('RVid').value);\n";<br>  txt+="  setTimeout(function(){ Confirmit.page.next() }

---

Function Name:
hQualityScoreAnalyzeTXT

Function Definition:
function hQualityScoreAnalyzeTXT() {<br>  var txt="";<br>  txt+="<input type='hidden' id='qualityscore_collect_disabled'>\n";<br>  txt+="<style>.cf-question__content, .footcontainer{ display:none !important }

---

Function Name:
submitForm

Function Definition:
function submitForm() {\n";<br>  txt+="    if(!submitted){\n";<br>  txt+="      submitted = 1;\n";<br>  txt+="      document.querySelector('.cf-navigation-next').click();\n";<br>  txt+="    }

---

Function Name:
AnalyzeDataReponse

Function Definition:
function AnalyzeDataReponse(jsonData) {\n";<br>  txt+="    try {	\n";<br>  txt+="      if (jsonData.StatusCode == 200) {\n";<br>  txt+="         var currentQuestion = Confirmit.page.getQuestion('hQualityScoreAnalyze');\n";<br>  txt+="         currentQuestion.setValue('1', jsonData.Score)\n";<br>  txt+="         currentQuestion.setValue('2', jsonData.StraightlineRanking)\n";<br>  txt+="         currentQuestion.setValue('3', jsonData.SpeedingRanking)\n";<br>  txt+="         currentQuestion.setValue('4', jsonData.RASRanking)\n";<br>  txt+="         currentQuestion.setValue('5', jsonData.RedoRanking)\n";<br>  txt+="         currentQuestion.setValue('6', jsonData.AccelerationRanking)\n";<br>  txt+="         currentQuestion.setValue('7', jsonData.VelocityRanking)\n";<br>  txt+="         currentQuestion.setValue('8', jsonData.InactivityRanking)\n";<br>  txt+="         currentQuestion.setValue('9', jsonData.StraightlineCount)\n";<br>  txt+="         currentQuestion.setValue('10', jsonData.MatrixQuestionCount)\n";<br>  txt+="         currentQuestion.setValue('11', JSON.stringify(jsonData.MatrixStraightlineStatuses))\n";<br>  txt+="         currentQuestion.setValue('12', jsonData.RASAverage)\n";<br>  txt+="         currentQuestion.setValue('13', jsonData.OpenEndsAnswered)\n";<br>  txt+="         currentQuestion.setValue('14', JSON.stringify(jsonData.OpenEndScores))\n";<br>  txt+="         currentQuestion.setValue('15', jsonData.RVid)\n";<br>  txt+="         currentQuestion.setValue('16', jsonData.Pages)\n";<br>  txt+="         currentQuestion.setValue('17', jsonData.DistinctPages)\n";<br>  txt+="         currentQuestion.setValue('18', jsonData.TransactionGuid)\n";<br>  txt+="         currentQuestion.setValue('19', JSON.stringify(jsonData.OutlierGroups))\n";<br>  txt+="         currentQuestion.setValue('20', jsonData.Mode)\n";<br>  txt+="         currentQuestion.setValue('21', JSON.stringify(jsonData.OpenEndFlags))\n";<br>  txt+="      }

---

Function Name:
getLangCode

Function Definition:
function getLangCode() {<br> var l=f("l").get();<br> if(l=="") l="blank"<br> var lcode={<br>/*Afrikaans*/ "l_54"  :  "N/A",<br>/*Albanian*/ "l_28"  :  "N/A",<br>/*Amharic*/ "l_528"  :  "N/A",<br>/*Arabic*/ "l_1"  :  "AR",<br>/*Arabic (Algeria)*/ "l_5121"  :  "AR",<br>/*Arabic (Bahrain)*/ "l_15361"  :  "AR",<br>/*Arabic (Egypt)*/ "l_3073"  :  "AR",<br>/*Arabic (Iraq)*/ "l_2049"  :  "AR",<br>/*Arabic (Jordan)*/ "l_11265"  :  "AR",<br>/*Arabic (Kuwait)*/ "l_13313"  :  "AR",<br>/*Arabic (Lebanon)*/ "l_12289"  :  "AR",<br>/*Arabic (Libya)*/ "l_4097"  :  "AR",<br>/*Arabic (Morocco)*/ "l_6145"  :  "AR",<br>/*Arabic (Oman)*/ "l_8193"  :  "AR",<br>/*Arabic (Qatar)*/ "l_16385"  :  "AR",<br>/*Arabic (Saudi Arabia)*/ "l_1025"  :  "AR",<br>/*Arabic (Syria)*/ "l_10241"  :  "AR",<br>/*Arabic (Tunisia)*/ "l_7169"  :  "AR",<br>/*Arabic (U.A.E.)*/ "l_14337"  :  "AR",<br>/*Arabic (Yemen)*/ "l_9217"  :  "AR",<br>/*Armenian*/ "l_43"  :  "N/A",<br>/*Assamese*/ "l_77"  :  "N/A",<br>/*Azeri*/ "l_44"  :  "N/A",<br>/*Azeri (Cyrillic)*/ "l_2092"  :  "N/A",<br>/*Azeri (Latin)*/ "l_1068"  :  "N/A",<br>/*Basque*/ "l_45"  :  "N/A",<br>/*Belarusian*/ "l_35"  :  "N/A",<br>/*Bengali*/ "l_69"  :  "N/A",<br>/*Bosnian*/ "l_513"  :  "N/A",<br>/*Bulgarian*/ "l_2"  :  "BG",<br>/*Burmese*/ "l_531"  :  "N/A",<br>/*Catalan*/ "l_3"  :  "N/A",<br>/*Chinese*/ "l_4"  :  "ZH-CHT",<br>/*Chinese (Hong Kong SAR, PRC)*/ "l_3076"  :  "ZH-CHT",<br>/*Chinese (Macau SAR)*/ "l_5124"  :  "ZH-CHT",<br>/*Chinese (Malaysia)*/ "l_43012"  :  "ZH-CHT",<br>/*Chinese (Mandarin)*/ "l_34820"  :  "ZH-CHT",<br>/*Chinese (Mongolian)*/ "l_44036"  :  "ZH-CHT",<br>/*Chinese (PRC)*/ "l_2052"  :  "ZH-CHT",<br>/*Chinese (Simplified)*/ "l_32772"  :  "ZH-CHS",<br>/*Chinese (Singapore)*/ "l_4100"  :  "ZH-CHT",<br>/*Chinese (Taiwan)*/ "l_1028"  :  "ZH-CHT",<br>/*Chinese (Traditional)*/ "l_31748"  :  "ZH-CHT",<br>/*Czech*/ "l_5"  :  "CS",<br>/*Danish*/ "l_6"  :  "DA",<br>/*Dari*/ "l_517"  :  "N/A",<br>/*Dutch*/ "l_19"  :  "NL",<br>/*Dutch (Belgium)*/ "l_2067"  :  "NL",<br>/*Dutch (Netherlands)*/ "l_1043"  :  "NL",<br>/*English*/ "l_9"  :  "EN",<br>/*English (Australia)*/ "l_3081"  :  "EN",<br>/*English (Belize)*/ "l_10249"  :  "EN",<br>/*English (Canada)*/ "l_4105"  :  "EN",<br>/*English (Caribbean)*/ "l_9225"  :  "EN",<br>/*English (Garo)*/ "l_36873"  :  "EN",<br>/*English (Ireland)*/ "l_6153"  :  "EN",<br>/*English (Jamaica)*/ "l_8201"  :  "EN",<br>/*English (Malaysia)*/ "l_41993"  :  "EN",<br>/*English (New Zealand)*/ "l_5129"  :  "EN",<br>/*English (Philippines)*/ "l_13321"  :  "EN",<br>/*English (Somali)*/ "l_33801"  :  "EN",<br>/*English (South Africa)*/ "l_7177"  :  "EN",<br>/*English (Tagalog)*/ "l_32777"  :  "EN",<br>/*English (Trinidad)*/ "l_11273"  :  "EN",<br>/*English*/ "l_2057"  :  "EN",<br>/*English*/ "l_1033"  :  "EN",<br>/*English (Zimbabwe)*/ "l_12297"  :  "EN",<br>/*Estonian*/ "l_37"  :  "N/A",<br>/*Faeroese*/ "l_56"  :  "N/A",<br>/*Farsi*/ "l_41"  :  "N/A",<br>/*Filipino*/ "l_532"  :  "N/A",<br>/*Finnish*/ "l_11"  :  "FI",<br>/*French*/ "l_12"  :  "FR",<br>/*French (Belgium)*/ "l_2060"  :  "FR",<br>/*French (Canada)*/ "l_3084"  :  "FR",<br>/*French (Luxembourg)*/ "l_5132"  :  "FR",<br>/*French (Monaco)*/ "l_6156"  :  "FR",<br>/*French (Standard)*/ "l_1036"  :  "FR",<br>/*French (Switzerland)*/ "l_4108"  :  "FR",<br>/*Gaelic*/ "l_515"  :  "N/A",<br>/*Georgian*/ "l_55"  :  "N/A",<br>/*German*/ "l_7"  :  "DE",<br>/*German (Austria)*/ "l_3079"  :  "DE",<br>/*German (Liechtenstein)*/ "l_5127"  :  "DE",<br>/*German (Luxembourg)*/ "l_4103"  :  "DE",<br>/*German (Standard)*/ "l_1031"  :  "DE",<br>/*German (Switzerland)*/ "l_2055"  :  "DE",<br>/*Greek*/ "l_8"  :  "N/A",<br>/*Greenlandic*/ "l_514"  :  "N/A",<br>/*Gujarati*/ "l_71"  :  "N/A",<br>/*Haitian / Creole*/ "l_520"  :  "N/A",<br>/*Hebrew*/ "l_13"  :  "N/A",<br>/*Hindi*/ "l_57"  :  "N/A",<br>/*Hungarian*/ "l_14"  :  "HU",<br>/*Icelandic*/ "l_15"  :  "N/A",<br>/*Indonesian*/ "l_33"  :  "ID",<br>/*Indonesian (Bahasa)*/ "l_32801"  :  "ID",<br>/*Indonesian (Indonesia)*/ "l_1057"  :  "ID",<br>/*Italian*/ "l_16"  :  "IT",<br>/*Italian (Standard)*/ "l_1040"  :  "IT",<br>/*Italian (Switzerland)*/ "l_2064"  :  "IT",<br>/*Japanese*/ "l_17"  :  "JA",<br>/*Japanese (Japan)*/ "l_1041"  :  "JA",<br>/*Japanese (Japanese)*/ "l_37905"  :  "JA",<br>/*Kannada*/ "l_75"  :  "N/A",<br>/*Karen*/ "l_530"  :  "N/A",<br>/*Karen (Pa'O)*/ "l_40466"  :  "N/A",<br>/*Kashmiri*/ "l_96"  :  "N/A",<br>/*Kashmiri (India)*/ "l_2144"  :  "N/A",<br>/*Kazak*/ "l_63"  :  "N/A",<br>/*Khasi*/ "l_525"  :  "N/A",<br>/*Khmer*/ "l_519"  :  "N/A",<br>/*Khmer (Cambodian)*/ "l_33287"  :  "N/A",<br>/*Kirundi*/ "l_529"  :  "N/A",<br>/*Konkani*/ "l_87"  :  "N/A",<br>/*Korean*/ "l_18"  :  "KO",<br>/*Korean (Johab)*/ "l_2066"  :  "KO",<br>/*Korean (Korea)*/ "l_1042"  :  "KO",<br>/*Latvian*/ "l_38"  :  "N/A",<br>/*Lithuanian*/ "l_39"  :  "N/A",<br>/*Lithuanian (Classic)*/ "l_2087"  :  "N/A",<br>/*Lithuanian (Lithuania)*/ "l_1063"  :  "N/A",<br>/*Macedonian*/ "l_47"  :  "N/A",<br>/*Malay*/ "l_62"  :  "MS",<br>/*Malay (Brunei Darussalam)*/ "l_2110"  :  "MS",<br>/*Malay (Malaysian)*/ "l_1086"  :  "MS",<br>/*Malayalam*/ "l_76"  :  "N/A",<br>/*Manipuri*/ "l_88"  :  "N/A",<br>/*Marathi*/ "l_78"  :  "N/A",<br>/*Mizo*/ "l_526"  :  "N/A",<br>/*Nagamese*/ "l_527"  :  "N/A",<br>/*Nepali*/ "l_97"  :  "N/A",<br>/*Nepali (India)*/ "l_2145"  :  "N/A",<br>/*Norwegian*/ "l_20"  :  "NN",<br>/*Norwegian (Bokmål)*/ "l_1044"  :  "NN",<br>/*Norwegian (Nynorsk)*/ "l_2068"  :  "NN",<br>/*Oriya*/ "l_72"  :  "N/A",<br>/*Pashto*/ "l_516"  :  "N/A",<br>/*Pashto (Afgan)*/ "l_33284"  :  "N/A",<br>/*Pashto (Deewa)*/ "l_34308"  :  "N/A",<br>/*Polish*/ "l_21"  :  "PL",<br>/*Portuguese*/ "l_22"  :  "PT",<br>/*Portuguese (Brazil)*/ "l_1046"  :  "PT",<br>/*Portuguese (Standard)*/ "l_2070"  :  "PT",<br>/*Punjabi*/ "l_70"  :  "N/A",<br>/*Romanian*/ "l_24"  :  "RO",<br>/*Russian*/ "l_25"  :  "RU",<br>/*Sanskrit*/ "l_79"  :  "N/A",<br>/*Serbian / Croatian*/ "l_26"  :  "N/A",<br>/*Serbian / Croatian (Croatian)*/ "l_1050"  :  "N/A",<br>/*Serbian / Croatian (Cyrillic)*/ "l_3098"  :  "N/A",<br>/*Serbian / Croatian (Latin)*/ "l_2074"  :  "N/A",<br>/*Sindhi*/ "l_89"  :  "N/A",<br>/*Sinhalese*/ "l_518"  :  "N/A",<br>/*Slovak*/ "l_27"  :  "SK",<br>/*Slovenian*/ "l_36"  :  "N/A",<br>/*Sotho*/ "l_521"  :  "N/A",<br>/*Spanish*/ "l_10"  :  "ES",<br>/*Spanish (Argentina)*/ "l_11274"  :  "ES",<br>/*Spanish (Bolivia)*/ "l_16394"  :  "ES",<br>/*Spanish (Chile)*/ "l_13322"  :  "ES",<br>/*Spanish (Colombia)*/ "l_9226"  :  "ES",<br>/*Spanish (Costa Rica)*/ "l_5130"  :  "ES",<br>/*Spanish (Dominican Republic)*/ "l_7178"  :  "ES",<br>/*Spanish (Ecuador)*/ "l_12298"  :  "ES",<br>/*Spanish (El Salvador)*/ "l_17418"  :  "ES",<br>/*Spanish (Guatemala)*/ "l_4106"  :  "ES",<br>/*Spanish (Honduras)*/ "l_18442"  :  "ES",<br>/*Spanish (Mexican)*/ "l_2058"  :  "ES",<br>/*Spanish (Modern Sort)*/ "l_3082"  :  "ES",<br>/*Spanish (Nicaragua)*/ "l_19466"  :  "ES",<br>/*Spanish (Panama)*/ "l_6154"  :  "ES",<br>/*Spanish (Paraguay)*/ "l_15370"  :  "ES",<br>/*Spanish (Peru)*/ "l_10250"  :  "N/A",<br>/*Spanish (Puerto Rico)*/ "l_20490"  :  "N/A",<br>/*Spanish (Spain)*/ "l_40970"  :  "ES",<br>/*Spanish (Traditional Sort)*/ "l_1034"  :  "ES",<br>/*Spanish (Uruguay)*/ "l_14346"  :  "ES",<br>/*Spanish (Venezuela)*/ "l_8202"  :  "ES",<br>/*Swahili*/ "l_65"  :  "N/A",<br>/*Swedish*/ "l_29"  :  "SV",<br>/*Swedish (Finland)*/ "l_2077"  :  "SV",<br>/*Swedish (Sweden)*/ "l_1053"  :  "SV",<br>/*Tamil*/ "l_73"  :  "N/A",<br>/*Tatar*/ "l_68"  :  "N/A",<br>/*Telugu*/ "l_74"  :  "N/A",<br>/*Thai*/ "l_30"  :  "TH",<br>/*Thai (Lao)*/ "l_38942"  :  "TH",<br>/*Thai (Thai)*/ "l_1054"  :  "TH",<br>/*Tswana*/ "l_522"  :  "N/A",<br>/*Turkish*/ "l_31"  :  "TR",<br>/*Ukrainian*/ "l_34"  :  "N/A",<br>/*Urdu*/ "l_32"  :  "N/A",<br>/*Urdu (India)*/ "l_2080"  :  "N/A",<br>/*Urdu (Pakistan)*/ "l_1056"  :  "N/A",<br>/*Uzbek*/ "l_67"  :  "N/A",<br>/*Uzbek (Cyrillic)*/ "l_2115"  :  "N/A",<br>/*Uzbek (Latin)*/ "l_1091"  :  "N/A",<br>/*Vietnamese*/ "l_42"  :  "VI",<br>/*Welsh*/ "l_512"  :  "N/A",<br>/*Xhosa*/ "l_523"  :  "N/A",<br>/*Zulu*/ "l_524"  :  "N/A",<br>/*blank*/ "l_blank" :"N/A"<br>}

---

Function Name:
getCountryCode

Function Definition:
function getCountryCode(fromtest) {<br> var ccode=fromtest!=undefined ? fromtest  :  f("hCountry").get();<br> var cntry={<br><br>/*Argentina*/ "c_11274"  :  "AR",<br>/*Armenia*/ "c_43"  :  "AM",<br>/*Australia*/ "c_3081"  :  "AU",<br>/*Austria*/ "c_3079"  :  "AT",<br>/*Albania*/ "c_28"  :  "AL",<br>/*Algeria*/ "c_5121"  :  "DZ",<br>/*Bahrain*/ "c_15361"  :  "BH",<br>/*Belarus*/ "c_35"  :  "BY",<br>/*Belgium*/ "c_2067"  :  "BE",<br>/*Belgium*/ "c_2060"  :  "BE",<br>/*Brazil*/ "c_1046"  :  "BR",<br>/*Bulgaria*/ "c_2"  :  "BG",<br>/*Canada*/ "c_3084"  :  "CA",<br>/*Canada*/ "c_4105"  :  "CA",<br>/*Chile*/ "c_13322"  :  "CL",<br>/*China*/ "c_4"  :  "CN",<br>/*China*/ "c_31748"  :  "CN",<br>/*Colombia*/ "c_9226"  :  "CO",<br>/*Croatia*/ "c_1050"  :  "HR",<br>/*Cyprus*/ "c_XXX"  :  "CY",<br>/*Czech Republic*/ "c_5"  :  "CZ",<br>/*Denmark*/ "c_6"  :  "DK",<br>/*Egypt*/ "c_3073"  :  "EG",<br>/*Estonia*/ "c_37"  :  "EE",<br>/*Finland*/ "c_11"  :  "FI",<br>/*France*/ "c_12"  :  "FR",<br>/*Georgia*/ "c_55"  :  "GE",<br>/*Germany*/ "c_7"  :  "DE",<br>/*Greece*/ "c_8"  :  "GR",<br>/*Hong Kong*/ "c_3076"  :  "HK",<br>/*Hungary*/ "c_14"  :  "HU",<br>/*Iceland*/ "c_15"  :  "IS",<br>/*India*/ "c_57"  :  "IN",<br>/*India*/ "c_2144"  :  "IN",<br>/*India*/ "c_2145"  :  "IN",<br>/*India*/ "c_2080"  :  "IN",<br>/*Indonesia*/ "c_33"  :  "ID",<br>/*Indonesia*/ "c_32801"  :  "ID",<br>/*Indonesia*/ "c_1057"  :  "ID",<br>/*Iraq*/ "c_2049"  :  "IQ",<br>/*Ireland*/ "c_6153"  :  "IE",<br>/*Israel*/ "c_13"  :  "IL",<br>/*Italy*/ "c_16"  :  "IT",<br>/*Italy*/ "c_1040"  :  "IT",<br>/*Italy*/ "c_2064"  :  "IT",<br>/*Japan*/ "c_17"  :  "JP",<br>/*Japan*/ "c_1041"  :  "JP",<br>/*Japan*/ "c_37905"  :  "JP",<br>/*Jordan*/ "c_11265"  :  "JO",<br>/*Kazakhstan*/ "c_63"  :  "KZ",<br>/*Kenya*/ "c_65"  :  "KE",<br>/*Korea*/ "c_18"  :  "KR",<br>/*Korea*/ "c_1042"  :  "KR",<br>/*Kuwait*/ "c_13313"  :  "KW",<br>/*Latvia*/ "c_38"  :  "LV",<br>/*Lebanon*/ "c_12289"  :  "LB",<br>/*Libya*/ "c_4097"  :  "LY",<br>/*Lithuania*/ "c_39"  :  "LT",<br>/*Lithuania*/ "c_2087"  :  "LT",<br>/*Lithuania*/ "c_1063"  :  "LT",<br>/*Luxembourg*/ "c_5132"  :  "LU",<br>/*Luxembourg*/ "c_4103"  :  "LU",<br>/*Macau SAR*/ "c_5124"  :  "MO",<br>/*Malaysia*/ "c_41993"  :  "MY",<br>/*Malaysia*/ "c_43012"  :  "MY",<br>/*Malaysia*/ "c_1086"  :  "MY",<br>/*Malta*/ "c_XXX"  :  "MT",<br>/*Mexico*/ "c_2058"  :  "MX",<br>/*Moldova*/ "c_XXX"  :  "MD",<br>/*Morocco*/ "c_6145"  :  "MA",<br>/*Netherlands*/ "c_19"  :  "NL",<br>/*Netherlands*/ "c_1043"  :  "NL",<br>/*New Zealand*/ "c_5129"  :  "NZ",<br>/*Norway*/ "c_20"  :  "NO",<br>/*Norway*/ "c_1044"  :  "NO",<br>/*Norway*/ "c_2068"  :  "NO",<br>/*Oman*/ "c_8193"  :  "OM",<br>/*Pakistan*/ "c_1056"  :  "PK",<br>/*Peru*/ "c_10250"  :  "PE",<br>/*Philippines*/ "c_13321"  :  "PH",<br>/*Philippines*/ "c_32777"  :  "PH",<br>/*Poland*/ "c_21"  :  "PL",<br>/*Portugal*/ "c_22"  :  "PT",<br>/*Portugal*/ "c_2070"  :  "PT",<br>/*Puerto Rico*/ "c_20490"  :  "PR",<br>/*Qatar*/ "c_16385"  :  "QA",<br>/*Romania*/ "c_24"  :  "RO",<br>/*Russian Federation*/ "c_25"  :  "RU",<br>/*Saudi Arabia*/ "c_1025"  :  "SA",<br>/*Serbia*/ "c_26"  :  "RS",<br>/*Serbia*/ "c_1050"  :  "RS",<br>/*Serbia*/ "c_3098"  :  "RS",<br>/*Serbia*/ "c_2074"  :  "RS",<br>/*Singapore*/ "c_4100"  :  "SG",<br>/*Slovakia*/ "c_27"  :  "SK",<br>/*Slovenia*/ "c_36"  :  "SI",<br>/*South Africa*/ "c_7177"  :  "ZA",<br>/*Spain*/ "c_10"  :  "ES",<br>/*Spain*/ "c_40970"  :  "ES",<br>/*Sweden*/ "c_29"  :  "SE",<br>/*Sweden*/ "c_1053"  :  "SE",<br>/*Switzerland*/ "c_4108"  :  "CH",<br>/*Switzerland*/ "c_2055"  :  "CH",<br>/*Switzerland*/ "c_10241"  :  "CH",<br>/*Syria*/ "c_2064"  :  "SY",<br>/*Taiwan*/ "c_1028"  :  "TW",<br>/*Thailand*/ "c_30"  :  "TH",<br>/*Thailand*/ "c_38942"  :  "TH",<br>/*Thailand*/ "c_1054"  :  "TH",<br>/*Tunisia*/ "c_7169"  :  "TN",<br>/*Turkey*/ "c_31"  :  "TR",<br>/*Ukraine*/ "c_34"  :  "UA",<br>/*United Arab Emirates*/ "c_14337"  :  "AE",<br>/*United Kingdom*/ "c_2057"  :  "GB",<br>/*United States*/ "c_1033"  :  "US",<br>/*Venezuela*/ "c_8202"  :  "VE",<br>/*Vietnam*/ "c_42"  :  "VN",<br>/*Yemen*/ "c_9217"  :  "YE",<br>/*blank*/ "c_" : ""<br>}

---

Function Name:
TermPreS2

Function Definition:
function TermPreS2() {<br>	var pre = f("HidPreS2").domainValues()[0];<br>	var flag = false;<br>	<br>	if(pre==1){<br>		if(f("PreS2").isect(set(1,2,3)).size()!=3)<br>			flag = true;<br>	}

---

Function Name:
PreS4cal

Function Definition:
function PreS4cal() {<br>var s;<br><br>if(f('HidPreS1')[1].toNumber()>f('PreS4x1')[1].toNumber())<br>{<br>s=f('HidPreS1')[1].toNumber()- f('PreS4x1')[1].toNumber()<br>}

---

Function Name:
getTextHP

Function Definition:
function getTextHP() {<br>  return "{data: valid}

---

Function Name:
getQSloopInfo

Function Definition:
function getQSloopInfo() {<br>  var loops=CurrentLoops()<br>  var info=""<br>  for( var i=0; i<loops.length; i++ ){<br>     info+=loops[i]+"_"+f(loops[i]).get()<br>  }

---

Function Name:
setRAflag

Function Definition:
function setRAflag(flag, code) {<br>   var rawResultArr=f("hRAResult").get().toString().split("||")//.replace(/ /gi, "").replace(/"/gi, "")<br>   //var oeArr=rawResult.split("QuestionID:")<br>   for( var i=0; i<rawResultArr.length; i++ ){<br>      if( rawResultArr[i]!="" && rawResultArr[i].split("QuestionID:").length>1 ){   <br>        var tempID=rawResultArr[i].split(",")[0].split(":")[1]<br>        tempID=tempID.split("__")[1]<br>        tempID=tempID.replace("_input","")<br>          if( flag=="DetectedLanguageCode" ){<br>           if( getLangCode()!="N/A" ){<br>            //check answer language - only if survey language is supported<br>             if( rawResultArr[i].toString().split(flag+":").length>1 && rawResultArr[i].toString().split(flag+":")[1].split(",")[0]!=getLangCode() ){<br>                f("RAflags")[code].set("1")<br>                if( !f("RAflags_"+code+"_other").toBoolean() || f("RAflags_"+code+"_other").get().toString().split(tempID).length<2 ){<br>                    if( !f("RAflags_"+code+"_other").toBoolean() ) f("RAflags_"+code+"_other").set(tempID+":"+rawResultArr[i].split(flag+":")[1].split(",")[0])<br>                    else  f("RAflags_"+code+"_other").set( f("RAflags_"+code+"_other").get()+","+tempID+":"+rawResultArr[i].split(flag+":")[1].split(",")[0])<br>                }

---

Function Name:
validB10

Function Definition:
function validB10(qid1,qid2,qid3) {<br><br>if( f(qid1).any('99') && ((f(qid2).toBoolean() && f(qid2).none('99')) || (f(qid3).toBoolean() && f(qid3).none('99'))) )<br>{<br>errorMsg('B10err1');<br>}

---

Function Name:
updateLOI

Function Definition:
function updateLOI(section,update) {<br>var maxIdle=45 //idle time in seconds when LOI caclulation is paused<br>if( !isDynTerm()  ){<br><br>var qLOI=Request.Form("qLOI")<br>if( qLOI!=undefined && qLOI.split(":").length==2 && f("hLOIupdated").none("1")){<br>      var screenerLOI=GetNum("respLOI_1")<br>      var qID=qLOI.split(":")[0]<br>      var infoLOI=parseFloat(qLOI.split(":")[1])<br>      f("respLOI_3").set(GetNum("respLOI_3")+infoLOI);<br>      if( section=="screener" ) f("respLOI_1").set(GetNum("respLOI_3") );<br>      if( section==undefined || section!="screener" ){<br>          if( f("respLOI_1").toBoolean() && !f("respLOI_2").toBoolean() ) f("respLOI_1").set(GetNum("respLOI_3") );  //this means it is first question in the main part, still need to update screener LOI from here<br>          f("respLOI_2").set(GetNum("respLOI_3") - GetNum("respLOI_1") );<br>      }

---

Function Name:
updateLOIvar

Function Definition:
function updateLOIvar(qID, timeSpent) {<br>     //records LOI of each individual question/screen***<br><br>     var sameQ=false<br><br>    if( f("hQLOI").toBoolean()  ){<br>        var curAnsw=f("hQLOI").get().toString().split(";")<br>       for( var i=0; i<curAnsw.length; i++ ){<br>	    var foundID=curAnsw[i].split(":")[0]<br>	    var foundLOI=curAnsw[i].split(":")[1]<br>	    var updatedLOI=parseFloat(foundLOI)+parseFloat(timeSpent)<br>        updatedLOI=Math.round(updatedLOI*100)/100<br>       if( foundID==qID ){<br>           sameQ=true;<br>           curAnsw[i]=foundID+":"+updatedLOI<br>       }

---

Function Name:
sectionLOI

Function Definition:
function sectionLOI(qID,action) {<br>  updateLOI("",true)<br>  f("hLOIupdated").set("1")<br>  if( action=='start' ) f(qID)['1'].set( GetNum("respLOI_3") )<br>  if( action=='end' ){<br>        f(qID)['2'].set( GetNum("respLOI_3") )<br>        f(qID)['3'].set( GetNum(qID+"_2")-GetNum(qID+"_1") )<br>  }

---

Function Name:
setInterviewTimeRegional

Function Definition:
function setInterviewTimeRegional(param) {<br>  var dtObj  = new  Date();<br>  var AESTTimezoneOffSet = 10; //UTC+10<br>  var yy = dtObj.getUTCFullYear();<br>  var mm = dtObj.getUTCMonth();<br>  var dd = dtObj.getUTCDate();<br>  var hr = dtObj.getUTCHours();<br>  var mn = dtObj.getUTCMinutes();<br>  var sc = dtObj.getUTCSeconds();<br>  var ms = dtObj.getUTCMilliseconds();<br><br>  //if (! isTimeInEST()) { AESTTimezoneOffSet++; }

---

Function Name:
isTimeInEST

Function Definition:
function isTimeInEST() {<br>  var flag = false;<br>  var firstSunApr;<br>  var firstSunOct;<br>  var dtObj  = new  Date();<br><br>  var yy = dtObj.getUTCFullYear();<br>  var mm = dtObj.getUTCMonth();<br>  var dd = dtObj.getUTCDate();<br>  var hr = dtObj.getUTCHours();<br>  var mn = dtObj.getUTCMinutes();<br>  var sc = dtObj.getUTCSeconds();<br>  var ms = dtObj.getUTCMilliseconds();<br><br>  var dtObjAEST = new Date(yy,mm,dd,hr+10,mn,sc,ms); //UTC+10<br>  //var dtObjAEST = new Date(yy,9,1,2,59,0,0); //UTC+11<br><br><br>  //find first Sunday of April/Oct<br>  var dtObjTempApr = new Date(yy,3,dd); //Date with April month<br>  var dtObjTempOct = new Date(yy,9,dd); //Date with October month<br>  for (var d=1;d<=30;d++) {<br>    dtObjTempApr.setDate(d); dtObjTempOct.setDate(d);<br>    if (dtObjTempApr.getDay() == 0 && firstSunApr == undefined) { firstSunApr = dtObjTempApr.getDate(); }

---

Function Name:
captchaInstr

Function Definition:
function captchaInstr() {<br>  return "<!-- ------------------ CAPTCHA HTML -------------------- --> <div class='container'> <div style='width:100%; display: flex; justify-content: space-between;'> <div id='captcha'> </div> <button class='regenerateCaptchaBtn' id='btnCreateCaptcha' style='width: 5rem;' > <img src='/isa/CVBPNBJTLMHDHKHTEDFXPXAOGFGIMPMK/icons/redo.png' > </button> </div> <span id='cpatchaTextBox'></span> <button id='btnSubmit' class='cf-navigation__button cf-navigation-next'>>></button> </div> <!-- -------------------- CSS --------------------------- --> <style> .cf-page__navigation { display: none; }

---

Function Name:
CheckReentryQuotas

Function Definition:
function CheckReentryQuotas() {<br>  if(GetStatus() != 'complete') {<br>    if( isQuotaFull() && f('screenStatus').any('SURVEY_QUIT') )<br>		return true;<br>	<br>    return false;<br>  }

---

Function Name:
setDayMonthWeekYear

Function Definition:
function setDayMonthWeekYear() {<br>var today = new Date();<br>var day  = today.getDay()+1;<br>var dd   = today.getDate();<br>var mm   = today.getMonth()+1;<br>var yyyy = today.getFullYear();<br><br>f("hYear").set(yyyy);<br>f("hMonth").set(mm);<br>f("hDay").set(day);<br><br><br>var date = new Date();<br>date.setHours(0, 0, 0, 0);<br><br>// Thursday in current week decides the year.<br>date.setDate(date.getDate() + 3 - (date.getDay() + 6) % 7);<br><br>// January 4 is always in week 1.<br>var week1 = new Date(date.getFullYear(), 0, 4);<br><br>// Adjust to Thursday in week 1 and count number of weeks from date to week1.<br>var finweekISO = 1 + Math.round(((date.getTime() - week1.getTime()) / 86400000 - 3 + (week1.getDay() + 6) % 7) / 7);<br>f("hWeek").set(finweekISO);<br>}

---