* ============================================================.
* SPSS Validation Script (Multi-Agent Batched Generation)
* Generated: 2025-10-15 07:51:38
* Source: R79641.md
* Model: gpt-5-mini
* Batch size: 10 questions per batch
* ============================================================.

* ============================================================.
* Question ID: hidS5Final
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5Final",
*   "Question Label": "hidS5Final - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5Final",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Respiratory Conditions"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Type 2 Diabetes"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Heart Disease"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Dermatologic Conditions"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5993"
*   }
* }
* -----------------------------------------------------------

tit hidS5Final. temporary. sel if miss(hidS5Final) or ~range(hidS5Final,1,4). list respid, hidS5Final.

* ============================================================.
* Question ID: hidS5x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5x2",
*   "Question Label": "hidS5x2 - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5x2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Asthma"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "COPD"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Psoriasis"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Atopic Dermatitis"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5994"
*   }
* }
* -----------------------------------------------------------

tit hidS5x2. temporary. sel if miss(hidS5x2) or ~any(hidS5x2,1,2,4,5). list respid, hidS5x2.

* ============================================================.
* Question ID: hidS5FinalNew
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5FinalNew",
*   "Question Label": "hidS5FinalNew - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5FinalNew",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Respiratory Conditions - Asthma"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Respiratory Conditions - COPD"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Type 2 Diabetes"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Heart Disease"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Dermatologic Conditions - Psoriasis"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Dermatologic Conditions - Atopic Dermatitis"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "6018"
*   }
* }
* -----------------------------------------------------------

tit hidS5FinalNew. temporary. sel if miss(hidS5FinalNew) or ~any(hidS5FinalNew,1,2,3,4,5,6). list respid, hidS5FinalNew.

* ============================================================.
* Question ID: qCountry
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qCountry",
*   "Question Label": "qCountry - In which country are you currently living?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [],
*   "Variable ID": "qCountry",
*   "answers": [
*     {
*       "Answer Code": "1033",
*       "Answer Label": "United States",
*       "answer_attributes": {
*         "ListSource": "list_yesno"
*       }
*     },
*     {
*       "Answer Code": "99",
*       "Answer Label": "Other",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "HierarchyMode": "Drilldown",
*     "AutoCheckOther": "true",
*     "FieldWidth": "5",
*     "EntityId": "2753912961"
*   }
* }
* -----------------------------------------------------------

tit qCountry. temporary. sel if qSurveyType <> 2 & (miss(qCountry) or ~any(qCountry,1033,99)). list respid, qSurveyType, qCountry.

* ============================================================.
* Question ID: QB002
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "QB002",
*   "Question Label": "QB002 - ^f('qCountry').text()^",
*   "question_type": "Open",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [],
*   "Variable ID": "QB002",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "EntityId": "4896"
*   }
* }
* -----------------------------------------------------------

tit QB002. temporary. sel if qSurveyType <> 2 & trim(QB002) = "".  list respid, qSurveyType, QB002.

* ============================================================.
* Question ID: SPECIALTY
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "SPECIALTY",
*   "question_type": "Single",
*   "entry_conditions": [
*     "false"
*   ],
*   "conditions": [
*     "f('SPECIALTY').any('99') //screen SPECIALITY"
*   ],
*   "Question Label": "SPECIALTY - What is your primary medical specialty?",
*   "question_attributes": {
*     "ValidationCode": "checkOS()",
*     "AutoCheckOther": "true",
*     "EntityId": "967"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "SPECIALTY",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Total"
*         },
*         {
*           "Answer Code": "99",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "SPECIALTY_99_other",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit SPECIALTY. temporary. * Allowed codes: 1 and 99 (Other). sel if miss(SPECIALTY) or ~any(SPECIALTY,1,99). list respid, SPECIALTY.  temporary. * Case A: Other selected but OE text missing. sel if any(SPECIALTY,99) & trim(SPECIALTY_99_other) = "".  list respid, SPECIALTY, SPECIALTY_99_other.  temporary. * Case B: OE text present but Other (99) not selected. sel if ~any(SPECIALTY,99) & trim(SPECIALTY_99_other) <> "".  list respid, SPECIALTY, SPECIALTY_99_other.

* ============================================================.
* Question ID: S0
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S0",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [
*     "f('S0').any('3')"
*   ],
*   "Question Label": "S0 - Welcome and thank you for participating in this market research survey. This survey is being conducted by Ipsos, an independent market research agency based in the US, on behalf of a technology company.   We are conducting research about your experiences as a patient and would like to ask you some questions on this topic. The survey will take 10 minutes of your time.  With your consent, your information will only be collected and used for market research and analysis. Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis.  As a member of EphMRA, Ipsos is bound by EphMRA Code of Conduct and all applicable laws protecting your personal data and responses. The study is conducted in compliance with ESOMAR/ EphMRA guidelines.  You have the right to withdraw from the interview at any time. For more information about your rights please see our privacy notice, it is available at here.  Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis. You will receive an honorarium for your participation.   Please confirm that:",
*   "question_attributes": {
*     "ValidationCode": "if(f('S0').isect(nset(2)).size()==1)\n{\nerrorMsg('S0'); \n}",
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "EntityId": "5854"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S0_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "I have read, understood and accept the points above and am happy to proceed with the market research survey on those basis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S0_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "I consent to providing information relating to my health/condition for the purpose of this research"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S0_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "No, I do not want to participate in this research",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S0. * Translate ValidationCode: error when S0_2 is selected as the only answer. compute total = nvalid(S0_1,S0_2,S0_3).  temporary. * Required: nothing selected. sel if total = 0. list respid, S0_1 to S0_3.  temporary. * Forbidden pattern: S0_2 selected alone. sel if S0_2 = 1 and total = 1. list respid, S0_1 to S0_3.  del var total.

* ============================================================.
* Question ID: S5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [
*     "f('S5').any('97','99') || f('S5').toBoolean() && f('S5').none('1','2','3','4','5','6') //soft-screen S5"
*   ],
*   "Question Label": "S5 - Which, if any, of the following conditions have you been diagnosed with by a healthcare provider?",
*   "question_attributes": {
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5867"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Asthma"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Chronic Obstructive Pulmonary Disease (COPD)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Type 2 Diabetes"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Psoriasis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Eczema/Atopic Dermatitis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Heart Disease (e.g., coronary artery disease, congenital heart disease, arrhythmia)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "High Blood Pressure/ Hypertension"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Parkinson’s Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Stroke"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Anemia"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Chronic Kidney Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_97",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Prefer not to answer",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "None of the above",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S5. compute total_any = sum(S5_1 to S5_11, S5_97, S5_99). compute primary = sum(S5_1 to S5_6).  temporary. * Flag 97/99 combined with other options. sel if (S5_97 = 1 or S5_99 = 1) & (total_any - (S5_97 + S5_99) > 0). list respid, S5_1 to S5_11 S5_97 S5_99.  temporary. * Soft-screen: answered but none of primary 1-6 selected. sel if total_any > 0 & primary = 0. list respid, S5_1 to S5_11 S5_97 S5_99 primary total_any.  del var total_any primary.

* ============================================================.
* Question ID: hidS5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidS5 - //hidden to classify below based on S5 response.",
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5872"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidS5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Respiratory Conditions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Type 2 Diabetes"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Heart Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Dermatologic Conditions"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hidS5. * Derive hidden classification variables from S5 responses. compute hidS5_1 = (S5_1 = 1 or S5_2 = 1).  /* Respiratory Conditions */ compute hidS5_2 = (S5_3 = 1).                 /* Type 2 Diabetes */ compute hidS5_3 = (S5_6 = 1).                 /* Heart Disease */ compute hidS5_4 = (S5_4 = 1 or S5_5 = 1).  /* Dermatologic Conditions */  * Convert logical to numeric 0/1. recode hidS5_1 hidS5_2 hidS5_3 hidS5_4 (true=1) (else=0).  temporary. * Validate derived values are 0/1 and not missing. sel if miss(hidS5_1) or miss(hidS5_2) or miss(hidS5_3) or miss(hidS5_4)      or ~range(hidS5_1,0,1) or ~range(hidS5_2,0,1) or ~range(hidS5_3,0,1) or ~range(hidS5_4,0,1). list respid S5_1 to S5_6 S5_4 S5_5 hidS5_1 to hidS5_4.

* ============================================================.
* Question ID: S10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S10",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [
*     "f('S10').any('99','97') //soft-screen S10"
*   ],
*   "Question Label": "S10 - In the past 12 months, how if at all, have you interacted with the healthcare system?",
*   "question_attributes": {
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5876"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S10_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "I had a video call with my usual healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "I used a patient portal offered by my healthcare providers’ office to request refills, schedule appointments or upload labs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "I exchanged messages (text, pictures, video, etc.) with a healthcare provider digitally"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "I shared wearable data (e.g., Apple Watch, Garmin, Fitbit, Oura Ring) with my healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I used virtual care/telehealth services (e.g., One Medical, MDLIVE, Teladoc)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "I used retail healthcare services (e.g., Hims/Hers, Nurx, Ro)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "I used a mobile health app for chronic disease management (e.g., Dario, Hinge Health, Livongo, Omada Health, Sword Health)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "I used a digital based tool that helped treat or manage my condition (e.g., Calm, EndeavorRx, Headspace, Talkspace)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "I used a digital solution to help me stay on track with my treatment & condition (e.g., Propeller Health, Kaiku Health)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "I saw my provider in their office face-to-face"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "I used a pharma solution (e.g., brand  website, digital medication coupons / rebates, patient assistance programs)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "I have not sought medical care in the past 12 months",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_97",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Prefer not to disclose",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S10. compute total_any = sum(S10_1 to S10_11, S10_97, S10_99). compute primary = sum(S10_1 to S10_11).  temporary. * Flag 97/99 combined with other options. sel if (S10_97 = 1 or S10_99 = 1) & (total_any - (S10_97 + S10_99) > 0). list respid, S10_1 to S10_11 S10_97 S10_99.  temporary. * Soft-screen: answered but none of primary 1-11 selected. sel if total_any > 0 & primary = 0. list respid, S10_1 to S10_11 S10_97 S10_99 primary total_any.  del var total_any primary.

* ============================================================.
* Question ID: B10xDK
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B10xDK",
*   "Question Label": "  - -Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('B5').toBoolean() && f('B5').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B10xDK_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "AutoCheckOther": "true",
*     "EntityId": "6010"
*   }
* }
* -----------------------------------------------------------

tit B10xDK. temporary. /* Only validate respondents who reached the question per entry condition: B5 is present and not 99 */ sel if (not miss(B5) and B5 <> 99) and (not miss(B10xDK_99) and ~range(B10xDK_99,0,1)). list respid, B10xDK_99.

* ============================================================.
* Question ID: B15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B15",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B15 - What are the main barriers preventing you from using ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ more frequently?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "MultiItemsSelectedMinimum": "3",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5916"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B15_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Current digital solutions don’t address my specific health needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Concerns about privacy and data security"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Find them hard to use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Cost of devices or subscriptions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I don’t know enough about digital health solutions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_15",
*       "answers": [
*         {
*           "Answer Code": "15",
*           "Answer Label": "Unsure how to find a digital health solution that meets my needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Preference for in-person healthcare visits"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Negative past experiences with digital solutions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Limited internet access or connectivity issues"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Lack of endorsement by trusted healthcare professionals"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Is not integrated with my healthcare provider’s system"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Digital solutions do not provide the same level of care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "Cause delays in care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_13",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": "There is not one app, platform or website that addresses all my healthcare needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "None-No barriers ",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B15. compute os_ok = checkOS(). compute B15_selcount = sum(0, B15_1 to B15_98). compute B15_flag = 0. DO IF (os_ok = 1).   /* (1) None selected alone = valid */   IF (B15_99 = 1 AND B15_selcount = 0) B15_flag = 0.   /* (2) None selected with other options = invalid (exclusive punch violation) */   ELSE IF (B15_99 = 1 AND B15_selcount > 0) B15_flag = 3.   /* (3) Minimum selections satisfied (>=3) = valid */   ELSE IF (B15_selcount >= 3) B15_flag = 0.   /* (4) Otherwise invalid: fewer than minimum selections */   ELSE B15_flag = 1. END IF. /* Other-text required when Other selected */ IF (os_ok = 1 AND B15_98 > 0 AND char.len(rtrim(ltrim(B15_98_other))) = 0) B15_flag = 2. temporary. sel if B15_flag > 0. list respid B15_1 to B15_99 B15_98_other B15_selcount B15_flag. del var os_ok B15_selcount B15_flag.

* ============================================================.
* End of Script - Total Questions Processed: 12
* ============================================================.
* ============================================================.
* Question ID: B10xDK
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B10xDK",
*   "Question Label": "  - -Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('B5').toBoolean() && f('B5').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B10xDK_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "AutoCheckOther": "true",
*     "EntityId": "6010"
*   }
* }
* -----------------------------------------------------------

tit B10xDK. temporary. * Only validate when B5 is in-scope (non-missing and not 99). Do not flag missing B10xDK_99 (NotRequired). sel if ~miss(B5) & B5<>99 & (~miss(B10xDK_99) & B10xDK_99<>99). list respid, B5 B10xDK_99.
```

```

* ============================================================.
* Question ID: B15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B15",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B15 - What are the main barriers preventing you from using ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ more frequently?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "MultiItemsSelectedMinimum": "3",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5916"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B15_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Current digital solutions don’t address my specific health needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Concerns about privacy and data security"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Find them hard to use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Cost of devices or subscriptions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I don’t know enough about digital health solutions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_15",
*       "answers": [
*         {
*           "Answer Code": "15",
*           "Answer Label": "Unsure how to find a digital health solution that meets my needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Preference for in-person healthcare visits"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Negative past experiences with digital solutions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Limited internet access or connectivity issues"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Lack of endorsement by trusted healthcare professionals"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Is not integrated with my healthcare provider’s system"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Digital solutions do not provide the same level of care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "Cause delays in care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_13",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": "There is not one app, platform or website that addresses all my healthcare needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "None-No barriers ",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B15. compute B15_count = SUM(B15_1 B15_2 B15_3 B15_4 B15_5 B15_15 B15_6 B15_7 B15_8 B15_9 B15_10 B15_11 B15_12 B15_13 B15_98 B15_99). temporary. * Required: at least 3 items selected (group-level check). sel if miss(B15_count) or B15_count < 3. * Exclusive 'None-No barriers' (B15_99) must be single — flag if selected with any other item. sel if B15_99 = 1 & (B15_count - B15_99) > 0. * If 'Other' selected require free-text in B15_98_other. sel if B15_98 = 1 & miss(B15_98_other). list respid B15_1 to B15_13 B15_15 B15_98 B15_99 B15_98_other B15_count.
```

* ============================================================.
* Question ID: qCountry
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qCountry",
*   "Question Label": "qCountry - In which country are you currently living?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [],
*   "Variable ID": "qCountry",
*   "answers": [
*     {
*       "Answer Code": "1033",
*       "Answer Label": "United States",
*       "answer_attributes": {
*         "ListSource": "list_yesno"
*       }
*     },
*     {
*       "Answer Code": "99",
*       "Answer Label": "Other",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "HierarchyMode": "Drilldown",
*     "AutoCheckOther": "true",
*     "FieldWidth": "5",
*     "EntityId": "2753912961"
*   }
* }
* -----------------------------------------------------------

tit qCountry. temporary. sel if qSurveyType <> 2 & (miss(qCountry) or ~any(qCountry,1033,99)). list respid, qCountry.

* ============================================================.
* Question ID: SPECIALTY
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "SPECIALTY",
*   "question_type": "Single",
*   "entry_conditions": [
*     "false"
*   ],
*   "conditions": [
*     "f('SPECIALTY').any('99') //screen SPECIALITY"
*   ],
*   "Question Label": "SPECIALTY - What is your primary medical specialty?",
*   "question_attributes": {
*     "ValidationCode": "checkOS()",
*     "AutoCheckOther": "true",
*     "EntityId": "967"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "SPECIALTY",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Total"
*         },
*         {
*           "Answer Code": "99",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "SPECIALTY_99_other",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit SPECIALTY. * Question has entry_conditions == false (hidden/inactive) — skip main-variable range/missing validation per reviewer instructions. temporary. sel if SPECIALTY = 99 & (SPECIALTY_99_other = "" or miss(SPECIALTY_99_other)). list respid, SPECIALTY, SPECIALTY_99_other.

* ============================================================.
* Question ID: S5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [
*     "f('S5').any('97','99') || f('S5').toBoolean() && f('S5').none('1','2','3','4','5','6') //soft-screen S5"
*   ],
*   "Question Label": "S5 - Which, if any, of the following conditions have you been diagnosed with by a healthcare provider?",
*   "question_attributes": {
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5867"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Asthma"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Chronic Obstructive Pulmonary Disease (COPD)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Type 2 Diabetes"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Psoriasis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Eczema/Atopic Dermatitis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Heart Disease (e.g., coronary artery disease, congenital heart disease, arrhythmia)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "High Blood Pressure/ Hypertension"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Parkinson’s Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Stroke"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Anemia"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Chronic Kidney Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_97",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Prefer not to answer",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "None of the above",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S5. * Required: flag respondents with nothing selected. count s5_cnt = S5_1 to S5_11(1). temporary. sel if s5_cnt = 0. list respid, S5_1 to S5_11. del var s5_cnt.  * Soft-screen logic: Prefer not to answer OR None OR answered but none of core items 1-6 selected. temporary. sel if S5_97 = 1 OR S5_99 = 1 OR (sum(S5_1 to S5_11) > 0 & ~any(S5_1,S5_2,S5_3,S5_4,S5_5,S5_6)). list respid, S5_1 to S5_11.

* ============================================================.
* Question ID: QB002
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "QB002",
*   "Question Label": "QB002 - ^f('qCountry').text()^",
*   "question_type": "Open",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [],
*   "Variable ID": "QB002",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "EntityId": "4896"
*   }
* }
* -----------------------------------------------------------

tit QB002. temporary. sel if qSurveyType <> 2 & (miss(QB002) or strip(QB002) = ''). list respid, QB002.

* ============================================================.
* Question ID: S0
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S0",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [
*     "f('S0').any('3')"
*   ],
*   "Question Label": "S0 - Welcome and thank you for participating in this market research survey. This survey is being conducted by Ipsos, an independent market research agency based in the US, on behalf of a technology company.   We are conducting research about your experiences as a patient and would like to ask you some questions on this topic. The survey will take 10 minutes of your time.  With your consent, your information will only be collected and used for market research and analysis. Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis.  As a member of EphMRA, Ipsos is bound by EphMRA Code of Conduct and all applicable laws protecting your personal data and responses. The study is conducted in compliance with ESOMAR/ EphMRA guidelines.  You have the right to withdraw from the interview at any time. For more information about your rights please see our privacy notice, it is available at here.  Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis. You will receive an honorarium for your participation.   Please confirm that:",
*   "question_attributes": {
*     "ValidationCode": "if(f('S0').isect(nset(2)).size()==1)\n{\nerrorMsg('S0'); \n}",
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "EntityId": "5854"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S0_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "I have read, understood and accept the points above and am happy to proceed with the market research survey on those basis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S0_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "I consent to providing information relating to my health/condition for the purpose of this research"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S0_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "No, I do not want to participate in this research",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S0. compute S0_checked = sum(S0_1 to S0_3).  temporary. sel if qSurveyType <> 2 & S0_checked = 0. list respid S0_1 S0_2 S0_3.  temporary. sel if qSurveyType <> 2 & S0_3 = 1 & S0_checked > 1. list respid S0_1 S0_2 S0_3.  temporary. sel if qSurveyType <> 2 & S0_3 = 1. list respid S0_1 S0_2 S0_3.  del var S0_checked.

* ============================================================.
* Question ID: hidS5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidS5 - //hidden to classify below based on S5 response.",
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5872"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidS5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Respiratory Conditions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Type 2 Diabetes"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Heart Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Dermatologic Conditions"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hidS5. 
/* Derived (hidden) multi - do NOT perform sel/list validations.  Compute each hidden flag from source S5 response variables. */ 
/* Mapping assumptions: source S5 indicators are S5_1..S5_4 (adjust names if source uses different variable names). */ 
do if S5_1 = 1. 
  hidS5_1 = 1. 
else. 
  hidS5_1 = 0. 
end if. 
do if S5_2 = 1. 
  hidS5_2 = 1. 
else. 
  hidS5_2 = 0. 
end if. 
do if S5_3 = 1. 
  hidS5_3 = 1. 
else. 
  hidS5_3 = 0. 
end if. 
do if S5_4 = 1. 
  hidS5_4 = 1. 
else. 
  hidS5_4 = 0. 
end if. 
/* Notes: If your S5 source uses different variable names (e.g. S5_asthma, S5_copd, S5_detail_x), replace S5_1..S5_4 above with the appropriate source variables or use OR conditions (any(...)) to combine multiple source indicators. Hidden variables are derived - no sel/list checks emitted. */

* ============================================================.
* Question ID: hidS5Final
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5Final",
*   "Question Label": "hidS5Final - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5Final",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Respiratory Conditions"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Type 2 Diabetes"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Heart Disease"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Dermatologic Conditions"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5993"
*   }
* }
* -----------------------------------------------------------

tit hidS5Final. 
/* Derived hidden single: compute deterministic classification from hidS5 flags (hidS5_1..hidS5_4). */ 
/* Priority: respiratory (hidS5_1), then diabetes (hidS5_2), then heart (hidS5_3), then dermatologic (hidS5_4). */ 
compute hidS5Final = $sysmis. 
do if hidS5_1 = 1. 
  hidS5Final = 1. 
else if hidS5_2 = 1. 
  hidS5Final = 2. 
else if hidS5_3 = 1. 
  hidS5Final = 3. 
else if hidS5_4 = 1. 
  hidS5Final = 4. 
else. 
  hidS5Final = $sysmis. 
end if. 
/* Notes: If multiple hidS5_* flags can be 1 simultaneously and a different priority rule is required, adjust the ELSE IF order above accordingly. Hidden single is derived — do not emit range/missing validations. */

* ============================================================.
* Question ID: hidS5x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5x2",
*   "Question Label": "hidS5x2 - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5x2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Asthma"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "COPD"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Psoriasis"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Atopic Dermatitis"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5994"
*   }
* }
* -----------------------------------------------------------

tit hidS5x2. 
/* Derived hidden single for sub-type mapping.  Do NOT perform sel/list validation. Compute from S5 detailed source indicators. */ 
/* Example source mappings (replace source var names as appropriate): 
   - Asthma source indicator: S5_asthma or S5_1a or similar 
   - COPD source indicator:  S5_copd or S5_1b etc. 
   - Psoriasis source indicator: S5_psoriasis or S5_4a etc. 
   - Atopic dermatitis source indicator: S5_atopic or S5_4b etc. */ 
compute hidS5x2 = $sysmis. 
/* Asthma */ 
do if (S5_asthma = 1). 
  hidS5x2 = 1. 
else if (S5_copd = 1). 
  hidS5x2 = 2. 
else if (S5_psoriasis = 1). 
  hidS5x2 = 4. 
else if (S5_atopic = 1). 
  hidS5x2 = 5. 
else. 
  hidS5x2 = $sysmis. 
end if. 
/* If your survey uses different variable names for the detailed indicators (for example S5_1a, S5_1b, S5_4a, S5_4b), replace S5_asthma/S5_copd/S5_psoriasis/S5_atopic above with the appropriate variables or use compound conditions, e.g.: DO IF any(S5_1a = 1, S5_1c = 1). hidS5x2 = 1. */

* ============================================================.
* Question ID: hidS5FinalNew
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5FinalNew",
*   "Question Label": "hidS5FinalNew - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5FinalNew",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Respiratory Conditions - Asthma"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Respiratory Conditions - COPD"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Type 2 Diabetes"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Heart Disease"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Dermatologic Conditions - Psoriasis"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Dermatologic Conditions - Atopic Dermatitis"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "6018"
*   }
* }
* -----------------------------------------------------------

tit hidS5FinalNew. 
/* Composite derived hidden single combining category flags (hidS5_1..hidS5_4) and subtype (hidS5x2). */ 
/* Mapping per specification: 
   1 = Respiratory - Asthma  (hidS5_1=1 AND hidS5x2=1) 
   2 = Respiratory - COPD    (hidS5_1=1 AND hidS5x2=2) 
   3 = Type 2 Diabetes        (hidS5_2=1) 
   6 = Heart Disease          (hidS5_3=1) 
   4 = Dermatologic - Psoriasis (hidS5_4=1 AND hidS5x2=4) 
   5 = Dermatologic - Atopic Derm (hidS5_4=1 AND hidS5x2=5) 
   Else = SYSMIS (ambiguous / not classifiable) */ 
compute hidS5FinalNew = $sysmis. 
/* Respiratory subtypes */ 
do if hidS5_1 = 1 and hidS5x2 = 1. 
  hidS5FinalNew = 1. 
else if hidS5_1 = 1 and hidS5x2 = 2. 
  hidS5FinalNew = 2. 
/* Diabetes */ 
else if hidS5_2 = 1. 
  hidS5FinalNew = 3. 
/* Heart */ 
else if hidS5_3 = 1. 
  hidS5FinalNew = 6. 
/* Dermatologic subtypes */ 
else if hidS5_4 = 1 and hidS5x2 = 4. 
  hidS5FinalNew = 4. 
else if hidS5_4 = 1 and hidS5x2 = 5. 
  hidS5FinalNew = 5. 
else. 
  hidS5FinalNew = $sysmis. 
end if. 
/* Notes: This implements explicit priority/combination logic. If a different priority or tie-breaking rule is required (e.g., prefer dermatologic over heart), adjust the order of the ELSE IF blocks accordingly. Hidden derived variable — no sel/list validation. */

* ============================================================.
* Question ID: S10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S10",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [
*     "f('S10').any('99','97') //soft-screen S10"
*   ],
*   "Question Label": "S10 - In the past 12 months, how if at all, have you interacted with the healthcare system?",
*   "question_attributes": {
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5876"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S10_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "I had a video call with my usual healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "I used a patient portal offered by my healthcare providers’ office to request refills, schedule appointments or upload labs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "I exchanged messages (text, pictures, video, etc.) with a healthcare provider digitally"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "I shared wearable data (e.g., Apple Watch, Garmin, Fitbit, Oura Ring) with my healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I used virtual care/telehealth services (e.g., One Medical, MDLIVE, Teladoc)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "I used retail healthcare services (e.g., Hims/Hers, Nurx, Ro)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "I used a mobile health app for chronic disease management (e.g., Dario, Hinge Health, Livongo, Omada Health, Sword Health)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "I used a digital based tool that helped treat or manage my condition (e.g., Calm, EndeavorRx, Headspace, Talkspace)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "I used a digital solution to help me stay on track with my treatment & condition (e.g., Propeller Health, Kaiku Health)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "I saw my provider in their office face-to-face"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "I used a pharma solution (e.g., brand  website, digital medication coupons / rebates, patient assistance programs)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "I have not sought medical care in the past 12 months",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_97",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Prefer not to disclose",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S10. 
/* Multi-response checks for S10 including requiredness and exclusivity of single-punch options S10_99 and S10_97. */ 
/* 1) Validate that all sub-variables are coded as 0/1 when present (flag_invalid). */ 
do repeat v = S10_1 to S10_11. 
  if not(missing(v)) and (v <> 0 and v <> 1) flag_invalid = 1. 
end repeat. 
if not(missing(S10_99)) and (S10_99 <> 0 and S10_99 <> 1) flag_invalid = 1. 
if not(missing(S10_97)) and (S10_97 <> 0 and S10_97 <> 1) flag_invalid = 1. 
temporary. 
sel if flag_invalid = 1. 
list respid S10_1 to S10_11 S10_99 S10_97. 
del var flag_invalid. 
/* 2) Exclusivity: if S10_99=1 OR S10_97=1 then all other S10_1..S10_11 must be 0 (or missing) */ 
compute S10_others_sum = sum(S10_1 to S10_11). 
compute excl_violation = (S10_99 = 1 or S10_97 = 1) and (S10_others_sum > 0). 
/* 3) Requiredness: at least one of S10_1..S10_11, S10_99, S10_97 must be selected */ 
compute any_selected = (S10_others_sum + (S10_99 = 1) + (S10_97 = 1)). 
compute none_selected = (any_selected = 0). 
temporary. 
sel if excl_violation = 1 or none_selected = 1. 
list respid excl_violation none_selected S10_1 to S10_11 S10_99 S10_97. 
/* cleanup helper vars */ 
del var S10_others_sum excl_violation any_selected none_selected.

* ============================================================.
* Question ID: S25
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S25",
*   "Question Label": "S25 - In which state do you currently live?",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "S25",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "AL Alabama",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "AK Alaska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "AZ Arizona",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "AR Arkansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "CA California",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "CO Colorado",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "CT Connecticut",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "DC District of Columbia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "DE Delaware",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "FL Florida",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "GA Georgia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "HI Hawaii",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "ID Idaho",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": "IL Illinois",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "IN Indiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "IA Iowa",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": "KS Kansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": "KY Kentucky",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "19",
*       "Answer Label": "LA Louisiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "20",
*       "Answer Label": "ME Maine",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "21",
*       "Answer Label": "MD Maryland",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "22",
*       "Answer Label": "MA Massachusetts",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "23",
*       "Answer Label": "MI Michigan",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "24",
*       "Answer Label": "MN Minnesota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "25",
*       "Answer Label": "MS Mississippi",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "26",
*       "Answer Label": "MO Missouri",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "27",
*       "Answer Label": "MT Montana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "28",
*       "Answer Label": "NC North Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "29",
*       "Answer Label": "ND North Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "30",
*       "Answer Label": "NE Nebraska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "31",
*       "Answer Label": "NV Nevada",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "32",
*       "Answer Label": "NH New Hampshire",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "33",
*       "Answer Label": "NJ New Jersey",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "34",
*       "Answer Label": "NM New Mexico",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "35",
*       "Answer Label": "NY New York",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "36",
*       "Answer Label": "OH Ohio",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "37",
*       "Answer Label": "OK Oklahoma",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "38",
*       "Answer Label": "OR Oregon",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "39",
*       "Answer Label": "PA Pennsylvania",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "40",
*       "Answer Label": "RI Rhode Island",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "41",
*       "Answer Label": "SC South Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "42",
*       "Answer Label": "SD South Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "43",
*       "Answer Label": "TN Tennessee",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "44",
*       "Answer Label": "TX Texas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "45",
*       "Answer Label": "UT Utah",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "46",
*       "Answer Label": "VT Vermont",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "47",
*       "Answer Label": "VA Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "48",
*       "Answer Label": "WA Washington",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "49",
*       "Answer Label": "WV West Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "50",
*       "Answer Label": "WI Wisconsin",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "51",
*       "Answer Label": "WY Wyoming",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "Dropdown": "true",
*     "EntityId": "5933"
*   }
* }
* -----------------------------------------------------------

tit S25. temporary. sel if miss(S25) or ~range(S25,1,51). list respid, S25.

* ============================================================.
* Question ID: hidS10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS10",
*   "Question Label": "hidS10 - //hidden to classify below based on S10 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS10",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "HIGH DIGITAL USER"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "MODERATE DIGITAL USER"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "LOW DIGITAL USER"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5881"
*   }
* }
* -----------------------------------------------------------

tit hidS10. compute hidS10 = $SYSMIS. do if not(miss(S10)).     /* Map S10 responses into hidS10 categories.  Adjust S10 code sets below to match study specification if different. */     if S10 in (1,2) hidS10 = 1.  /* HIGH DIGITAL USER */     if S10 in (3,4) hidS10 = 2.  /* MODERATE DIGITAL USER */     if S10 in (5,6) hidS10 = 3.  /* LOW DIGITAL USER */ end if. exe.

* ============================================================.
* Question ID: S15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S15",
*   "Question Label": "S15 - How old are you?",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [
*     "GetNum('S15_1') < 18 || GetNum('S15_1') > 79 //soft-screen S15"
*   ],
*   "Variable ID": "S15_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "S15_1 (S15 - How old are you?)"
*     }
*   ],
*   "question_attributes": {
*     "LowerLimitType": "GreaterOrEqual",
*     "LowerLimit": "0",
*     "Numeric": "true",
*     "UpperLimit": "99",
*     "AutoCheckOther": "true",
*     "OpenText": "true",
*     "EntityId": "5915",
*     "RightText": "true",
*     "UpperLimitType": "SmallerOrEqual"
*   }
* }
* -----------------------------------------------------------

tit S15. temporary. sel if miss(S15_1) or ~range(S15_1,0,99). list respid, S15_1.  compute S15_softfail=0. if not(miss(S15_1)) and (S15_1<18 or S15_1>79) S15_softfail=1. exe. temporary. sel if S15_softfail=1. list respid, S15_1 S15_softfail. * Note: S15_1 is validated against the numeric data bounds 0-99 (hard validation). * S15_softfail flags soft-screen cases (age &lt;18 or &gt;79) for review rather than treating them as invalid.

* ============================================================.
* Question ID: hidS15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS15",
*   "Question Label": "hidS15 - //hidden clasify below based on S15 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS15",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "GEN Z"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "MILLENNIAL"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "GEN X"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "BOOMER"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5924"
*   }
* }
* -----------------------------------------------------------

tit hidS15. compute hidS15 = $SYSMIS. do if not(miss(S15_1)).     /* Map S15_1 (age) into generation categories.  Adjust ranges if study spec differs. */     if (S15_1 >= 18 and S15_1 <= 24) hidS15 = 1.  /* GEN Z */     if (S15_1 >= 25 and S15_1 <= 40) hidS15 = 2.  /* MILLENNIAL */     if (S15_1 >= 41 and S15_1 <= 56) hidS15 = 3.  /* GEN X */     if (S15_1 >= 57) hidS15 = 4.                 /* BOOMER */ end if. exe.

* ============================================================.
* Question ID: S20
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S20",
*   "Question Label": "S20 - What gender do you identify as?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [],
*   "Variable ID": "S20",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Man"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Woman"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Non-binary or other gender identity"
*     },
*     {
*       "Answer Code": "97",
*       "Answer Label": "Prefer not to disclose"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5932"
*   }
* }
* -----------------------------------------------------------

tit S20. temporary. sel if qSurveyType <> 2. sel if miss(S20) or ~any(S20,1,2,3,97). list respid, S20.

* ============================================================.
* Question ID: A5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A5",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "SubHeaderOrder": "Randomize",
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5947"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A5_1",
*       "Question Label": "Finding a primary  healthcare provider online is easy (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_2",
*       "Question Label": "Finding a provider who specializes in my condition online is easy (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_3",
*       "Question Label": "I am able to schedule an appointment with my primary provider in a reasonable timeframe (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_4",
*       "Question Label": "I am able to schedule an appointment with a provider who specializes in my condition in a reasonable timeframe (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_5",
*       "Question Label": "The location of my  healthcare facility is convenient for me (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_6",
*       "Question Label": "Accessing and completing necessary lab tests is convenient (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_7",
*       "Question Label": "Understanding the results of my lab tests is clear and straightforward (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_8",
*       "Question Label": "Obtaining my prescribed medications is hassle-free (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_9",
*       "Question Label": "Digital resources help me easily schedule appointments with my provider (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_10",
*       "Question Label": "Digital resources help me easily communicate with my provider (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_11",
*       "Question Label": "Pharma companies are patient centric and prioritize the needs and preferences of the patient (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_12",
*       "Question Label": "I receive the same quality of care through a telehealth appointment as I do during an in-person office visit (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A5. DO REPEAT x=A5_1 TO A5_12. temporary. sel if miss(x) or ~any(x,1,2,3,4,5,97). list respid, x. END REPEAT.

* ============================================================.
* Question ID: A10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A10",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5958"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A10_1",
*       "Question Label": "I find ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ to be user-friendly and intuitive (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_2",
*       "Question Label": "^tooltip(\"Digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ have helped me maintain better communication with my healthcare providers (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_3",
*       "Question Label": "I believe that ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ provide a cost-effective way to manage my health (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_4",
*       "Question Label": "I experience technical difficulties when using ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_5",
*       "Question Label": "I have to utilize multiple ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ to manage my health (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A10. DO REPEAT x=A10_1 TO A10_5. temporary. sel if miss(x) or ~any(x,1,2,3,4,5,97). list respid, x. END REPEAT.

* ============================================================.
* Question ID: Qual
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "Qual",
*   "Question Label": "Qual - Your responses have qualified you for this research. This survey should take approximately 10 minutes to complete.  Are you willing to participate?  ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [
*     "f('Qual').any('2') //soft-screen Qual"
*   ],
*   "Variable ID": "Qual",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Yes",
*       "answer_attributes": {
*         "ColumnWidth": "100",
*         "ListSource": "list_yesno"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "No",
*       "answer_attributes": {
*         "ColumnWidth": "100",
*         "ListSource": "list_yesno"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5940"
*   }
* }
* -----------------------------------------------------------

tit Qual. temporary. sel if (f('qSurveyType').none('2') and (miss(Qual) or ~range(Qual,1,2))). list respid, Qual.

* ============================================================.
* Question ID: qtRegion1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qtRegion1",
*   "Question Label": "qtRegion1 - // hidden question storing region for quota purposes",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "qtRegion1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Northeast"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Midwest"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "South"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "West"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "5935"
*   }
* }
* -----------------------------------------------------------

tit qtRegion1. /* Hidden variable qtRegion1 - no validation emitted because VariableType='Hidden' and Disabled='true'. */ /* Allowed/expected codes: 1=Northeast, 2=Midwest, 3=South, 4=West. */ /* NotRequired/ExcludeTranslation metadata documented above. No temporary selection/listing or enforcement is performed for this hidden/disabled variable. */

* ============================================================.
* Question ID: A15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A15",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ValidationCode": "CheckDK('A15','A15xDK')\n\nif(f('A15').toBoolean())\n{\n\ncheckOS()\n\nvar code = f('A15').domainValues()\n\nfor(var i=0;i<code.length;i++)\n{\nif(code[i]!=98)\n{\n\tif(!f('A15')[code[i]].toBoolean())\n\t\t{\n\t\terrorMsg('A15err1')\n\t\t}\n}\n\n}\n\nif(f('A15')['98'].any('1'))\n{\nerrorMsg('A15err2')\n}\n\n}",
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5999"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A15_1",
*       "Question Label": "Telehealth platforms for virtual consultations (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_2",
*       "Question Label": "Mobile health apps for chronic disease management (e.g., diabetes, asthma) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_3",
*       "Question Label": "Wearable devices for health (e.g., heart rate, oxygen level, sleep, steps) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_4",
*       "Question Label": "Patient portals for accessing healthcare information and resources (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_5",
*       "Question Label": "Websites for accessing healthcare information and resources (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_6",
*       "Question Label": "At-home diagnostic testing kits for personalized health insights (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_7",
*       "Question Label": "Digital therapeutics for mental health support (e.g., anxiety, depression) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_8",
*       "Question Label": "Health management platforms that are integrated with my health provider’s electronic health records (EHR) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_9",
*       "Question Label": "Remote health monitoring tools to keep track of your health conditions (e.g. blood sugar monitors, heart rate monitors etc.) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_10",
*       "Question Label": "AI-driven health assistants for personalized health advice (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_11",
*       "Question Label": "Pharma solutions (e.g., brand website, digital coupons, pharma physician finders, patient assistance programs) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_12",
*       "Question Label": "Nutrition and diet planning apps tailored to individual health needs (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_13",
*       "Question Label": "Pharmacy delivery services (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_98",
*       "Question Label": "Other specify (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_98_other",
*       "Question Label": "A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true",
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A15.  /* IMPLEMENTATION NOTES (matching ValidationCode semantics): */ /* 1) CheckDK('A15','A15xDK') - detect any explicit DK/NA codes (commonly 99) in the grid and record A15xDK_chk. */ /* 2) checkOS() semantics: if any non-98 grid item is answered then ALL non-98 items must be answered; otherwise raise A15err1. */ /* 3) If A15_98 is selected in a way that triggers the survey error (JS used f('A15')['98'].any('1')), raise A15err2. */  /* === CheckDK implementation === */ compute A15xDK_chk=0. do repeat v = A15_1 to A15_13 A15_98.   if v = 99 A15xDK_chk = 1. end repeat. exe.  /* === checkOS per-item presence check (A15err1) === */ compute A15_any_answered = 0. do repeat v = A15_1 to A15_13.   if not miss(v) A15_any_answered = 1. end repeat. compute A15_any_missing = 0. do repeat v = A15_1 to A15_13.   if miss(v) A15_any_missing = 1. end repeat. compute A15err1_chk = 0. if (A15_any_answered = 1 and A15_any_missing = 1) A15err1_chk = 1. exe.  /* === A15_98 (Other) rule: trigger A15err2 when A15_98 is selected in the disallowed way per ValidationCode === */ compute A15err2_chk = 0. if A15_98 = 1 A15err2_chk = 1.  /* mirrors f('A15')['98'].any('1') -> errorMsg('A15err2') in JS */ /* Enforce Other-text dependency: require text when Other selected; require empty when not selected */ compute A15err2_othertext = 0. if (A15_98 = 1 and (A15_98_other = \"\")) A15err2_othertext = 1. /* Other selected but OE blank */ if ( (miss(A15_98) or A15_98 = 0) and (A15_98_other <> \"\") ) A15err2_othertext = 2. /* OE filled but Other not selected */ exe.  /* === Produce developer diagnostic listings for each explicit error condition === */ temporary. sel if A15xDK_chk = 1. list respid A15_1 to A15_13 A15_98 A15_98_other A15xDK_chk.  temporary. sel if A15err1_chk = 1. list respid A15_1 to A15_13 A15_98 A15_98_other A15err1_chk A15_any_answered A15_any_missing.  temporary. sel if (A15err2_chk = 1) or (A15err2_othertext > 0). list respid A15_98 A15_98_other A15err2_chk A15err2_othertext.  /* clean up helper check variables */ del var A15xDK_chk A15_any_answered A15_any_missing A15err1_chk A15err2_chk A15err2_othertext.

* ============================================================.
* Question ID: A25
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A25",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "/*A25*/ GreaterThan('A20',3).size() > 0"
*   ],
*   "conditions": [],
*   "Question Label": "A25 - What are the top reasons generally that you are satisfied with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you are using or have used?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5966"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A25_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "It is convenient"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "It helps me receive treatment or care more quickly"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "It is cheaper than traditional options"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "It improves my communication with my healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "It improves my engagement with my healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "It improves my ability not to forget to take  to my medication"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "It provides my healthcare provider with more data so that they can personalize my care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "It helps me get the medications I need"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "It improves my overall health"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other Specify",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A25. compute flt=0. do repeat a=A20_1 to A20_13 A20_98.     if a>3 flt=1. end repeat. exe.  count sel = A25_1 to A25_98 (1). exe.  temporary. sel if (flt=1 and sel = 0) or (flt<>1 and sel > 0). list respid sel A20_1 to A20_13 A25_1 to A25_98 A25_98_other.  temporary. sel if (A25_98>0 and A25_98_other = '') or (A25_98=0 and A25_98_other <> ''). list respid, A25_98_other. del var sel flt.

* ============================================================.
* Question ID: A30
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A30",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "/*A30*/ LessThan('A20',3).size() > 0"
*   ],
*   "conditions": [],
*   "Question Label": "A30 - What are the top reasons generally that you are not satisfied with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you are using/used in the past?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5968"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A30_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "It was hard to use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "I had technical issues"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "It was not easy to access the care that I needed"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "I was not able to schedule an in-person visit with a healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I had data security concerns"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "It couldn’t address my health needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "It was too expensive"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "It didn’t integrate with my healthcare provider’s system"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "I had to use multiple ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ to get what I need/needed"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other Specify",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A30. compute flt=0. do repeat a=A20_1 to A20_13 A20_98.     if a<3 and a<>0 flt=1. end repeat. exe.  count sel = A30_1 to A30_98 (1). exe.  temporary. sel if (flt=1 and sel = 0) or (flt<>1 and sel > 0). list respid sel A20_1 to A20_13 A30_1 to A30_98 A30_98_other.  temporary. sel if (A30_98>0 and A30_98_other = '') or (A30_98=0 and A30_98_other <> ''). list respid, A30_98_other. del var sel flt.

* ============================================================.
* Question ID: A35
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A35",
*   "Question Label": "A35 - If a company were to offer all of the following in one solution, how beneficial, if at all, would that be?  Services:  Helping me find a physician Providing patient assistance programs to help those who cannot afford their medication Providing tools or resources to help me access medication (e.g., delivery services, automatic reminders) Education about the conditions that medication treats Support programs to help with adherence (e.g., medication reminders) Telehealth services to connect me to care Easier access for lab testing; at home kits, or scheduling at service centers ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A35",
*   "answers": [
*     {
*       "Answer Code": "97",
*       "Answer Label": "I don’t know"
*     },
*     {
*       "Answer Code": "1",
*       "Answer Label": "Not at all beneficial"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Slightly beneficial"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Moderately beneficial"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Very beneficial"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Extremely beneficial"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6005"
*   }
* }
* -----------------------------------------------------------

tit A35. temporary. sel if miss(A35) or ~any(A35,1,2,3,4,5,97). list respid, A35.

* ============================================================.
* Question ID: A20
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A20",
*   "question_type": "Grid",
*   "entry_conditions": [
*     "/*A20*/ GreaterThan('A15', 1).diff(set('99')).size()>0"
*   ],
*   "conditions": [],
*   "question_attributes": {
*     "PrecodeMask": "GreaterThan('A15', 1).diff(set('99'))",
*     "Carousel": "false",
*     "EntityId": "5964"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A20_1",
*       "Question Label": "Telehealth platforms for virtual consultations (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_2",
*       "Question Label": "Mobile health apps for chronic disease management (e.g., diabetes, asthma) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_3",
*       "Question Label": "Wearable devices for health (e.g., heart rate, oxygen level, sleep, steps) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_4",
*       "Question Label": "Patient portals for accessing healthcare information and resources (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_5",
*       "Question Label": "Websites for accessing healthcare information and resources (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_6",
*       "Question Label": "At-home diagnostic testing kits for personalized health insights (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_7",
*       "Question Label": "Digital therapeutics for mental health support (e.g., anxiety, depression) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_8",
*       "Question Label": "Health management platforms that are integrated with my health provider’s electronic health records (EHR) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_9",
*       "Question Label": "Remote health monitoring tools to keep track of your health conditions (e.g. blood sugar monitors, heart rate monitors etc.) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_10",
*       "Question Label": "AI-driven health assistants for personalized health advice (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_11",
*       "Question Label": "Pharma solutions (e.g., brand website, digital coupons, pharma physician finders, patient assistance programs) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_12",
*       "Question Label": "Nutrition and diet planning apps tailored to individual health needs (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_13",
*       "Question Label": "Pharmacy delivery services (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_98",
*       "Question Label": "^f('A15_98_other')^ (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A20. compute cnt = SUM(A15_1 to A15_98). compute flt = (cnt>0). filter by flt. compute flag = 0. do repeat a=A15_1 to A15_98 / x=A20_1 to A20_98.   if a=1 and (miss(x) or ~range(x,1,5)) flag=1. end repeat. FREQUENCIES flag. filter off. temporary. sel if flag>0. list respid flag A15_1 to A15_98 A20_1 to A20_98. delete variables flag cnt flt.

* ============================================================.
* Question ID: A15xDK
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A15xDK",
*   "Question Label": "  - -Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A15xDK_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": "I have not used any digital health solutions"
*     }
*   ],
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "AutoCheckOther": "true",
*     "EntityId": "6004"
*   }
* }
* -----------------------------------------------------------

tit A15xDK. compute cnt_other = sum(A15_1 to A15_98). compute invalid_none = (A15xDK_99 = 1 and cnt_other > 0). compute invalid_a15xdk99 = ( ~miss(A15xDK_99) and ~range(A15xDK_99,0,1) ). compute invalid_other_codes = 0. do repeat v = A15_1 to A15_98. if (~miss(v) and ~range(v,0,1)) invalid_other_codes=1. end repeat. temporary. sel if invalid_none or invalid_a15xdk99 or invalid_other_codes. list respid A15xDK_99 A15_1 to A15_98 cnt_other invalid_none invalid_a15xdk99 invalid_other_codes. del var cnt_other invalid_none invalid_a15xdk99 invalid_other_codes.

* ============================================================.
* Question ID: A40
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A40",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5974"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A40_1",
*       "Question Label": "Helping me find a physician (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_2",
*       "Question Label": "Providing patient assistance programs to help those who cannot afford their medication (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_3",
*       "Question Label": "Providing tools or resources to help me access medication (e.g., delivery services, automatic reminders) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_4",
*       "Question Label": "Education about the conditions that medication treats (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_5",
*       "Question Label": "Support programs to help with adherence (e.g., medication reminders) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_6",
*       "Question Label": "Telehealth services to connect me to care (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_7",
*       "Question Label": "Easier access for lab testing; at home kits, or scheduling at service centers (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_8",
*       "Question Label": "Reduce the barriers to care that I experience with traditional healthcare process (e.g., long wait times, lack of convenience) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A40. compute flag=0. do repeat x=A40_1 to A40_8.   if miss(x) or (~range(x,1,5) and x<>97) flag=1. end repeat. temp. sel if flag=1. list respid flag A40_1 to A40_8. delete variables flag.

* ============================================================.
* Question ID: B5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5 - Which of the following, if any, would motivate you to use a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "MultiItemsSelectedMinimum": "3",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5913"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Improves convenience in finding healthcare providers"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Increases my access to healthcare providers"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Provides more options to fit healthcare into my lifestyle or schedule"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Allows me to keep track of my health information"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Personalized health insights"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Integration with other digital devices"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Recommendations from healthcare providers"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Provides an easier way to get my medications"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Ability to set and track personal health goals"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Access to virtual consultations or telemedicine"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Provides a convenient way to access lab tests"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "It is a pharma solution or the solution is partnered with a pharma company"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "Nothing would motivate me to use a digital solution",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5. !MULTI_B svar=B5_1 evar=B5_99 qnt=B5 ctr= 12 . !multi_numb svar=B5_1 evar=B5_98 qnt=B5 ctr=3 opr= < . if sum(B5_1 to B5_98) > 0 and B5_99 > 0 flag=1. if sum(B5_1 to B5_98) = 0 and B5_99 = 0 flag=2. if B5_98 > 0 and B5_98_other = '' flag=3. if (B5_98 = 0 or miss(B5_98)) and B5_98_other ne '' flag=4. FREQUENCIES flag. DELETE VARIABLES flag.

* ============================================================.
* Question ID: B15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B15",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B15 - What are the main barriers preventing you from using ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ more frequently?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "MultiItemsSelectedMinimum": "3",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5916"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B15_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Current digital solutions don’t address my specific health needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Concerns about privacy and data security"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Find them hard to use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Cost of devices or subscriptions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I don’t know enough about digital health solutions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_15",
*       "answers": [
*         {
*           "Answer Code": "15",
*           "Answer Label": "Unsure how to find a digital health solution that meets my needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Preference for in-person healthcare visits"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Negative past experiences with digital solutions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Limited internet access or connectivity issues"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Lack of endorsement by trusted healthcare professionals"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Is not integrated with my healthcare provider’s system"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Digital solutions do not provide the same level of care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "Cause delays in care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_13",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": "There is not one app, platform or website that addresses all my healthcare needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "None-No barriers ",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B15. * Validation code specified in survey attributes: checkOS(); (placeholder - platform/OS checks executed in survey engine). * First, check exclusivity: the 'None - No barriers' punch-single (B15_99) must not be selected with any other options.; temporary. sel if B15_99 = 1 and sum(B15_1 to B15_98) > 0. list respid, B15_1 to B15_99.  * Next, enforce minimum selection requirement (at least 3) when None is not selected.; count cnt = B15_1 to B15_98 (1). temporary. sel if cnt < 3 and (B15_99 = 0 or miss(B15_99)). list respid, B15_1 to B15_99. DELETE VARIABLES cnt.  * Finally, ensure Other open-text is consistent with Other flag.; temporary. sel if (B15_98 > 0 and (B15_98_other = "")) or ((B15_98 = 0 or miss(B15_98)) and (B15_98_other <> "")). list respid, B15_98_other.

* ============================================================.
* Question ID: B10xDK
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B10xDK",
*   "Question Label": "  - -Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('B5').toBoolean() && f('B5').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B10xDK_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "AutoCheckOther": "true",
*     "EntityId": "6010"
*   }
* }
* -----------------------------------------------------------

tit B10xDK. compute flt=0. if (not miss(B5) and B5<>99) flt=1. temporary. sel if flt=1 and not miss(B10xDK_99) and (B10xDK_99 <> 99). list respid, B10xDK_99. del var flt.

* ============================================================.
* Question ID: qCountry
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qCountry",
*   "Question Label": "qCountry - In which country are you currently living?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [],
*   "Variable ID": "qCountry",
*   "answers": [
*     {
*       "Answer Code": "1033",
*       "Answer Label": "United States",
*       "answer_attributes": {
*         "ListSource": "list_yesno"
*       }
*     },
*     {
*       "Answer Code": "99",
*       "Answer Label": "Other",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "HierarchyMode": "Drilldown",
*     "AutoCheckOther": "true",
*     "FieldWidth": "5",
*     "EntityId": "2753912961"
*   }
* }
* -----------------------------------------------------------

tit qCountry.<br>temporary.<br>* Display logic: question shown when qSurveyType <> 2. If shown, must be one of the allowed codes; if not shown (qSurveyType = 2) it must be missing.<br>sel if ((qSurveyType <> 2 and (miss(qCountry) or ~any(qCountry,1033,99))) or (qSurveyType = 2 and ~miss(qCountry))).<br>list respid, qSurveyType qCountry.<br>

* ============================================================.
* Question ID: SPECIALTY
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "SPECIALTY",
*   "question_type": "Single",
*   "entry_conditions": [
*     "false"
*   ],
*   "conditions": [
*     "f('SPECIALTY').any('99') //screen SPECIALITY"
*   ],
*   "Question Label": "SPECIALTY - What is your primary medical specialty?",
*   "question_attributes": {
*     "ValidationCode": "checkOS()",
*     "AutoCheckOther": "true",
*     "EntityId": "967"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "SPECIALTY",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Total"
*         },
*         {
*           "Answer Code": "99",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "SPECIALTY_99_other",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit SPECIALTY.<br>* Entry condition is FALSE (question not displayed). Both the main variable and its 'Other' text must therefore be missing for all cases.<br>temporary.<br>sel if (~miss(SPECIALTY) or ~miss(SPECIALTY_99_other)).<br>list respid, SPECIALTY SPECIALTY_99_other.<br>

* ============================================================.
* Question ID: S0
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S0",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [
*     "f('S0').any('3')"
*   ],
*   "Question Label": "S0 - Welcome and thank you for participating in this market research survey. This survey is being conducted by Ipsos, an independent market research agency based in the US, on behalf of a technology company.   We are conducting research about your experiences as a patient and would like to ask you some questions on this topic. The survey will take 10 minutes of your time.  With your consent, your information will only be collected and used for market research and analysis. Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis.  As a member of EphMRA, Ipsos is bound by EphMRA Code of Conduct and all applicable laws protecting your personal data and responses. The study is conducted in compliance with ESOMAR/ EphMRA guidelines.  You have the right to withdraw from the interview at any time. For more information about your rights please see our privacy notice, it is available at here.  Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis. You will receive an honorarium for your participation.   Please confirm that:",
*   "question_attributes": {
*     "ValidationCode": "if(f('S0').isect(nset(2)).size()==1)\n{\nerrorMsg('S0'); \n}",
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "EntityId": "5854"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S0_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "I have read, understood and accept the points above and am happy to proceed with the market research survey on those basis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S0_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "I consent to providing information relating to my health/condition for the purpose of this research"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S0_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "No, I do not want to participate in this research",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S0.<br>* S0 is required and has a single-punch "No" option (S0_3). Respect display logic: shown when qSurveyType <> 2. If shown enforce exclusivity and basic completeness. If not shown (qSurveyType = 2) all options must be missing.<br>temporary.<br>sel if ( (qSurveyType <> 2 and ((S0_3 = 1 and (S0_1 = 1 or S0_2 = 1)) or (S0_3 <> 1 and (coalesce(S0_1,0) <> 1 and coalesce(S0_2,0) <> 1)))) or (qSurveyType = 2 and (S0_1 = 1 or S0_2 = 1 or S0_3 = 1)) ).<br>list respid, qSurveyType S0_1 S0_2 S0_3.<br>

* ============================================================.
* Question ID: S5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [
*     "f('S5').any('97','99') || f('S5').toBoolean() && f('S5').none('1','2','3','4','5','6') //soft-screen S5"
*   ],
*   "Question Label": "S5 - Which, if any, of the following conditions have you been diagnosed with by a healthcare provider?",
*   "question_attributes": {
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5867"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Asthma"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Chronic Obstructive Pulmonary Disease (COPD)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Type 2 Diabetes"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Psoriasis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Eczema/Atopic Dermatitis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Heart Disease (e.g., coronary artery disease, congenital heart disease, arrhythmia)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "High Blood Pressure/ Hypertension"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Parkinson’s Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Stroke"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Anemia"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Chronic Kidney Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_97",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Prefer not to answer",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "None of the above",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S5.<br>* Compute sums and detect exclusivity, nothing-selected (required), both single-punch selected, and soft-screen (choices but none of S5_1..S5_6).<br>compute sum_1_6 = sum(0, S5_1 to S5_6).<br>compute sum_1_11 = sum(0, S5_1 to S5_11).<br>compute any_selected = (sum_1_11 > 0) or (coalesce(S5_97,0) = 1) or (coalesce(S5_99,0) = 1).<br>compute flag = 0.<br>* Exclusivity: main options selected together with a single-punch (97 or 99).<br>if (sum_1_11 > 0 and (coalesce(S5_97,0) = 1 or coalesce(S5_99,0) = 1)) flag = 1.<br>* Nothing selected (required question): neither main options nor single-punch selected.<br>if (sum_1_11 = 0 and coalesce(S5_97,0) = 0 and coalesce(S5_99,0) = 0) flag = 2.<br>* Both single-punch options selected (invalid).<br>if (coalesce(S5_97,0) = 1 and coalesce(S5_99,0) = 1) flag = 3.<br>* Soft-screen: some selection made but none of S5_1..S5_6 selected (per reviewer instruction).<br>if ((coalesce(S5_97,0) = 1 or coalesce(S5_99,0) = 1) or (any_selected = 1 and sum_1_6 = 0)) flag = max(flag,4).<br>exe.<br>temporary.<br>sel if flag > 0.<br>list respid S5_1 to S5_11 S5_97 S5_99 sum_1_6 sum_1_11 any_selected flag.<br>del var sum_1_6 sum_1_11 any_selected flag.

* ============================================================.
* Question ID: QB002
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "QB002",
*   "Question Label": "QB002 - ^f('qCountry').text()^",
*   "question_type": "Open",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [],
*   "Variable ID": "QB002",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "EntityId": "4896"
*   }
* }
* -----------------------------------------------------------

tit QB002.<br>temporary.<br>sel if ((qSurveyType <> 2 and strip(QB002) = '') or (qSurveyType = 2 and strip(QB002) <> '')).<br>list respid, qSurveyType QB002.
```

* ============================================================.
* Question ID: hidS5x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5x2",
*   "Question Label": "hidS5x2 - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5x2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Asthma"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "COPD"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Psoriasis"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Atopic Dermatitis"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5994"
*   }
* }
* -----------------------------------------------------------

tit hidS5x2.<br>
* Validate allowed codes when variable is present (explicit non-contiguous set).<br>
temporary.<br>
sel if ~miss(hidS5x2) and ~any(hidS5x2,1,2,4,5).<br>
list respid hidS5x2.<br>
* Conditional consistency: hidS5x2 should be present only when Respiratory (hidS5_1) or Dermatologic (hidS5_4) selected,<br>
* and use the appropriate allowed subset for each parent category.<br>
temporary.<br>
sel if (hidS5_1 = 1 and (miss(hidS5x2) or ~any(hidS5x2,1,2)))<br>
      or (hidS5_4 = 1 and (miss(hidS5x2) or ~any(hidS5x2,4,5)))<br>
      or (hidS5_1 <> 1 and hidS5_4 <> 1 and ~miss(hidS5x2)).<br>
list respid hidS5_1 hidS5_4 hidS5x2.

* ============================================================.
* Question ID: S10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S10",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [
*     "f('S10').any('99','97') //soft-screen S10"
*   ],
*   "Question Label": "S10 - In the past 12 months, how if at all, have you interacted with the healthcare system?",
*   "question_attributes": {
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5876"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S10_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "I had a video call with my usual healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "I used a patient portal offered by my healthcare providers’ office to request refills, schedule appointments or upload labs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "I exchanged messages (text, pictures, video, etc.) with a healthcare provider digitally"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "I shared wearable data (e.g., Apple Watch, Garmin, Fitbit, Oura Ring) with my healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I used virtual care/telehealth services (e.g., One Medical, MDLIVE, Teladoc)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "I used retail healthcare services (e.g., Hims/Hers, Nurx, Ro)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "I used a mobile health app for chronic disease management (e.g., Dario, Hinge Health, Livongo, Omada Health, Sword Health)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "I used a digital based tool that helped treat or manage my condition (e.g., Calm, EndeavorRx, Headspace, Talkspace)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "I used a digital solution to help me stay on track with my treatment & condition (e.g., Propeller Health, Kaiku Health)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "I saw my provider in their office face-to-face"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "I used a pharma solution (e.g., brand  website, digital medication coupons / rebates, patient assistance programs)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "I have not sought medical care in the past 12 months",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_97",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Prefer not to disclose",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S10.<br>
* Verify each item is 0/1 (or missing allowed).<br>
do repeat x = S10_1 to S10_11.<br>
  if miss(x) or ~range(x,0,1) flag1 = 1.<br>
end repeat.<br>
compute s10sum = sum(S10_1 to S10_11).<br>
* Exclusive logic: if a regular option is selected, punch-single options 99 or 97 must not be selected.<br>
if (s10sum > 0) and (S10_99 = 1 or S10_97 = 1) flag2 = 1.<br>
* Required: if no regular option selected, at least one of the punch-single options must be selected (question required).<br>
if (s10sum = 0) and (S10_99 = 0 and S10_97 = 0) flag3 = 1.<br>
temporary.<br>
sel if flag1 > 0 or flag2 > 0 or flag3 > 0.<br>
list respid S10_1 to S10_11 S10_99 S10_97 s10sum flag1 flag2 flag3.<br>
del var flag1 flag2 flag3 s10sum.

* ============================================================.
* Question ID: hidS5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidS5 - //hidden to classify below based on S5 response.",
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5872"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidS5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Respiratory Conditions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Type 2 Diabetes"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Heart Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Dermatologic Conditions"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hidS5.<br>compute flag = 0.<br>DO REPEAT x = hidS5_1 TO hidS5_4.<br>  IF (NOT MISSING(x) AND NOT RANGE(x,0,1)) flag = 1.<br>END REPEAT.<br>temporary.<br>SEL IF flag > 0.<br>LIST respid hidS5_1 TO hidS5_4.<br>DEL VAR flag.
```

```

* ============================================================.
* Question ID: hidS5Final
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5Final",
*   "Question Label": "hidS5Final - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5Final",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Respiratory Conditions"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Type 2 Diabetes"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Heart Disease"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Dermatologic Conditions"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5993"
*   }
* }
* -----------------------------------------------------------

tit hidS5Final.<br>compute hidS5Final_chk = 99.<br>DO IF SUM(hidS5_1 TO hidS5_4) = 1.<br>  IF (hidS5_1 = 1) hidS5Final_chk = 1.<br>  IF (hidS5_2 = 1) hidS5Final_chk = 2.<br>  IF (hidS5_3 = 1) hidS5Final_chk = 3.<br>  IF (hidS5_4 = 1) hidS5Final_chk = 4.<br>END IF.<br>temporary.<br>SEL IF (SUM(hidS5_1 TO hidS5_4) = 1 AND (MISSING(hidS5Final) OR hidS5Final_chk <> hidS5Final)) OR (NOT MISSING(hidS5Final) AND NOT ANY(hidS5Final,1,2,3,4)).<br>LIST respid hidS5_1 TO hidS5_4 hidS5Final hidS5Final_chk.<br>DEL VAR hidS5Final_chk.
```

```

* ============================================================.
* Question ID: hidS5FinalNew
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5FinalNew",
*   "Question Label": "hidS5FinalNew - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5FinalNew",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Respiratory Conditions - Asthma"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Respiratory Conditions - COPD"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Type 2 Diabetes"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Heart Disease"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Dermatologic Conditions - Psoriasis"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Dermatologic Conditions - Atopic Dermatitis"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "6018"
*   }
* }
* -----------------------------------------------------------

tit hidS5FinalNew.<br>compute hidS5FinalNew_chk = 0.<br>DO IF SUM(hidS5_1 TO hidS5_4) = 1.<br>  IF (hidS5_1 = 1 AND hidS5x2 = 1) hidS5FinalNew_chk = 1.<br>  IF (hidS5_1 = 1 AND hidS5x2 = 2) hidS5FinalNew_chk = 2.<br>  IF (hidS5_2 = 1) hidS5FinalNew_chk = 3.<br>  IF (hidS5_3 = 1) hidS5FinalNew_chk = 6.<br>  IF (hidS5_4 = 1 AND hidS5x2 = 4) hidS5FinalNew_chk = 4.<br>  IF (hidS5_4 = 1 AND hidS5x2 = 5) hidS5FinalNew_chk = 5.<br>END IF.<br>IF (hidS5FinalNew_chk = 0) hidS5FinalNew_chk = 99.<br>temporary.<br>SEL IF (SUM(hidS5_1 TO hidS5_4) = 1 AND (MISSING(hidS5FinalNew) OR hidS5FinalNew_chk <> hidS5FinalNew)) OR (NOT MISSING(hidS5FinalNew) AND NOT ANY(hidS5FinalNew,1,2,3,4,5,6)).<br>LIST respid hidS5_1 TO hidS5_4 hidS5x2 hidS5FinalNew hidS5FinalNew_chk.<br>DEL VAR hidS5FinalNew_chk.
```

* ============================================================.
* Question ID: S15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S15",
*   "Question Label": "S15 - How old are you?",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [
*     "GetNum('S15_1') < 18 || GetNum('S15_1') > 79 //soft-screen S15"
*   ],
*   "Variable ID": "S15_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "S15_1 (S15 - How old are you?)"
*     }
*   ],
*   "question_attributes": {
*     "LowerLimitType": "GreaterOrEqual",
*     "LowerLimit": "0",
*     "Numeric": "true",
*     "UpperLimit": "99",
*     "AutoCheckOther": "true",
*     "OpenText": "true",
*     "EntityId": "5915",
*     "RightText": "true",
*     "UpperLimitType": "SmallerOrEqual"
*   }
* }
* -----------------------------------------------------------

tit S15.<br>
* Soft-screen: flag respondents with age outside 18-79 (and missing values).<br>
temporary.<br>
sel if miss(S15_1) or ~range(S15_1,18,79).<br>
list respid, S15_1.<br>
* Optional explicit soft-screen flag (keeps results without deleting variable):<br>
compute s15_out_of_range = 0.<br>
if not miss(S15_1) & (S15_1 < 18 or S15_1 > 79) s15_out_of_range = 1.<br>
temporary.<br>
sel if s15_out_of_range = 1.<br>
list respid, S15_1 s15_out_of_range.<br>
del var s15_out_of_range.<br>

* ============================================================.
* Question ID: hidS15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS15",
*   "Question Label": "hidS15 - //hidden clasify below based on S15 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS15",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "GEN Z"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "MILLENNIAL"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "GEN X"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "BOOMER"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5924"
*   }
* }
* -----------------------------------------------------------

tit hidS15.<br>
* Derive generation from age (S15_1).  Confirm cutoffs with study spec before use.<br>
compute hidS15_chk = 0.<br>
if not miss(S15_1) and S15_1 >= 18 and S15_1 <= 25 hidS15_chk = 1. /* GEN Z */<br>
if not miss(S15_1) and S15_1 >= 26 and S15_1 <= 41 hidS15_chk = 2. /* MILLENNIAL */<br>
if not miss(S15_1) and S15_1 >= 42 and S15_1 <= 57 hidS15_chk = 3. /* GEN X */<br>
if not miss(S15_1) and S15_1 >= 58 and S15_1 <= 79 hidS15_chk = 4. /* BOOMER */<br>
temporary.<br>
sel if (not miss(S15_1)) and ( miss(hidS15) or ~range(hidS15,1,4) or (hidS15_chk <> hidS15) ).<br>
list respid, S15_1 hidS15 hidS15_chk.<br>
del var hidS15_chk.<br>

* ============================================================.
* Question ID: S20
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S20",
*   "Question Label": "S20 - What gender do you identify as?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [],
*   "Variable ID": "S20",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Man"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Woman"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Non-binary or other gender identity"
*     },
*     {
*       "Answer Code": "97",
*       "Answer Label": "Prefer not to disclose"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5932"
*   }
* }
* -----------------------------------------------------------

tit S20.<br>
* Validate only when question was asked (entry condition: qSurveyType != 2).<br>
temporary.<br>
sel if (not any(qSurveyType,2)) and ( miss(S20) or ~any(S20,1,2,3,97) ).<br>
list respid, qSurveyType S20.<br>

* ============================================================.
* Question ID: S25
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S25",
*   "Question Label": "S25 - In which state do you currently live?",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "S25",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "AL Alabama",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "AK Alaska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "AZ Arizona",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "AR Arkansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "CA California",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "CO Colorado",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "CT Connecticut",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "DC District of Columbia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "DE Delaware",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "FL Florida",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "GA Georgia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "HI Hawaii",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "ID Idaho",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": "IL Illinois",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "IN Indiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "IA Iowa",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": "KS Kansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": "KY Kentucky",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "19",
*       "Answer Label": "LA Louisiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "20",
*       "Answer Label": "ME Maine",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "21",
*       "Answer Label": "MD Maryland",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "22",
*       "Answer Label": "MA Massachusetts",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "23",
*       "Answer Label": "MI Michigan",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "24",
*       "Answer Label": "MN Minnesota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "25",
*       "Answer Label": "MS Mississippi",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "26",
*       "Answer Label": "MO Missouri",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "27",
*       "Answer Label": "MT Montana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "28",
*       "Answer Label": "NC North Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "29",
*       "Answer Label": "ND North Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "30",
*       "Answer Label": "NE Nebraska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "31",
*       "Answer Label": "NV Nevada",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "32",
*       "Answer Label": "NH New Hampshire",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "33",
*       "Answer Label": "NJ New Jersey",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "34",
*       "Answer Label": "NM New Mexico",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "35",
*       "Answer Label": "NY New York",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "36",
*       "Answer Label": "OH Ohio",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "37",
*       "Answer Label": "OK Oklahoma",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "38",
*       "Answer Label": "OR Oregon",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "39",
*       "Answer Label": "PA Pennsylvania",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "40",
*       "Answer Label": "RI Rhode Island",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "41",
*       "Answer Label": "SC South Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "42",
*       "Answer Label": "SD South Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "43",
*       "Answer Label": "TN Tennessee",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "44",
*       "Answer Label": "TX Texas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "45",
*       "Answer Label": "UT Utah",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "46",
*       "Answer Label": "VT Vermont",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "47",
*       "Answer Label": "VA Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "48",
*       "Answer Label": "WA Washington",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "49",
*       "Answer Label": "WV West Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "50",
*       "Answer Label": "WI Wisconsin",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "51",
*       "Answer Label": "WY Wyoming",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "Dropdown": "true",
*     "EntityId": "5933"
*   }
* }
* -----------------------------------------------------------

tit S25.<br>
temporary.<br>
sel if miss(S25) or ~range(S25,1,51).<br>
list respid, S25.<br>

* ============================================================.
* Question ID: hidS10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS10",
*   "Question Label": "hidS10 - //hidden to classify below based on S10 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS10",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "HIGH DIGITAL USER"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "MODERATE DIGITAL USER"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "LOW DIGITAL USER"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5881"
*   }
* }
* -----------------------------------------------------------

tit hidS10.<br>
compute hidS10_chk = $sysmis.<br>
if S10 = 1 or S10 = 2 hidS10_chk = 1. /* HIGH DIGITAL USER derived from S10 codes 1 or 2 */<br>
if S10 = 3 hidS10_chk = 2. /* MODERATE DIGITAL USER derived from S10 code 3 */<br>
if S10 = 4 hidS10_chk = 3. /* LOW DIGITAL USER derived from S10 code 4 */<br>
exe.<br>
temporary.<br>
sel if miss(hidS10) or ~range(hidS10,1,3) or (hidS10_chk <> hidS10).<br>
list respid hidS10 S10 hidS10_chk.<br>
del var hidS10_chk.<br>
```

* ============================================================.
* Question ID: qtRegion1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qtRegion1",
*   "Question Label": "qtRegion1 - // hidden question storing region for quota purposes",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "qtRegion1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Northeast"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Midwest"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "South"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "West"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "5935"
*   }
* }
* -----------------------------------------------------------

* qtRegion1 - hidden region quota check.<br>TEMPORARY.<br*SELECT IF MISSING(qtRegion1) OR NOT (qtRegion1 >= 1 AND qtRegion1 <= 4).<br>LIST respid qtRegion1.<br>
```

```

* ============================================================.
* Question ID: Qual
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "Qual",
*   "Question Label": "Qual - Your responses have qualified you for this research. This survey should take approximately 10 minutes to complete.  Are you willing to participate?  ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [
*     "f('Qual').any('2') //soft-screen Qual"
*   ],
*   "Variable ID": "Qual",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Yes",
*       "answer_attributes": {
*         "ColumnWidth": "100",
*         "ListSource": "list_yesno"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "No",
*       "answer_attributes": {
*         "ColumnWidth": "100",
*         "ListSource": "list_yesno"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5940"
*   }
* }
* -----------------------------------------------------------

* Qual - consent / soft-screen check.<br>TEMPORARY.<br*SELECT IF MISSING(Qual) OR NOT (Qual >= 1 AND Qual <= 2).<br>LIST respid Qual.<br>* Additionally list soft-screen (Qual = 2) for follow-up review.<br>TEMPORARY.<br*SELECT IF Qual = 2.<br>LIST respid Qual.<br>
```

```

* ============================================================.
* Question ID: A5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A5",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "SubHeaderOrder": "Randomize",
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5947"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A5_1",
*       "Question Label": "Finding a primary  healthcare provider online is easy (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_2",
*       "Question Label": "Finding a provider who specializes in my condition online is easy (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_3",
*       "Question Label": "I am able to schedule an appointment with my primary provider in a reasonable timeframe (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_4",
*       "Question Label": "I am able to schedule an appointment with a provider who specializes in my condition in a reasonable timeframe (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_5",
*       "Question Label": "The location of my  healthcare facility is convenient for me (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_6",
*       "Question Label": "Accessing and completing necessary lab tests is convenient (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_7",
*       "Question Label": "Understanding the results of my lab tests is clear and straightforward (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_8",
*       "Question Label": "Obtaining my prescribed medications is hassle-free (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_9",
*       "Question Label": "Digital resources help me easily schedule appointments with my provider (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_10",
*       "Question Label": "Digital resources help me easily communicate with my provider (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_11",
*       "Question Label": "Pharma companies are patient centric and prioritize the needs and preferences of the patient (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_12",
*       "Question Label": "I receive the same quality of care through a telehealth appointment as I do during an in-person office visit (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

* A5 grid validity check - allowed values 1..5 or 97 (Does Not Apply).<br>DO REPEAT x = A5_1 TO A5_12.<br>  IF MISSING(x) OR NOT (x IN (1 2 3 4 5 97)) flagA5 = 1.<br>END REPEAT.<br>TEMPORARY.<br>SELECT IF (SYSMIS(flagA5) = 0 AND flagA5 > 0).<br>LIST respid A5_1 TO A5_12.<br>DELETE VARIABLES flagA5.<br>
```

```

* ============================================================.
* Question ID: A10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A10",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5958"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A10_1",
*       "Question Label": "I find ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ to be user-friendly and intuitive (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_2",
*       "Question Label": "^tooltip(\"Digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ have helped me maintain better communication with my healthcare providers (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_3",
*       "Question Label": "I believe that ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ provide a cost-effective way to manage my health (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_4",
*       "Question Label": "I experience technical difficulties when using ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_5",
*       "Question Label": "I have to utilize multiple ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ to manage my health (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

* A10 grid validity check - allowed values 1..5 or 97 (Not Applicable).<br>DO REPEAT x = A10_1 TO A10_5.<br>  IF MISSING(x) OR NOT (x IN (1 2 3 4 5 97)) flagA10 = 1.<br>END REPEAT.<br>TEMPORARY.<br>SELECT IF (SYSMIS(flagA10) = 0 AND flagA10 > 0).<br>LIST respid A10_1 TO A10_5.<br>DELETE VARIABLES flagA10.<br>
```

```

* ============================================================.
* Question ID: A15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A15",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ValidationCode": "CheckDK('A15','A15xDK')\n\nif(f('A15').toBoolean())\n{\n\ncheckOS()\n\nvar code = f('A15').domainValues()\n\nfor(var i=0;i<code.length;i++)\n{\nif(code[i]!=98)\n{\n\tif(!f('A15')[code[i]].toBoolean())\n\t\t{\n\t\terrorMsg('A15err1')\n\t\t}\n}\n\n}\n\nif(f('A15')['98'].any('1'))\n{\nerrorMsg('A15err2')\n}\n\n}",
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5999"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A15_1",
*       "Question Label": "Telehealth platforms for virtual consultations (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_2",
*       "Question Label": "Mobile health apps for chronic disease management (e.g., diabetes, asthma) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_3",
*       "Question Label": "Wearable devices for health (e.g., heart rate, oxygen level, sleep, steps) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_4",
*       "Question Label": "Patient portals for accessing healthcare information and resources (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_5",
*       "Question Label": "Websites for accessing healthcare information and resources (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_6",
*       "Question Label": "At-home diagnostic testing kits for personalized health insights (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_7",
*       "Question Label": "Digital therapeutics for mental health support (e.g., anxiety, depression) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_8",
*       "Question Label": "Health management platforms that are integrated with my health provider’s electronic health records (EHR) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_9",
*       "Question Label": "Remote health monitoring tools to keep track of your health conditions (e.g. blood sugar monitors, heart rate monitors etc.) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_10",
*       "Question Label": "AI-driven health assistants for personalized health advice (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_11",
*       "Question Label": "Pharma solutions (e.g., brand website, digital coupons, pharma physician finders, patient assistance programs) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_12",
*       "Question Label": "Nutrition and diet planning apps tailored to individual health needs (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_13",
*       "Question Label": "Pharmacy delivery services (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_98",
*       "Question Label": "Other specify (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_98_other",
*       "Question Label": "A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true",
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A15.<br>
**** A15 - completeness (exclude the 'Other' row A15_98) ****<br>
compute A15_total = 13.<br>
compute cnt_A15 = nvalid(A15_1 to A15_13).<br>
compute A15_flag_partial = 0.<br>
if (cnt_A15 > 0 and cnt_A15 <> A15_total) A15_flag_partial = 1.<br>
<br>
**** A15 - range/invalid code checks for main rows (only when answered) ****<br>
compute A15_flag_range = 0.<br>
DO REPEAT x = A15_1 TO A15_13.<br>
  if (not miss(x) and ~range(x,1,3)) A15_flag_range = 1.<br>
END REPEAT.<br>
/* also check A15_98's code if present (allowed codes 1..3 but additional rules below) */<br>
if (not miss(A15_98) and ~range(A15_98,1,3)) A15_flag_range = 1.<br>
<br>
**** A15 - 'Other' row specific checks (A15_98 and A15_98_other) ****<br>
compute A15_flag_other_code = 0.  /* disallowed code for Other = 1 */<br>
compute A15_flag_other_text = 0.  /* selected Other but missing text */<br>
compute A15_flag_other_text2 = 0. /* free-text present without selecting Other */<br>
<br>
if (A15_98 = 1) A15_flag_other_code = 1. /* survey JS: A15_98 = 1 is not allowed */<br>
if (A15_98 in (2,3) and (RTRIM(LTRIM(A15_98_other)) = '')) A15_flag_other_text = 1.<br>
if (miss(A15_98) and RTRIM(LTRIM(A15_98_other)) <> '') A15_flag_other_text2 = 1.<br>
<br>
**** A15 - DK handling per CheckDK('A15','A15xDK') ****<br>
/* If A15xDK = 1, there must be NO answered A15 items (include A15_98_other as an answered item) */<br>
compute A15_flag_DKanswers = 0.<br>
DO REPEAT x = A15_1 TO A15_13 A15_98.<br>
  if (A15xDK = 1 and not miss(x)) A15_flag_DKanswers = 1.<br>
END REPEAT.<br>
if (A15xDK = 1 and RTRIM(LTRIM(A15_98_other)) <> '') A15_flag_DKanswers = 1.<br>
<br>
**** OUTPUT / LISTING OF FAILS ****<br>
/* 1) Partial completion (some of the main rows answered but not all) */<br>
temporary.<br>
sel if A15_flag_partial = 1.<br>
list respid A15_1 to A15_13 A15_98 A15_98_other cnt_A15 A15_total.<br>
<br>
/* 2) Invalid codes in main rows or Other code out of allowed range */<br>
temporary.<br>
sel if A15_flag_range = 1.<br>
list respid A15_1 to A15_13 A15_98.<br>
<br>
/* 3) Other-code specific errors (disallowed code, missing other-text, stray text) */<br>
temporary.<br>
sel if A15_flag_other_code = 1 or A15_flag_other_text = 1 or A15_flag_other_text2 = 1.<br>
list respid A15_98 A15_98_other A15_flag_other_code A15_flag_other_text A15_flag_other_text2.<br>
<br>
/* 4) DK selected but there are answered items (including A15_98_other) */<br>
temporary.<br>
sel if A15_flag_DKanswers = 1.<br>
list respid A15xDK A15_1 to A15_13 A15_98 A15_98_other.<br>
<br>
/* cleanup helper variables */<br>
delete variables A15_total cnt_A15 A15_flag_partial A15_flag_range A15_flag_other_code A15_flag_other_text A15_flag_other_text2 A15_flag_DKanswers.<br>

* ============================================================.
* Question ID: A20
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A20",
*   "question_type": "Grid",
*   "entry_conditions": [
*     "/*A20*/ GreaterThan('A15', 1).diff(set('99')).size()>0"
*   ],
*   "conditions": [],
*   "question_attributes": {
*     "PrecodeMask": "GreaterThan('A15', 1).diff(set('99'))",
*     "Carousel": "false",
*     "EntityId": "5964"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A20_1",
*       "Question Label": "Telehealth platforms for virtual consultations (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_2",
*       "Question Label": "Mobile health apps for chronic disease management (e.g., diabetes, asthma) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_3",
*       "Question Label": "Wearable devices for health (e.g., heart rate, oxygen level, sleep, steps) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_4",
*       "Question Label": "Patient portals for accessing healthcare information and resources (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_5",
*       "Question Label": "Websites for accessing healthcare information and resources (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_6",
*       "Question Label": "At-home diagnostic testing kits for personalized health insights (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_7",
*       "Question Label": "Digital therapeutics for mental health support (e.g., anxiety, depression) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_8",
*       "Question Label": "Health management platforms that are integrated with my health provider’s electronic health records (EHR) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_9",
*       "Question Label": "Remote health monitoring tools to keep track of your health conditions (e.g. blood sugar monitors, heart rate monitors etc.) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_10",
*       "Question Label": "AI-driven health assistants for personalized health advice (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_11",
*       "Question Label": "Pharma solutions (e.g., brand website, digital coupons, pharma physician finders, patient assistance programs) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_12",
*       "Question Label": "Nutrition and diet planning apps tailored to individual health needs (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_13",
*       "Question Label": "Pharmacy delivery services (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_98",
*       "Question Label": "^f('A15_98_other')^ (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A20.<br>temporary.<br>* Validate each A20 row only when its corresponding A15 precursor indicates the solution was used (PrecodeMask: GreaterThan('A15',1) excluding 99). If precursor not shown/not used then A20 should be missing.<br>compute flag1 = 0.<br>compute flag2 = 0.<br>do repeat x = A20_1 TO A20_13 / ask = A15_1 TO A15_13.<br>  /* If precursor indicates used (ask>1) then A20 must be present and in range 1..5 */<br>  if (not missing(ask) and ask > 1) and (miss(x) or ~range(x,1,5)) flag1 = 1.<br>  /* If precursor indicates NOT used/shown (miss(ask) or ask<=1 or ask=99) then A20 must be missing */<br>  if ((missing(ask) or ask <= 1 or ask = 99) and (not miss(x))) flag2 = 1.<br>end repeat.<br>* Also validate the A20_98 other text mapping against A15_98_other and value range for A20_98.<br>compute flag3 = 0.<br>if (not miss(A20_98) and ~range(A20_98,1,5)) flag3 = 1.<br>if (A20_98 > 0 and (A15_98_other = '' or missing(A15_98_other))) flag3 = 2.<br>if ((missing(A20_98) or A20_98 = 0) and (A15_98_other <> '' and not missing(A15_98_other))) flag3 = 3.<br>* List any respondents with problems.<br>sel if flag1 > 0 or flag2 > 0.<br>list respid flag1 flag2 A15_1 TO A15_13 A20_1 TO A20_13 A15_98_other A20_98 A20_98_other.<br>sel if flag3 > 0.<br>list respid flag3 A20_98 A15_98_other A20_98_other.<br>* Clean up helper flags.<br>del var flag1 flag2 flag3.<br>

* ============================================================.
* Question ID: A25
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A25",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "/*A25*/ GreaterThan('A20',3).size() > 0"
*   ],
*   "conditions": [],
*   "Question Label": "A25 - What are the top reasons generally that you are satisfied with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you are using or have used?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5966"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A25_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "It is convenient"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "It helps me receive treatment or care more quickly"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "It is cheaper than traditional options"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "It improves my communication with my healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "It improves my engagement with my healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "It improves my ability not to forget to take  to my medication"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "It provides my healthcare provider with more data so that they can personalize my care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "It helps me get the medications I need"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "It improves my overall health"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other Specify",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A25.<br>* Trigger: A25 shown when any A20 response > 3 (somewhat/very satisfied). Create a flag and validate A25 only for those respondents.<br>compute flt = 0.<br>do repeat xx = A20_1 TO A20_13.<br>  if (not missing(xx) and xx > 3) flt = 1.<br>end repeat.<br>if (not missing(A20_98) and A20_98 > 3) flt = 1.<br>execute.<br>* When shown (flt=1) A25 is required: ensure at least one choice selected. We count selections (assumes dichotomous multi variables coded as 0/1).<br>compute cntA25 = SUM(A25_1, A25_2, A25_3, A25_4, A25_5, A25_6, A25_7, A25_8, A25_9, A25_98).<br>temporary.<br>sel if flt = 1 and cntA25 = 0.<br>list respid flt cntA25 A20_1 TO A20_13 A20_98 A25_1 TO A25_9 A25_98 A25_98_other.<br>* If A25 was NOT shown (flt=0) but contains answers -> flag unexpected data.<br>temporary.<br>sel if (flt = 0 and cntA25 > 0).\nlist respid flt cntA25 A20_1 TO A20_13 A20_98 A25_1 TO A25_9 A25_98 A25_98_other.<br>* Other text checks for A25_98.<br>compute flagA25_oe = 0.<br>if (A25_98 > 0 and (A25_98_other = '' or missing(A25_98_other))) flagA25_oe = 1.<br>if ((missing(A25_98) or A25_98 = 0) and (A25_98_other <> '' and not missing(A25_98_other))) flagA25_oe = 2.<br>sel if flagA25_oe > 0.<br>list respid flagA25_oe A25_98 A25_98_other.<br>del var flt cntA25 flagA25_oe.<br>

* ============================================================.
* Question ID: A30
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A30",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "/*A30*/ LessThan('A20',3).size() > 0"
*   ],
*   "conditions": [],
*   "Question Label": "A30 - What are the top reasons generally that you are not satisfied with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you are using/used in the past?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5968"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A30_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "It was hard to use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "I had technical issues"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "It was not easy to access the care that I needed"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "I was not able to schedule an in-person visit with a healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I had data security concerns"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "It couldn’t address my health needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "It was too expensive"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "It didn’t integrate with my healthcare provider’s system"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "I had to use multiple ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ to get what I need/needed"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other Specify",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A30.<br>* Trigger: A30 shown when any A20 response < 3 (codes 1 or 2). Create flag and validate A30 only for those respondents.<br>compute flt = 0.<br>do repeat xx = A20_1 TO A20_13.<br>  if (not missing(xx) and xx < 3) flt = 1.<br>end repeat.<br>if (not missing(A20_98) and A20_98 < 3) flt = 1.<br>execute.<br>* When shown (flt=1) A30 is required: ensure at least one choice selected (assumes dichotomous multi coding 0/1).<br>compute cntA30 = SUM(A30_1, A30_2, A30_3, A30_4, A30_5, A30_6, A30_7, A30_8, A30_9, A30_98).<br>temporary.<br>sel if flt = 1 and cntA30 = 0.<br>list respid flt cntA30 A20_1 TO A20_13 A20_98 A30_1 TO A30_9 A30_98 A30_98_other.<br>* If A30 was NOT shown (flt=0) but contains answers -> flag unexpected data.<br>temporary.<br>sel if (flt = 0 and cntA30 > 0).\nlist respid flt cntA30 A20_1 TO A20_13 A20_98 A30_1 TO A30_9 A30_98 A30_98_other.<br>* Other text checks for A30_98.<br>compute flagA30_oe = 0.<br>if (A30_98 > 0 and (A30_98_other = '' or missing(A30_98_other))) flagA30_oe = 1.<br>if ((missing(A30_98) or A30_98 = 0) and (A30_98_other <> '' and not missing(A30_98_other))) flagA30_oe = 2.<br>sel if flagA30_oe > 0.<br>list respid flagA30_oe A30_98 A30_98_other.<br>del var flt cntA30 flagA30_oe.<br>

* ============================================================.
* Question ID: A35
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A35",
*   "Question Label": "A35 - If a company were to offer all of the following in one solution, how beneficial, if at all, would that be?  Services:  Helping me find a physician Providing patient assistance programs to help those who cannot afford their medication Providing tools or resources to help me access medication (e.g., delivery services, automatic reminders) Education about the conditions that medication treats Support programs to help with adherence (e.g., medication reminders) Telehealth services to connect me to care Easier access for lab testing; at home kits, or scheduling at service centers ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A35",
*   "answers": [
*     {
*       "Answer Code": "97",
*       "Answer Label": "I don’t know"
*     },
*     {
*       "Answer Code": "1",
*       "Answer Label": "Not at all beneficial"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Slightly beneficial"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Moderately beneficial"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Very beneficial"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Extremely beneficial"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6005"
*   }
* }
* -----------------------------------------------------------

tit A35.<br>temporary.<br>sel if miss(A35) or ~any(A35,97,1,2,3,4,5).<br>list respid A35.<br>

* ============================================================.
* Question ID: A15xDK
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A15xDK",
*   "Question Label": "  - -Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A15xDK_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": "I have not used any digital health solutions"
*     }
*   ],
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "AutoCheckOther": "true",
*     "EntityId": "6004"
*   }
* }
* -----------------------------------------------------------

tit A15xDK.<br>
* Validate checkbox coding (expect 0/1) for all option variables including the 'None' (99) option.<br>
compute flag1=0.<br>
DO REPEAT x=A15xDK_1 TO A15xDK_98.<br>
  /* if present, values must be 0 or 1 */<br>
  if (not missing(x) and (x <> 0 and x <> 1)) flag1=1.<br>
END REPEAT.<br>
/* Validate the 'None / 99' checkbox variable for 0/1 if present */<br>
if (not missing(A15xDK_99) and (A15xDK_99 <> 0 and A15xDK_99 <> 1)) flag1=1.<br>
<br>
* Mutual-exclusion: 'None' (A15xDK_99=1) must not be selected together with any other option.<br>
compute cntOther = SUM(A15xDK_1 TO A15xDK_98).<br>
compute flag2=0.<br>
if (A15xDK_99 = 1 and cntOther > 0) flag2=1.<br>
<br>
temporary.<br>
sel if flag1>0 or flag2>0.<br>
list respid flag1 flag2 cntOther A15xDK_1 TO A15xDK_98 A15xDK_99.<br>
del var flag1 flag2 cntOther.<br>

* ============================================================.
* Question ID: A40
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A40",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5974"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A40_1",
*       "Question Label": "Helping me find a physician (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_2",
*       "Question Label": "Providing patient assistance programs to help those who cannot afford their medication (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_3",
*       "Question Label": "Providing tools or resources to help me access medication (e.g., delivery services, automatic reminders) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_4",
*       "Question Label": "Education about the conditions that medication treats (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_5",
*       "Question Label": "Support programs to help with adherence (e.g., medication reminders) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_6",
*       "Question Label": "Telehealth services to connect me to care (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_7",
*       "Question Label": "Easier access for lab testing; at home kits, or scheduling at service centers (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_8",
*       "Question Label": "Reduce the barriers to care that I experience with traditional healthcare process (e.g., long wait times, lack of convenience) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A40.<br>DO REPEAT x = A40_1 A40_2 A40_3 A40_4 A40_5 A40_6 A40_7 A40_8.<br>temporary.<br>sel if miss(x) or ~(x = 97 or range(x,1,5)).<br>list respid x.<br>END REPEAT.

* ============================================================.
* Question ID: B5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5 - Which of the following, if any, would motivate you to use a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "MultiItemsSelectedMinimum": "3",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5913"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Improves convenience in finding healthcare providers"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Increases my access to healthcare providers"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Provides more options to fit healthcare into my lifestyle or schedule"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Allows me to keep track of my health information"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Personalized health insights"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Integration with other digital devices"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Recommendations from healthcare providers"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Provides an easier way to get my medications"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Ability to set and track personal health goals"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Access to virtual consultations or telemedicine"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Provides a convenient way to access lab tests"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "It is a pharma solution or the solution is partnered with a pharma company"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "Nothing would motivate me to use a digital solution",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5.<br>/* Count selections among the standard multi-punch items (exclude the single-punch 'Nothing would motivate' 99) */<br>count selcnt = B5_1 to B5_98 (1).<br><br>/* Enforce minimum selections (MultiItemsSelectedMinimum = 3) unless 'Nothing' (99) was selected */<br>temporary.<br>sel if selcnt < 3 and (B5_99 = 0 or miss(B5_99)).<br>list respid selcnt B5_1 to B5_99.<br><br>/* Ensure 'Nothing would motivate me' (B5_99) is exclusive */<br>temporary.<br>sel if B5_99 = 1 and selcnt > 0.<br>list respid selcnt B5_1 to B5_99.<br><br>/* Other (B5_98) open-text consistency: when Other selected, text must be present; when not selected, text should be blank */<br>temporary.<br>sel if (B5_98 = 1 and trim(B5_98_other) = \"\") or (B5_98 <> 1 and trim(B5_98_other) <> \"\").<br>list respid B5_98 B5_98_other.

* ============================================================.
* Question ID: B10x1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B10x1",
*   "Question Label": "B10x1 - Most Important-Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('B5').toBoolean() && f('B5').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B10x1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Improves convenience in finding healthcare providers"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Increases my access to healthcare providers"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Provides more options to fit healthcare into my lifestyle or schedule"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Allows me to keep track of my health information"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Personalized health insights"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Integration with other digital devices"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Recommendations from healthcare providers"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Provides an easier way to get my medications"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Ability to set and track personal health goals"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Access to virtual consultations or telemedicine"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Provides a convenient way to access lab tests"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "It is a pharma solution or the solution is partnered with a pharma company"
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": "^f('B5_98_other')^",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ValidationCode": "CheckDK3D('B10x1','B10xDK')\nCheckDK3D('B10x2','B10xDK')\nCheckDK3D('B10x3','B10xDK')\n\nif(f('B10x1').toBoolean() || f('B10x2').toBoolean() || f('B10x3').toBoolean())\n{\nif(!QuestionErrors()){\n    var s = new Set();\n    var cnt = 0\n    if(f('B10x1').toBoolean() && f('B10x1').none('99')){\n        s=s.union(f('B10x1'))\n        cnt++\n    }\n    if(f('B10x2').toBoolean() && f('B10x2').none('99')){\n        s=s.union(f('B10x2'))\n        cnt++\n    }\n    if(f('B10x3').toBoolean() && f('B10x3').none('99')){\n        s=s.union(f('B10x3'))\n        cnt++\n    }\n    if(cnt > 0 && s.size() != cnt){\n        errorMsg('b10err')\n    }\n\n//validB10('B10x1','B10x2','B10x3')\n}\n}",
*     "AutoCheckOther": "true",
*     "EntityId": "5948"
*   }
* }
* -----------------------------------------------------------

tit B10x1.<br>
/* Define in-scope respondents: B5 has at least one selection among B5_1..B5_98 and B5_99 (Nothing) not selected */<br>
compute flt = 0.<br>
if sum(B5_1 to B5_98) > 0 and B5_99 = 0 flt = 1.<br>
exe.<br>
<br>
/* Validate B10x1 only when the follow-up was shown and the variable is answered (NotRequired = true => do not flag missing) */<br>
temporary.<br>
sel if flt = 1 and ~miss(B10x1) and not((B10x1 >= 1 and B10x1 <= 12) or B10x1 = 98).<br>
list respid B10x1.<br>
<br>
/* Flag respondents who answered B10x1 even though they were out-of-scope */<br>
temporary.<br>
sel if flt = 0 and ~miss(B10x1).<br>
list respid B10x1.<br>
<br>
/* Duplicate checks across the top-3 picks — only flag duplicates when both fields are answered and in-scope */<br>
compute dupflag = 0.<br>
if flt = 1 and ~miss(B10x1) and ~miss(B10x2) and B10x1 = B10x2 dupflag = 1.<br>
if flt = 1 and ~miss(B10x1) and ~miss(B10x3) and B10x1 = B10x3 dupflag = 1.<br>
if flt = 1 and ~miss(B10x2) and ~miss(B10x3) and B10x2 = B10x3 dupflag = 1.<br>
temporary.<br>
sel if dupflag = 1.<br>
list respid B10x1 B10x2 B10x3 dupflag.<br>
del var dupflag.<br>
<br>
/* Consistency with source multi-select B5: any chosen B10x code must have been selected in B5 */<br>
compute incons = 0.<br>
do repeat bx = B10x1 B10x2 B10x3.<br>
  do repeat code = 1 2 3 4 5 6 7 8 9 10 11 12 98 / b5var = B5_1 B5_2 B5_3 B5_4 B5_5 B5_6 B5_7 B5_8 B5_9 B5_10 B5_11 B5_12 B5_98.<br>
    if flt = 1 and ~miss(bx) and bx = code and b5var <> 1 incons = 1.<br>
  end repeat.<br>
end repeat.<br>
temporary.<br>
sel if incons = 1.<br>
list respid B10x1 B10x2 B10x3 B5_1 to B5_12 B5_98.<br>
del var incons flt.<br>

* ============================================================.
* Question ID: B10x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B10x2",
*   "Question Label": "B10x2 - Second Most Important-Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('B5').toBoolean() && f('B5').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B10x2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Improves convenience in finding healthcare providers"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Increases my access to healthcare providers"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Provides more options to fit healthcare into my lifestyle or schedule"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Allows me to keep track of my health information"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Personalized health insights"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Integration with other digital devices"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Recommendations from healthcare providers"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Provides an easier way to get my medications"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Ability to set and track personal health goals"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Access to virtual consultations or telemedicine"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Provides a convenient way to access lab tests"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "It is a pharma solution or the solution is partnered with a pharma company"
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": "^f('B5_98_other')^",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "AutoCheckOther": "true",
*     "EntityId": "5950"
*   }
* }
* -----------------------------------------------------------

tit B10x2.<br>
/* Define in-scope respondents: B5 has at least one selection among B5_1..B5_98 and B5_99 (Nothing) not selected */<br>
compute flt = 0.<br>
if sum(B5_1 to B5_98) > 0 and B5_99 = 0 flt = 1.<br>
exe.<br>
<br>
/* Validate B10x2 only when the follow-up was shown and the variable is answered (NotRequired = true => do not flag missing) */<br>
temporary.<br>
sel if flt = 1 and ~miss(B10x2) and not((B10x2 >= 1 and B10x2 <= 12) or B10x2 = 98).<br>
list respid B10x2.<br>
<br>
/* Flag respondents who answered B10x2 even though they were out-of-scope */<br>
temporary.<br>
sel if flt = 0 and ~miss(B10x2).<br>
list respid B10x2.<br>
<br>
/* Duplicate checks across the top-3 picks — only flag duplicates when both fields are answered and in-scope */<br>
compute dupflag = 0.<br>
if flt = 1 and ~miss(B10x1) and ~miss(B10x2) and B10x1 = B10x2 dupflag = 1.<br>
if flt = 1 and ~miss(B10x1) and ~miss(B10x3) and B10x1 = B10x3 dupflag = 1.<br>
if flt = 1 and ~miss(B10x2) and ~miss(B10x3) and B10x2 = B10x3 dupflag = 1.<br>
temporary.<br>
sel if dupflag = 1.<br>
list respid B10x1 B10x2 B10x3 dupflag.<br>
del var dupflag.<br>
<br>
/* Consistency with source multi-select B5: any chosen B10x code must have been selected in B5 */<br>
compute incons = 0.<br>
do repeat bx = B10x1 B10x2 B10x3.<br>
  do repeat code = 1 2 3 4 5 6 7 8 9 10 11 12 98 / b5var = B5_1 B5_2 B5_3 B5_4 B5_5 B5_6 B5_7 B5_8 B5_9 B5_10 B5_11 B5_12 B5_98.<br>
    if flt = 1 and ~miss(bx) and bx = code and b5var <> 1 incons = 1.<br>
  end repeat.<br>
end repeat.<br>
temporary.<br>
sel if incons = 1.<br>
list respid B10x1 B10x2 B10x3 B5_1 to B5_12 B5_98.<br>
del var incons flt.<br>

* ============================================================.
* Question ID: B10x3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B10x3",
*   "Question Label": "B10x3 - Third Most Important-Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('B5').toBoolean() && f('B5').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B10x3",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Improves convenience in finding healthcare providers"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Increases my access to healthcare providers"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Provides more options to fit healthcare into my lifestyle or schedule"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Allows me to keep track of my health information"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Personalized health insights"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Integration with other digital devices"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Recommendations from healthcare providers"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Provides an easier way to get my medications"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Ability to set and track personal health goals"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Access to virtual consultations or telemedicine"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Provides a convenient way to access lab tests"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "It is a pharma solution or the solution is partnered with a pharma company"
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": "^f('B5_98_other')^",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "AutoCheckOther": "true",
*     "EntityId": "5951"
*   }
* }
* -----------------------------------------------------------

tit B10x3.<br>
/* Define in-scope respondents: B5 has at least one selection among B5_1..B5_98 and B5_99 (Nothing) not selected */<br>
compute flt = 0.<br>
if sum(B5_1 to B5_98) > 0 and B5_99 = 0 flt = 1.<br>
exe.<br>
<br>
/* Validate B10x3 only when the follow-up was shown and the variable is answered (NotRequired = true => do not flag missing) */<br>
temporary.<br>
sel if flt = 1 and ~miss(B10x3) and not((B10x3 >= 1 and B10x3 <= 12) or B10x3 = 98).<br>
list respid B10x3.<br>
<br>
/* Flag respondents who answered B10x3 even though they were out-of-scope */<br>
temporary.<br>
sel if flt = 0 and ~miss(B10x3).<br>
list respid B10x3.<br>
<br>
/* Duplicate checks across the top-3 picks — only flag duplicates when both fields are answered and in-scope */<br>
compute dupflag = 0.<br>
if flt = 1 and ~miss(B10x1) and ~miss(B10x2) and B10x1 = B10x2 dupflag = 1.<br>
if flt = 1 and ~miss(B10x1) and ~miss(B10x3) and B10x1 = B10x3 dupflag = 1.<br>
if flt = 1 and ~miss(B10x2) and ~miss(B10x3) and B10x2 = B10x3 dupflag = 1.<br>
temporary.<br>
sel if dupflag = 1.<br>
list respid B10x1 B10x2 B10x3 dupflag.<br>
del var dupflag.<br>
<br>
/* Consistency with source multi-select B5: any chosen B10x code must have been selected in B5 */<br>
compute incons = 0.<br>
do repeat bx = B10x1 B10x2 B10x3.<br>
  do repeat code = 1 2 3 4 5 6 7 8 9 10 11 12 98 / b5var = B5_1 B5_2 B5_3 B5_4 B5_5 B5_6 B5_7 B5_8 B5_9 B5_10 B5_11 B5_12 B5_98.<br>
    if flt = 1 and ~miss(bx) and bx = code and b5var <> 1 incons = 1.<br>
  end repeat.<br>
end repeat.<br>
temporary.<br>
sel if incons = 1.<br>
list respid B10x1 B10x2 B10x3 B5_1 to B5_12 B5_98.<br>
del var incons flt.<br>

* ============================================================.
* Question ID: B15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B15",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B15 - What are the main barriers preventing you from using ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ more frequently?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "MultiItemsSelectedMinimum": "3",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5916"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B15_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Current digital solutions don’t address my specific health needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Concerns about privacy and data security"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Find them hard to use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Cost of devices or subscriptions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I don’t know enough about digital health solutions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_15",
*       "answers": [
*         {
*           "Answer Code": "15",
*           "Answer Label": "Unsure how to find a digital health solution that meets my needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Preference for in-person healthcare visits"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Negative past experiences with digital solutions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Limited internet access or connectivity issues"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Lack of endorsement by trusted healthcare professionals"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Is not integrated with my healthcare provider’s system"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Digital solutions do not provide the same level of care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "Cause delays in care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_13",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": "There is not one app, platform or website that addresses all my healthcare needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "None-No barriers ",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B15.<br>
* 1) Per-option code validation (expecting 0/1 for each checkbox). Includes B15_98 (Other code) but excludes B15_99 (None) which is handled separately.<br>
do repeat x = B15_1 B15_2 B15_3 B15_4 B15_5 B15_15 B15_6 B15_7 B15_8 B15_9 B15_10 B15_11 B15_12 B15_13 B15_98.<br>
  if (missing(x) or not range(x,0,1)) flag1 = 1.<br>
end repeat.<br>
* 2) Count selections (include B15_98 if checked). Exclude B15_99 (None) from the count.<br>
count selcount = B15_1 B15_2 B15_3 B15_4 B15_5 B15_15 B15_6 B15_7 B15_8 B15_9 B15_10 B15_11 B15_12 B15_13 B15_98 (1).<br>
* 3) None (B15_99) exclusivity: if None=1 then no other options must be selected.<br>
if B15_99 = 1 and selcount > 0 flag2 = 1.<br>
* 4) Minimum selections required (3) when None not selected.<br>
if (B15_99 = 0 or missing(B15_99)) and selcount < 3 flag3 = 1.<br>
* 5) OE text checks for B15_98_other (two-way): if code selected then text required; if text filled then code must be selected.<br>
if (B15_98 > 0) and (missing(B15_98_other) or ltrim(rtrim(B15_98_other)) = '') flag4 = 1.<br>
if (missing(B15_98) or B15_98 = 0) and (not(missing(B15_98_other)) and ltrim(rtrim(B15_98_other)) <> '') flag5 = 1.<br>
* 6) Report respondents who have any validation flags.<br>
temporary.<br>
sel if sum(flag1 to flag5) > 0.<br>
list respid B15_1 B15_2 B15_3 B15_4 B15_5 B15_15 B15_6 B15_7 B15_8 B15_9 B15_10 B15_11 B15_12 B15_13 B15_98 B15_98_other B15_99 selcount flag1 to flag5.<br>
* Clean up temporary variables.<br>
del var selcount flag1 to flag5.

* ============================================================.
* Question ID: B10xDK
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B10xDK",
*   "Question Label": "  - -Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('B5').toBoolean() && f('B5').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B10xDK_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "AutoCheckOther": "true",
*     "EntityId": "6010"
*   }
* }
* -----------------------------------------------------------

/* B10xDK validation - scoped to respondents who saw B5 (at least one B5 item selected and B5_99 not selected).
   NotRequired: do NOT flag missing B10xDK_99; only validate its value when present.
   NOTE: Replace B5_1 TO B5_10 with the actual B5 item variables if your B5 block uses a different range. */<br>
COMPUTE flt = 0.<br>
IF SUM(B5_1 TO B5_10) > 0 AND (MISSING(B5_99) OR B5_99 = 0) flt = 1.<br>
COMPUTE flag = 0.<br>
/* Only validate B10xDK_99 when respondent was in-scope (flt=1) AND the variable is present (not missing) */<br>
IF flt = 1 AND NOT MISSING(B10xDK_99) AND NOT RANGE(B10xDK_99,0,1) flag = 1.<br>
TEMPORARY.<br>
SEL IF flag = 1.<br>
LIST respid B10xDK_99 B5_1 TO B5_10.<br>
DEL VAR flt flag.<br>
```

* ============================================================.
* Question ID: qCountry
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qCountry",
*   "Question Label": "qCountry - In which country are you currently living?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [],
*   "Variable ID": "qCountry",
*   "answers": [
*     {
*       "Answer Code": "1033",
*       "Answer Label": "United States",
*       "answer_attributes": {
*         "ListSource": "list_yesno"
*       }
*     },
*     {
*       "Answer Code": "99",
*       "Answer Label": "Other",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "HierarchyMode": "Drilldown",
*     "AutoCheckOther": "true",
*     "FieldWidth": "5",
*     "EntityId": "2753912961"
*   }
* }
* -----------------------------------------------------------

tit qCountry.<br>temporary.<br>sel if miss(qCountry) or ~any(qCountry,1033,99).<br>list respid, qCountry.<br><br>/* OE coupling: QB002 is Other - free text */<br>temporary.<br>sel if qCountry = 99 and (QB002 = "" or char.len(QB002) < 2).<br>list respid, qCountry, QB002.<br><br>temporary.<br>sel if qCountry <> 99 and QB002 <> "". <br>list respid, qCountry, QB002.<br>

* ============================================================.
* Question ID: QB002
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "QB002",
*   "Question Label": "QB002 - ^f('qCountry').text()^",
*   "question_type": "Open",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [],
*   "Variable ID": "QB002",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "EntityId": "4896"
*   }
* }
* -----------------------------------------------------------

tit QB002.<br>/* QB002 is the open text shown when qCountry = Other (99). Validate presence/length when qCountry = 99 and ensure empty otherwise. */<br>temporary.<br>sel if qCountry = 99 and (QB002 = "" or char.len(QB002) < 2).<br>list respid, qCountry, QB002.<br><br>temporary.<br>sel if qCountry <> 99 and QB002 <> "". <br>list respid, qCountry, QB002.<br>

* ============================================================.
* Question ID: SPECIALTY
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "SPECIALTY",
*   "question_type": "Single",
*   "entry_conditions": [
*     "false"
*   ],
*   "conditions": [
*     "f('SPECIALTY').any('99') //screen SPECIALITY"
*   ],
*   "Question Label": "SPECIALTY - What is your primary medical specialty?",
*   "question_attributes": {
*     "ValidationCode": "checkOS()",
*     "AutoCheckOther": "true",
*     "EntityId": "967"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "SPECIALTY",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Total"
*         },
*         {
*           "Answer Code": "99",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "SPECIALTY_99_other",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit SPECIALTY.<br>/* Validate main code */<br>temporary.<br>sel if miss(SPECIALTY) or ~any(SPECIALTY,1,99).<br>list respid, SPECIALTY.<br><br>/* Other-Open coupling checks */<br>temporary.<br>sel if SPECIALTY = 99 and (SPECIALTY_99_other = "" or char.len(SPECIALTY_99_other) < 2).<br>list respid, SPECIALTY, SPECIALTY_99_other.<br><br>temporary.<br>sel if SPECIALTY <> 99 and SPECIALTY_99_other <> "". <br>list respid, SPECIALTY, SPECIALTY_99_other.<br>

* ============================================================.
* Question ID: S0
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S0",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [
*     "f('S0').any('3')"
*   ],
*   "Question Label": "S0 - Welcome and thank you for participating in this market research survey. This survey is being conducted by Ipsos, an independent market research agency based in the US, on behalf of a technology company.   We are conducting research about your experiences as a patient and would like to ask you some questions on this topic. The survey will take 10 minutes of your time.  With your consent, your information will only be collected and used for market research and analysis. Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis.  As a member of EphMRA, Ipsos is bound by EphMRA Code of Conduct and all applicable laws protecting your personal data and responses. The study is conducted in compliance with ESOMAR/ EphMRA guidelines.  You have the right to withdraw from the interview at any time. For more information about your rights please see our privacy notice, it is available at here.  Any information you give will be treated in the strictest confidence and results will only be reported back on an aggregated basis. You will receive an honorarium for your participation.   Please confirm that:",
*   "question_attributes": {
*     "ValidationCode": "if(f('S0').isect(nset(2)).size()==1)\n{\nerrorMsg('S0'); \n}",
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "EntityId": "5854"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S0_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "I have read, understood and accept the points above and am happy to proceed with the market research survey on those basis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S0_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "I consent to providing information relating to my health/condition for the purpose of this research"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S0_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "No, I do not want to participate in this research",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S0.<br>/* S0 is a multi with a single-punch opt-out (S0_3). Required question: ensure exclusivity and at least one selection. */<br>compute S0_sum_yes = sum(S0_1, S0_2).<br>compute S0_flag_exclusive = 0.<br>compute S0_flag_missing = 0.<br>if (S0_sum_yes > 0 and S0_3 = 1) S0_flag_exclusive = 1.<br>if (S0_sum_yes = 0 and S0_3 <> 1) S0_flag_missing = 1. /* required - none selected */<br>temporary.<br>sel if S0_flag_exclusive = 1 or S0_flag_missing = 1.<br>list respid, S0_1 S0_2 S0_3 S0_sum_yes S0_flag_exclusive S0_flag_missing.<br>del var S0_sum_yes S0_flag_exclusive S0_flag_missing.<br>

* ============================================================.
* Question ID: S5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [
*     "f('S5').any('97','99') || f('S5').toBoolean() && f('S5').none('1','2','3','4','5','6') //soft-screen S5"
*   ],
*   "Question Label": "S5 - Which, if any, of the following conditions have you been diagnosed with by a healthcare provider?",
*   "question_attributes": {
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5867"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Asthma"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Chronic Obstructive Pulmonary Disease (COPD)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Type 2 Diabetes"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Psoriasis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Eczema/Atopic Dermatitis"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Heart Disease (e.g., coronary artery disease, congenital heart disease, arrhythmia)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "High Blood Pressure/ Hypertension"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Parkinson’s Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Stroke"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Anemia"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Chronic Kidney Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_97",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Prefer not to answer",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "None of the above",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S5.<br>/* S5 multi: ensure at least one option selected (required) and that single-punch options (97,99) are exclusive with other choices and with each other. */<br>compute S5_sum_main = sum(S5_1 to S5_11).<br>compute S5_flag_exclusive = 0.<br>compute S5_flag_both_single = 0.<br>compute S5_flag_missing = 0.<br>if (S5_sum_main > 0 and (S5_97 = 1 or S5_99 = 1)) S5_flag_exclusive = 1.<br>if (S5_97 = 1 and S5_99 = 1) S5_flag_both_single = 1.<br>if (S5_sum_main = 0 and S5_97 <> 1 and S5_99 <> 1) S5_flag_missing = 1. /* required - none selected */<br>temporary.<br>sel if S5_flag_exclusive = 1 or S5_flag_both_single = 1 or S5_flag_missing = 1.<br>list respid, S5_1 to S5_11 S5_97 S5_99 S5_sum_main S5_flag_exclusive S5_flag_both_single S5_flag_missing.<br>del var S5_sum_main S5_flag_exclusive S5_flag_both_single S5_flag_missing.<br>

* ============================================================.
* Question ID: hidS5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidS5 - //hidden to classify below based on S5 response.",
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5872"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidS5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Respiratory Conditions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Type 2 Diabetes"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Heart Disease"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidS5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Dermatologic Conditions"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hidS5.<br>/* Compute expected hidden classification values based on S5 responses. Mapping (based on spec/template):<br>   hidS5_1 (Respiratory) <- S5_1 or S5_2<br>   hidS5_2 (Type 2 Diabetes) <- S5_3<br>   hidS5_3 (Heart Disease) <- S5_6 or S5_9  (as per project mapping example)<br>   hidS5_4 (Dermatologic) <- S5_4 or S5_5<br*/<br>compute hidS5_1_chk = 0.<br>compute hidS5_2_chk = 0.<br>compute hidS5_3_chk = 0.<br>compute hidS5_4_chk = 0.<br>if (S5_1 = 1 or S5_2 = 1) hidS5_1_chk = 1.<br>if (S5_3 = 1) hidS5_2_chk = 1.<br>if (S5_6 = 1 or S5_9 = 1) hidS5_3_chk = 1.<br>if (S5_4 = 1 or S5_5 = 1) hidS5_4_chk = 1.<br><br>/* Compare stored hidden vars to computed checks */<br>temporary.<br>sel if miss(hidS5_1) or ~range(hidS5_1,0,1) or (hidS5_1 <> hidS5_1_chk).<br>list respid, hidS5_1 hidS5_1_chk S5_1 to S5_11 S5_97 S5_99.<br><br>temporary.<br>sel if miss(hidS5_2) or ~range(hidS5_2,0,1) or (hidS5_2 <> hidS5_2_chk).<br>list respid, hidS5_2 hidS5_2_chk S5_1 to S5_11 S5_97 S5_99.<br><br>temporary.<br>sel if miss(hidS5_3) or ~range(hidS5_3,0,1) or (hidS5_3 <> hidS5_3_chk).<br>list respid, hidS5_3 hidS5_3_chk S5_1 to S5_11 S5_97 S5_99.<br><br>temporary.<br>sel if miss(hidS5_4) or ~range(hidS5_4,0,1) or (hidS5_4 <> hidS5_4_chk).<br>list respid, hidS5_4 hidS5_4_chk S5_1 to S5_11 S5_97 S5_99.<br><br>del var hidS5_1_chk hidS5_2_chk hidS5_3_chk hidS5_4_chk.<br>

* ============================================================.
* Question ID: hidS5FinalNew
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5FinalNew",
*   "Question Label": "hidS5FinalNew - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5FinalNew",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Respiratory Conditions - Asthma"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Respiratory Conditions - COPD"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Type 2 Diabetes"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Heart Disease"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Dermatologic Conditions - Psoriasis"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Dermatologic Conditions - Atopic Dermatitis"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "6018"
*   }
* }
* -----------------------------------------------------------

tit hidS5FinalNew - consolidated hidden classification combining hidS5Final and hidS5x2.<br>
/* Compute final consolidated check variable based on hidS5Final and hidS5x2 (intermediate hidden variables) */<br>
compute hidS5FinalNew_chk = 0.<br>
/* Mapping (explicit) - follow the mapping provided in details_normalized */<br>
if (hidS5Final = 1 and hidS5x2 = 1) hidS5FinalNew_chk = 1.  /* Respiratory - Asthma -> 1 */<br>
if (hidS5Final = 1 and hidS5x2 = 2) hidS5FinalNew_chk = 2.  /* Respiratory - COPD -> 2 */<br>
if (hidS5Final = 2) hidS5FinalNew_chk = 3.                  /* Type 2 Diabetes -> 3 */<br>
if (hidS5Final = 3) hidS5FinalNew_chk = 6.                  /* Heart Disease -> 6 */<br>
if (hidS5Final = 4 and hidS5x2 = 4) hidS5FinalNew_chk = 4.  /* Dermatologic - Psoriasis -> 4 */<br>
if (hidS5Final = 4 and hidS5x2 = 5) hidS5FinalNew_chk = 5.  /* Dermatologic - Atopic Dermatitis -> 5 */<br>
exe.<br>
<br>
temporary.<br>
/* Allowed codes are non-sequential (1,2,3,4,5,6) so use explicit any() check */<br>
sel if miss(hidS5FinalNew) or ~any(hidS5FinalNew,1,2,3,4,5,6) or (hidS5FinalNew_chk <> hidS5FinalNew).<br>
/* List intermediate hidden vars and source hidden vars to aid debugging */<br>
list respid hidS5FinalNew hidS5FinalNew_chk hidS5Final hidS5x2.<br>
del var hidS5FinalNew_chk.<br>
```

```

* ============================================================.
* Question ID: S10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S10",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [
*     "f('S10').any('99','97') //soft-screen S10"
*   ],
*   "Question Label": "S10 - In the past 12 months, how if at all, have you interacted with the healthcare system?",
*   "question_attributes": {
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5876"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S10_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "I had a video call with my usual healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "I used a patient portal offered by my healthcare providers’ office to request refills, schedule appointments or upload labs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "I exchanged messages (text, pictures, video, etc.) with a healthcare provider digitally"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "I shared wearable data (e.g., Apple Watch, Garmin, Fitbit, Oura Ring) with my healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I used virtual care/telehealth services (e.g., One Medical, MDLIVE, Teladoc)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "I used retail healthcare services (e.g., Hims/Hers, Nurx, Ro)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "I used a mobile health app for chronic disease management (e.g., Dario, Hinge Health, Livongo, Omada Health, Sword Health)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "I used a digital based tool that helped treat or manage my condition (e.g., Calm, EndeavorRx, Headspace, Talkspace)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "I used a digital solution to help me stay on track with my treatment & condition (e.g., Propeller Health, Kaiku Health)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "I saw my provider in their office face-to-face"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "I used a pharma solution (e.g., brand  website, digital medication coupons / rebates, patient assistance programs)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "I have not sought medical care in the past 12 months",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "S10_97",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Prefer not to disclose",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S10 - multi-response: interactions with healthcare system (includes exclusive codes 99 and 97).<br>
/* Count number of selections across the multi (binary-coded) variables.
   Assumes S10_1..S10_11, S10_97 and S10_99 exist and take value 1 when selected. */<br>
count s10_cnt = S10_1 to S10_99 (1).<br>
<br>
/* Nothing selected (Question is required) */<br>
tit S10 - Nothing Selected.<br>
temporary.<br>
sel if s10_cnt = 0.<br>
list respid S10_1 to S10_11 S10_97 S10_99 s10_cnt.<br>
<br>
/* Invalid combinations: exclusive single-punch options selected together with others */<br>
temporary.<br>
sel if s10_cnt > 1 and (S10_99 = 1 or S10_97 = 1).<br>
list respid S10_1 to S10_11 S10_97 S10_99 s10_cnt.<br>
<br>
/* Note: conditions included in details_normalized indicate a soft-screen if 99 or 97 are chosen.
   That is a study routing rule; above we still validate requiredness and exclusivity. */<br>
```

```

* ============================================================.
* Question ID: hidS10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS10",
*   "Question Label": "hidS10 - //hidden to classify below based on S10 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS10",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "HIGH DIGITAL USER"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "MODERATE DIGITAL USER"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "LOW DIGITAL USER"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5881"
*   }
* }
* -----------------------------------------------------------

tit hidS10 - derived digital user classification based on S10 items.<br>
/* Compute a digital-use count and derive a chk classification variable.
   Here we consider S10_1..S10_9 to be 'digital' interactions (adjust as required). */<br>
compute s10_digcount = sum(S10_1 to S10_9).<br>
compute hidS10_chk = 3. /* default LOW */<br>
if (s10_digcount >= 5) hidS10_chk = 1. /* HIGH */<br>
if (s10_digcount >= 2 and s10_digcount <= 4) hidS10_chk = 2. /* MODERATE */<br>
exe.<br>
<br>
temporary.<br>
sel if miss(hidS10) or ~any(hidS10,1,2,3) or (hidS10_chk <> hidS10).<br>
list respid hidS10 hidS10_chk s10_digcount S10_1 to S10_9 S10_10 S10_11 S10_97 S10_99.<br>
del var hidS10_chk s10_digcount.<br>
```

```

* ============================================================.
* Question ID: S15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S15",
*   "Question Label": "S15 - How old are you?",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [
*     "GetNum('S15_1') < 18 || GetNum('S15_1') > 79 //soft-screen S15"
*   ],
*   "Variable ID": "S15_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "S15_1 (S15 - How old are you?)"
*     }
*   ],
*   "question_attributes": {
*     "LowerLimitType": "GreaterOrEqual",
*     "LowerLimit": "0",
*     "Numeric": "true",
*     "UpperLimit": "99",
*     "AutoCheckOther": "true",
*     "OpenText": "true",
*     "EntityId": "5915",
*     "RightText": "true",
*     "UpperLimitType": "SmallerOrEqual"
*   }
* }
* -----------------------------------------------------------

tit S15 - Age (soft-screen if <18 or >79).<br>
/* Numeric open response validation: check missing and soft-screen range 18..79.
   Ensure variable is numeric in dataset. */<br>
temporary.<br>
sel if miss(S15_1) or ~range(S15_1,18,79).<br>
list respid S15_1.<br>
```

* ============================================================.
* Question ID: hidS5Final
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5Final",
*   "Question Label": "hidS5Final - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5Final",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Respiratory Conditions"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Type 2 Diabetes"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Heart Disease"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Dermatologic Conditions"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5993"
*   }
* }
* -----------------------------------------------------------

tit hidS5Final.<br>
* NOTE: Replace the S5 indicator variable names below with the actual S5 source indicator variables from your dataset before running this check.<br>
* Expected source indicator variables (placeholders used here): S5_Respiratory, S5_Type2Diabetes, S5_HeartDisease, S5_DermConditions.<br>
compute s5_count = sum(S5_Respiratory S5_Type2Diabetes S5_HeartDisease S5_DermConditions).<br>
compute hidS5Final_chk = $sysmis.<br>
if (s5_count = 1 and S5_Respiratory = 1) hidS5Final_chk = 1.<br>
if (s5_count = 1 and S5_Type2Diabetes = 1) hidS5Final_chk = 2.<br>
if (s5_count = 1 and S5_HeartDisease = 1) hidS5Final_chk = 3.<br>
if (s5_count = 1 and S5_DermConditions = 1) hidS5Final_chk = 4.<br>
* If more than one S5 indicator is true, mark derived chk as system-missing to indicate ambiguity.<br>
if (s5_count > 1) hidS5Final_chk = $sysmis.<br>
exe.<br>
temporary.<br>
* List records where hidS5Final is missing/invalid or doesn't match computed value.<br>
sel if miss(hidS5Final) or ~any(hidS5Final,1,2,3,4) or (hidS5Final_chk <> hidS5Final).<br>
list respid hidS5Final hidS5Final_chk S5_Respiratory S5_Type2Diabetes S5_HeartDisease S5_DermConditions.<br>
del var hidS5Final_chk s5_count.<br>

* ============================================================.
* Question ID: hidS5x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS5x2",
*   "Question Label": "hidS5x2 - //hidden to classify below based on S5 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS5x2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Asthma"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "COPD"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Psoriasis"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Atopic Dermatitis"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5994"
*   }
* }
* -----------------------------------------------------------

tit hidS5x2.<br>
* NOTE: Replace the S5 sub-condition variable names below with the actual S5 sub-condition indicator variables from your dataset before running this check.<br>
* Expected source indicator variables (placeholders used here): S5_sub_asthma, S5_sub_copd, S5_sub_psoriasis, S5_sub_atopic.<br>
compute s5x2_count = sum(S5_sub_asthma S5_sub_copd S5_sub_psoriasis S5_sub_atopic).<br>
compute hidS5x2_chk = $sysmis.<br>
if (s5x2_count = 1 and S5_sub_asthma = 1) hidS5x2_chk = 1.<br>
if (s5x2_count = 1 and S5_sub_copd = 1) hidS5x2_chk = 2.<br>
if (s5x2_count = 1 and S5_sub_psoriasis = 1) hidS5x2_chk = 4.<br>
if (s5x2_count = 1 and S5_sub_atopic = 1) hidS5x2_chk = 5.<br>
* If more than one sub-condition indicator is true, mark derived chk as system-missing to indicate ambiguity.<br>
if (s5x2_count > 1) hidS5x2_chk = $sysmis.<br>
exe.<br>
temporary.<br>
* List records where hidS5x2 is missing/invalid or doesn't match computed value.<br>
sel if miss(hidS5x2) or ~any(hidS5x2,1,2,4,5) or (hidS5x2_chk <> hidS5x2).<br>
list respid hidS5x2 hidS5x2_chk S5_sub_asthma S5_sub_copd S5_sub_psoriasis S5_sub_atopic.<br>
del var hidS5x2_chk s5x2_count.<br>

* ============================================================.
* Question ID: S25
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S25",
*   "Question Label": "S25 - In which state do you currently live?",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "S25",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "AL Alabama",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "AK Alaska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "AZ Arizona",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "AR Arkansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "CA California",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "CO Colorado",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "CT Connecticut",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "DC District of Columbia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "DE Delaware",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "FL Florida",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "GA Georgia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "HI Hawaii",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "ID Idaho",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": "IL Illinois",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "IN Indiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "IA Iowa",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": "KS Kansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": "KY Kentucky",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "19",
*       "Answer Label": "LA Louisiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "20",
*       "Answer Label": "ME Maine",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "21",
*       "Answer Label": "MD Maryland",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "22",
*       "Answer Label": "MA Massachusetts",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "23",
*       "Answer Label": "MI Michigan",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "24",
*       "Answer Label": "MN Minnesota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "25",
*       "Answer Label": "MS Mississippi",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "26",
*       "Answer Label": "MO Missouri",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "27",
*       "Answer Label": "MT Montana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "28",
*       "Answer Label": "NC North Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "29",
*       "Answer Label": "ND North Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "30",
*       "Answer Label": "NE Nebraska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "31",
*       "Answer Label": "NV Nevada",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "32",
*       "Answer Label": "NH New Hampshire",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "33",
*       "Answer Label": "NJ New Jersey",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "34",
*       "Answer Label": "NM New Mexico",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "35",
*       "Answer Label": "NY New York",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "36",
*       "Answer Label": "OH Ohio",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "37",
*       "Answer Label": "OK Oklahoma",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "38",
*       "Answer Label": "OR Oregon",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "39",
*       "Answer Label": "PA Pennsylvania",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "40",
*       "Answer Label": "RI Rhode Island",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "41",
*       "Answer Label": "SC South Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "42",
*       "Answer Label": "SD South Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "43",
*       "Answer Label": "TN Tennessee",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "44",
*       "Answer Label": "TX Texas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "45",
*       "Answer Label": "UT Utah",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "46",
*       "Answer Label": "VT Vermont",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "47",
*       "Answer Label": "VA Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "48",
*       "Answer Label": "WA Washington",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "49",
*       "Answer Label": "WV West Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "50",
*       "Answer Label": "WI Wisconsin",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "51",
*       "Answer Label": "WY Wyoming",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "Dropdown": "true",
*     "EntityId": "5933"
*   }
* }
* -----------------------------------------------------------

tit S25.<br>temporary.<br>sel if miss(S25) or ~range(S25,1,51).<br>list respid S25.
```

```

* ============================================================.
* Question ID: qtRegion1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qtRegion1",
*   "Question Label": "qtRegion1 - // hidden question storing region for quota purposes",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "qtRegion1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Northeast"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Midwest"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "South"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "West"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "5935"
*   }
* }
* -----------------------------------------------------------

tit qtRegion1.<br>compute qtRegion1_chk = 0.<br>* Map S25 state codes to regions (U.S. Census grouping). Update lists if your coding differs.<br>if S25 in (20,32,46,22,40,7,35,33,39) qtRegion1_chk = 1.  /* Northeast */<br>if S25 in (36,23,15,14,50,24,16,26,29,42,30,17) qtRegion1_chk = 2. /* Midwest */<br>if S25 in (9,21,8,47,49,28,41,11,10,18,43,25,1,37,44,4,19) qtRegion1_chk = 3. /* South */<br>if S25 in (27,13,51,6,34,3,45,31,5,38,48,2,12) qtRegion1_chk = 4. /* West */<br>temporary.<br>sel if miss(qtRegion1) or ~range(qtRegion1,1,4) or (qtRegion1_chk <> qtRegion1).<br>list respid S25 qtRegion1 qtRegion1_chk.<br>del var qtRegion1_chk.
```

```

* ============================================================.
* Question ID: A5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A5",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "SubHeaderOrder": "Randomize",
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5947"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A5_1",
*       "Question Label": "Finding a primary  healthcare provider online is easy (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_2",
*       "Question Label": "Finding a provider who specializes in my condition online is easy (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_3",
*       "Question Label": "I am able to schedule an appointment with my primary provider in a reasonable timeframe (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_4",
*       "Question Label": "I am able to schedule an appointment with a provider who specializes in my condition in a reasonable timeframe (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_5",
*       "Question Label": "The location of my  healthcare facility is convenient for me (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_6",
*       "Question Label": "Accessing and completing necessary lab tests is convenient (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_7",
*       "Question Label": "Understanding the results of my lab tests is clear and straightforward (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_8",
*       "Question Label": "Obtaining my prescribed medications is hassle-free (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_9",
*       "Question Label": "Digital resources help me easily schedule appointments with my provider (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_10",
*       "Question Label": "Digital resources help me easily communicate with my provider (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_11",
*       "Question Label": "Pharma companies are patient centric and prioritize the needs and preferences of the patient (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A5_12",
*       "Question Label": "I receive the same quality of care through a telehealth appointment as I do during an in-person office visit (A5 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Does Not Apply"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A5.<br>compute flag = 0.<br>do repeat x = A5_1 to A5_12.<br>  if miss(x) or (~range(x,1,5) and x <> 97) flag = 1.<br>end repeat.<br>temporary.<br>sel if flag = 1.<br>list respid A5_1 to A5_12.<br>del var flag.
```

* ============================================================.
* Question ID: hidS15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS15",
*   "Question Label": "hidS15 - //hidden clasify below based on S15 response.",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidS15",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "GEN Z"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "MILLENNIAL"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "GEN X"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "BOOMER"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5924"
*   }
* }
* -----------------------------------------------------------

tit hidS15.<br>compute hidS15_chk = $SYSMIS.<br>* Definitive mapping from S15 to hidS15 (1=GEN Z, 2=MILLENNIAL, 3=GEN X, 4=BOOMER).<br>* If S15 already contains generation codes 1-4 use direct mapping; otherwise replace the S15 code lists below with the real source codes.<br>if S15 = 1 hidS15_chk = 1.<br>if S15 = 2 hidS15_chk = 2.<br>if S15 = 3 hidS15_chk = 3.<br>if S15 = 4 hidS15_chk = 4.<br>temporary.<br>sel if miss(hidS15) or ~range(hidS15,1,4) or (hidS15_chk <> hidS15).<br>list respid S15 hidS15 hidS15_chk.<br>del var hidS15_chk.

* ============================================================.
* Question ID: S20
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S20",
*   "Question Label": "S20 - What gender do you identify as?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [],
*   "Variable ID": "S20",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Man"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Woman"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Non-binary or other gender identity"
*     },
*     {
*       "Answer Code": "97",
*       "Answer Label": "Prefer not to disclose"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5932"
*   }
* }
* -----------------------------------------------------------

tit S20.<br>temporary.<br>* Apply entry condition: question asked when qSurveyType is NOT 2.<br>sel if (qSurveyType <> 2) and (miss(S20) or ~any(S20,1,2,3,97)).<br>list respid qSurveyType S20.

* ============================================================.
* Question ID: Qual
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "Qual",
*   "Question Label": "Qual - Your responses have qualified you for this research. This survey should take approximately 10 minutes to complete.  Are you willing to participate?  ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //SCREENER"
*   ],
*   "conditions": [
*     "f('Qual').any('2') //soft-screen Qual"
*   ],
*   "Variable ID": "Qual",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Yes",
*       "answer_attributes": {
*         "ColumnWidth": "100",
*         "ListSource": "list_yesno"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "No",
*       "answer_attributes": {
*         "ColumnWidth": "100",
*         "ListSource": "list_yesno"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5940"
*   }
* }
* -----------------------------------------------------------

tit Qual.<br>temporary.<br>* Validate only for respondents who should have seen the question (qSurveyType <> 2).<br>sel if (qSurveyType <> 2) and (miss(Qual) or ~range(Qual,1,2)).<br>list respid qSurveyType Qual.<br>* Additionally, list soft‑screened respondents (Qual = 2) if required for review.<br>temporary.<br>sel if (qSurveyType <> 2) and Qual = 2.<br>list respid qSurveyType Qual.

* ============================================================.
* Question ID: A10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A10",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5958"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A10_1",
*       "Question Label": "I find ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ to be user-friendly and intuitive (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_2",
*       "Question Label": "^tooltip(\"Digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ have helped me maintain better communication with my healthcare providers (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_3",
*       "Question Label": "I believe that ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ provide a cost-effective way to manage my health (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_4",
*       "Question Label": "I experience technical difficulties when using ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A10_5",
*       "Question Label": "I have to utilize multiple ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ to manage my health (A10 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Moderately Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A10.<br>temporary.<br>DO REPEAT x = A10_1 TO A10_5.<br>  sel if miss(x) or (~range(x,1,5) and x<>97).<br>  list respid, x.<br>END REPEAT.<br>

* ============================================================.
* Question ID: A15xDK
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A15xDK",
*   "Question Label": "  - -Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A15xDK_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": "I have not used any digital health solutions"
*     }
*   ],
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "AutoCheckOther": "true",
*     "EntityId": "6004"
*   }
* }
* -----------------------------------------------------------

tit A15xDK.<br>* Basic checks for DK checkbox used with A15. Ensure value is 0/1 (or missing) and consistency with A15 rows.<br>compute flagDK = 0.<br>/* flagDK=2 means DK coding unexpected; flagDK=1 means DK checked but A15 rows filled */<br>DO REPEAT x = A15_1 TO A15_13.<br>  if (A15xDK_99 = 1 and not miss(x)) flagDK = 1.<br>END REPEAT.<br>if (not miss(A15xDK_99) and A15xDK_99 <> 0 and A15xDK_99 <> 1) flagDK = 2.<br>temporary.<br>sel if flagDK > 0.<br>list respid A15_1 TO A15_13 A15_98 A15xDK_99 flagDK.<br>del var flagDK.<br>

* ============================================================.
* Question ID: A20
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A20",
*   "question_type": "Grid",
*   "entry_conditions": [
*     "/*A20*/ GreaterThan('A15', 1).diff(set('99')).size()>0"
*   ],
*   "conditions": [],
*   "question_attributes": {
*     "PrecodeMask": "GreaterThan('A15', 1).diff(set('99'))",
*     "Carousel": "false",
*     "EntityId": "5964"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A20_1",
*       "Question Label": "Telehealth platforms for virtual consultations (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_2",
*       "Question Label": "Mobile health apps for chronic disease management (e.g., diabetes, asthma) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_3",
*       "Question Label": "Wearable devices for health (e.g., heart rate, oxygen level, sleep, steps) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_4",
*       "Question Label": "Patient portals for accessing healthcare information and resources (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_5",
*       "Question Label": "Websites for accessing healthcare information and resources (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_6",
*       "Question Label": "At-home diagnostic testing kits for personalized health insights (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_7",
*       "Question Label": "Digital therapeutics for mental health support (e.g., anxiety, depression) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_8",
*       "Question Label": "Health management platforms that are integrated with my health provider’s electronic health records (EHR) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_9",
*       "Question Label": "Remote health monitoring tools to keep track of your health conditions (e.g. blood sugar monitors, heart rate monitors etc.) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_10",
*       "Question Label": "AI-driven health assistants for personalized health advice (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_11",
*       "Question Label": "Pharma solutions (e.g., brand website, digital coupons, pharma physician finders, patient assistance programs) (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_12",
*       "Question Label": "Nutrition and diet planning apps tailored to individual health needs (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_13",
*       "Question Label": "Pharmacy delivery services (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A20_98",
*       "Question Label": "^f('A15_98_other')^ (A20 - How satisfied are/were you with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you have used?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very unsatisfied"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat unsatisfied"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither satisfied or unsatisfied"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat satisfied"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Very satisfied"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A20.<br>* A20 should be present only when corresponding A15 row indicates past/current use (A15>1).<br>compute flagA20_miss = 0.<br>compute flagA20_extra = 0.<br>/* Pair each A20 item with its A15 precursor. If precursor>1 then A20 must be 1..5; if precursor<=1 or miss then A20 must be missing. */<br>DO REPEAT x = A20_1 A20_2 A20_3 A20_4 A20_5 A20_6 A20_7 A20_8 A20_9 A20_10 A20_11 A20_12 A20_13 A20_98 /<br>           y = A15_1 A15_2 A15_3 A15_4 A15_5 A15_6 A15_7 A15_8 A15_9 A15_10 A15_11 A15_12 A15_13 A15_98.<br>  if (y > 1 and (miss(x) or ~range(x,1,5))) flagA20_miss = 1.<br>  if ((y <= 1 or miss(y)) and (not miss(x))) flagA20_extra = 1.<br>END REPEAT.<br>temporary.<br>sel if flagA20_miss > 0 or flagA20_extra > 0.<br>list respid A15_1 TO A15_13 A15_98 A20_1 TO A20_13 A20_98 flagA20_miss flagA20_extra.<br>del var flagA20_miss flagA20_extra.<br>

* ============================================================.
* Question ID: A25
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A25",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "/*A25*/ GreaterThan('A20',3).size() > 0"
*   ],
*   "conditions": [],
*   "Question Label": "A25 - What are the top reasons generally that you are satisfied with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you are using or have used?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5966"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A25_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "It is convenient"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "It helps me receive treatment or care more quickly"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "It is cheaper than traditional options"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "It improves my communication with my healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "It improves my engagement with my healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "It improves my ability not to forget to take  to my medication"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "It provides my healthcare provider with more data so that they can personalize my care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "It helps me get the medications I need"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "It improves my overall health"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other Specify",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A25_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A25.<br>* Validate A25 only when any A20 item > 3 (i.e., satisfaction). Ensure multi-punch coding (0/1) and required selection plus OE consistency.<br>compute fltA25 = 0.<br>DO REPEAT t = A20_1 A20_2 A20_3 A20_4 A20_5 A20_6 A20_7 A20_8 A20_9 A20_10 A20_11 A20_12 A20_13 A20_98.<br>  if (not miss(t) and t > 3) fltA25 = 1.<br>END REPEAT.<br>compute flagA25 = 0.<br>DO REPEAT v = A25_1 A25_2 A25_3 A25_4 A25_5 A25_6 A25_7 A25_8 A25_9 A25_98.<br>  /* when shown (fltA25=1) values should be 0/1 or missing; when not shown they should be blank/0 */<br>  if (fltA25 = 1 and not miss(v) and (~range(v,0,1))) flagA25 = 2.<br>  if (fltA25 <> 1 and not miss(v) and v <> 0) flagA25 = 3.<br>END REPEAT.<br>compute cntA25 = SUM(A25_1 TO A25_9, A25_98).<br>if (fltA25 = 1 and cntA25 = 0) flagA25 = 1.<br>* Other-specify checks for A25_98.<br>if (A25_98 = 1 and (missing(A25_98_other) or A25_98_other = '')) flagA25 = 4.<br>if ((missing(A25_98) or A25_98 = 0) and (not missing(A25_98_other) and A25_98_other <> '')) flagA25 = 5.<br>temporary.<br>sel if flagA25 > 0.<br>list respid A20_1 TO A20_13 A20_98 A25_1 TO A25_9 A25_98 A25_98_other fltA25 flagA25 cntA25.<br>del var flagA25 cntA25 fltA25.<br>

* ============================================================.
* Question ID: A30
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A30",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "/*A30*/ LessThan('A20',3).size() > 0"
*   ],
*   "conditions": [],
*   "Question Label": "A30 - What are the top reasons generally that you are not satisfied with the ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ you are using/used in the past?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5968"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A30_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "It was hard to use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "I had technical issues"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "It was not easy to access the care that I needed"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "I was not able to schedule an in-person visit with a healthcare provider"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I had data security concerns"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "It couldn’t address my health needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "It was too expensive"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "It didn’t integrate with my healthcare provider’s system"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "I had to use multiple ^tooltip(\"digital health solutions\",f('ProductProfile')[\"DHSdef\"].label())^ to get what I need/needed"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other Specify",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A30_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A30.<br>* Validate A30 only when any A20 item < 3 (i.e., dissatisfaction). Ensure multi-punch coding (0/1), required selection and OE consistency.<br>compute fltA30 = 0.<br>DO REPEAT t = A20_1 A20_2 A20_3 A20_4 A20_5 A20_6 A20_7 A20_8 A20_9 A20_10 A20_11 A20_12 A20_13 A20_98.<br>  if (not miss(t) and t < 3) fltA30 = 1.<br>END REPEAT.<br>compute flagA30 = 0.<br>DO REPEAT v = A30_1 A30_2 A30_3 A30_4 A30_5 A30_6 A30_7 A30_8 A30_9 A30_98.<br>  if (fltA30 = 1 and not miss(v) and (~range(v,0,1))) flagA30 = 2.<br>  if (fltA30 <> 1 and not miss(v) and v <> 0) flagA30 = 3.<br>END REPEAT.<br>compute cntA30 = SUM(A30_1 TO A30_9, A30_98).<br>if (fltA30 = 1 and cntA30 = 0) flagA30 = 1.<br>* Other-specify checks for A30_98.<br>if (A30_98 = 1 and (missing(A30_98_other) or A30_98_other = '')) flagA30 = 4.<br>if ((missing(A30_98) or A30_98 = 0) and (not missing(A30_98_other) and A30_98_other <> '')) flagA30 = 5.<br>temporary.<br>sel if flagA30 > 0.<br>list respid A20_1 TO A20_13 A20_98 A30_1 TO A30_9 A30_98 A30_98_other fltA30 flagA30 cntA30.<br>del var flagA30 cntA30 fltA30.

* ============================================================.
* Question ID: A15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A15",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ValidationCode": "CheckDK('A15','A15xDK')\n\nif(f('A15').toBoolean())\n{\n\ncheckOS()\n\nvar code = f('A15').domainValues()\n\nfor(var i=0;i<code.length;i++)\n{\nif(code[i]!=98)\n{\n\tif(!f('A15')[code[i]].toBoolean())\n\t\t{\n\t\terrorMsg('A15err1')\n\t\t}\n}\n\n}\n\nif(f('A15')['98'].any('1'))\n{\nerrorMsg('A15err2')\n}\n\n}",
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5999"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A15_1",
*       "Question Label": "Telehealth platforms for virtual consultations (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_2",
*       "Question Label": "Mobile health apps for chronic disease management (e.g., diabetes, asthma) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_3",
*       "Question Label": "Wearable devices for health (e.g., heart rate, oxygen level, sleep, steps) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_4",
*       "Question Label": "Patient portals for accessing healthcare information and resources (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_5",
*       "Question Label": "Websites for accessing healthcare information and resources (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_6",
*       "Question Label": "At-home diagnostic testing kits for personalized health insights (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_7",
*       "Question Label": "Digital therapeutics for mental health support (e.g., anxiety, depression) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_8",
*       "Question Label": "Health management platforms that are integrated with my health provider’s electronic health records (EHR) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_9",
*       "Question Label": "Remote health monitoring tools to keep track of your health conditions (e.g. blood sugar monitors, heart rate monitors etc.) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_10",
*       "Question Label": "AI-driven health assistants for personalized health advice (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_11",
*       "Question Label": "Pharma solutions (e.g., brand website, digital coupons, pharma physician finders, patient assistance programs) (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_12",
*       "Question Label": "Nutrition and diet planning apps tailored to individual health needs (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_13",
*       "Question Label": "Pharmacy delivery services (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_98",
*       "Question Label": "Other specify (A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Never used"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Past use"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Current use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A15_98_other",
*       "Question Label": "A15 - Which of the following types of ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ have you used in the past/currently using?",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true",
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A15.<br>
* Compute a flag indicating whether the A15 grid (any row or the DK checkbox) contains any response – this allows NotRequired grids to remain blank without flags.<br>
compute anyA15 = 0.<br>
DO REPEAT v = A15_1 TO A15_13 A15_98 A15xDK_99.<br>
  if (not miss(v)) anyA15 = 1.<br>
END REPEAT.<br>

* Check DK (A15xDK_99) coding validity when grid has any response: should be 0/1 or missing. Flag if other codes present.<br>
compute flagDK = 0.<br>
if (anyA15 = 1 and not miss(A15xDK_99) and A15xDK_99 <> 0 and A15xDK_99 <> 1) flagDK = 1.<br>

* Row-level validation: when anyA15=1 and DK not checked (0 or miss) all non-Other rows must be answered with 1..3.<br>
* If DK checked (A15xDK_99 = 1) then all item rows must be missing.<br>
compute flagRow = 0.<br>
DO REPEAT x = A15_1 TO A15_13.<br>
  /* DK not checked (treat miss as not checked) → require answer 1..3 */<br>
  if (anyA15 = 1 and (miss(A15xDK_99) or A15xDK_99 = 0) and (miss(x) or (~range(x,1,3)))) flagRow = 1.<br>
  /* DK checked → items must be blank */<br>
  if (anyA15 = 1 and A15xDK_99 = 1 and not miss(x)) flagRow = 2.<br>
END REPEAT.<br>

* Other-specify consistency for A15_98 ↔ A15_98_other (only enforce when anyA15=1).<br>
compute flagOE = 0.<br>
* If the respondent selected the Other row but left the open text blank → flagOE=1.<br>
if (anyA15 = 1 and not miss(A15_98) and (A15_98_other = '')) flagOE = 1.<br>
* If the open-text has content but the Other row was not selected → flagOE=2.<br>
if (anyA15 = 1 and miss(A15_98) and (A15_98_other <> '')) flagOE = 2.<br>

temporary.<br>
sel if flagDK > 0 or flagRow > 0 or flagOE > 0.<br>
list respid A15_1 TO A15_13 A15_98 A15_98_other A15xDK_99 flagDK flagRow flagOE.<br>

* Clean up helper variables.<br>
del var flagDK flagRow flagOE anyA15.<br>
```

* ============================================================.
* Question ID: A35
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A35",
*   "Question Label": "A35 - If a company were to offer all of the following in one solution, how beneficial, if at all, would that be?  Services:  Helping me find a physician Providing patient assistance programs to help those who cannot afford their medication Providing tools or resources to help me access medication (e.g., delivery services, automatic reminders) Education about the conditions that medication treats Support programs to help with adherence (e.g., medication reminders) Telehealth services to connect me to care Easier access for lab testing; at home kits, or scheduling at service centers ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A35",
*   "answers": [
*     {
*       "Answer Code": "97",
*       "Answer Label": "I don’t know"
*     },
*     {
*       "Answer Code": "1",
*       "Answer Label": "Not at all beneficial"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Slightly beneficial"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Moderately beneficial"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Very beneficial"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Extremely beneficial"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6005"
*   }
* }
* -----------------------------------------------------------

tit A35.<br>temporary.<br>sel if miss(A35) or ( ~range(A35,1,5) and A35 <> 97 ).<br>list respid A35.<br>

* ============================================================.
* Question ID: A40
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A40",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5974"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A40_1",
*       "Question Label": "Helping me find a physician (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_2",
*       "Question Label": "Providing patient assistance programs to help those who cannot afford their medication (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_3",
*       "Question Label": "Providing tools or resources to help me access medication (e.g., delivery services, automatic reminders) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_4",
*       "Question Label": "Education about the conditions that medication treats (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_5",
*       "Question Label": "Support programs to help with adherence (e.g., medication reminders) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_6",
*       "Question Label": "Telehealth services to connect me to care (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_7",
*       "Question Label": "Easier access for lab testing; at home kits, or scheduling at service centers (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A40_8",
*       "Question Label": "Reduce the barriers to care that I experience with traditional healthcare process (e.g., long wait times, lack of convenience) (A40 - On a scale from 1 to 5, where 1 is not beneficial and 5 is extremely beneficial,  how beneficial, if at all, would it be if a pharma company offered the following: )",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "I Don’t Know"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Moderately Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Beneficial",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A40.<br>/* Validate each grid sub-question: allowed 1..5 or 97 = Don’t know */<br>do repeat x = A40_1 to A40_8.<br>  if miss(x) or ( ~range(x,1,5) and x <> 97 ) flagA40=1.<br>end repeat.<br>temporary.<br>sel if flagA40>0.<br>list respid A40_1 to A40_8 flagA40.<br>delete variables flagA40.<br>

* ============================================================.
* Question ID: B5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5 - Which of the following, if any, would motivate you to use a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "MultiItemsSelectedMinimum": "3",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5913"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Improves convenience in finding healthcare providers"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Increases my access to healthcare providers"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Provides more options to fit healthcare into my lifestyle or schedule"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Allows me to keep track of my health information"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Personalized health insights"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Integration with other digital devices"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Recommendations from healthcare providers"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Provides an easier way to get my medications"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Ability to set and track personal health goals"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Access to virtual consultations or telemedicine"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Provides a convenient way to access lab tests"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "It is a pharma solution or the solution is partnered with a pharma company"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "Nothing would motivate me to use a digital solution",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5.<br>/* Mutual exclusivity: 'Nothing would motivate me' (B5_99) must be exclusive */<br>temporary.<br>!MULTI_B svar=B5_1 evar=B5_99 qnt=B5 ctr= 12 .<br><br>/* Minimum selections: at least 3 selected among B5_1 .. B5_12 (exclude 98 and 99) */<br>!multi_numb svar=B5_1 evar=B5_12 qnt=B5 ctr=3 opr=<.<br><br>/* Other (98) open-text consistency checks */<br>compute B5_flag=0.<br>if B5_98>0 and (B5_98_other = '') B5_flag=1.<br>if (B5_98=0 or miss(B5_98)) and (B5_98_other <> '') B5_flag=2.<br>temporary.<br>sel if B5_flag>0.<br>list respid B5_1 to B5_12 B5_98 B5_98_other B5_99 B5_flag.<br>FREQUENCIES VARIABLES=B5_flag /FORMAT=NOTABLE /ORDER=ANALYSIS.<br>delete variables B5_flag.<br>

* ============================================================.
* Question ID: B10x1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B10x1",
*   "Question Label": "B10x1 - Most Important-Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('B5').toBoolean() && f('B5').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B10x1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Improves convenience in finding healthcare providers"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Increases my access to healthcare providers"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Provides more options to fit healthcare into my lifestyle or schedule"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Allows me to keep track of my health information"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Personalized health insights"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Integration with other digital devices"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Recommendations from healthcare providers"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Provides an easier way to get my medications"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Ability to set and track personal health goals"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Access to virtual consultations or telemedicine"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Provides a convenient way to access lab tests"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "It is a pharma solution or the solution is partnered with a pharma company"
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": "^f('B5_98_other')^",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ValidationCode": "CheckDK3D('B10x1','B10xDK')\nCheckDK3D('B10x2','B10xDK')\nCheckDK3D('B10x3','B10xDK')\n\nif(f('B10x1').toBoolean() || f('B10x2').toBoolean() || f('B10x3').toBoolean())\n{\nif(!QuestionErrors()){\n    var s = new Set();\n    var cnt = 0\n    if(f('B10x1').toBoolean() && f('B10x1').none('99')){\n        s=s.union(f('B10x1'))\n        cnt++\n    }\n    if(f('B10x2').toBoolean() && f('B10x2').none('99')){\n        s=s.union(f('B10x2'))\n        cnt++\n    }\n    if(f('B10x3').toBoolean() && f('B10x3').none('99')){\n        s=s.union(f('B10x3'))\n        cnt++\n    }\n    if(cnt > 0 && s.size() != cnt){\n        errorMsg('b10err')\n    }\n\n//validB10('B10x1','B10x2','B10x3')\n}\n}",
*     "AutoCheckOther": "true",
*     "EntityId": "5948"
*   }
* }
* -----------------------------------------------------------

tit B10x1_B10x2_B10x3 - basic range & uniqueness checks.<br>/* Range check for B10x1/2/3: allow 1..12 and 98 (OE) */<br>temporary.<br>sel if ( not miss(B10x1) and ( ~range(B10x1,1,12) and B10x1 <> 98 ) ).<br>list respid B10x1 B10x2 B10x3.<br>temporary.<br>sel if ( not miss(B10x2) and ( ~range(B10x2,1,12) and B10x2 <> 98 ) ).<br>list respid B10x1 B10x2 B10x3.<br>temporary.<br>sel if ( not miss(B10x3) and ( ~range(B10x3,1,12) and B10x3 <> 98 ) ).<br>list respid B10x1 B10x2 B10x3.<br><br>/* Duplicate picks across the three top-3 variables */<br>compute dup=0.<br>if not miss(B10x1) and not miss(B10x2) and B10x1 = B10x2 dup=1.<br>if not miss(B10x1) and not miss(B10x3) and B10x1 = B10x3 dup=1.<br>if not miss(B10x2) and not miss(B10x3) and B10x2 = B10x3 dup=1.<br>temporary.<br>sel if dup=1.<br>list respid B10x1 B10x2 B10x3 dup.<br>delete variables dup.<br><br>/* Consistency: each B10x pick should have been selected in B5 (or be the Other OE) */<br>compute b10_outside=0.<br>/* Checks for B10x1 */<br>if B10x1 = 1 and (B5_1 <> 1) b10_outside = 1.<br>if B10x1 = 2 and (B5_2 <> 1) b10_outside = 1.<br>if B10x1 = 3 and (B5_3 <> 1) b10_outside = 1.<br>if B10x1 = 4 and (B5_4 <> 1) b10_outside = 1.<br>if B10x1 = 5 and (B5_5 <> 1) b10_outside = 1.<br>if B10x1 = 6 and (B5_6 <> 1) b10_outside = 1.<br>if B10x1 = 7 and (B5_7 <> 1) b10_outside = 1.<br>if B10x1 = 8 and (B5_8 <> 1) b10_outside = 1.<br>if B10x1 = 9 and (B5_9 <> 1) b10_outside = 1.<br>if B10x1 = 10 and (B5_10 <> 1) b10_outside = 1.<br>if B10x1 = 11 and (B5_11 <> 1) b10_outside = 1.<br>if B10x1 = 12 and (B5_12 <> 1) b10_outside = 1.<br>/* OE mapping: if B10x1=98 then B5_98 must have been selected or OE text present */<br>if B10x1 = 98 and ( (B5_98 = 0 or miss(B5_98)) and (B5_98_other = '') ) b10_outside = 1.<br><br>/* Checks for B10x2 */<br>if B10x2 = 1 and (B5_1 <> 1) b10_outside = 1.<br>if B10x2 = 2 and (B5_2 <> 1) b10_outside = 1.<br>if B10x2 = 3 and (B5_3 <> 1) b10_outside = 1.<br>if B10x2 = 4 and (B5_4 <> 1) b10_outside = 1.<br>if B10x2 = 5 and (B5_5 <> 1) b10_outside = 1.<br>if B10x2 = 6 and (B5_6 <> 1) b10_outside = 1.<br>if B10x2 = 7 and (B5_7 <> 1) b10_outside = 1.<br>if B10x2 = 8 and (B5_8 <> 1) b10_outside = 1.<br>if B10x2 = 9 and (B5_9 <> 1) b10_outside = 1.<br>if B10x2 = 10 and (B5_10 <> 1) b10_outside = 1.<br>if B10x2 = 11 and (B5_11 <> 1) b10_outside = 1.<br>if B10x2 = 12 and (B5_12 <> 1) b10_outside = 1.<br>if B10x2 = 98 and ( (B5_98 = 0 or miss(B5_98)) and (B5_98_other = '') ) b10_outside = 1.<br><br>/* Checks for B10x3 */<br>if B10x3 = 1 and (B5_1 <> 1) b10_outside = 1.<br>if B10x3 = 2 and (B5_2 <> 1) b10_outside = 1.<br>if B10x3 = 3 and (B5_3 <> 1) b10_outside = 1.<br>if B10x3 = 4 and (B5_4 <> 1) b10_outside = 1.<br>if B10x3 = 5 and (B5_5 <> 1) b10_outside = 1.<br>if B10x3 = 6 and (B5_6 <> 1) b10_outside = 1.<br>if B10x3 = 7 and (B5_7 <> 1) b10_outside = 1.<br>if B10x3 = 8 and (B5_8 <> 1) b10_outside = 1.<br>if B10x3 = 9 and (B5_9 <> 1) b10_outside = 1.<br>if B10x3 = 10 and (B5_10 <> 1) b10_outside = 1.<br>if B10x3 = 11 and (B5_11 <> 1) b10_outside = 1.<br>if B10x3 = 12 and (B5_12 <> 1) b10_outside = 1.<br>if B10x3 = 98 and ( (B5_98 = 0 or miss(B5_98)) and (B5_98_other = '') ) b10_outside = 1.<br><br>temporary.<br>sel if b10_outside=1.<br>list respid B5_1 to B5_12 B5_98 B5_98_other B10x1 B10x2 B10x3 b10_outside.<br>delete variables b10_outside.<br>

* ============================================================.
* Question ID: B10x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B10x2",
*   "Question Label": "B10x2 - Second Most Important-Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('B5').toBoolean() && f('B5').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B10x2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Improves convenience in finding healthcare providers"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Increases my access to healthcare providers"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Provides more options to fit healthcare into my lifestyle or schedule"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Allows me to keep track of my health information"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Personalized health insights"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Integration with other digital devices"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Recommendations from healthcare providers"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Provides an easier way to get my medications"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Ability to set and track personal health goals"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Access to virtual consultations or telemedicine"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Provides a convenient way to access lab tests"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "It is a pharma solution or the solution is partnered with a pharma company"
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": "^f('B5_98_other')^",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "AutoCheckOther": "true",
*     "EntityId": "5950"
*   }
* }
* -----------------------------------------------------------

tit B10x2 - see combined B10x checks (B10x1 block contains shared checks).<br>/* Additional individual range check already included in B10x1 block; include safety range check here as well */<br>temporary.<br>sel if not miss(B10x2) and ( ~range(B10x2,1,12) and B10x2 <> 98 ).<br>list respid B10x1 B10x2 B10x3.<br>

* ============================================================.
* Question ID: B10x3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B10x3",
*   "Question Label": "B10x3 - Third Most Important-Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('B5').toBoolean() && f('B5').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B10x3",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Improves convenience in finding healthcare providers"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Increases my access to healthcare providers"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Provides more options to fit healthcare into my lifestyle or schedule"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Allows me to keep track of my health information"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Personalized health insights"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Integration with other digital devices"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Recommendations from healthcare providers"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Provides an easier way to get my medications"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Ability to set and track personal health goals"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Access to virtual consultations or telemedicine"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Provides a convenient way to access lab tests"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "It is a pharma solution or the solution is partnered with a pharma company"
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": "^f('B5_98_other')^",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "AutoCheckOther": "true",
*     "EntityId": "5951"
*   }
* }
* -----------------------------------------------------------

tit B10x3 - see combined B10x checks (B10x1 block contains shared checks).<br>/* Additional individual range check for B10x3 */<br>temporary.<br>sel if not miss(B10x3) and ( ~range(B10x3,1,12) and B10x3 <> 98 ).<br>list respid B10x1 B10x2 B10x3.<br>

* ============================================================.
* Question ID: B15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B15",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B15 - What are the main barriers preventing you from using ^tooltip('digital health solutions',f('ProductProfile')['DHSdef'].label())^ more frequently?",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AnswerRequiredType": "Required",
*     "MultiItemsSelectedMinimum": "3",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5916"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B15_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Current digital solutions don’t address my specific health needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Concerns about privacy and data security"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Find them hard to use"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Cost of devices or subscriptions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "I don’t know enough about digital health solutions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_15",
*       "answers": [
*         {
*           "Answer Code": "15",
*           "Answer Label": "Unsure how to find a digital health solution that meets my needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Preference for in-person healthcare visits"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Negative past experiences with digital solutions"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Limited internet access or connectivity issues"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Lack of endorsement by trusted healthcare professionals"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Is not integrated with my healthcare provider’s system"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Digital solutions do not provide the same level of care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "Cause delays in care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_13",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": "There is not one app, platform or website that addresses all my healthcare needs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "None-No barriers ",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B15_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

* B15 multi-response checks: minimum selections, None(99) exclusivity, Other(98) OE presence/absence;<br>
* Mapping reminder: code X -> variable B15_X (includes code 15 -> B15_15; other codes up to 13 and 98/99).;<br>

* 1) Minimum selections (minimum = 3) - count selections among B15_1..B15_98 (exclude None = B15_99).;<br>
COUNT b15_sel = B15_1 TO B15_98 (1).<br>
TEMPORARY.<br>
SELECT IF b15_sel < 3.<br>
LIST respid b15_sel B15_1 TO B15_99.<br>

* 2) None (99) exclusivity and empty-checks - if B15_99 = 1 then no other B15_1..B15_98 should be selected; if nobody selected and B15_99 = 0 flag as missing selection (since question is Required).;<br>
COMPUTE b15_sum = SUM(B15_1 TO B15_98).<br>
COMPUTE b15_none_flag = 0.<br>
IF (b15_sum > 0 AND B15_99 = 1) b15_none_flag = 1. /* None selected together with other items */<br>
IF (b15_sum = 0 AND B15_99 = 0) b15_none_flag = 2. /* Nothing selected at all (should have min 3) */<br>
TEMPORARY.<br>
SELECT IF b15_none_flag > 0.<br>
LIST respid b15_sum B15_1 TO B15_99 b15_none_flag.<br>
FREQUENCIES VARIABLES=b15_none_flag /ORDER=ANALYSIS.<br>

* 3) Other (98) open-text logic - if B15_98 = 1 then B15_98_other must be non-empty; if B15_98 <>1 then OE must be empty.;<br>
TEMPORARY.<br>
SELECT IF (B15_98 = 1 AND (B15_98_other = "" OR CHAR.LENGTH(B15_98_other) < 1)) OR (B15_98 <> 1 AND B15_98_other <> "").<br>
LIST respid B15_98 B15_98_other.<br>

* 4) Optional: show respondents who selected more than a reasonable number (debugging) - not required but useful;<br>
COMPUTE b15_total_possible = 98. /* informational */.<br>

* ============================================================.
* Question ID: B20xDK
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B20xDK",
*   "Question Label": "  - -Of the barriers you just chose, which of the following are the top 3 biggest barriers with 1 being the biggest barrier?",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('B15').toBoolean() && f('B15').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B20xDK_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "AutoCheckOther": "true",
*     "EntityId": "6015"
*   }
* }
* -----------------------------------------------------------

* B20xDK - DK for B20x top-3 picks (code 99). Validate coding and consistency with B20x1/B20x2/B20x3.;<br>
* 1) Domain check (expect 0/1 or missing encoding for DK indicator).;<br>
TEMPORARY.<br>
SELECT IF (NOT MISSING(B20xDK_99) AND B20xDK_99 <> 0 AND B20xDK_99 <> 1).<br>
LIST respid B20xDK_99.<br>

* 2) If DK selected then picks should be missing; if DK not selected but all picks missing while B15 has selections -> flag.;<br>
TEMPORARY.<br>
SELECT IF (B20xDK_99 = 1 AND (NOT MISSING(B20x1) OR NOT MISSING(B20x2) OR NOT MISSING(B20x3))).<br>
LIST respid B20xDK_99 B20x1 B20x2 B20x3.<br>

TEMPORARY.<br>
SELECT IF ((B20xDK_99 = 0 OR MISSING(B20xDK_99)) AND MISSING(B20x1) AND MISSING(B20x2) AND MISSING(B20x3) AND SUM(B15_1 TO B15_98) > 0 AND B15_99 = 0).<br>
LIST respid B20xDK_99 B20x1 B20x2 B20x3 SUM(B15_1 TO B15_98) B15_99.<br>

* End of B20xDK checks.;

* ============================================================.
* Question ID: B20x1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B20x1",
*   "Question Label": "B20x1 - Most Important-Of the barriers you just chose, which of the following are the top 3 biggest barriers with 1 being the biggest barrier?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('B15').toBoolean() && f('B15').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B20x1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Current digital solutions don’t address my specific health needs"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Concerns about privacy and data security"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Find them hard to use"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Cost of devices or subscriptions"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "I don’t know enough about digital health solutions"
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "Unsure how to find a digital health solution that meets my needs"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Preference for in-person healthcare visits"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Negative past experiences with digital solutions"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Limited internet access or connectivity issues"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Lack of endorsement by trusted healthcare professionals"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Is not integrated with my healthcare provider’s system"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Digital solutions do not provide the same level of care"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "Cause delays in care"
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "There is not one app, platform or website that addresses all my healthcare needs"
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": "^f('B15_98_other')^",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ValidationCode": "CheckDK3D('B20x1','B20xDK')\nCheckDK3D('B20x2','B20xDK')\nCheckDK3D('B20x3','B20xDK')\n\nif(f('B20x1').toBoolean() || f('B20x2').toBoolean() || f('B20x3').toBoolean())\n{\nif (!QuestionErrors()) {\n    var s = new Set();\n    var cnt = 0\n    if (f('B20x1').toBoolean() && f('B20x1').none('99')) {\n        s = s.union(f('B20x1'))\n        cnt++\n    }\n    if (f('B20x2').toBoolean() && f('B20x2').none('99')) {\n        s = s.union(f('B20x2'))\n        cnt++\n    }\n    if (f('B20x3').toBoolean() && f('B20x3').none('99')) {\n        s = s.union(f('B20x3'))\n        cnt++\n    }\n    if (cnt > 0 && s.size() != cnt) {\n        errorMsg('b10err')\n    }\n\n//validB10('B20x1','B20x2','B20x3')\n}\n}",
*     "AutoCheckOther": "true",
*     "EntityId": "5952"
*   }
* }
* -----------------------------------------------------------

tit B20x1.<br>
* Gating: only validate B20x top-3 when respondent selected at least one B15 item and did not select B15_99 (None).;<br>
* Gate condition (maps f('B15').toBoolean() && f('B15').none('99')): SUM(B15_1 TO B15_98) > 0 AND B15_99 = 0;<br>
* Mapping table (code -> B15 variable):<br>
* 1 -> B15_1<br>
* 2 -> B15_2<br>
* 3 -> B15_3<br>
* 4 -> B15_4<br>
* 5 -> B15_5<br>
* 15 -> B15_15<br>
* 6 -> B15_6<br>
* 7 -> B15_7<br>
* 8 -> B15_8<br>
* 9 -> B15_9<br>
* 10 -> B15_10<br>
* 11 -> B15_11<br>
* 12 -> B15_12<br>
* 13 -> B15_13<br>
* 98 -> B15_98 (Other) and B15_98_other (open text).<br>
<br>
TEMPORARY.<br>
SELECT IF (SUM(B15_1 TO B15_98) > 0 AND B15_99 = 0).<br>
<br>
* 1) Range / valid code check for B20x1;<br>
SELECT IF (NOT MISSING(B20x1) AND ~ANY(B20x1,1,2,3,4,5,6,7,8,9,10,11,12,13,15,98)).<br>
LIST respid B20x1.<br>
<br>
* 2) Subset check: if a pick (e.g., B20x1) selects a code X then corresponding B15_X must be = 1. Flag when pick points to an item not selected in B15.;<br>
COMPUTE B20x1_subset_flag = 0.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 1 AND B15_1 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 2 AND B15_2 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 3 AND B15_3 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 4 AND B15_4 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 5 AND B15_5 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 15 AND B15_15 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 6 AND B15_6 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 7 AND B15_7 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 8 AND B15_8 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 9 AND B15_9 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 10 AND B15_10 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 11 AND B15_11 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 12 AND B15_12 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 13 AND B15_13 <> 1) B20x1_subset_flag = 1.<br>
IF (NOT MISSING(B20x1) AND B20x1 = 98 AND B15_98 <> 1) B20x1_subset_flag = 1.<br>
<br>
* 3) OE (98) open-text consistency for B20x1 when mapped to B15_98_other (ensure B15_98_other exists and is not blank when 98 is used in pick);<br>
COMPUTE B20x1_98_oe_flag = 0.<br>
IF (B20x1 = 98 AND (RTRIM(LTRIM(B15_98_other)) = '')) B20x1_98_oe_flag = 1.<br>
IF (B15_98 = 1 AND (RTRIM(LTRIM(B15_98_other)) = '') ) B20x1_98_oe_flag = 2.  * If B15_98 selected but OE blank - separate code to show upstream problem.;<br>
<br>
* 4) Combined uniqueness check for top-3 (set-size approach). This logic compares number of non-missing picks to number of distinct non-missing values.;<br>
COMPUTE b20_cnt = (NOT MISSING(B20x1)) + (NOT MISSING(B20x2)) + (NOT MISSING(B20x3)).<br>
COMPUTE b20_unique = 0.<br>
IF (NOT MISSING(B20x1)) b20_unique = b20_unique + 1.<br>
IF (NOT MISSING(B20x2) AND (B20x2 <> B20x1)) b20_unique = b20_unique + 1.<br>
IF (NOT MISSING(B20x3) AND (B20x3 <> B20x1) AND (B20x3 <> B20x2)) b20_unique = b20_unique + 1.<br>
SELECT IF (b20_cnt > 0 AND b20_unique <> b20_cnt).<br>
LIST respid B20x1 B20x2 B20x3 b20_cnt b20_unique.<br>
<br>
* 5) DK consistency: If DK flag (B20xDK_99) = 1 then picks should be empty. Flag violations.;<br>
TEMPORARY.<br>
SELECT IF (SUM(B15_1 TO B15_98) > 0 AND B15_99 = 0).<br>
SELECT IF (NOT MISSING(B20xDK_99) AND B20xDK_99 = 1 AND (NOT MISSING(B20x1) OR NOT MISSING(B20x2) OR NOT MISSING(B20x3))).<br>
LIST respid B20xDK_99 B20x1 B20x2 B20x3.<br>
<br>
* 6) List subset / OE problems found for B20x1 scope;<br>
TEMPORARY.<br>
SELECT IF (B20x1_subset_flag = 1 OR B20x1_98_oe_flag > 0).<br>
LIST respid B20x1 B20x1_subset_flag B20x1_98_oe_flag B15_98 B15_98_other B15_1 TO B15_15.<br>
* End of B20x1 checks.;<br>

* ============================================================.
* Question ID: B20x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B20x2",
*   "Question Label": "B20x2 - Second Most Important-Of the barriers you just chose, which of the following are the top 3 biggest barriers with 1 being the biggest barrier?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('B15').toBoolean() && f('B15').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B20x2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Current digital solutions don’t address my specific health needs"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Concerns about privacy and data security"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Find them hard to use"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Cost of devices or subscriptions"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "I don’t know enough about digital health solutions"
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "Unsure how to find a digital health solution that meets my needs"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Preference for in-person healthcare visits"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Negative past experiences with digital solutions"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Limited internet access or connectivity issues"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Lack of endorsement by trusted healthcare professionals"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Is not integrated with my healthcare provider’s system"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Digital solutions do not provide the same level of care"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "Cause delays in care"
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "There is not one app, platform or website that addresses all my healthcare needs"
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": "^f('B15_98_other')^",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "AutoCheckOther": "true",
*     "EntityId": "5953"
*   }
* }
* -----------------------------------------------------------

tit B20x2.<br>
* Gating: only validate B20x2 when respondent selected at least one B15 item and did not select B15_99 (None).;<br>
TEMPORARY.<br>
SELECT IF (SUM(B15_1 TO B15_98) > 0 AND B15_99 = 0).<br>
<br>
* 1) Range / valid code check for B20x2;<br>
SELECT IF (NOT MISSING(B20x2) AND ~ANY(B20x2,1,2,3,4,5,6,7,8,9,10,11,12,13,15,98)).<br>
LIST respid B20x2.<br>
<br>
* 2) Subset check for B20x2 -> picked code must have been selected in B15;<br>
COMPUTE B20x2_subset_flag = 0.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 1 AND B15_1 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 2 AND B15_2 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 3 AND B15_3 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 4 AND B15_4 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 5 AND B15_5 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 15 AND B15_15 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 6 AND B15_6 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 7 AND B15_7 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 8 AND B15_8 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 9 AND B15_9 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 10 AND B15_10 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 11 AND B15_11 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 12 AND B15_12 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 13 AND B15_13 <> 1) B20x2_subset_flag = 1.<br>
IF (NOT MISSING(B20x2) AND B20x2 = 98 AND B15_98 <> 1) B20x2_subset_flag = 1.<br>
<br>
* 3) OE (98) open-text consistency for B20x2 when 98 selected;<br>
COMPUTE B20x2_98_oe_flag = 0.<br>
IF (B20x2 = 98 AND (RTRIM(LTRIM(B15_98_other)) = '')) B20x2_98_oe_flag = 1.<br>
IF (B15_98 = 1 AND (RTRIM(LTRIM(B15_98_other)) = '') ) B20x2_98_oe_flag = 2.<br>
<br>
* 4) Uniqueness across B20x1..B20x3 (repeat of set-size unique-count logic) - run inside gate so duplication is checked for in-scope respondents.;<br>
COMPUTE b20_cnt = (NOT MISSING(B20x1)) + (NOT MISSING(B20x2)) + (NOT MISSING(B20x3)).<br>
COMPUTE b20_unique = 0.<br>
IF (NOT MISSING(B20x1)) b20_unique = b20_unique + 1.<br>
IF (NOT MISSING(B20x2) AND (B20x2 <> B20x1)) b20_unique = b20_unique + 1.<br>
IF (NOT MISSING(B20x3) AND (B20x3 <> B20x1) AND (B20x3 <> B20x2)) b20_unique = b20_unique + 1.<br>
SELECT IF (b20_cnt > 0 AND b20_unique <> b20_cnt).<br>
LIST respid B20x1 B20x2 B20x3 b20_cnt b20_unique.<br>
<br>
* 5) DK consistency for B20xDK_99: if DK=1 then picks should be empty (flag violations);<br>
TEMPORARY.<br>
SELECT IF (SUM(B15_1 TO B15_98) > 0 AND B15_99 = 0).<br>
SELECT IF (NOT MISSING(B20xDK_99) AND B20xDK_99 = 1 AND (NOT MISSING(B20x1) OR NOT MISSING(B20x2) OR NOT MISSING(B20x3))).<br>
LIST respid B20xDK_99 B20x1 B20x2 B20x3.<br>
<br>
* 6) List subset/OE problems for B20x2 scope;<br>
TEMPORARY.<br>
SELECT IF (B20x2_subset_flag = 1 OR B20x2_98_oe_flag > 0).<br>
LIST respid B20x2 B20x2_subset_flag B20x2_98_oe_flag B15_98 B15_98_other B15_1 TO B15_15.<br>
* End of B20x2 checks.;<br>

* ============================================================.
* Question ID: B20x3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B20x3",
*   "Question Label": "B20x3 - Third Most Important-Of the barriers you just chose, which of the following are the top 3 biggest barriers with 1 being the biggest barrier?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('B15').toBoolean() && f('B15').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B20x3",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Current digital solutions don’t address my specific health needs"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Concerns about privacy and data security"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Find them hard to use"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Cost of devices or subscriptions"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "I don’t know enough about digital health solutions"
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "Unsure how to find a digital health solution that meets my needs"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Preference for in-person healthcare visits"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Negative past experiences with digital solutions"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Limited internet access or connectivity issues"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Lack of endorsement by trusted healthcare professionals"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Is not integrated with my healthcare provider’s system"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Digital solutions do not provide the same level of care"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "Cause delays in care"
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "There is not one app, platform or website that addresses all my healthcare needs"
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": "^f('B15_98_other')^",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "AutoCheckOther": "true",
*     "EntityId": "5954"
*   }
* }
* -----------------------------------------------------------

tit B20x3.<br>
* Gating: only validate B20x3 when respondent selected at least one B15 item and did not select B15_99 (None).;<br>
TEMPORARY.<br>
SELECT IF (SUM(B15_1 TO B15_98) > 0 AND B15_99 = 0).<br>
<br>
* 1) Range / valid code check for B20x3;<br>
SELECT IF (NOT MISSING(B20x3) AND ~ANY(B20x3,1,2,3,4,5,6,7,8,9,10,11,12,13,15,98)).<br>
LIST respid B20x3.<br>
<br>
* 2) Subset check for B20x3 -> picked code must have been selected in B15;<br>
COMPUTE B20x3_subset_flag = 0.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 1 AND B15_1 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 2 AND B15_2 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 3 AND B15_3 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 4 AND B15_4 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 5 AND B15_5 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 15 AND B15_15 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 6 AND B15_6 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 7 AND B15_7 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 8 AND B15_8 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 9 AND B15_9 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 10 AND B15_10 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 11 AND B15_11 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 12 AND B15_12 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 13 AND B15_13 <> 1) B20x3_subset_flag = 1.<br>
IF (NOT MISSING(B20x3) AND B20x3 = 98 AND B15_98 <> 1) B20x3_subset_flag = 1.<br>
<br>
* 3) OE (98) open-text consistency for B20x3 when 98 selected;<br>
COMPUTE B20x3_98_oe_flag = 0.<br>
IF (B20x3 = 98 AND (RTRIM(LTRIM(B15_98_other)) = '')) B20x3_98_oe_flag = 1.<br>
IF (B15_98 = 1 AND (RTRIM(LTRIM(B15_98_other)) = '') ) B20x3_98_oe_flag = 2.<br>
<br>
* 4) Uniqueness across B20x1..B20x3 (set-size unique-count) - run inside gate.;<br>
COMPUTE b20_cnt = (NOT MISSING(B20x1)) + (NOT MISSING(B20x2)) + (NOT MISSING(B20x3)).<br>
COMPUTE b20_unique = 0.<br>
IF (NOT MISSING(B20x1)) b20_unique = b20_unique + 1.<br>
IF (NOT MISSING(B20x2) AND (B20x2 <> B20x1)) b20_unique = b20_unique + 1.<br>
IF (NOT MISSING(B20x3) AND (B20x3 <> B20x1) AND (B20x3 <> B20x2)) b20_unique = b20_unique + 1.<br>
SELECT IF (b20_cnt > 0 AND b20_unique <> b20_cnt).<br>
LIST respid B20x1 B20x2 B20x3 b20_cnt b20_unique.<br>
<br>
* 5) DK consistency for B20xDK_99: if DK=1 then picks should be empty (flag violations);<br>
TEMPORARY.<br>
SELECT IF (SUM(B15_1 TO B15_98) > 0 AND B15_99 = 0).<br>
SELECT IF (NOT MISSING(B20xDK_99) AND B20xDK_99 = 1 AND (NOT MISSING(B20x1) OR NOT MISSING(B20x2) OR NOT MISSING(B20x3))).<br>
LIST respid B20xDK_99 B20x1 B20x2 B20x3.<br>
<br>
* 6) List subset/OE problems for B20x3 scope;<br>
TEMPORARY.<br>
SELECT IF (B20x3_subset_flag = 1 OR B20x3_98_oe_flag > 0).<br>
LIST respid B20x3 B20x3_subset_flag B20x3_98_oe_flag B15_98 B15_98_other B15_1 TO B15_15.<br>
* End of B20x3 checks.;

* ============================================================.
* Question ID: B10xDK
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B10xDK",
*   "Question Label": "  - -Of the motivations you just chose which of the following are the top 3 most important with 1 being the most important?",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('B5').toBoolean() && f('B5').none('99')"
*   ],
*   "conditions": [],
*   "Variable ID": "B10xDK_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AnswerRequiredType": "NotRequired",
*     "AutoCheckOther": "true",
*     "EntityId": "6010"
*   }
* }
* -----------------------------------------------------------

tit B10xDK.<br>
* Gate: only validate respondents who answered the source multi B5 (any of B5_1..B5_98 selected) and did NOT select the 'None' punch B5_99 = 1.<br>
* 1) DK selected but any top-3 picks present (invalid).<br>
TEMPORARY.<br>
SELECT IF (SUM(B5_1 TO B5_98) > 0 AND B5_99 = 0).<br>
SELECT IF (B10xDK_99 = 1 AND (NOT MISSING(B10x1) OR NOT MISSING(B10x2) OR NOT MISSING(B10x3))).<br>
LIST respid B5_1 TO B5_99 B10xDK_99 B10x1 B10x2 B10x3.<br>
<br>
* 2) DK variable contains invalid codes (should be 0/1 or missing).<br>
TEMPORARY.<br>
SELECT IF (SUM(B5_1 TO B5_98) > 0 AND B5_99 = 0).<br>
SELECT IF (NOT MISSING(B10xDK_99) AND ~ANY(B10xDK_99,0,1)).<br>
LIST respid B10xDK_99 B10x1 B10x2 B10x3.<br>
<br>
* 3) DK not selected (or missing) but all top-3 picks are missing — respondent is in-scope (B5 has selections) but provided no picks (flag for review).<br>
TEMPORARY.<br>
SELECT IF (SUM(B5_1 TO B5_98) > 0 AND B5_99 = 0).<br>
SELECT IF ((B10xDK_99 = 0 OR MISSING(B10xDK_99)) AND MISSING(B10x1) AND MISSING(B10x2) AND MISSING(B10x3)).<br>
LIST respid B5_1 TO B5_99 B10xDK_99 B10x1 B10x2 B10x3.<br>
```

* ============================================================.
* Question ID: B25
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B25",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B25 - From your perspective, what factors would be a success for a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^?",
*   "question_attributes": {
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5923"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B25_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Helps me to better manage my condition(s)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B25_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Single website, platform or portal  for my entire healthcare experience"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B25_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Reliable and secure management of personal health data"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B25_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Cost-effective"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B25_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Addresses my specific healthcare need"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B25_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Let’s me connect with a primary healthcare provider or specialist more quickly than in person care"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B25_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Makes accessing health data more convenient"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B25_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Has strong customer service"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B25_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Improves access to prescription refills"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B25_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Increases or improves my engagement with my healthcare"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B25_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "B25_99",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "None of the above",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B25.<br>compute b25_sum = SUM(B25_1, B25_2, B25_3, B25_4, B25_5, B25_6, B25_7, B25_8, B25_9, B25_10, B25_98, B25_99).<br>temporary.<br>sel if b25_sum = 0.<br>list respid B25_1 to B25_10 B25_98 B25_99.<br><br>* None (B25_99) selected together with any other option.<br>temporary.<br>sel if B25_99 = 1 and (SUM(B25_1, B25_2, B25_3, B25_4, B25_5, B25_6, B25_7, B25_8, B25_9, B25_10, B25_98) > 0).<br>list respid B25_1 to B25_10 B25_98 B25_99.<br><br>* Check for invalid values (expecting 0/1 for multi selections).<br>DO REPEAT v = B25_1 B25_2 B25_3 B25_4 B25_5 B25_6 B25_7 B25_8 B25_9 B25_10 B25_98 B25_99.<br>  temporary.<br>  sel if NOT MISSING(v) and ANY(v,0,1) = 0.<br>  list respid v.<br>END REPEAT.<br><br>delete variables b25_sum.

* ============================================================.
* Question ID: B35
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B35",
*   "Question Label": "B35 - In your own words, what is the greatest challenge that a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ could solve for you?",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B35",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ValidationCode": "blankcheckopen();",
*     "EntityId": "5926"
*   }
* }
* -----------------------------------------------------------

tit B35.<br>temporary.<br>sel if B35 = "".<br>list respid B35.

* ============================================================.
* Question ID: C5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "C5",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "AnswerlistOrder": "Randomize",
*     "Disabled": "true",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5889"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "C5_1",
*       "Question Label": "Personalized health insights and recommendations based on your data (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C5_2",
*       "Question Label": "Integration with your existing health records for a comprehensive view (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C5_3",
*       "Question Label": "Ability to consult with healthcare professionals virtually or schedule in person (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C5_4",
*       "Question Label": "A digital platform to track and manage your health metrics over time (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C5_5",
*       "Question Label": "Educational content tailored to your health needs (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C5_6",
*       "Question Label": "Secure options for sharing your health data (e.g., lab test results, notes, insurance cards etc..) with others including your healthcare provider (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C5_8",
*       "Question Label": "Accepts my insurance coverage for services (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C5_9",
*       "Question Label": "Provides access to insurance benefits, claims and payment support (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C5_10",
*       "Question Label": "Provides digital pharmacy options (e.g., online ordering, prescription delivery) (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C5_11",
*       "Question Label": "Telehealth options for primary and specialist healthcare providers (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C5_12",
*       "Question Label": "Online physician finders and scheduling services (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C5_13",
*       "Question Label": "Easier access for lab testing; at home kits, or scheduling at service center (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit C5.<br>* Hidden/disabled grid mirror — validate only when a value is present (question NotRequired). Allowed values 1..5 or 97.<br>DO REPEAT v = C5_1 C5_2 C5_3 C5_4 C5_5 C5_6 C5_8 C5_9 C5_10 C5_11 C5_12 C5_13.<br>  temporary.<br>  sel if NOT MISSING(v) and ANY(v,1,2,3,4,5,97) = 0.<br>  list respid v.<br>END REPEAT.

* ============================================================.
* Question ID: hidC5Ord
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidC5Ord",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidC5Ord - //hidden to store the order",
*   "question_attributes": {
*     "Randomize": "true",
*     "NotRequired": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "LowerLimit": "0",
*     "Numeric": "true",
*     "UpperLimit": "99",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "OpenText": "true",
*     "EntityId": "5884",
*     "AnswerlistOrder": "Randomize",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidC5Ord_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Personalized health insights and recommendations based on your data (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC5Ord_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Integration with your existing health records for a comprehensive view (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC5Ord_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Ability to consult with healthcare professionals virtually or schedule in person (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC5Ord_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "A digital platform to track and manage your health metrics over time (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC5Ord_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Educational content tailored to your health needs (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC5Ord_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Secure options for sharing your health data (e.g., lab test results, notes, insurance cards etc..) with others including your healthcare provider (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC5Ord_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Accepts my insurance coverage for services (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC5Ord_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Provides access to insurance benefits, claims and payment support (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC5Ord_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Provides digital pharmacy options (e.g., online ordering, prescription delivery) (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC5Ord_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Telehealth options for primary and specialist healthcare providers (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC5Ord_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "Online physician finders and scheduling services (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC5Ord_13",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": "Easier access for lab testing; at home kits, or scheduling at service center (hidC5Ord - //hidden to store the order)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hidC5Ord.<br>DO REPEAT x = hidC5Ord_1 hidC5Ord_2 hidC5Ord_3 hidC5Ord_4 hidC5Ord_5 hidC5Ord_6 hidC5Ord_8 hidC5Ord_9 hidC5Ord_10 hidC5Ord_11 hidC5Ord_12 hidC5Ord_13.<br>  temporary.<br>  /* Validate only when a value is present; allow full numeric limits 0..99 as specified */<br>  sel if (NOT MISSING(x) and NOT RANGE(x,0,99)).<br>  list respid x.<br>END REPEAT.<br>

* ============================================================.
* Question ID: hC5x1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hC5x1",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "PrecodeMask": "LessThan('hidC5Ord', 7)",
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5886"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hC5x1_1",
*       "Question Label": "Personalized health insights and recommendations based on your data (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x1_2",
*       "Question Label": "Integration with your existing health records for a comprehensive view (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x1_3",
*       "Question Label": "Ability to consult with healthcare professionals virtually or schedule in person (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x1_4",
*       "Question Label": "A digital platform to track and manage your health metrics over time (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x1_5",
*       "Question Label": "Educational content tailored to your health needs (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x1_6",
*       "Question Label": "Secure options for sharing your health data (e.g., lab test results, notes, insurance cards etc..) with others including your healthcare provider (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x1_8",
*       "Question Label": "Accepts my insurance coverage for services (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x1_9",
*       "Question Label": "Provides access to insurance benefits, claims and payment support (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x1_10",
*       "Question Label": "Provides digital pharmacy options (e.g., online ordering, prescription delivery) (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x1_11",
*       "Question Label": "Telehealth options for primary and specialist healthcare providers (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x1_12",
*       "Question Label": "Online physician finders and scheduling services (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x1_13",
*       "Question Label": "Easier access for lab testing; at home kits, or scheduling at service center (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hC5x1.<br>/* Validate hC5x1 items only when their corresponding hidC5Ord indicates they were shown (PrecodeMask: LessThan('hidC5Ord',7)) */<br>DO REPEAT v = hC5x1_1 hC5x1_2 hC5x1_3 hC5x1_4 hC5x1_5 hC5x1_6 hC5x1_8 hC5x1_9 hC5x1_10 hC5x1_11 hC5x1_12 hC5x1_13 /<br>           o = hidC5Ord_1 hidC5Ord_2 hidC5Ord_3 hidC5Ord_4 hidC5Ord_5 hidC5Ord_6 hidC5Ord_8 hidC5Ord_9 hidC5Ord_10 hidC5Ord_11 hidC5Ord_12 hidC5Ord_13.<br>  temporary.<br>  /* Only validate when the order value is present and < 7 (i.e. this item was shown in the first split) */<br>  sel if (NOT MISSING(o) and o < 7 and (MISSING(v) or ANY(v,1,2,3,4,5,97) = 0)).<br>  list respid v o.<br>END REPEAT.<br>

* ============================================================.
* Question ID: hC5x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hC5x2",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "PrecodeMask": "GreaterThan('hidC5Ord', 6)",
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5888"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hC5x2_1",
*       "Question Label": "Personalized health insights and recommendations based on your data (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x2_2",
*       "Question Label": "Integration with your existing health records for a comprehensive view (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x2_3",
*       "Question Label": "Ability to consult with healthcare professionals virtually or schedule in person (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x2_4",
*       "Question Label": "A digital platform to track and manage your health metrics over time (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x2_5",
*       "Question Label": "Educational content tailored to your health needs (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x2_6",
*       "Question Label": "Secure options for sharing your health data (e.g., lab test results, notes, insurance cards etc..) with others including your healthcare provider (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x2_8",
*       "Question Label": "Accepts my insurance coverage for services (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x2_9",
*       "Question Label": "Provides access to insurance benefits, claims and payment support (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x2_10",
*       "Question Label": "Provides digital pharmacy options (e.g., online ordering, prescription delivery) (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x2_11",
*       "Question Label": "Telehealth options for primary and specialist healthcare providers (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x2_12",
*       "Question Label": "Online physician finders and scheduling services (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC5x2_13",
*       "Question Label": "Easier access for lab testing; at home kits, or scheduling at service center (C5 - If a ^tooltip('digital health solution',f('ProductProfile')['DHSdef'].label())^ offered the following features, how likely on a scale from 1 to 5 where 1 is not at all likely and 5 is extremely likely, how likely would you be to use it?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Not at all likely"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slightly likely"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither unlikely or likely"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Very likely"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Extremely Likely"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hC5x2.<br>/* Validate hC5x2 items only when their corresponding hidC5Ord indicates they were shown (PrecodeMask: GreaterThan('hidC5Ord',6)) */<br>DO REPEAT v = hC5x2_1 hC5x2_2 hC5x2_3 hC5x2_4 hC5x2_5 hC5x2_6 hC5x2_8 hC5x2_9 hC5x2_10 hC5x2_11 hC5x2_12 hC5x2_13 /<br>           o = hidC5Ord_1 hidC5Ord_2 hidC5Ord_3 hidC5Ord_4 hidC5Ord_5 hidC5Ord_6 hidC5Ord_8 hidC5Ord_9 hidC5Ord_10 hidC5Ord_11 hidC5Ord_12 hidC5Ord_13.<br>  temporary.<br>  /* Only validate when the order value is present and > 6 (i.e. this item was shown in the second split) */<br>  sel if (NOT MISSING(o) and o > 6 and (MISSING(v) or ANY(v,1,2,3,4,5,97) = 0)).<br>  list respid v o.<br>END REPEAT.<br>

* ============================================================.
* Question ID: hidC10Ord
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidC10Ord",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidC10Ord - //hidden to store the order",
*   "question_attributes": {
*     "Randomize": "true",
*     "NotRequired": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "LowerLimit": "0",
*     "Numeric": "true",
*     "UpperLimit": "99",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "OpenText": "true",
*     "EntityId": "5896",
*     "AnswerlistOrder": "Randomize",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidC10Ord_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Personalized health insights and recommendations based on your data (hidC10Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC10Ord_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Ability to consult with healthcare professionals virtually or schedule in person (hidC10Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC10Ord_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "A digital platform to track and manage your health metrics over time (hidC10Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC10Ord_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Educational content tailored to your health needs (hidC10Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC10Ord_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Secure options for sharing your health data (e.g., lab test results, notes, insurance cards etc..) with others including your healthcare provider (hidC10Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC10Ord_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Accepts my insurance coverage for services (hidC10Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC10Ord_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Provides access to insurance benefits, claims and payment support (hidC10Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC10Ord_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Provides digital pharmacy options (e.g., online ordering, prescription delivery) (hidC10Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC10Ord_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Telehealth options for primary and specialist healthcare providers (hidC10Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC10Ord_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "Online physician finders and scheduling services (hidC10Ord - //hidden to store the order)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidC10Ord_13",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": "Easier access for lab testing; at home kits, or scheduling at service center (hidC10Ord - //hidden to store the order)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

COMPUTE flag_hidC10Ord = 0.<br>
DO REPEAT x = hidC10Ord_1 hidC10Ord_3 hidC10Ord_4 hidC10Ord_5 hidC10Ord_6 hidC10Ord_8 hidC10Ord_9 hidC10Ord_10 hidC10Ord_11 hidC10Ord_12 hidC10Ord_13.<br>
  /* NotRequired: only flag values that are present but outside allowed numeric bounds (0-99) */<br>
  IF (NOT MISSING(x) AND (x < 0 OR x > 99)) flag_hidC10Ord = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SELECT IF flag_hidC10Ord > 0.<br>
LIST respid flag_hidC10Ord hidC10Ord_1 hidC10Ord_3 hidC10Ord_4 hidC10Ord_5 hidC10Ord_6 hidC10Ord_8 hidC10Ord_9 hidC10Ord_10 hidC10Ord_11 hidC10Ord_12 hidC10Ord_13.<br>
DELETE VARIABLES flag_hidC10Ord.<br>

* ============================================================.
* Question ID: hC10x1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hC10x1",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "PrecodeMask": "LessThan('hidC10Ord', 7)",
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5900"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hC10x1_1",
*       "Question Label": "Personalized health insights and recommendations based on your data (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x1_3",
*       "Question Label": "Ability to consult with healthcare professionals virtually or schedule in person (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x1_4",
*       "Question Label": "A digital platform to track and manage your health metrics over time (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x1_5",
*       "Question Label": "Educational content tailored to your health needs (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x1_6",
*       "Question Label": "Secure options for sharing your health data (e.g., lab test results, notes, insurance cards etc..) with others including your healthcare provider (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x1_8",
*       "Question Label": "Accepts my insurance coverage for services (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x1_9",
*       "Question Label": "Provides access to insurance benefits, claims and payment support (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x1_10",
*       "Question Label": "Provides digital pharmacy options (e.g., online ordering, prescription delivery) (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x1_11",
*       "Question Label": "Telehealth options for primary and specialist healthcare providers (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x1_12",
*       "Question Label": "Online physician finders and scheduling services (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x1_13",
*       "Question Label": "Easier access for lab testing; at home kits, or scheduling at service center (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

COMPUTE flag_hC10x1 = 0.<br>
DO REPEAT x = hC10x1_1 hC10x1_3 hC10x1_4 hC10x1_5 hC10x1_6 hC10x1_8 hC10x1_9 hC10x1_10 hC10x1_11 hC10x1_12 hC10x1_13.<br>
  /* PrecodeMask: only respondents with hidC10Ord < 7 were shown hC10x1 */<br>
  IF (hidC10Ord < 7 AND (MISSING(x) OR ANY(x,1,2,3,4,5,97) = 0)) flag_hC10x1 = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SELECT IF flag_hC10x1 > 0.<br>
LIST respid flag_hC10x1 hC10x1_1 hC10x1_3 hC10x1_4 hC10x1_5 hC10x1_6 hC10x1_8 hC10x1_9 hC10x1_10 hC10x1_11 hC10x1_12 hC10x1_13.<br>
DELETE VARIABLES flag_hC10x1.<br>

* ============================================================.
* Question ID: hC10x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hC10x2",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "PrecodeMask": "GreaterThan('hidC10Ord', 6)",
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5901"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hC10x2_1",
*       "Question Label": "Personalized health insights and recommendations based on your data (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x2_3",
*       "Question Label": "Ability to consult with healthcare professionals virtually or schedule in person (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x2_4",
*       "Question Label": "A digital platform to track and manage your health metrics over time (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x2_5",
*       "Question Label": "Educational content tailored to your health needs (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x2_6",
*       "Question Label": "Secure options for sharing your health data (e.g., lab test results, notes, insurance cards etc..) with others including your healthcare provider (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x2_8",
*       "Question Label": "Accepts my insurance coverage for services (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x2_9",
*       "Question Label": "Provides access to insurance benefits, claims and payment support (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x2_10",
*       "Question Label": "Provides digital pharmacy options (e.g., online ordering, prescription delivery) (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x2_11",
*       "Question Label": "Telehealth options for primary and specialist healthcare providers (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x2_12",
*       "Question Label": "Online physician finders and scheduling services (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hC10x2_13",
*       "Question Label": "Easier access for lab testing; at home kits, or scheduling at service center (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

COMPUTE flag_hC10x2 = 0.<br>
DO REPEAT x = hC10x2_1 hC10x2_3 hC10x2_4 hC10x2_5 hC10x2_6 hC10x2_8 hC10x2_9 hC10x2_10 hC10x2_11 hC10x2_12 hC10x2_13.<br>
  /* PrecodeMask: only respondents with hidC10Ord > 6 were shown hC10x2 */<br>
  IF (hidC10Ord > 6 AND (MISSING(x) OR ANY(x,1,2,3,4,5,97) = 0)) flag_hC10x2 = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SELECT IF flag_hC10x2 > 0.<br>
LIST respid flag_hC10x2 hC10x2_1 hC10x2_3 hC10x2_4 hC10x2_5 hC10x2_6 hC10x2_8 hC10x2_9 hC10x2_10 hC10x2_11 hC10x2_12 hC10x2_13.<br>
DELETE VARIABLES flag_hC10x2.<br>

* ============================================================.
* Question ID: C10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "C10",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "AnswerlistOrder": "Randomize",
*     "Disabled": "true",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "5902"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "C10_1",
*       "Question Label": "Personalized health insights and recommendations based on your data (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "C10_3",
*       "Question Label": "Ability to consult with healthcare professionals virtually or schedule in person (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "C10_4",
*       "Question Label": "A digital platform to track and manage your health metrics over time (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "C10_5",
*       "Question Label": "Educational content tailored to your health needs (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "C10_6",
*       "Question Label": "Secure options for sharing your health data (e.g., lab test results, notes, insurance cards etc..) with others including your healthcare provider (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "C10_8",
*       "Question Label": "Accepts my insurance coverage for services (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "C10_9",
*       "Question Label": "Provides access to insurance benefits, claims and payment support (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "C10_10",
*       "Question Label": "Provides digital pharmacy options (e.g., online ordering, prescription delivery) (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "C10_11",
*       "Question Label": "Telehealth options for primary and specialist healthcare providers (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "C10_12",
*       "Question Label": "Online physician finders and scheduling services (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     },
*     {
*       "Variable ID": "C10_13",
*       "Question Label": "Easier access for lab testing; at home kits, or scheduling at service center (C10 - If a pharma company were to offer a digital solution with the following attributes how, if at all, would it change your perception of the company?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Much more negative"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat more negative"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "No change"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat more positive"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Much more positive"
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Not Applicable"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

COMPUTE flag_C10 = 0.<br>
DO REPEAT x = C10_1 C10_3 C10_4 C10_5 C10_6 C10_8 C10_9 C10_10 C10_11 C10_12 C10_13.<br>
  /* Hidden/Disabled and NotRequired: only flag when present and value is outside allowed set (1-5 or 97) */<br>
  IF (NOT MISSING(x) AND ANY(x,1,2,3,4,5,97) = 0) flag_C10 = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SELECT IF flag_C10 > 0.<br>
LIST respid flag_C10 C10_1 C10_3 C10_4 C10_5 C10_6 C10_8 C10_9 C10_10 C10_11 C10_12 C10_13.<br>
DELETE VARIABLES flag_C10.<br>

* ============================================================.
* Question ID: C15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "C15",
*   "Question Label": "C15 - If a company were to offer a solution with all of the following features, how likely, if at all, would you be to use?  Services:  Telehealth consultations (primary care and/or specialty) Lab testing (at-home test kits, scheduling at a service center, & mobile phlebotomy options with digital result delivery) Virtual patient experience (patient portal with digital intake, clinical history, eConsents, and digital connection to healthcare services and providers etc.) Prescription fulfillment (including ePrescribing and home delivery) Benefits verification, claims, and payments (online) ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "C15",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Not at all likely"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Slightly likely"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Neither unlikely or likely"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Very likely"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Extremely Likely"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6006"
*   }
* }
* -----------------------------------------------------------

TIT C15.<br>
TEMPORARY.<br>
SELECT IF MISSING(C15) OR NOT RANGE(C15,1,5).<br>
LIST respid C15.<br>

* ============================================================.
* Question ID: C16
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "C16",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "Randomize": "true",
*     "EntityId": "6007"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "C16_1",
*       "Question Label": "Pharmaceutical companies should provide resources to patients to help them get the care and medicines they need (C16 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C16_2",
*       "Question Label": "I value pharmaceutical companies that provide expansive patient support services (e.g., co-pay cards, nurse call centers, insurance coverage questions) (C16 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C16_3",
*       "Question Label": "I prefer to engage with pharmaceutical companies through non-personal / digital channels (i.e. websites) vs. personal channels (phone calls, email) (C16 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C16_4",
*       "Question Label": "I would trust a pharmaceutical company more if they provided additional resources to help me get the care and medication I need (C16 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C16_5",
*       "Question Label": "I would value help from a pharmaceutical company to reduce the healthcare barriers I encounter (e.g., help accessing physicians, increasing access to medications  or reducing price) (C16 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "C16_6",
*       "Question Label": "I expect a pharmaceutical company to provide additional resources to help me get the care and medication I need (C16 - On a scale from 1 to 5, where 1 is strongly disagree and 5 is strongly agree, please rate how much you agree or disagree with the following statements:)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Strongly Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Somewhat Disagree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Neither Disagree or Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Somewhat Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Strongly Agree",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

COMPUTE flag_C16 = 0.<br>
DO REPEAT x = C16_1 C16_2 C16_3 C16_4 C16_5 C16_6.<br>
  IF (MISSING(x) OR NOT RANGE(x,1,5)) flag_C16 = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SELECT IF flag_C16 > 0.<br>
LIST respid flag_C16 C16_1 C16_2 C16_3 C16_4 C16_5 C16_6.<br>
DELETE VARIABLES flag_C16.<br>

* ============================================================.
* Question ID: C20
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "C20",
*   "Question Label": "C20 - In your own words, what role, if any, can pharma have in simplifying the healthcare journey through technology?",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "C20",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ValidationCode": "blankcheckopen();",
*     "EntityId": "5911"
*   }
* }
* -----------------------------------------------------------

tit C20.<br>temporary.<br>sel if C20 = ''.<br>list respid, C20.

* ============================================================.
* Question ID: E5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "E5",
*   "Question Label": "E5 - What type of insurance / health care coverage, if any, do you currently have? ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "E5",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Private medical insurance provided by employer or union (HMO, PPO, POS)"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Your own private medical insurance (medical insurance you bought directly from an insurance agent, broker, or company, or from a group or association you belong to such as AARP)"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Medicare"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Medicaid"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Veteran’s Administration (VA) insurance"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Other military health plan covering civilians"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Health Insurance Exchange or Marketplace (created as a result of the Affordable Care Act (ACA), sometimes referred to as Obamacare)"
*     },
*     {
*       "Answer Code": "97",
*       "Answer Label": "Prefer not to answer",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     },
*     {
*       "Answer Code": "99",
*       "Answer Label": "I do not have insurance / health care coverage",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5864"
*   }
* }
* -----------------------------------------------------------

tit E5.<br>temporary.<br>sel if miss(E5) or ~any(E5,1,2,3,4,5,6,7,97,99).<br>list respid, E5.

* ============================================================.
* Question ID: E10
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "E10",
*   "Question Label": "E10 - What is your current employment status? ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "E10",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Full-time employee"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Working part-time"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Laid-off / looking for work"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Stay-at-home"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Full-time student"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Maternity leave"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Retired"
*     },
*     {
*       "Answer Code": "97",
*       "Answer Label": "Prefer not to answer",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5865"
*   }
* }
* -----------------------------------------------------------

tit E10.<br>temporary.<br>sel if miss(E10) or ~any(E10,1,2,3,4,5,6,7,97).<br>list respid, E10.

* ============================================================.
* Question ID: E15
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "E15",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "E15 - Please select the highest level of education you have completed to date.",
*   "question_attributes": {
*     "ValidationCode": "checkOS();",
*     "AutoCheckOther": "true",
*     "EntityId": "5866"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "E15",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "High school or less"
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Trade / technical / vocational training"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some college, no degree"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Associate degree"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Bachelor’s degree"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Post-graduate degree"
*         },
*         {
*           "Answer Code": "98",
*           "Answer Label": "Other (specify)",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         },
*         {
*           "Answer Code": "97",
*           "Answer Label": "Prefer not to answer",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "E15_98_other",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit E15.<br>temporary.<br>sel if miss(E15) or ~any(E15,1,2,3,4,5,6,98,97).<br>list respid, E15.<br><br>tit E15_98_other (Other-specify consistency).<br>temporary.<br>sel if (E15 = 98 and E15_98_other = '') or (E15 <> 98 and E15_98_other <> '').<br>list respid, E15_98_other.

* ============================================================.
* Question ID: E20
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "E20",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "E20 - Which of the following describes your racial identity?",
*   "question_attributes": {
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "AnswerlistOrder": "Randomize",
*     "Randomize": "true",
*     "EntityId": "5874"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "E20_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "White/Caucasian"
*         }
*       ]
*     },
*     {
*       "Variable ID": "E20_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Black or African American"
*         }
*       ]
*     },
*     {
*       "Variable ID": "E20_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "American Indian or Alaska Native"
*         }
*       ]
*     },
*     {
*       "Variable ID": "E20_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Asian or Asian Indian"
*         }
*       ]
*     },
*     {
*       "Variable ID": "E20_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Native Hawaiian"
*         }
*       ]
*     },
*     {
*       "Variable ID": "E20_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Other Asian or Pacific Islander"
*         }
*       ]
*     },
*     {
*       "Variable ID": "E20_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Another race",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "E20_97",
*       "answers": [
*         {
*           "Answer Code": "97",
*           "Answer Label": "Prefer not to answer",
*           "answer_attributes": {
*             "KeepPosition": "true",
*             "Punch": "Single"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit E20.<br>temporary.<br>!MULTI_B svar=E20_1 evar=E20_97 qnt=E20 ctr=7 .<br><br>* Note: E20 has E20_1..E20_6 and E20_98 as selectable options (ctr=7). E20_97 is the single-punch 'Prefer not to answer' exclusion variable.

* ============================================================.
* Question ID: E25
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "E25",
*   "Question Label": "E25 - After this study concludes, we might find we have a few follow-up questions. If this occurs, may we contact you again? This may include a follow up survey or online conversation. ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "E25",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Yes",
*       "answer_attributes": {
*         "ColumnWidth": "100",
*         "ListSource": "list_yesno"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "No",
*       "answer_attributes": {
*         "ColumnWidth": "100",
*         "ListSource": "list_yesno"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5875"
*   }
* }
* -----------------------------------------------------------

tit E25.<br>temporary.<br>sel if miss(E25) or ~range(E25,1,2).<br>list respid, E25.

* ============================================================.
* Question ID: ProgSpecialty
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgSpecialty",
*   "Question Label": "Specialty - Specialty:",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgSpecialty",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Administration",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Allergy & Immunology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Allied Health Professional (AHP)",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Anesthesiology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Behavioral Medicine",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Cardiology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Clinical Pharmacology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Community Medicine",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Dentistry",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Dermatology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Emergency Medicine",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "Endocrinology, Diabetes & Metabolism",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "Family Medicine/General Practice",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": "Gastroenterology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "Geriatrics",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "Gerontology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": "Hospitalist",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": "Infectious Diseases",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "19",
*       "Answer Label": "Information Technology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "20",
*       "Answer Label": "Internal Medicine",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "21",
*       "Answer Label": "Legal Medicine",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "22",
*       "Answer Label": "Medical Genetics",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "23",
*       "Answer Label": "Medical Physics",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "24",
*       "Answer Label": "Medical Scientist",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "25",
*       "Answer Label": "Medical Student",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "26",
*       "Answer Label": "Nephrology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "27",
*       "Answer Label": "Neurological Surgery",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "28",
*       "Answer Label": "Neurology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "29",
*       "Answer Label": "Neuroscientist",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "30",
*       "Answer Label": "Nuclear Medicine",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "31",
*       "Answer Label": "Nurse",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "32",
*       "Answer Label": "Nurse Practitioner ",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "33",
*       "Answer Label": "Obstetrics & Gynecology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "34",
*       "Answer Label": "Oncology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "35",
*       "Answer Label": "Ophthalmology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "36",
*       "Answer Label": "Orthopedics",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "37",
*       "Answer Label": "Osteopathy",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "38",
*       "Answer Label": "Otolaryngology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "39",
*       "Answer Label": "Pathology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "40",
*       "Answer Label": "Pediatrics",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "41",
*       "Answer Label": "Pharmaceuticals",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "42",
*       "Answer Label": "Pharmacy",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "43",
*       "Answer Label": "Physical Medicine & Rehabilitation",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "44",
*       "Answer Label": "Physician Assistant",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "45",
*       "Answer Label": "Plastic Surgery",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "46",
*       "Answer Label": "Podiatry",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "47",
*       "Answer Label": "Preventive Medicine",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "48",
*       "Answer Label": "Psychiatry",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "49",
*       "Answer Label": "Psychology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "50",
*       "Answer Label": "Psychotherapy",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "51",
*       "Answer Label": "Pulmonology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "52",
*       "Answer Label": "Radiology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "53",
*       "Answer Label": "Rheumatology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "54",
*       "Answer Label": "Surgery",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "55",
*       "Answer Label": "Urology",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "56",
*       "Answer Label": "Veterinary Medicine",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "57",
*       "Answer Label": "Women's Health",
*       "answer_attributes": {
*         "ListSource": "listPriSpecialty"
*       }
*     },
*     {
*       "Answer Code": "998",
*       "Answer Label": "Other",
*       "answer_attributes": {
*         "KeepPosition": "true",
*         "ListSource": "listPriSpecialty"
*       }
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ValidationCode": "RequireCheck('ProgSpecialty')",
*     "HierarchyMode": "Drilldown",
*     "ExcludeTranslation": "true",
*     "Dropdown": "true",
*     "EntityId": "4524"
*   }
* }
* -----------------------------------------------------------

tit ProgSpecialty.<br>
compute flt = $sysmis.<br>
if gid = 15 flt = 1.<br>
temporary.<br>
* NotRequired=true → do not require presence when expected, but if answered it must be a valid code (1..57 or 998). Also should be missing when not expected.<br>
sel if ( flt = 1 and ( ~range(ProgSpecialty,1,57) and ProgSpecialty <> 998 and ~miss(ProgSpecialty) ) )<br>
    or ( miss(flt) and ~miss(ProgSpecialty) ).<br>
list respid ProgSpecialty gid.<br>
del var flt.<br>

* OE consistency for Specialty (Other = 998) - ensure OE present when Other selected and empty otherwise (applies only when gid=15).<br>
tit ProgSpecialty_OE_Consistency.<br>
compute flt = $sysmis.<br>
if gid = 15 flt = 1.<br>
temporary.<br>
sel if ( flt = 1 and ( (ProgSpecialty = 998 and trim(ProgSpecialtyOE_1) = '') or (ProgSpecialty <> 998 and trim(ProgSpecialtyOE_1) <> '') ) )<br>
    or ( miss(flt) and trim(ProgSpecialtyOE_1) <> '' ).<br>
list respid ProgSpecialty ProgSpecialtyOE_1 gid.<br>
del var flt.<br>

* ============================================================.
* Question ID: ProgSpecialtyOE
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgSpecialtyOE",
*   "Question Label": "SpecialtyOE - Other Specialty:",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgSpecialtyOE_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "ProgSpecialtyOE_1 (SpecialtyOE - Other Specialty:)"
*     }
*   ],
*   "question_attributes": {
*     "OpenText": "true",
*     "EntityId": "4525"
*   }
* }
* -----------------------------------------------------------

tit ProgSpecialtyOE.<br>
compute flt = $sysmis.<br>
if gid = 15 flt = 1.<br>
temporary.<br>
* When Specialty parent = 998 (Other) and question shown (gid=15) OE should be non-empty (and reasonably long). If not expected OE should be empty.<br>
sel if ( flt = 1 and ( ProgSpecialty = 998 and ( trim(ProgSpecialtyOE_1) = '' or char.len(trim(ProgSpecialtyOE_1)) < 2 ) ) )<br>
    or ( miss(flt) and trim(ProgSpecialtyOE_1) <> '' ).<br>
list respid ProgSpecialty ProgSpecialtyOE_1 gid.<br>
del var flt.<br>

* ============================================================.
* Question ID: ProgFName
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgFName",
*   "Question Label": "FName - First Name:",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgFName_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "ProgFName_1 (FName - First Name:)"
*     }
*   ],
*   "question_attributes": {
*     "ValidationCode": "RequireCheck('ProgFName_1')",
*     "Columns": "20",
*     "OpenText": "true",
*     "EntityId": "4526"
*   }
* }
* -----------------------------------------------------------

tit ProgFName.<br>
compute flt = $sysmis.<br>
if gid = 15 flt = 1.<br>
temporary.<br>
* Required when gid=15: must be non-empty. If not expected it should be empty.<br>
sel if ( flt = 1 and ( trim(ProgFName_1) = '' ) )<br>
    or ( miss(flt) and trim(ProgFName_1) <> '' ).<br>
list respid ProgFName_1 gid.<br>
del var flt.<br>

* ============================================================.
* Question ID: ProgLName
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgLName",
*   "Question Label": "LName - Last Name:",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgLName_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "ProgLName_1 (LName - Last Name:)"
*     }
*   ],
*   "question_attributes": {
*     "ValidationCode": "RequireCheck('ProgLName_1')",
*     "Columns": "20",
*     "OpenText": "true",
*     "EntityId": "4527"
*   }
* }
* -----------------------------------------------------------

tit ProgLName.<br>
compute flt = $sysmis.<br>
if gid = 15 flt = 1.<br>
temporary.<br>
* Required when gid=15: must be non-empty. If not expected it should be empty.<br>
sel if ( flt = 1 and ( trim(ProgLName_1) = '' ) )<br>
    or ( miss(flt) and trim(ProgLName_1) <> '' ).<br>
list respid ProgLName_1 gid.<br>
del var flt.<br>

* ============================================================.
* Question ID: ProgAddress
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgAddress",
*   "Question Label": "Address - Address:",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgAddress_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "ProgAddress_1 (Address - Address:)"
*     }
*   ],
*   "question_attributes": {
*     "ValidationCode": "RequireCheck('ProgAddress_1')",
*     "OpenText": "true",
*     "EntityId": "4528"
*   }
* }
* -----------------------------------------------------------

tit ProgAddress.<br>
compute flt = $sysmis.<br>
if gid = 15 flt = 1.<br>
temporary.<br>
* Required when gid=15: must be non-empty. If not expected it should be empty.<br>
sel if ( flt = 1 and ( trim(ProgAddress_1) = '' ) )<br>
    or ( miss(flt) and trim(ProgAddress_1) <> '' ).<br>
list respid ProgAddress_1 gid.<br>
del var flt.<br>

* ============================================================.
* Question ID: ProgCountry
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgCountry",
*   "Question Label": "Country - Country:",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgCountry",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "United States"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Canada"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "United Kingdom"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Afghanistan"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Albania"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Algeria"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Andorra"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Angola"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Antigua and Barbuda"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Argentina"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Armenia"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "Australia"
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "Austria"
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": "Azerbaijan"
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "Bahamas, The"
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "Bahrain"
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": "Bangladesh"
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": "Barbados"
*     },
*     {
*       "Answer Code": "19",
*       "Answer Label": "Belarus"
*     },
*     {
*       "Answer Code": "20",
*       "Answer Label": "Belgium"
*     },
*     {
*       "Answer Code": "21",
*       "Answer Label": "Belize"
*     },
*     {
*       "Answer Code": "22",
*       "Answer Label": "Benin"
*     },
*     {
*       "Answer Code": "23",
*       "Answer Label": "Bhutan"
*     },
*     {
*       "Answer Code": "24",
*       "Answer Label": "Bolivia"
*     },
*     {
*       "Answer Code": "25",
*       "Answer Label": "Bosnia and Herzegovina"
*     },
*     {
*       "Answer Code": "26",
*       "Answer Label": "Botswana"
*     },
*     {
*       "Answer Code": "27",
*       "Answer Label": "Brazil"
*     },
*     {
*       "Answer Code": "28",
*       "Answer Label": "Brunei"
*     },
*     {
*       "Answer Code": "29",
*       "Answer Label": "Bulgaria"
*     },
*     {
*       "Answer Code": "30",
*       "Answer Label": "Burkina Faso"
*     },
*     {
*       "Answer Code": "31",
*       "Answer Label": "Burundi"
*     },
*     {
*       "Answer Code": "32",
*       "Answer Label": "Cambodia"
*     },
*     {
*       "Answer Code": "33",
*       "Answer Label": "Cameroon"
*     },
*     {
*       "Answer Code": "34",
*       "Answer Label": "Cape Verde"
*     },
*     {
*       "Answer Code": "35",
*       "Answer Label": "Central African Republic"
*     },
*     {
*       "Answer Code": "36",
*       "Answer Label": "Chad"
*     },
*     {
*       "Answer Code": "37",
*       "Answer Label": "Chile"
*     },
*     {
*       "Answer Code": "38",
*       "Answer Label": "China, People's Republic of"
*     },
*     {
*       "Answer Code": "39",
*       "Answer Label": "Colombia"
*     },
*     {
*       "Answer Code": "40",
*       "Answer Label": "Comoros"
*     },
*     {
*       "Answer Code": "41",
*       "Answer Label": "Congo, (Congo – Kinshasa)"
*     },
*     {
*       "Answer Code": "42",
*       "Answer Label": "Congo, (Congo – Brazzaville)"
*     },
*     {
*       "Answer Code": "43",
*       "Answer Label": "Costa Rica"
*     },
*     {
*       "Answer Code": "44",
*       "Answer Label": "Cote d'Ivoire (Ivory Coast)"
*     },
*     {
*       "Answer Code": "45",
*       "Answer Label": "Croatia"
*     },
*     {
*       "Answer Code": "46",
*       "Answer Label": "Cuba"
*     },
*     {
*       "Answer Code": "47",
*       "Answer Label": "Cyprus"
*     },
*     {
*       "Answer Code": "48",
*       "Answer Label": "Czech Republic"
*     },
*     {
*       "Answer Code": "49",
*       "Answer Label": "Denmark"
*     },
*     {
*       "Answer Code": "50",
*       "Answer Label": "Djibouti"
*     },
*     {
*       "Answer Code": "51",
*       "Answer Label": "Dominica"
*     },
*     {
*       "Answer Code": "52",
*       "Answer Label": "Dominican Republic"
*     },
*     {
*       "Answer Code": "53",
*       "Answer Label": "Ecuador"
*     },
*     {
*       "Answer Code": "54",
*       "Answer Label": "Egypt"
*     },
*     {
*       "Answer Code": "55",
*       "Answer Label": "El Salvador"
*     },
*     {
*       "Answer Code": "56",
*       "Answer Label": "Equatorial Guinea"
*     },
*     {
*       "Answer Code": "57",
*       "Answer Label": "Eritrea"
*     },
*     {
*       "Answer Code": "58",
*       "Answer Label": "Estonia"
*     },
*     {
*       "Answer Code": "59",
*       "Answer Label": "Ethiopia"
*     },
*     {
*       "Answer Code": "60",
*       "Answer Label": "Fiji"
*     },
*     {
*       "Answer Code": "61",
*       "Answer Label": "Finland"
*     },
*     {
*       "Answer Code": "62",
*       "Answer Label": "France"
*     },
*     {
*       "Answer Code": "63",
*       "Answer Label": "Gabon"
*     },
*     {
*       "Answer Code": "64",
*       "Answer Label": "Gambia, The"
*     },
*     {
*       "Answer Code": "65",
*       "Answer Label": "Georgia"
*     },
*     {
*       "Answer Code": "66",
*       "Answer Label": "Germany"
*     },
*     {
*       "Answer Code": "67",
*       "Answer Label": "Ghana"
*     },
*     {
*       "Answer Code": "68",
*       "Answer Label": "Greece"
*     },
*     {
*       "Answer Code": "69",
*       "Answer Label": "Grenada"
*     },
*     {
*       "Answer Code": "70",
*       "Answer Label": "Guatemala"
*     },
*     {
*       "Answer Code": "71",
*       "Answer Label": "Guinea"
*     },
*     {
*       "Answer Code": "72",
*       "Answer Label": "Guinea-Bissau"
*     },
*     {
*       "Answer Code": "73",
*       "Answer Label": "Guyana"
*     },
*     {
*       "Answer Code": "74",
*       "Answer Label": "Haiti"
*     },
*     {
*       "Answer Code": "75",
*       "Answer Label": "Honduras"
*     },
*     {
*       "Answer Code": "76",
*       "Answer Label": "Hungary"
*     },
*     {
*       "Answer Code": "77",
*       "Answer Label": "Iceland"
*     },
*     {
*       "Answer Code": "78",
*       "Answer Label": "India"
*     },
*     {
*       "Answer Code": "79",
*       "Answer Label": "Indonesia"
*     },
*     {
*       "Answer Code": "80",
*       "Answer Label": "Iran"
*     },
*     {
*       "Answer Code": "81",
*       "Answer Label": "Iraq"
*     },
*     {
*       "Answer Code": "82",
*       "Answer Label": "Ireland"
*     },
*     {
*       "Answer Code": "83",
*       "Answer Label": "Israel"
*     },
*     {
*       "Answer Code": "84",
*       "Answer Label": "Italy"
*     },
*     {
*       "Answer Code": "85",
*       "Answer Label": "Jamaica"
*     },
*     {
*       "Answer Code": "86",
*       "Answer Label": "Japan"
*     },
*     {
*       "Answer Code": "87",
*       "Answer Label": "Jordan"
*     },
*     {
*       "Answer Code": "88",
*       "Answer Label": "Kazakhstan"
*     },
*     {
*       "Answer Code": "89",
*       "Answer Label": "Kenya"
*     },
*     {
*       "Answer Code": "90",
*       "Answer Label": "Kiribati"
*     },
*     {
*       "Answer Code": "91",
*       "Answer Label": "Korea, North"
*     },
*     {
*       "Answer Code": "92",
*       "Answer Label": "Korea, South"
*     },
*     {
*       "Answer Code": "93",
*       "Answer Label": "Kuwait"
*     },
*     {
*       "Answer Code": "94",
*       "Answer Label": "Kyrgyzstan"
*     },
*     {
*       "Answer Code": "95",
*       "Answer Label": "Laos"
*     },
*     {
*       "Answer Code": "96",
*       "Answer Label": "Latvia"
*     },
*     {
*       "Answer Code": "97",
*       "Answer Label": "Lebanon"
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": "Lesotho"
*     },
*     {
*       "Answer Code": "99",
*       "Answer Label": "Liberia"
*     },
*     {
*       "Answer Code": "100",
*       "Answer Label": "Libya"
*     },
*     {
*       "Answer Code": "101",
*       "Answer Label": "Liechtenstein"
*     },
*     {
*       "Answer Code": "102",
*       "Answer Label": "Lithuania"
*     },
*     {
*       "Answer Code": "103",
*       "Answer Label": "Luxembourg"
*     },
*     {
*       "Answer Code": "104",
*       "Answer Label": "Macedonia"
*     },
*     {
*       "Answer Code": "105",
*       "Answer Label": "Madagascar"
*     },
*     {
*       "Answer Code": "106",
*       "Answer Label": "Malawi"
*     },
*     {
*       "Answer Code": "107",
*       "Answer Label": "Malaysia"
*     },
*     {
*       "Answer Code": "108",
*       "Answer Label": "Maldives"
*     },
*     {
*       "Answer Code": "109",
*       "Answer Label": "Mali"
*     },
*     {
*       "Answer Code": "110",
*       "Answer Label": "Malta"
*     },
*     {
*       "Answer Code": "111",
*       "Answer Label": "Marshall Islands"
*     },
*     {
*       "Answer Code": "112",
*       "Answer Label": "Mauritania"
*     },
*     {
*       "Answer Code": "113",
*       "Answer Label": "Mauritius"
*     },
*     {
*       "Answer Code": "114",
*       "Answer Label": "Mexico"
*     },
*     {
*       "Answer Code": "115",
*       "Answer Label": "Micronesia"
*     },
*     {
*       "Answer Code": "116",
*       "Answer Label": "Moldova"
*     },
*     {
*       "Answer Code": "117",
*       "Answer Label": "Monaco"
*     },
*     {
*       "Answer Code": "118",
*       "Answer Label": "Mongolia"
*     },
*     {
*       "Answer Code": "119",
*       "Answer Label": "Montenegro"
*     },
*     {
*       "Answer Code": "120",
*       "Answer Label": "Morocco"
*     },
*     {
*       "Answer Code": "121",
*       "Answer Label": "Mozambique"
*     },
*     {
*       "Answer Code": "122",
*       "Answer Label": "Myanmar (Burma)"
*     },
*     {
*       "Answer Code": "123",
*       "Answer Label": "Namibia"
*     },
*     {
*       "Answer Code": "124",
*       "Answer Label": "Nauru"
*     },
*     {
*       "Answer Code": "125",
*       "Answer Label": "Nepal"
*     },
*     {
*       "Answer Code": "126",
*       "Answer Label": "Netherlands"
*     },
*     {
*       "Answer Code": "127",
*       "Answer Label": "New Zealand"
*     },
*     {
*       "Answer Code": "128",
*       "Answer Label": "Nicaragua"
*     },
*     {
*       "Answer Code": "129",
*       "Answer Label": "Niger"
*     },
*     {
*       "Answer Code": "130",
*       "Answer Label": "Nigeria"
*     },
*     {
*       "Answer Code": "131",
*       "Answer Label": "Norway"
*     },
*     {
*       "Answer Code": "132",
*       "Answer Label": "Oman"
*     },
*     {
*       "Answer Code": "133",
*       "Answer Label": "Pakistan"
*     },
*     {
*       "Answer Code": "134",
*       "Answer Label": "Palau"
*     },
*     {
*       "Answer Code": "135",
*       "Answer Label": "Panama"
*     },
*     {
*       "Answer Code": "136",
*       "Answer Label": "Papua New Guinea"
*     },
*     {
*       "Answer Code": "137",
*       "Answer Label": "Paraguay"
*     },
*     {
*       "Answer Code": "138",
*       "Answer Label": "Peru"
*     },
*     {
*       "Answer Code": "139",
*       "Answer Label": "Philippines"
*     },
*     {
*       "Answer Code": "140",
*       "Answer Label": "Poland"
*     },
*     {
*       "Answer Code": "141",
*       "Answer Label": "Portugal"
*     },
*     {
*       "Answer Code": "142",
*       "Answer Label": "Qatar"
*     },
*     {
*       "Answer Code": "143",
*       "Answer Label": "Romania"
*     },
*     {
*       "Answer Code": "144",
*       "Answer Label": "Russia"
*     },
*     {
*       "Answer Code": "145",
*       "Answer Label": "Rwanda"
*     },
*     {
*       "Answer Code": "146",
*       "Answer Label": "Saint Kitts and Nevis"
*     },
*     {
*       "Answer Code": "147",
*       "Answer Label": "Saint Lucia"
*     },
*     {
*       "Answer Code": "148",
*       "Answer Label": "Saint Vincent and the Grenadines"
*     },
*     {
*       "Answer Code": "149",
*       "Answer Label": "Samoa"
*     },
*     {
*       "Answer Code": "150",
*       "Answer Label": "San Marino"
*     },
*     {
*       "Answer Code": "151",
*       "Answer Label": "Sao Tome and Principe"
*     },
*     {
*       "Answer Code": "152",
*       "Answer Label": "Saudi Arabia"
*     },
*     {
*       "Answer Code": "153",
*       "Answer Label": "Senegal"
*     },
*     {
*       "Answer Code": "154",
*       "Answer Label": "Serbia"
*     },
*     {
*       "Answer Code": "155",
*       "Answer Label": "Seychelles"
*     },
*     {
*       "Answer Code": "156",
*       "Answer Label": "Sierra Leone"
*     },
*     {
*       "Answer Code": "157",
*       "Answer Label": "Singapore"
*     },
*     {
*       "Answer Code": "158",
*       "Answer Label": "Slovakia"
*     },
*     {
*       "Answer Code": "159",
*       "Answer Label": "Slovenia"
*     },
*     {
*       "Answer Code": "160",
*       "Answer Label": "Solomon Islands"
*     },
*     {
*       "Answer Code": "161",
*       "Answer Label": "Somalia"
*     },
*     {
*       "Answer Code": "162",
*       "Answer Label": "South Africa"
*     },
*     {
*       "Answer Code": "163",
*       "Answer Label": "Spain"
*     },
*     {
*       "Answer Code": "164",
*       "Answer Label": "Sri Lanka"
*     },
*     {
*       "Answer Code": "165",
*       "Answer Label": "Sudan"
*     },
*     {
*       "Answer Code": "166",
*       "Answer Label": "Suriname"
*     },
*     {
*       "Answer Code": "167",
*       "Answer Label": "Swaziland"
*     },
*     {
*       "Answer Code": "168",
*       "Answer Label": "Sweden"
*     },
*     {
*       "Answer Code": "169",
*       "Answer Label": "Switzerland"
*     },
*     {
*       "Answer Code": "170",
*       "Answer Label": "Syria"
*     },
*     {
*       "Answer Code": "171",
*       "Answer Label": "Tajikistan"
*     },
*     {
*       "Answer Code": "172",
*       "Answer Label": "Tanzania"
*     },
*     {
*       "Answer Code": "173",
*       "Answer Label": "Thailand"
*     },
*     {
*       "Answer Code": "174",
*       "Answer Label": "Timor-Leste (East Timor)"
*     },
*     {
*       "Answer Code": "175",
*       "Answer Label": "Togo"
*     },
*     {
*       "Answer Code": "176",
*       "Answer Label": "Tonga"
*     },
*     {
*       "Answer Code": "177",
*       "Answer Label": "Trinidad and Tobago"
*     },
*     {
*       "Answer Code": "178",
*       "Answer Label": "Tunisia"
*     },
*     {
*       "Answer Code": "179",
*       "Answer Label": "Turkey"
*     },
*     {
*       "Answer Code": "180",
*       "Answer Label": "Turkmenistan"
*     },
*     {
*       "Answer Code": "181",
*       "Answer Label": "Tuvalu"
*     },
*     {
*       "Answer Code": "182",
*       "Answer Label": "Uganda"
*     },
*     {
*       "Answer Code": "183",
*       "Answer Label": "Ukraine"
*     },
*     {
*       "Answer Code": "184",
*       "Answer Label": "United Arab Emirates"
*     },
*     {
*       "Answer Code": "185",
*       "Answer Label": "Uruguay"
*     },
*     {
*       "Answer Code": "186",
*       "Answer Label": "Uzbekistan"
*     },
*     {
*       "Answer Code": "187",
*       "Answer Label": "Vanuatu"
*     },
*     {
*       "Answer Code": "188",
*       "Answer Label": "Vatican City"
*     },
*     {
*       "Answer Code": "189",
*       "Answer Label": "Venezuela"
*     },
*     {
*       "Answer Code": "190",
*       "Answer Label": "Vietnam"
*     },
*     {
*       "Answer Code": "191",
*       "Answer Label": "Yemen"
*     },
*     {
*       "Answer Code": "192",
*       "Answer Label": "Zambia"
*     },
*     {
*       "Answer Code": "193",
*       "Answer Label": "Zimbabwe"
*     },
*     {
*       "Answer Code": "998",
*       "Answer Label": "Others"
*     }
*   ],
*   "question_attributes": {
*     "ValidationCode": "if(!QuestionErrors())\n{\n\tvar num : String = f('ProgPostalCode')['1'].get();\n\tvar re = /^\\d{5}$/;\n\tif( !re.test(num) && f('ProgPostalCode')['1'].toBoolean())\n\t{errorMsg('Postal') }\n\n\tvar num1 : String = f('ProgPhone')['1'].get();\n\tvar re1 = /^\\d{10}$/;\n\tif( !re1.test(num1) && f('ProgPhone')['1'].toBoolean())\n\t{errorMsg('S4') }\n\t\n\tvar val = f(\"ProgEmail\")['1'].get();\n\tif(!IsEmail(val) && f('ProgEmail')['1'].toBoolean())\n\t{errorMsg('S8') }\n\n}",
*     "HierarchyMode": "Drilldown",
*     "ExcludeTranslation": "true",
*     "Dropdown": "true",
*     "EntityId": "4523"
*   }
* }
* -----------------------------------------------------------

tit ProgCountry.<br>
/* Validate ProgCountry presence and allowed codes when question shown (gid=15). If question not shown, ensure it's empty. */<br>
compute flt = $sysmis.<br>
if gid = 15 flt = 1.<br>
temporary.<br>
sel if (flt = 1 and ( miss(ProgCountry) or ((~range(ProgCountry,1,193)) and ProgCountry <> 998) ))<br>
    or ( miss(flt) and ~miss(ProgCountry) ).<br>
list respid ProgCountry gid.<br>
del var flt.<br>
<br>
/* Contact-field sanity checks translated from ValidationCode: postal (5 digits), phone (10 digits), email (has '@' and '.' after '@').<br>
   Only validate when gid=15 (question shown). If not shown (gid<>15) these fields should be empty. */<br>
compute flt = $sysmis.<br>
if gid = 15 flt = 1.<br>
/* create trimmed helpers for reliable length checks */<br>
compute postaltrim = trim(ProgPostalCode_1).<br>
compute phonetrim  = trim(ProgPhone_1).<br>
compute emailtrim  = trim(ProgEmail).<br>
/* compute positions for simple email structure check */<br>
compute atpos = index(emailtrim,'@').<br>
compute dotpos = index(substr(emailtrim, atpos+1, 255), '.').<br>
temporary.<br>
/* Flag if: when expected (flt=1) and any provided contact value is syntactically invalid,<br>
   OR when not expected (flt missing) but any contact field is filled. */<br>
sel if ( flt = 1 and ( (postaltrim <> '' and ( char.len(postaltrim) <> 5 or number(postaltrim,F5) = $sysmis ))<br>
                      or (phonetrim  <> '' and ( char.len(phonetrim)  <> 10 or number(phonetrim,F10) = $sysmis ))<br>
                      or (emailtrim  <> '' and ( atpos = 0 or dotpos = 0 )) ) )<br>
    or ( miss(flt) and ( postaltrim <> '' or phonetrim <> '' or emailtrim <> '' ) ).<br>
list respid ProgPostalCode_1 ProgPhone_1 ProgEmail gid.<br>
del var flt postaltrim phonetrim emailtrim atpos dotpos.

* ============================================================.
* Question ID: ProgCity
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgCity",
*   "Question Label": "City - City:",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgCity_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "ProgCity_1 (City - City:)"
*     }
*   ],
*   "question_attributes": {
*     "ValidationCode": "RequireCheck('ProgCity_1')",
*     "Columns": "20",
*     "OpenText": "true",
*     "EntityId": "4529"
*   }
* }
* -----------------------------------------------------------

tit ProgCity.<br>compute flt=0.<br>if gid=15 flt=1.<br>temporary.<br>sel if (flt=1 and (ProgCity_1 = "" or miss(ProgCity_1))) or (flt=0 and ~miss(ProgCity_1)).<br>list respid, ProgCity_1.<br>del var flt.
```

```

* ============================================================.
* Question ID: ProgStateUS
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgStateUS",
*   "Question Label": "StateUS - State:",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgStateUS",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "AL Alabama",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "AK Alaska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "AZ Arizona",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "AR Arkansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "CA California",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "CO Colorado",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "CT Connecticut",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "DC District of Columbia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "DE Delaware",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "FL Florida",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "GA Georgia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "HI Hawaii",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "ID Idaho",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": "IL Illinois",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "IN Indiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "IA Iowa",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": "KS Kansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": "KY Kentucky",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "19",
*       "Answer Label": "LA Louisiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "20",
*       "Answer Label": "ME Maine",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "21",
*       "Answer Label": "MD Maryland",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "22",
*       "Answer Label": "MA Massachusetts",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "23",
*       "Answer Label": "MI Michigan",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "24",
*       "Answer Label": "MN Minnesota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "25",
*       "Answer Label": "MS Mississippi",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "26",
*       "Answer Label": "MO Missouri",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "27",
*       "Answer Label": "MT Montana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "28",
*       "Answer Label": "NC North Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "29",
*       "Answer Label": "ND North Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "30",
*       "Answer Label": "NE Nebraska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "31",
*       "Answer Label": "NV Nevada",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "32",
*       "Answer Label": "NH New Hampshire",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "33",
*       "Answer Label": "NJ New Jersey",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "34",
*       "Answer Label": "NM New Mexico",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "35",
*       "Answer Label": "NY New York",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "36",
*       "Answer Label": "OH Ohio",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "37",
*       "Answer Label": "OK Oklahoma",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "38",
*       "Answer Label": "OR Oregon",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "39",
*       "Answer Label": "PA Pennsylvania",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "40",
*       "Answer Label": "RI Rhode Island",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "41",
*       "Answer Label": "SC South Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "42",
*       "Answer Label": "SD South Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "43",
*       "Answer Label": "TN Tennessee",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "44",
*       "Answer Label": "TX Texas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "45",
*       "Answer Label": "UT Utah",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "46",
*       "Answer Label": "VT Vermont",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "47",
*       "Answer Label": "VA Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "48",
*       "Answer Label": "WA Washington",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "49",
*       "Answer Label": "WV West Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "50",
*       "Answer Label": "WI Wisconsin",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "51",
*       "Answer Label": "WY Wyoming",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     }
*   ],
*   "question_attributes": {
*     "HierarchyMode": "Drilldown",
*     "ExcludeTranslation": "true",
*     "Dropdown": "true",
*     "EntityId": "4530"
*   }
* }
* -----------------------------------------------------------

tit ProgStateUS.<br>compute flt=0.<br>if gid=15 flt=1.<br>temporary.<br>sel if (flt=1 and (miss(ProgStateUS) or ~range(ProgStateUS,1,51))) or (flt=0 and ~miss(ProgStateUS)).<br>list respid, ProgStateUS.<br>del var flt.
```

```

* ============================================================.
* Question ID: ProgPostalCode
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgPostalCode",
*   "Question Label": "PostalCode - Postal Code/Zip code:",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgPostalCode_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "ProgPostalCode_1 (PostalCode - Postal Code/Zip code:)"
*     }
*   ],
*   "question_attributes": {
*     "ValidationCode": "RequireCheck('ProgPostalCode_1')",
*     "Columns": "20",
*     "OpenText": "true",
*     "EntityId": "4532"
*   }
* }
* -----------------------------------------------------------

tit ProgPostalCode.<br>compute flt=0.<br>if gid=15 flt=1.<br>temporary.<br>sel if (flt=1 and (ProgPostalCode_1 = "" or miss(ProgPostalCode_1))) or (flt=0 and ~miss(ProgPostalCode_1)).<br>list respid, ProgPostalCode_1.<br>del var flt.
```

```

* ============================================================.
* Question ID: ProgPhone
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgPhone",
*   "Question Label": "Phone - Telephone:",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgPhone_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "ProgPhone_1 (Phone - Telephone:)"
*     }
*   ],
*   "question_attributes": {
*     "ValidationCode": "RequireCheck('ProgPhone_1')",
*     "Columns": "20",
*     "OpenText": "true",
*     "EntityId": "4533"
*   }
* }
* -----------------------------------------------------------

tit ProgPhone.<br>compute flt=0.<br>if gid=15 flt=1.<br>temporary.<br>sel if (flt=1 and (ProgPhone_1 = "" or miss(ProgPhone_1))) or (flt=0 and ~miss(ProgPhone_1)).<br>list respid, ProgPhone_1.<br>del var flt.
```

```

* ============================================================.
* Question ID: ProgEmail
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgEmail",
*   "Question Label": "Email - Email:",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgEmail_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "ProgEmail_1 (Email - Email:)"
*     }
*   ],
*   "question_attributes": {
*     "ValidationCode": "RequireCheck('ProgEmail_1')",
*     "Columns": "40",
*     "OpenText": "true",
*     "EntityId": "4534"
*   }
* }
* -----------------------------------------------------------

tit ProgEmail.<br>compute flt=0.<br>if gid=15 flt=1.<br>temporary.<br>sel if (flt=1 and (ProgEmail_1 = "" or miss(ProgEmail_1))) or (flt=0 and ~miss(ProgEmail_1)).<br>list respid, ProgEmail_1.<br>del var flt.
```

* ============================================================.
* Question ID: ProgStateCA
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProgStateCA",
*   "Question Label": "StateCA - Province:",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('gid')=='15'   //Update this condition as per requirement"
*   ],
*   "conditions": [],
*   "Variable ID": "ProgStateCA",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": "AB",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "BC",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "MB",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "NB",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "NL",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "NS",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "NT",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "NU",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "ON",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "PE",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "QC",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "SK",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "YT",
*       "answer_attributes": {
*         "ListSource": "stateCA"
*       }
*     }
*   ],
*   "question_attributes": {
*     "HierarchyMode": "Drilldown",
*     "ExcludeTranslation": "true",
*     "Dropdown": "true",
*     "EntityId": "4531"
*   }
* }
* -----------------------------------------------------------

tit ProgStateCA.<br>
compute flt=0.<br>
if gid=15 flt=1.<br>
temporary.<br>
sel if (flt=1 and (ProgStateCA = "" or miss(ProgStateCA) or NOT(ProgStateCA = 'AB' or ProgStateCA = 'BC' or ProgStateCA = 'MB' or ProgStateCA = 'NB' or ProgStateCA = 'NL' or ProgStateCA = 'NS' or ProgStateCA = 'NT' or ProgStateCA = 'NU' or ProgStateCA = 'ON' or ProgStateCA = 'PE' or ProgStateCA = 'QC' or ProgStateCA = 'SK' or ProgStateCA = 'YT'))) or (flt=0 and ~miss(ProgStateCA)).<br>
list respid, ProgStateCA.<br>
del var flt.
```

* ============================================================.
* Question ID: hInstrText
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hInstrText",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hInstrText - //Question instructions",
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "FieldWidth": "1",
*     "EntityId": "3030"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hInstrText_s",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Select one"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_s3",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Select one for each column"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_g",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Select one for each row"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_m",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Select all that apply"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_m3",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Select all that apply for each column"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_mg",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Select all that apply for each row"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_n",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter a whole number"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_nl",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter a whole number for each field below"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_lp",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter a whole number. Your entry cannot exceed "
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_gep",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter a whole number. Your entry must be at least "
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_seh",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter only whole numbers. Your total must add to 100."
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_sgeh",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter only whole numbers. Your total must add to 100 or more."
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_sep",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter only whole numbers. Your total must add to ."
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_sehc",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter only whole numbers. Your total in each column must add to 100."
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_sepc",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter only whole numbers. Your total in each column must add to the numbers specified in the column headers."
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_sehr",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter only whole numbers. Your total in each row must add to 100."
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_sgehc",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter only whole numbers. Your total in each column must add to 100 or more."
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_sgehr",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter only whole numbers. Your total in each row must add to 100 or more."
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_o",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter your response below"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_rc",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Click to rank items below"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_rd",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Drag and drop to rank items below"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_csc",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Drag and drop each option into one of the choices below"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_css",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Drag each option and place it on the appropriate part of the scale below"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_sls",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Click and slide the handle to rate each of the options below"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_slc",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Click and slide the handle to indicate your responses below"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hInstrText_ri",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Enter a unique rank for each item "
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hInstrText.<br>* No validation for instruction/hidden text variables (skip routine data validation). 
```

```

* ============================================================.
* Question ID: qTitle
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qTitle",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "qTitle",
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "EntityId": "188"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "qTitle_SurveyTitle",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Online Survey"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTitle_tot",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "TOTAL"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTitle_loadTxt",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Loading..."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTitle_msgJS",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "JavaScript is DISABLED on this browser. This survey requires JavaScript for best user experience. Follow these instructions to enable JavaScript in your web browser or alternatively try a different browser."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTitle_msgMob",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Sorry, this survey is not compatible with Mobile devices. Please use a desktop browser to continue."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTitle_dtFrmt",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "DD/MM/YYYY "
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTitle_mFull",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "January,February,March,April,May,June,July,August,September,October,November,December"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTitle_mShort",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTitle_dFull",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTitle_dShort",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Sun,Mon,Tue,Wed,Thu,Fri,Sat"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTitle_dShort2",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Su,Mo,Tu,We,Th,Fr,Sa"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit qTitle.<br>* Hidden title resources - no data validation generated.
```

```

* ============================================================.
* Question ID: qErrors
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qErrors",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "qErrors",
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "FieldWidth": "1",
*     "EntityId": "2753912695"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "qErrors_S1",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please enter First name."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_S2",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please enter Last name."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_S3",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please enter Phone Number."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_S4",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please provide Phone Number in the following format: xxx-xxx-xxxx"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_S5",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please enter Alternative Phone Number."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_S6",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please provide Alternative Phone Number in the following format: xxx-xxx-xxxx"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_S7",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Alternative Phone Number must be different from your primary Phone Number"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_S8",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please enter a valid email address."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Please provide an answer."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Please specify if «"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "» is chosen."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Please make sure that you either enter a number greater than 0 for «Specify» option or remove the «"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "» text."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Please select an answer for «"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "», if you have specified text."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Please make sure that you either provide an answer for «Specify» option or remove the «"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Please make sure you either enter a response(s) or select the «"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "» checkbox."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "Please enter your responses sequentially."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "Please enter unique responses."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_13",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": "Please enter a minimum of ^f('qErrNum')[1]^ characters."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_14",
*       "answers": [
*         {
*           "Answer Code": "14",
*           "Answer Label": "Please enter a maximum of ^f('qErrNum')[2]^ characters."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_15",
*       "answers": [
*         {
*           "Answer Code": "15",
*           "Answer Label": "Please enter a minimum of ^f('qErrNum')[1]^ words."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_16",
*       "answers": [
*         {
*           "Answer Code": "16",
*           "Answer Label": "Please enter a maximum of ^f('qErrNum')[2]^ words."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_17",
*       "answers": [
*         {
*           "Answer Code": "17",
*           "Answer Label": ": Please ensure your answer is less than ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_18",
*       "answers": [
*         {
*           "Answer Code": "18",
*           "Answer Label": ": Please ensure your answer is less than or equal to ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_19",
*       "answers": [
*         {
*           "Answer Code": "19",
*           "Answer Label": ": Please ensure your answer is greater than ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_20",
*       "answers": [
*         {
*           "Answer Code": "20",
*           "Answer Label": ": Please ensure your answer is greater than or equal to ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_21",
*       "answers": [
*         {
*           "Answer Code": "21",
*           "Answer Label": ": Please ensure your answer is equal to ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_22",
*       "answers": [
*         {
*           "Answer Code": "22",
*           "Answer Label": "Please ensure the sum of your answers is less than ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_23",
*       "answers": [
*         {
*           "Answer Code": "23",
*           "Answer Label": "Please ensure the sum of your answers is less than or equal to ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_24",
*       "answers": [
*         {
*           "Answer Code": "24",
*           "Answer Label": "Please ensure the sum of your answers is greater than ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_25",
*       "answers": [
*         {
*           "Answer Code": "25",
*           "Answer Label": "Please ensure the sum of your answers is greater than or equal to ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_26",
*       "answers": [
*         {
*           "Answer Code": "26",
*           "Answer Label": "Please ensure the sum of your answers equals ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_27",
*       "answers": [
*         {
*           "Answer Code": "27",
*           "Answer Label": "Please ensure the sum of your answers is between ^f('qErrNum')[1]^ and ^f('qErrNum')[2]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_28",
*       "answers": [
*         {
*           "Answer Code": "28",
*           "Answer Label": "Please ensure your answer is less than ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_29",
*       "answers": [
*         {
*           "Answer Code": "29",
*           "Answer Label": "Please ensure your answer is less than or equal to ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_30",
*       "answers": [
*         {
*           "Answer Code": "30",
*           "Answer Label": "Please ensure your answer is greater than ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_31",
*       "answers": [
*         {
*           "Answer Code": "31",
*           "Answer Label": "Please ensure your answer is greater than or equal to ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_32",
*       "answers": [
*         {
*           "Answer Code": "32",
*           "Answer Label": "Please ensure your answer equals ^f('qErrNum')[1]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_33",
*       "answers": [
*         {
*           "Answer Code": "33",
*           "Answer Label": "Please ensure your answer is between ^f('qErrNum')[1]^ and ^f('qErrNum')[2]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_34",
*       "answers": [
*         {
*           "Answer Code": "34",
*           "Answer Label": ": The sum of this row must add to ^f('qErrNum')[3]^."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_35",
*       "answers": [
*         {
*           "Answer Code": "35",
*           "Answer Label": "For column ^f('qErrNum')[3]^: "
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_36",
*       "answers": [
*         {
*           "Answer Code": "36",
*           "Answer Label": "For column ^f('qErrNum')[3]^, row "
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_37",
*       "answers": [
*         {
*           "Answer Code": "37",
*           "Answer Label": "Please make sure to assign a rank to 'Other' if you have entered text in the 'Please Specify' field or remove the text from this field."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_38",
*       "answers": [
*         {
*           "Answer Code": "38",
*           "Answer Label": ": Please do not provide an answer in column '^f('qErrNum')[3]^'."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_39",
*       "answers": [
*         {
*           "Answer Code": "39",
*           "Answer Label": "Please do not provide an answer."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_40",
*       "answers": [
*         {
*           "Answer Code": "40",
*           "Answer Label": ": Please provide an answer in column '^f('qErrNum')[3]^'."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_password",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "You have entered an incorrect password, please try again."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_41",
*       "answers": [
*         {
*           "Answer Code": "41",
*           "Answer Label": 41
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Please enter a minimum of ^f('qCountry').none('4') ? \"2 characters\" : \"1 character\"^ in the box."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_OEAlert",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Open ended responses must have at least [[]] characters without spaces."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_OEAlertN",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Open ends must have a valid response."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_OEMin",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "[[1]] must have at least [[2]] characters without spaces when answered."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_Toutmsg",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Warning: This survey is about to time out. You have ^GetNum('hidTimeOutMin_2')-GetNum('hidTimeOutMin_1')^ minutes remaining before you are redirected. Please click anywhere on the page to stay active."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_Postal",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please provide valid zip code / postal code in the format of XXXXX"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_other",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please specify in other box if chosen."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_b10err",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please enter unique responses in each columns."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_S0",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please select both options to continue."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_B10err1",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please select your response other than 'None' for column 'Most Important'."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_B10err2",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please select your response other than 'None' for column 'Second Most Important'."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_A15err1",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please make sure that you provide response for all rows except 'Other specify' as this option is optional."
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrors_A15err2",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please check your response, you cannot select 'Never used' for 'Other specify' option."
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit qErrors.<br>* Hidden error-label resources - no data validation generated.
```

```

* ============================================================.
* Question ID: ProductProfile
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ProductProfile",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "ProductProfile - [NOTE: TRANSLATION IS NOT NEEDED FOR THE FOLLOWING TEXT BUT DO TRANSLATE ANSWERS]  EXAMPLES....    Popup('linkcode[,contentcode]'[, 'params']) :  Popup with image element: No content code: ^popup('ProfYlink')^ With specified content code #1: ^popup('ProfYlink,ProfY')^ With specified content code #2: ^popup('LinkX,ImgX')^ With specified content code (dynamic text pop up): ^popup('ProfYlink,ProfZText')^  Tooltip (AKA mouse over popup) : Please move your mouse over to see description of  Default display : ^tooltip('Profile ABC','ProfABCv2')^ Code string: ^tooltip('Profile ABC','ProfABCv2', 'showIcon: true')^ Recalled label: ^tooltip('Prof ABCD',f('ProductProfile')['ProfABC'].label())^ Content as a string: ^tooltip('Prof ABC','This is a description of ABC','style: {'color': 'green'}')^",
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "EntityId": "199"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "ProductProfile_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "INSERT PRODUCT PROFILE"
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "This is a standard popup."
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "This is a draggable popup."
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "This is a scrolling popup."
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "This is a larger font and wrapping popup."
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "This is a mouseover."
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_ProfY",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "https://hub.m3globalresearch.com/files/view/survey_images/884329/pharmacyShelf.jpg"
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_ProfYlink",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please click here to see the profile again."
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_ProfZText",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "This is Profile-Z with dynamic text pipe-in."
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_ImgX",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "https://hub.m3globalresearch.com/files/view/survey_images/884329/prescription.png"
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_LinkX",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Please click here to see the profile X again."
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_ProfABC",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "This is ABC  description"
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_ProfABCv2",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "This is ABC's  description called by content code \"ProfABCv2\""
*         }
*       ]
*     },
*     {
*       "Variable ID": "ProductProfile_DHSdef",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Digital health solutions are technologies, websites or platforms that use connectivity, software and sensors for healthcare. This may include tools such as health websites, patient portals, mobile health, health information technology, wearable devices, online pharmacy,  and telehealth/telemedicine."
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit ProductProfile.<br>* Hidden product profile content - no data validation generated.
```

```

* ============================================================.
* Question ID: hQualityScoreAnalyze
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hQualityScoreAnalyze",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "Forward() && !f(\"hQualityScoreAnalyze\").toBoolean() && flag"
*   ],
*   "conditions": [],
*   "Question Label": "Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Columns": "50",
*     "AutoCheckOther": "true",
*     "OpenText": "true",
*     "EntityId": "4484",
*     "NotPerformDataCleaningOnMasking": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hQualityScoreAnalyze_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "hQualityScoreAnalyze_1 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "hQualityScoreAnalyze_2 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "hQualityScoreAnalyze_3 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "hQualityScoreAnalyze_4 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "hQualityScoreAnalyze_5 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "hQualityScoreAnalyze_6 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "hQualityScoreAnalyze_7 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "hQualityScoreAnalyze_8 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "hQualityScoreAnalyze_9 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "hQualityScoreAnalyze_10 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "hQualityScoreAnalyze_11 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "hQualityScoreAnalyze_12 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_13",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": "hQualityScoreAnalyze_13 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_14",
*       "answers": [
*         {
*           "Answer Code": "14",
*           "Answer Label": "hQualityScoreAnalyze_14 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_15",
*       "answers": [
*         {
*           "Answer Code": "15",
*           "Answer Label": "hQualityScoreAnalyze_15 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_16",
*       "answers": [
*         {
*           "Answer Code": "16",
*           "Answer Label": "hQualityScoreAnalyze_16 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_17",
*       "answers": [
*         {
*           "Answer Code": "17",
*           "Answer Label": "hQualityScoreAnalyze_17 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_18",
*       "answers": [
*         {
*           "Answer Code": "18",
*           "Answer Label": "hQualityScoreAnalyze_18 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hQualityScoreAnalyze_19",
*       "answers": [
*         {
*           "Answer Code": "19",
*           "Answer Label": "hQualityScoreAnalyze_19 (Quality Score response - ^getTitleLabel('loadTxt')^  ^hQualityScoreAnalyzeTXT()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hQualityScoreAnalyze.<br>
compute hqsa_flag = 0.<br>
DO REPEAT x = hQualityScoreAnalyze_1 TO hQualityScoreAnalyze_19.<br>
  IF (NOT(MISSING(x))) hqsa_flag = 1.<br>
END REPEAT.<br>
temporary.<br>
sel if ( Forward() AND NOT(f('hQualityScoreAnalyze').toBoolean()) AND flag AND hqsa_flag = 0 ).<br>
list respid hQualityScoreAnalyze_1 TO hQualityScoreAnalyze_19.<br>
del var hqsa_flag.<br>
```

```

* ============================================================.
* Question ID: xhidDQ1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "xhidDQ1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "xhidDQ1 - Speeder - total tested",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3089",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "xhidDQ1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Speeder 1"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Speeder 2"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Speeder 3"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Speeder 4"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ1_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Speeder 5"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit xhidDQ1.<br>
compute xhidDQ1_flag = 0.<br>
DO REPEAT x = xhidDQ1_1 TO xhidDQ1_5.<br>
  /* Flag only when non-missing and out of allowed answer codes (1..5) */<br>
  IF (NOT(MISSING(x)) AND (~RANGE(x,1,5))) xhidDQ1_flag = 1.<br>
END REPEAT.<br>
temporary.<br>
sel if ( xhidDQ1_flag > 0 ).<br>
list respid xhidDQ1_1 TO xhidDQ1_5.<br>
del var xhidDQ1_flag.<br>
```

* ============================================================.
* Question ID: hidDQ1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidDQ1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidDQ1 - Speeder - total failed",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3090",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidDQ1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Speeder 1"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Speeder 2"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Speeder 3"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Speeder 4"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ1_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Speeder 5"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hidDQ1.<br>
* Validate hidDQ1 (5 item failed-set). Check domain (expected binary 0..1) and totals.<br>
DO REPEAT v = hidDQ1_1 TO hidDQ1_5.<br>
  IF (MISS(v) OR ~RANGE(v,0,1)) hdrange_flag = 1.<br>
END REPEAT.<br>
temporary.<br>
SEL IF hdrange_flag > 0.<br>
LIST respid hdrange_flag hidDQ1_1 TO hidDQ1_5.<br>
DEL VAR hdrange_flag.<br>
* Compute failed total and list any unexpected totals (sanity check).<br>
COMPUTE failed_total = SUM(hidDQ1_1 TO hidDQ1_5).<br>
temporary.<br>
/* Cases where computed total is impossible (sanity) or all missing vs some non-missing handled below) */<br>
SEL IF (MISSED(failed_total) AND NVAlid(hidDQ1_1 TO hidDQ1_5) > 0) OR (failed_total < 0) OR (failed_total > 5).<br>
LIST respid failed_total hidDQ1_1 TO hidDQ1_5.<br>
DEL VAR failed_total.<br>

* ============================================================.
* Question ID: xhidDQ2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "xhidDQ2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "xhidDQ2 - Straightliner - total tested",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3091",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "xhidDQ2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "SL01"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "SL02"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "SL03"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "SL04"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "SL05"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "SL06"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "SL07"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "SL08"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "SL09"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "SL10"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "SL11"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "SL12"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_13",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": "SL13"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_14",
*       "answers": [
*         {
*           "Answer Code": "14",
*           "Answer Label": "SL14"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_15",
*       "answers": [
*         {
*           "Answer Code": "15",
*           "Answer Label": "SL15"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_16",
*       "answers": [
*         {
*           "Answer Code": "16",
*           "Answer Label": "SL16"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_17",
*       "answers": [
*         {
*           "Answer Code": "17",
*           "Answer Label": "SL17"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_18",
*       "answers": [
*         {
*           "Answer Code": "18",
*           "Answer Label": "SL18"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_19",
*       "answers": [
*         {
*           "Answer Code": "19",
*           "Answer Label": "SL19"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_20",
*       "answers": [
*         {
*           "Answer Code": "20",
*           "Answer Label": "SL20"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_21",
*       "answers": [
*         {
*           "Answer Code": "21",
*           "Answer Label": "SL21"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_22",
*       "answers": [
*         {
*           "Answer Code": "22",
*           "Answer Label": "SL22"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_23",
*       "answers": [
*         {
*           "Answer Code": "23",
*           "Answer Label": "SL23"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_24",
*       "answers": [
*         {
*           "Answer Code": "24",
*           "Answer Label": "SL24"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_25",
*       "answers": [
*         {
*           "Answer Code": "25",
*           "Answer Label": "SL25"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_26",
*       "answers": [
*         {
*           "Answer Code": "26",
*           "Answer Label": "SL26"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_27",
*       "answers": [
*         {
*           "Answer Code": "27",
*           "Answer Label": "SL27"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_28",
*       "answers": [
*         {
*           "Answer Code": "28",
*           "Answer Label": "SL28"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_29",
*       "answers": [
*         {
*           "Answer Code": "29",
*           "Answer Label": "SL29"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ2_30",
*       "answers": [
*         {
*           "Answer Code": "30",
*           "Answer Label": "SL30"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit xhidDQ2.<br>
* Validate xhidDQ2 (30 item tested-set). Domain checks, computed tested_total, and straightline detection.<br>
COMPUTE tested_total = SUM(xhidDQ2_1 TO xhidDQ2_30).<br>
EXECUTE.<br>
* Check for missing/out-of-range on any tested flags (expect binary 0..1).<br>
DO REPEAT x = xhidDQ2_1 TO xhidDQ2_30.<br>
  IF (MISS(x) OR ~RANGE(x,0,1)) xhidDQ2_flag = 1.<br>
END REPEAT.<br>
temporary.<br>
SEL IF xhidDQ2_flag > 0.<br>
LIST respid xhidDQ2_flag tested_total xhidDQ2_1 TO xhidDQ2_30.<br>
DEL VAR xhidDQ2_flag.<br>
* Cases where computed tested_total is missing but some item values exist (sanity).<br>
temporary.<br>
SEL IF MISSED(tested_total) AND NVAlid(xhidDQ2_1 TO xhidDQ2_30) > 0.<br>
LIST respid tested_total xhidDQ2_1 TO xhidDQ2_30.<br>
DEL VAR tested_total.<br>
* Straightline / flatline detection (many identical values across tested flags). Threshold chosen for 30 items.<br>
COUNT cnt0 = xhidDQ2_1 TO xhidDQ2_30 (0).<br>
COUNT cnt1 = xhidDQ2_1 TO xhidDQ2_30 (1).<br>
COMPUTE xhidDQ2_flatline = 0.<br>
IF cnt0 > 25 OR cnt1 > 25 xhidDQ2_flatline = 1.<br>
temporary.<br>
SEL IF xhidDQ2_flatline = 1.<br>
LIST respid cnt0 cnt1 xhidDQ2_1 TO xhidDQ2_30.<br>
DEL VAR cnt0 cnt1 xhidDQ2_flatline.<br>

* ============================================================.
* Question ID: xhidDQ3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "xhidDQ3",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "xhidDQ3 - Poor OE - total tested",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3093",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "xhidDQ3_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "OE1"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ3_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "OE2"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ3_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "OE3"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ3_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "OE4"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ3_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "OE5"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit xhidDQ3.<br>
* Validate xhidDQ3 (5 item tested-set for OE quality). Domain checks and totals.<br>
COMPUTE tested_total = SUM(xhidDQ3_1 TO xhidDQ3_5).<br>
EXECUTE.<br>
DO REPEAT x = xhidDQ3_1 TO xhidDQ3_5.<br>
  IF (MISS(x) OR ~RANGE(x,0,1)) xhidDQ3_flag = 1.<br>
END REPEAT.<br>
temporary.<br>
SEL IF xhidDQ3_flag > 0.<br>
LIST respid xhidDQ3_flag tested_total xhidDQ3_1 TO xhidDQ3_5.<br>
DEL VAR xhidDQ3_flag.<br>
temporary.<br>
SEL IF MISSED(tested_total) AND NVAlid(xhidDQ3_1 TO xhidDQ3_5) > 0.<br>
LIST respid tested_total xhidDQ3_1 TO xhidDQ3_5.<br>
DEL VAR tested_total.<br>

* ============================================================.
* Question ID: hidDQ3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidDQ3",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidDQ3 - Poor OE - total failed",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3094",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidDQ3_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "OE1"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ3_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "OE2"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ3_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "OE3"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ3_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "OE4"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ3_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "OE5"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hidDQ3.<br>
* Full consistency checks between xhidDQ3 (tested) and hidDQ3 (failed) for OE quality.<br>
COMPUTE tested_total = SUM(xhidDQ3_1 TO xhidDQ3_5).<br>
COMPUTE failed_total  = SUM(hidDQ3_1 TO hidDQ3_5).<br>
EXECUTE.<br>
temporary.<br>
SEL IF (NOT MISSING(failed_total) AND NOT MISSING(tested_total) AND failed_total > tested_total).<br>
LIST respid tested_total failed_total hidDQ3_1 TO hidDQ3_5 xhidDQ3_1 TO xhidDQ3_5.<br>
DEL VAR tested_total failed_total.<br>
DO REPEAT tx = xhidDQ3_1 TO xhidDQ3_5 / fx = hidDQ3_1 TO hidDQ3_5.<br>
  IF ((tx = 0 OR MISSING(tx)) AND (NOT MISSING(fx) AND fx <> 0)) hidDQ3_flag_failed_but_not_tested = 1.<br>
  IF (tx > 0 AND (MISSING(fx) OR ~RANGE(fx,0,1))) hidDQ3_flag_tested_but_failed_invalid = 1.<br>
END REPEAT.<br>
temporary.<br>
SEL IF (hidDQ3_flag_failed_but_not_tested > 0 OR hidDQ3_flag_tested_but_failed_invalid > 0).<br>
LIST respid hidDQ3_flag_failed_but_not_tested hidDQ3_flag_tested_but_failed_invalid xhidDQ3_1 TO xhidDQ3_5 hidDQ3_1 TO hidDQ3_5.<br>
DEL VAR hidDQ3_flag_failed_but_not_tested hidDQ3_flag_tested_but_failed_invalid.<br>

* ============================================================.
* Question ID: xhidDQ4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "xhidDQ4",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "xhidDQ4 - Inconsistent Answers - total tested",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3095",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "xhidDQ4_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "IA1"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ4_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "IA2"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ4_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "IA3"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ4_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "IA4"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ4_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "IA5"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit xhidDQ4.<br>
* Validate xhidDQ4 (5 item tested-set for inconsistent answers). Domain checks and totals.<br>
COMPUTE tested_total = SUM(xhidDQ4_1 TO xhidDQ4_5).<br>
EXECUTE.<br>
DO REPEAT x = xhidDQ4_1 TO xhidDQ4_5.<br>
  IF (MISS(x) OR ~RANGE(x,0,1)) xhidDQ4_flag = 1.<br>
END REPEAT.<br>
temporary.<br>
SEL IF xhidDQ4_flag > 0.<br>
LIST respid xhidDQ4_flag tested_total xhidDQ4_1 TO xhidDQ4_5.<br>
DEL VAR xhidDQ4_flag.<br>
temporary.<br>
SEL IF MISSED(tested_total) AND NVAlid(xhidDQ4_1 TO xhidDQ4_5) > 0.<br>
LIST respid tested_total xhidDQ4_1 TO xhidDQ4_5.<br>
DEL VAR tested_total.<br>

* ============================================================.
* Question ID: hidDQ2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidDQ2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidDQ2 - Straightliner - total failed",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3092",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidDQ2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "SL01"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "SL02"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "SL03"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "SL04"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "SL05"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "SL06"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "SL07"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "SL08"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "SL09"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "SL10"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_11",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": "SL11"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_12",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": "SL12"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_13",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": "SL13"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_14",
*       "answers": [
*         {
*           "Answer Code": "14",
*           "Answer Label": "SL14"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_15",
*       "answers": [
*         {
*           "Answer Code": "15",
*           "Answer Label": "SL15"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_16",
*       "answers": [
*         {
*           "Answer Code": "16",
*           "Answer Label": "SL16"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_17",
*       "answers": [
*         {
*           "Answer Code": "17",
*           "Answer Label": "SL17"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_18",
*       "answers": [
*         {
*           "Answer Code": "18",
*           "Answer Label": "SL18"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_19",
*       "answers": [
*         {
*           "Answer Code": "19",
*           "Answer Label": "SL19"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_20",
*       "answers": [
*         {
*           "Answer Code": "20",
*           "Answer Label": "SL20"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_21",
*       "answers": [
*         {
*           "Answer Code": "21",
*           "Answer Label": "SL21"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_22",
*       "answers": [
*         {
*           "Answer Code": "22",
*           "Answer Label": "SL22"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_23",
*       "answers": [
*         {
*           "Answer Code": "23",
*           "Answer Label": "SL23"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_24",
*       "answers": [
*         {
*           "Answer Code": "24",
*           "Answer Label": "SL24"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_25",
*       "answers": [
*         {
*           "Answer Code": "25",
*           "Answer Label": "SL25"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_26",
*       "answers": [
*         {
*           "Answer Code": "26",
*           "Answer Label": "SL26"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_27",
*       "answers": [
*         {
*           "Answer Code": "27",
*           "Answer Label": "SL27"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_28",
*       "answers": [
*         {
*           "Answer Code": "28",
*           "Answer Label": "SL28"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_29",
*       "answers": [
*         {
*           "Answer Code": "29",
*           "Answer Label": "SL29"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ2_30",
*       "answers": [
*         {
*           "Answer Code": "30",
*           "Answer Label": "SL30"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hidDQ2. <br>
* Compute aggregate tested and failed totals (xhidDQ2_1..30 expected to exist as tested indicators).<br>
compute tested_total = sum(xhidDQ2_1 to xhidDQ2_30).<br>
compute failed_total  = sum(hidDQ2_1 to hidDQ2_30).<br>
exe.<br>
<br>
* 1) Aggregate check: failed_total should not exceed tested_total.<br>
temporary.<br>
sel if (not missing(failed_total) and not missing(tested_total) and failed_total > tested_total).<br>
list respid tested_total failed_total hidDQ2_1 to hidDQ2_30 xhidDQ2_1 to xhidDQ2_30.<br>
* keep computed totals for subsequent checks (do not delete yet).<br>
<br>
* 2) Pairwise per-item consistency checks (tested vs failed).<br>
compute flag_not_tested_but_failed = 0.<br>
compute flag_tested_but_hid_missing_invalid = 0.<br>
do repeat tx = xhidDQ2_1 to xhidDQ2_30 / fx = hidDQ2_1 to hidDQ2_30.<br>
  /* If not tested (tx=0 or missing) but hid shows a failure (non-missing and not 0) */<br>
  if ( (tx = 0 or miss(tx)) and (not miss(fx) and fx <> 0) ) flag_not_tested_but_failed = 1.<br>
  /* If tested (tx>0) but hid is missing or out of expected binary range 0..1 */<br>
  if ( tx > 0 and ( miss(fx) or ~range(fx,0,1) ) ) flag_tested_but_hid_missing_invalid = 1.<br>
end repeat.<br>
temporary.<br>
sel if flag_not_tested_but_failed > 0 or flag_tested_but_hid_missing_invalid > 0.<br>
list respid tested_total failed_total flag_not_tested_but_failed flag_tested_but_hid_missing_invalid xhidDQ2_1 to xhidDQ2_30 hidDQ2_1 to hidDQ2_30.<br>
<br>
* 3) When any tested items exist (tested_total > 0) ensure hid items are present and within range.<br>
compute flt_hidDQ2 = 0.<br>
if tested_total > 0 flt_hidDQ2 = 1.<br>
<br>
temporary.<br>
sel if flt_hidDQ2 = 1.<br>
compute hidDQ2_missing_or_invalid_when_tested = 0.<br>
do repeat h = hidDQ2_1 to hidDQ2_30.<br>
  /* For respondents where tests were run, each hid should be present and within 0..1 (binary) */<br>
  if ( miss(h) or ~range(h,0,1) ) hidDQ2_missing_or_invalid_when_tested = 1.<br>
end repeat.<br>
sel if hidDQ2_missing_or_invalid_when_tested > 0.<br>
list respid tested_total hidDQ2_missing_or_invalid_when_tested hidDQ2_1 to hidDQ2_30 xhidDQ2_1 to xhidDQ2_30.<br>
<br>
* 4) Complementary case: tested_total could not be computed (missing) but there are hid values present → flag.<br>
temporary.<br>
sel if miss(tested_total) and nvalid(hidDQ2_1 to hidDQ2_30) > 0.<br>
list respid tested_total hidDQ2_1 to hidDQ2_30 xhidDQ2_1 to xhidDQ2_30.<br>
<br>
* Cleanup temporary flags and computed totals after listings.<br>
del var flag_not_tested_but_failed flag_tested_but_hid_missing_invalid hidDQ2_missing_or_invalid_when_tested flt_hidDQ2 tested_total failed_total.

* ============================================================.
* Question ID: hidDQ4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidDQ4",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidDQ4 - Inconsistent Answers - total failed",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3096",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidDQ4_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "IA1"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ4_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "IA2"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ4_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "IA3"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ4_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "IA4"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ4_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "IA5"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hidDQ4.<br>compute hidDQ4_chk = sum(hidDQ4_1 to hidDQ4_5).<br>temporary.<br>sel if miss(hidDQ4) or ~range(hidDQ4,0,5) or (hidDQ4_chk <> hidDQ4).<br>list respid hidDQ4 hidDQ4_1 to hidDQ4_5.<br>del var hidDQ4_chk.

* ============================================================.
* Question ID: xhidDQ5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "xhidDQ5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "xhidDQ5 - Red Herring - total tested",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3097",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "xhidDQ5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "RH1"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "RH2"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "RH3"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "RH4"
*         }
*       ]
*     },
*     {
*       "Variable ID": "xhidDQ5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "RH5"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit xhidDQ5.<br>compute xhidDQ5_chk = sum(xhidDQ5_1 to xhidDQ5_5).<br>temporary.<br>sel if miss(xhidDQ5) or ~range(xhidDQ5,0,5) or (xhidDQ5_chk <> xhidDQ5).<br>list respid xhidDQ5 xhidDQ5_1 to xhidDQ5_5 xhidDQ5_chk.<br>del var xhidDQ5_chk.

* ============================================================.
* Question ID: hidDQ5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidDQ5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidDQ5 - Red Herring - total failed",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3098",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidDQ5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "RH1"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "RH2"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "RH3"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "RH4"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidDQ5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "RH5"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hidDQ5.<br>compute hidDQ5_chk = sum(hidDQ5_1 to hidDQ5_5).<br>temporary.<br>sel if miss(hidDQ5) or ~range(hidDQ5,0,5) or (hidDQ5_chk <> hidDQ5).<br>list respid hidDQ5 hidDQ5_1 to hidDQ5_5.<br>del var hidDQ5_chk.

* ============================================================.
* Question ID: tested1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "tested1",
*   "Question Label": "tested1 - Speeders - Total Tested",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "tested1",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3102"
*   }
* }
* -----------------------------------------------------------

tit tested1 - numeric validity.<br>temporary.<br>sel if miss(tested1) or ~range(tested1,0,999).<br>list respid tested1.<br>

* ============================================================.
* Question ID: tested2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "tested2",
*   "Question Label": "tested2 - Straightliners - Total Tested",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "tested2",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3104"
*   }
* }
* -----------------------------------------------------------

tit tested2 - numeric validity.<br>temporary.<br>sel if miss(tested2) or ~range(tested2,0,999).<br>list respid tested2.

* ============================================================.
* Question ID: failed1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "failed1",
*   "Question Label": "failed1 - Speeders - Total failed",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "failed1",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3103"
*   }
* }
* -----------------------------------------------------------

tit failed1.<br>
* The variable 'failed1' is defined as VariableType='Hidden' and is marked ExcludeFromReporting='true' and NotPerformDataCleaningOnMasking='true'.<br>
* Per QA policy, no standard validation (temporary sel if / list) or reporting is generated for hidden/masked variables. No range or missing-value checks are emitted because explicit numeric bounds are not provided in the metadata.<br>
* If explicit validation is required later, supply Lower/Upper limit metadata and remove ExcludeFromReporting/NotPerformDataCleaningOnMasking flags to allow generation of checks.<br>
```

* ============================================================.
* Question ID: failed2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "failed2",
*   "Question Label": "failed2 - Straightliners - Total failed",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "failed2",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3105"
*   }
* }
* -----------------------------------------------------------

tit failed2.<br>temporary.<br>sel if miss(failed2) or ~range(failed2,0,999).<br>list respid, failed2.
```

```

* ============================================================.
* Question ID: tested3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "tested3",
*   "Question Label": "tested3 - OE - Total Tested",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "tested3",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3106"
*   }
* }
* -----------------------------------------------------------

tit tested3.<br>temporary.<br>sel if miss(tested3) or ~range(tested3,0,999).<br>list respid, tested3.
```

```

* ============================================================.
* Question ID: failed3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "failed3",
*   "Question Label": "failed3 - OE - Total failed",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "failed3",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3107"
*   }
* }
* -----------------------------------------------------------

tit failed3.<br>temporary.<br>sel if miss(failed3) or ~range(failed3,0,999) or (not miss(tested3) and failed3>tested3).<br>list respid, failed3 tested3.
```

```

* ============================================================.
* Question ID: tested4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "tested4",
*   "Question Label": "tested4 - Inconsistent Answers - Total Tested",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "tested4",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3108"
*   }
* }
* -----------------------------------------------------------

tit tested4.<br>temporary.<br>sel if miss(tested4) or ~range(tested4,0,999).<br>list respid, tested4.
```

```

* ============================================================.
* Question ID: failed4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "failed4",
*   "Question Label": "failed4 - Inconsistent Answers - Total failed",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "failed4",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3109"
*   }
* }
* -----------------------------------------------------------

tit failed4.<br>temporary.<br>sel if miss(failed4) or ~range(failed4,0,999) or (not miss(tested4) and failed4>tested4).<br>list respid, failed4 tested4.
```

```

* ============================================================.
* Question ID: tested5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "tested5",
*   "Question Label": "tested5 - Red herring - Total tested",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "tested5",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3110"
*   }
* }
* -----------------------------------------------------------

tit tested5.<br>temporary.<br>sel if miss(tested5) or ~range(tested5,0,999).<br>list respid, tested5.
```

* ============================================================.
* Question ID: failed5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "failed5",
*   "Question Label": "failed5 - Red herring - Total failed",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "failed5",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3111"
*   }
* }
* -----------------------------------------------------------

compute failed5_flag = 0.<br>
* Check hidden numeric OE failed5: should be numeric and non-missing (basic range >=0). Honor QOF override (QOF=1 skips validation).<br>
if ( (QOF <> 1) and ( miss(failed5) or ~range(failed5,0,999999999) ) ) failed5_flag = 1.<br>
temporary.<br>
sel if failed5_flag = 1.<br>
list respid failed5 QOF.<br>
del var failed5_flag.<br>

* ============================================================.
* Question ID: weighted
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "weighted",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "weighted - Weights applied",
*   "question_attributes": {
*     "QuestionLayoutName": "Numeric list",
*     "Precision": "10",
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "Numeric": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "OpenText": "true",
*     "EntityId": "3113",
*     "AutoSum": "true",
*     "NotPerformDataCleaningOnMasking": "true",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "weighted_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Speeders tested (^f('tested1')^) X 1 (weighted - Weights applied)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "weighted_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Speeders failed (^f('failed1')^) X 3 (weighted - Weights applied)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "weighted_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Straightliners tested (^f('tested2')^) X 7 (weighted - Weights applied)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "weighted_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Straightliners failed (^f('failed2')^) X 9 (weighted - Weights applied)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "weighted_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "OE tested (^f('tested3')^) X 1 (weighted - Weights applied)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "weighted_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "OE failed (^f('failed3')^) X 3 (weighted - Weights applied)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "weighted_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Inconsistent tested (^f('tested4')^) X 7 (weighted - Weights applied)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "weighted_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Inconsistent failed (^f('failed4')^) X 9 (weighted - Weights applied)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "weighted_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Red herring tested (^f('tested5')^) X 1 (weighted - Weights applied)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "weighted_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Red herring failed (^f('failed5')^) X 3 (weighted - Weights applied)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

* Validate numeric multi (weighted_1 .. weighted_10). Check presence and basic non-negative range. Honor QOF override (QOF=1 skips checks).<br>
compute weight_flag = 0.<br>
DO REPEAT w = weighted_1 TO weighted_10.<br>
  if ( (QOF <> 1) and ( miss(w) or ~range(w,0,999999999) ) ) weight_flag = 1.<br>
END REPEAT.<br>
temporary.<br>
sel if weight_flag = 1.<br>
list respid weighted_1 to weighted_10 QOF.<br>
del var weight_flag.<br>

* ============================================================.
* Question ID: totweight
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "totweight",
*   "Question Label": "totweight - Total of 10 weighted variables",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "totweight",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Rows": "1",
*     "Precision": "9",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3124"
*   }
* }
* -----------------------------------------------------------

* Recompute total of weighted_1..weighted_10 and compare to stored totweight. Honor QOF override (QOF=1 skips checks).<br>
compute totweight_calc = sum(weighted_1 to weighted_10).<br>
compute totflag = 0.<br>
if ( (QOF <> 1) and ( miss(totweight) or abs(totweight - totweight_calc) > 0.00001 ) ) totflag = 1.<br>
temporary.<br>
sel if totflag = 1.<br>
list respid weighted_1 to weighted_10 totweight totweight_calc QOF.<br>
del var totweight_calc totflag.<br>

* ============================================================.
* Question ID: checksum
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "checksum",
*   "Question Label": "checksum - totweight (^f('totweight')^) divided by 10.",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "checksum",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "Scale": "2",
*     "Precision": "9",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "EntityId": "3125"
*   }
* }
* -----------------------------------------------------------

* Validate checksum = totweight/10 (scale 2). Recompute totweight from weighted_* to avoid relying on AutoSum. Use rounding/tolerance to 2 decimals. Honor QOF override (QOF=1 skips checks).<br>
compute totweight_calc = sum(weighted_1 to weighted_10).<br>
compute checksum_calc = totweight_calc / 10.<br>
* Round to 2 decimals using truncation technique to avoid floating precision issues.<br>
compute checksum_chk = trunc(checksum_calc * 100 + 0.5) / 100.<br>
compute checksum_flag = 0.<br>
if ( (QOF <> 1) and ( miss(checksum) or abs(checksum - checksum_chk) > 0.01 ) ) checksum_flag = 1.<br>
temporary.<br>
sel if checksum_flag = 1.<br>
list respid weighted_1 to weighted_10 totweight checksum checksum_chk QOF.<br>
del var totweight_calc checksum_calc checksum_chk checksum_flag.<br>

* ============================================================.
* Question ID: QOF
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "QOF",
*   "Question Label": "QOF - Override flag",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "QOF",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": 0
*     },
*     {
*       "Answer Code": "1",
*       "Answer Label": 1
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "NotPerformDataCleaningOnMasking": "true",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3126"
*   }
* }
* -----------------------------------------------------------

* Validate override flag QOF contains valid codes 0 or 1.<br>
compute QOF_flag = 0.<br>
if ( miss(QOF) or (QOF <> 0 and QOF <> 1) ) QOF_flag = 1.<br>
temporary.<br>
sel if QOF_flag = 1.<br>
list respid QOF.<br>
del var QOF_flag.<br>

* ============================================================.
* Question ID: respLOI
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "respLOI",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "false //LOI vars ans scripts"
*   ],
*   "conditions": [],
*   "Question Label": "respLOI",
*   "question_attributes": {
*     "Scale": "2",
*     "Precision": "13",
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "Numeric": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "OpenText": "true",
*     "EntityId": "3914",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "respLOI_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "screener LOI (respLOI)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "respLOI_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "main part LOI (respLOI)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "respLOI_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "total survey LOI in seconds (respLOI)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit respLOI.<br>/* Check screener and main-part LOI (seconds) */<br>DO REPEAT v=respLOI_1 respLOI_2.<br>  temporary.<br>  sel if miss(v) or ~range(v,0,9999999).<br>  list respid v.<br>END REPEAT.<br><br>/* Check total LOI (seconds) */<br>temporary.<br>sel if miss(respLOI_3) or ~range(respLOI_3,0,99999999).<br>list respid respLOI_3.<br><br>/* Consistency: total equals sum of parts */<br>compute respLOI_chk = respLOI_1 + respLOI_2.<br>exe.<br>temporary.<br>sel if not miss(respLOI_3) and (respLOI_3 <> respLOI_chk).<br>list respid respLOI_1 respLOI_2 respLOI_3 respLOI_chk.<br>del var respLOI_chk.<br>

* ============================================================.
* Question ID: surveyLOI
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "surveyLOI",
*   "Question Label": "surveyLOI - This question holds the LOI in minutes, for each respondent.  THE VARIABLE TYPE FOR THIS QUESTION MUST BE SET TO 'HIDDEN'.",
*   "question_type": "Open",
*   "entry_conditions": [
*     "false //LOI vars ans scripts"
*   ],
*   "conditions": [],
*   "Variable ID": "surveyLOI",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "Columns": "20",
*     "Scale": "2",
*     "LowerLimit": "0",
*     "Rows": "1",
*     "Precision": "20",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "2753912551"
*   }
* }
* -----------------------------------------------------------

tit surveyLOI.<br>/* surveyLOI should reflect respLOI_3 converted to minutes */<br>compute surveyLOI_chk = respLOI_3 / 60.<br>compute surveyLOI_diff = abs(surveyLOI - surveyLOI_chk).<br>temporary.<br>sel if miss(surveyLOI) or surveyLOI < 0 or surveyLOI > 999999 or surveyLOI_diff > 0.02.<br>list respid surveyLOI respLOI_3 surveyLOI_chk surveyLOI_diff.<br>del var surveyLOI_chk surveyLOI_diff.<br><br>/* If surveyLOI is expected to be integer minutes, uncomment and use the block below instead (optional) */<br>*compute surveyLOI_chk_int = rint(respLOI_3 / 60).<br>*temporary.<br>*sel if not miss(surveyLOI) and (surveyLOI <> surveyLOI_chk_int).<br>*list respid surveyLOI respLOI_3 surveyLOI_chk_int.<br>*del var surveyLOI_chk_int.<br>

* ============================================================.
* Question ID: hLOIupdated
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hLOIupdated",
*   "Question Label": "hLOIupdated",
*   "question_type": "Single",
*   "entry_conditions": [
*     "false //LOI vars ans scripts"
*   ],
*   "conditions": [],
*   "Variable ID": "hLOIupdated",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": 1
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3916"
*   }
* }
* -----------------------------------------------------------

tit hLOIupdated.<br>/* Expect hLOIupdated=1 when LOI update logic ran (respLOI_3 present and >0). Adjust rule if your project uses different logic. */<br>compute hLOIupdated_chk = 0.<br>if (not miss(respLOI_3) and respLOI_3 > 0) hLOIupdated_chk = 1.<br>temporary.<br>sel if miss(hLOIupdated) or ~range(hLOIupdated,0,1) or (hLOIupdated_chk <> hLOIupdated).<br>list respid hLOIupdated hLOIupdated_chk respLOI_3 surveyLOI RespondentLOI.<br>del var hLOIupdated_chk.<br>

* ============================================================.
* Question ID: RespondentLOI
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "RespondentLOI",
*   "Question Label": "RespondentLOI - This question holds the LOI in minutes, for each respondent.  [Hold data using Traditional LOI calculations]",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "RespondentLOI",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "Columns": "20",
*     "Scale": "2",
*     "Rows": "1",
*     "Precision": "20",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3915"
*   }
* }
* -----------------------------------------------------------

tit RespondentLOI.<br>/* RespondentLOI (minutes) should be consistent with respLOI_3 (seconds) */<br>compute RespondentLOI_chk = respLOI_3 / 60.<br>compute RespondentLOI_diff = abs(RespondentLOI - RespondentLOI_chk).<br>temporary.<br>sel if miss(RespondentLOI) or RespondentLOI < 0 or RespondentLOI > 999999 or RespondentLOI_diff > 0.02.<br>list respid RespondentLOI respLOI_3 RespondentLOI_chk RespondentLOI_diff.<br>del var RespondentLOI_chk RespondentLOI_diff.<br><br>/* If RespondentLOI should be integer minutes, use rint() comparison instead (optional) */<br>*compute RespondentLOI_chk_int = rint(respLOI_3 / 60).<br>*temporary.<br>*sel if not miss(RespondentLOI) and (RespondentLOI <> RespondentLOI_chk_int).<br>*list respid RespondentLOI respLOI_3 RespondentLOI_chk_int.<br>*del var RespondentLOI_chk_int.<br>

* ============================================================.
* Question ID: qTimeStamp
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qTimeStamp",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "qTimeStamp - //Stores start timestamps of each section",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "OpenText": "true",
*     "EntityId": "2865",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "qTimeStamp_start",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Start Time (qTimeStamp - //Stores start timestamps of each section)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTimeStamp_screener",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Screener (qTimeStamp - //Stores start timestamps of each section)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTimeStamp_sec1",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Section 1 (qTimeStamp - //Stores start timestamps of each section)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTimeStamp_sec2",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Section 2 (qTimeStamp - //Stores start timestamps of each section)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTimeStamp_sec3",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Section 3 (qTimeStamp - //Stores start timestamps of each section)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTimeStamp_Sec4",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Section 4 (qTimeStamp - //Stores start timestamps of each section)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTimeStamp_main",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Main (qTimeStamp - //Stores start timestamps of each section)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qTimeStamp_surveyLOI",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Survey length of interview (qTimeStamp - //Stores start timestamps of each section)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit qTimeStamp string checks.<br>/* qTimeStamp elements are strings — check for empty values (blank string) */<br>DO REPEAT v = qTimeStamp_start qTimeStamp_screener qTimeStamp_sec1 qTimeStamp_sec2 qTimeStamp_sec3 qTimeStamp_Sec4 qTimeStamp_main qTimeStamp_surveyLOI.<br>  temporary.<br>  sel if v = "". <br>  list respid v.<br>END REPEAT.<br>

* ============================================================.
* Question ID: qIntLen
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qIntLen",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI)",
*   "question_attributes": {
*     "Precision": "10",
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "LowerLimit": "0",
*     "Numeric": "true",
*     "UpperLimit": "9999999999",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "OpenText": "true",
*     "EntityId": "2866",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "qIntLen_start",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Start Time (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qIntLen_screener",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Screener (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qIntLen_sec1",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Section 1 (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qIntLen_sec2",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Section 2 (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qIntLen_sec3",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Section 3 (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qIntLen_Sec4",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Section 4 (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qIntLen_main",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Main (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qIntLen_surveyLOI",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Survey length of interview (//Stores length of time per section (rounds up LOI) - //Stores length of time per section (rounds up LOI))"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit qIntLen checks.<br>/* Per-field numeric range checks (units: as captured in survey; lower=0, upper from details) */<br>DO REPEAT v = qIntLen_start qIntLen_screener qIntLen_sec1 qIntLen_sec2 qIntLen_sec3 qIntLen_Sec4 qIntLen_main qIntLen_surveyLOI.<br>  temporary.<br>  sel if miss(v) or ~range(v,0,9999999999).<br>  list respid v.<br>END REPEAT.<br><br>/* Sum consistency: section-level lengths should sum to qIntLen_surveyLOI (if present) */<br>compute qIntLen_sum = sum(qIntLen_start, qIntLen_screener, qIntLen_sec1, qIntLen_sec2, qIntLen_sec3, qIntLen_Sec4, qIntLen_main).<br>temporary.<br>sel if not miss(qIntLen_surveyLOI) and (qIntLen_sum <> qIntLen_surveyLOI).<br>list respid qIntLen_sum qIntLen_surveyLOI qIntLen_start qIntLen_screener qIntLen_sec1 qIntLen_sec2 qIntLen_sec3 qIntLen_Sec4 qIntLen_main.<br><br>/* Compare qIntLen_sum (assumed minutes) to respLOI_3 (seconds) after converting units (flag if >1 second difference) */<br>compute qIntLen_sum_secs = qIntLen_sum * 60.<br>compute qIntLen_diff_sec = abs(qIntLen_sum_secs - respLOI_3).<br>temporary.<br>sel if not miss(respLOI_3) and qIntLen_diff_sec > 1.<br>list respid qIntLen_sum qIntLen_sum_secs respLOI_3 qIntLen_diff_sec qIntLen_start qIntLen_screener qIntLen_sec1 qIntLen_sec2 qIntLen_sec3 qIntLen_Sec4 qIntLen_main.<br>del var qIntLen_sum qIntLen_sum_secs qIntLen_diff_sec.<br>

* ============================================================.
* Question ID: hidTimeOutMin
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidTimeOutMin",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hidTimeOutMin - //time out in minutes",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "LowerLimit": "0",
*     "Numeric": "true",
*     "UpperLimit": "99",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "OpenText": "true",
*     "EntityId": "3194",
*     "NotPerformDataCleaningOnMasking": "true",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hidTimeOutMin_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "minutes for warning (hidTimeOutMin - //time out in minutes)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hidTimeOutMin_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "minutes for redirect (hidTimeOutMin - //time out in minutes)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hidTimeOutMin.<br>
do repeat x=hidTimeOutMin_1 to hidTimeOutMin_2.<br>
if miss(x) or ~range(x,0,99) flag=1.<br>
end repeat.<br>
temporary.<br>
sel if flag>0.<br>
list respid hidTimeOutMin_1 hidTimeOutMin_2.<br>
delete variables flag.
```

```

* ============================================================.
* Question ID: hSType
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hSType",
*   "Question Label": "hSType",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hSType",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Normal"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Patient Chart"
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3199"
*   }
* }
* -----------------------------------------------------------

tit hSType.<br>
temporary.<br>
sel if miss(hSType) or ~range(hSType,1,2).<br>
list respid, hSType.
```

```

* ============================================================.
* Question ID: hidSessionsCount
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidSessionsCount",
*   "Question Label": "hidSessionsCount",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidSessionsCount_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Number of sessions (hidSessionsCount)"
*     }
*   ],
*   "question_attributes": {
*     "Precision": "3",
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "LowerLimit": "0",
*     "Numeric": "true",
*     "UpperLimit": "999",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "OpenText": "true",
*     "EntityId": "3195",
*     "NotPerformDataCleaningOnMasking": "true",
*     "UpperLimitType": "SmallerOrEqual"
*   }
* }
* -----------------------------------------------------------

tit hidSessionsCount.<br>
temporary.<br>
sel if miss(hidSessionsCount_1) or ~range(hidSessionsCount_1,0,999).<br>
list respid, hidSessionsCount_1.
```

```

* ============================================================.
* Question ID: id
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "id",
*   "Question Label": "//background: used in sample upload  - //background: used in sample upload ",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "id",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Background",
*     "ExcludeTranslation": "true",
*     "EntityId": "2753912805"
*   }
* }
* -----------------------------------------------------------

tit id.<br>
temporary.<br>
sel if id = "".<br>
list respid, id.
```

```

* ============================================================.
* Question ID: SurveyID
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "SurveyID",
*   "Question Label": "//hidden: stores survey R number - //hidden: stores survey R number",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "SurveyID",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "FieldWidth": "30",
*     "ExcludeTranslation": "true",
*     "EntityId": "2753912813"
*   }
* }
* -----------------------------------------------------------

tit SurveyID.<br>
temporary.<br>
sel if SurveyID = "".<br>
list respid, SurveyID.
```

```

* ============================================================.
* Question ID: prepwd
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "prepwd",
*   "Question Label": "prepwd - //hidden: stores pretest password",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "prepwd",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "FieldWidth": "30",
*     "ExcludeTranslation": "true",
*     "EntityId": "5378"
*   }
* }
* -----------------------------------------------------------

tit prepwd.<br>
temporary.<br>
sel if prepwd = "".<br>
list respid, prepwd.
```

* ============================================================.
* Question ID: QRedirect
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "QRedirect",
*   "Question Label": "QRedirect - Stores actual link they were redirected to",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "QRedirect",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "ExcludeTranslation": "true",
*     "EntityId": "2753912870"
*   }
* }
* -----------------------------------------------------------

tit QRedirect.<br>temporary.<br>sel if QRedirect = "".<br>list respid, QRedirect.
```

```

* ============================================================.
* Question ID: qSupport
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qSupport",
*   "Question Label": "qSupport - //Hidden var to show support email text",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "qSupport",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": 0
*     },
*     {
*       "Answer Code": "1",
*       "Answer Label": "If you have questions or issues with this survey, please contact Help/Support using the link in your survey invitation."
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "HierarchyMode": "Drilldown",
*     "AutoCheckOther": "true",
*     "FieldWidth": "8",
*     "EntityId": "2753912889"
*   }
* }
* -----------------------------------------------------------

tit qSupport.<br>temporary.<br>sel if miss(qSupport) or ~range(qSupport,0,1).<br>list respid, qSupport.
```

```

* ============================================================.
* Question ID: QBrowser
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "QBrowser",
*   "Question Label": "QBrowser - Respondent's Browser type and version",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "QBrowser",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "ExcludeTranslation": "true",
*     "EntityId": "2753912931"
*   }
* }
* -----------------------------------------------------------

tit QBrowser.<br>temporary.<br>sel if QBrowser = "".<br>list respid, QBrowser.
```

```

* ============================================================.
* Question ID: QDevice
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "QDevice",
*   "Question Label": "QDevice - Respondent's Device Type",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "QDevice",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "ExcludeTranslation": "true",
*     "EntityId": "2753912939"
*   }
* }
* -----------------------------------------------------------

tit QDevice.<br>temporary.<br>sel if QDevice = "".<br>list respid, QDevice.
```

```

* ============================================================.
* Question ID: QStr
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "QStr",
*   "Question Label": "QStr",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "QStr",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "ExcludeTranslation": "true",
*     "EntityId": "2753912950"
*   }
* }
* -----------------------------------------------------------

tit QStr.<br>temporary.<br>sel if QStr = "".<br>list respid, QStr.
```

```

* ============================================================.
* Question ID: qHidMode
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qHidMode",
*   "Question Label": "qHidMode",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "qHidMode",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "2753912923"
*   }
* }
* -----------------------------------------------------------

tit qHidMode.<br>temporary.<br>sel if miss(qHidMode).<br>list respid, qHidMode.
```

* ============================================================.
* Question ID: hidOEBatch
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidOEBatch",
*   "Question Label": "hidOEBatch",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidOEBatch",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3254"
*   }
* }
* -----------------------------------------------------------

tit hidOEBatch.<br>temporary.<br>sel if miss(hidOEBatch) or ~range(hidOEBatch,0,999999999).<br>list respid hidOEBatch.
```

```

* ============================================================.
* Question ID: hidDVBatch
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidDVBatch",
*   "Question Label": "hidDVBatch",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidDVBatch",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3255"
*   }
* }
* -----------------------------------------------------------

tit hidDVBatch.<br>temporary.<br>sel if miss(hidDVBatch) or ~range(hidDVBatch,0,999999999).<br>list respid hidDVBatch.
```

```

* ============================================================.
* Question ID: isLiveTest
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "isLiveTest",
*   "Question Label": "isLiveTest - //Hidden to track if a test link was used for testing",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "isLiveTest",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Yes"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3171"
*   }
* }
* -----------------------------------------------------------

tit isLiveTest.<br>temporary.<br>* Field is NotRequired and Disabled — only flag when present but invalid.<br>sel if (~miss(isLiveTest) and ~range(isLiveTest,1,1)).<br>list respid isLiveTest.
```

```

* ============================================================.
* Question ID: hrespid
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hrespid",
*   "Question Label": "//hidden to store respid for further reference  - //hidden to store respid for further reference ",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hrespid",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "Rows": "1",
*     "Precision": "20",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3213"
*   }
* }
* -----------------------------------------------------------

tit hrespid.<br>temporary.<br>* Field is NotRequired and Disabled — check only when present and ensure it is a reasonable numeric id.<br>sel if (~miss(hrespid) and ~range(hrespid,1,999999999999)).<br>list respid hrespid.
```

```

* ============================================================.
* Question ID: hsid
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hsid",
*   "Question Label": "//sid - //hidden to store sid for further reference ",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hsid",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "Precision": "20",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "EntityId": "4487"
*   }
* }
* -----------------------------------------------------------

tit hsid.<br>temporary.<br>* Field is NotRequired and Disabled — check only when present and ensure it is a reasonable numeric id.<br>sel if (~miss(hsid) and ~range(hsid,1,999999999999)).<br>list respid hsid.
```

* ============================================================.
* Question ID: qIPs
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qIPs",
*   "Question Label": "qIPs",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "qIPs_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "24.193.125.121"
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "2862"
*   }
* }
* -----------------------------------------------------------

tit qIPs.<br>* Derive hidden indicator qIPs_1 from raw IP string variable 'ip_addr'. Replace 'ip_addr' with the actual source variable name if different.<br>compute qIPs_1 = $SYSMIS.<br>DO IF (LTRIM(RTRIM(ip_addr)) = '24.193.125.121').<br>  compute qIPs_1 = 1.<br>ELSE IF (NOT MISSING(ip_addr)).<br>  compute qIPs_1 = 0.<br>END IF.<br>EXECUTE.<br>
```

* ============================================================.
* Question ID: hScrAnswered
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hScrAnswered",
*   "Question Label": "hScrAnswered",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hScrAnswered",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3276"
*   }
* }
* -----------------------------------------------------------

tit hScrAnswered.<br>temporary.<br>* Hidden open/text - check for blank string (NotRequired=true so we only list blanks for review).<br>sel if hScrAnswered = "". .<br>list respid, hScrAnswered.<br>

* ============================================================.
* Question ID: hScrCount
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hScrCount",
*   "Question Label": "//hidden to store respid for further reference  - //hidden to store respid for further reference ",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hScrCount",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "Rows": "1",
*     "Precision": "20",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "3275"
*   }
* }
* -----------------------------------------------------------

tit hScrCount.<br>temporary.<br>* Hidden numeric counter - check missing or clearly invalid (negative) values.<br>sel if miss(hScrCount) or hScrCount < 0.<br>list respid, hScrCount.<br>

* ============================================================.
* Question ID: qHardQuota
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qHardQuota",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "// hidden question add all quotas to this question - // hidden question add all quotas to this question",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3164"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "qHardQuota_quotaPretest",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "quotaPretest"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qHardQuota_OVERQUOTA_quota1",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "OVERQUOTA_quota1"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qHardQuota_OVERQUOTA_quota3",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "OVERQUOTA_quota3"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qHardQuota_OVERQUOTA_quota5",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "OVERQUOTA_quota5"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qHardQuota_OVERQUOTA_quota6",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "OVERQUOTA_quota6"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qHardQuota_OVERQUOTA_qhidS10",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "OVERQUOTA_qhidS10"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qHardQuota_OVERQUOTA_qqCountry",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "OVERQUOTA_qqCountry"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qHardQuota_OVERQUOTA_qS5",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "OVERQUOTA_qS5"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qHardQuota_OVERQUOTA_qS5x2",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "OVERQUOTA_qS5x2"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qHardQuota_OVERQUOTA_qS5Final",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "OVERQUOTA_qS5Final"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit qHardQuota.<br>* Hidden multi (quota flags) - expect 0/1 flags; check missing or values outside 0..1.<br>do repeat q = qHardQuota_quotaPretest qHardQuota_OVERQUOTA_quota1 qHardQuota_OVERQUOTA_quota3 qHardQuota_OVERQUOTA_quota5 qHardQuota_OVERQUOTA_quota6 qHardQuota_OVERQUOTA_qhidS10 qHardQuota_OVERQUOTA_qqCountry qHardQuota_OVERQUOTA_qS5 qHardQuota_OVERQUOTA_qS5x2 qHardQuota_OVERQUOTA_qS5Final.<br>  if miss(q) or ~range(q,0,1) qHardQuota_flag = 1.<br>end repeat.<br>temporary.<br>sel if qHardQuota_flag > 0.<br>list respid, qHardQuota_quotaPretest qHardQuota_OVERQUOTA_quota1 qHardQuota_OVERQUOTA_quota3 qHardQuota_OVERQUOTA_quota5 qHardQuota_OVERQUOTA_quota6 qHardQuota_OVERQUOTA_qhidS10 qHardQuota_OVERQUOTA_qqCountry qHardQuota_OVERQUOTA_qS5 qHardQuota_OVERQUOTA_qS5x2 qHardQuota_OVERQUOTA_qS5Final.<br>del var qHardQuota_flag.<br>

* ============================================================.
* Question ID: hSLFlags
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hSLFlags",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hSLFlags - Hidden : used to drive Logo, Backbutton, Jumplink and qids/Titles",
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "ExcludeTranslation": "true",
*     "EntityId": "3595",
*     "Disabled": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hSLFlags_l",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Hide Logo"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hSLFlags_b",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Hide BackButton"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hSLFlags_t",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Hide Titles/QIDs"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hSLFlags_j",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Hide Jump links and Dropdown"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hSLFlags_s",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "Hide Support Text from bottom of the page"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hSLFlags.<br>* Hidden UI flags - expect 0/1 values; check missing or outside 0..1.<br>do repeat f = hSLFlags_l hSLFlags_b hSLFlags_t hSLFlags_j hSLFlags_s.<br>  if miss(f) or ~range(f,0,1) hSLFlags_flag = 1.<br>end repeat.<br>temporary.<br>sel if hSLFlags_flag > 0.<br>list respid, hSLFlags_l hSLFlags_b hSLFlags_t hSLFlags_j hSLFlags_s.<br>del var hSLFlags_flag.<br>

* ============================================================.
* Question ID: hCountry
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hCountry",
*   "Question Label": "hCountry - In which country are you currently practicing? ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hCountry",
*   "answers": [
*     {
*       "Answer Code": "1033",
*       "Answer Label": "United States",
*       "answer_attributes": {
*         "ListSource": "list_yesno"
*       }
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "HierarchyMode": "Drilldown",
*     "AutoCheckOther": "true",
*     "FieldWidth": "5",
*     "ExcludeTranslation": "true",
*     "EntityId": "3073"
*   }
* }
* -----------------------------------------------------------

tit hCountry.<br>temporary.<br>* Hidden country code - expect 1033 (United States) per metadata; list if missing or not equal to 1033.<br>sel if miss(hCountry) or ~range(hCountry,1033,1033).<br>list respid, hCountry.<br>

* ============================================================.
* Question ID: hElapse
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hElapse",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hElapse",
*   "question_attributes": {
*     "Precision": "6",
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "OpenText": "true",
*     "EntityId": "3032",
*     "NotPerformDataCleaningOnMasking": "true",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hElapse_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Start"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hElapse_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "End"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hElapse.<br>
* Convert open-text start/end to numeric and compute elapsed; validate numeric-ness, non-negative and ordering.<br>
compute hElapse1_n = NUMBER(hElapse_1, F6.).<br>
compute hElapse2_n = NUMBER(hElapse_2, F6.).<br>
compute hElapse_diff = hElapse2_n - hElapse1_n.<br>
temporary.<br>
sel if MISSING(hElapse1_n) or MISSING(hElapse2_n) or hElapse1_n < 0 or hElapse2_n < 0 or hElapse2_n < hElapse1_n.<br>
list respid hElapse_1 hElapse_2 hElapse1_n hElapse2_n hElapse_diff.<br>
DELETE VARIABLES hElapse1_n hElapse2_n hElapse_diff.<br>
```

* ============================================================.
* Question ID: hRawLink
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hRawLink",
*   "Question Label": "hRawLink - hRawLink",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hRawLink",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "ExcludeTranslation": "true",
*     "EntityId": "184"
*   }
* }
* -----------------------------------------------------------

tit hRawLink.<br>/* hRawLink is a hidden open field expected to contain a URL when populated. NotRequired=true so only perform a light format check */<br>temporary.<br>sel if (hRawLink <> "" and index(hRawLink,"http") = 0).<br>list respid, hRawLink.<br>

* ============================================================.
* Question ID: hULink
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hULink",
*   "Question Label": "hULink - hULink",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hULink",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "ExcludeTranslation": "true",
*     "EntityId": "2948"
*   }
* }
* -----------------------------------------------------------

tit hULink.<br>/* hULink is a hidden open field expected to contain a unique URL when populated. NotRequired=true so only perform a light format check */<br>temporary.<br>sel if (hULink <> "" and index(hULink,"http") = 0).<br>list respid, hULink.<br>

* ============================================================.
* Question ID: hCurrQid
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hCurrQid",
*   "Question Label": "hCurrQid - ****Hidden question used to store current question respondent is on.****",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hCurrQid",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "179"
*   }
* }
* -----------------------------------------------------------

tit hCurrQid.<br>/* Debugging/tracker field - list respondents where current-QID is empty (informational) */<br>temporary.<br>sel if hCurrQid = "". <br>list respid, hCurrQid.<br>

* ============================================================.
* Question ID: hPrevQid
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hPrevQid",
*   "Question Label": "hPrevQid - ****Hidden question used to store previous question respondent seen.****",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hPrevQid",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "180"
*   }
* }
* -----------------------------------------------------------

tit hPrevQid.<br>/* Debugging/tracker field - list respondents where previous-QID is empty (informational) */<br>temporary.<br>sel if hPrevQid = "". <br>list respid, hPrevQid.<br>

* ============================================================.
* Question ID: hAllQids
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hAllQids",
*   "Question Label": "hAllQids - ****Hidden question used to store all question seen by respondent.****",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hAllQids",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "181"
*   }
* }
* -----------------------------------------------------------

tit hAllQids.<br>/* Debugging/tracker field - list respondents with empty hAllQids (informational) */<br>temporary.<br>sel if hAllQids = "". <br>list respid, hAllQids.<br><br>/* Lightweight sanity check: when populated, expect some delimiter (e.g. ';') in concatenated qid string */<br>temporary.<br>sel if (hAllQids <> "" and index(hAllQids,";") = 0).<br>list respid, hAllQids.<br>

* ============================================================.
* Question ID: qErrNum
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qErrNum",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "qErrNum",
*   "question_attributes": {
*     "Precision": "20",
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "OpenText": "true",
*     "EntityId": "189",
*     "UpperLimitType": "SmallerOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "qErrNum_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Num 1 (qErrNum)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrNum_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Num 2 (qErrNum)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "qErrNum_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Column Text (CompareNum) (qErrNum)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit qErrNum.<br>
* Validation for hidden Multi qErrNum (3 subfields).<br>
* Notes: qErrNum_1 and qErrNum_2 are expected numeric (internal JS use). Metadata gives Precision=20 but no explicit numeric bounds; apply conservative plausibility and precision checks. qErrNum_3 is a text carrier used by CompareNum3D — ensure it is present when numeric values exist and not empty whitespace.<br>
<br>
* ------------------------------<br>
* Check qErrNum_1 - missing, numeric plausibility and precision limits<br>
NUMERIC qErrNum_1_numFlag (F1).<br>
COMPUTE qErrNum_1_numFlag = 0.<br>
* Flag if missing or outside conservative numeric plausibility bounds or exceeds precision magnitude.<br>
IF (MISSING(qErrNum_1) OR qErrNum_1 < -1e9 OR qErrNum_1 > 1e9 OR ABS(qErrNum_1) >= 1e20) qErrNum_1_numFlag = 1.<br>
TEMPORARY.<br>
SEL IF qErrNum_1_numFlag = 1.<br>
LIST respid qErrNum_1 qErrNum_1_numFlag.<br>
DELETE VARIABLES qErrNum_1_numFlag.<br>
<br>
* ------------------------------<br>
* Check qErrNum_2 - missing, numeric plausibility and precision limits<br>
NUMERIC qErrNum_2_numFlag (F1).<br>
COMPUTE qErrNum_2_numFlag = 0.<br>
IF (MISSING(qErrNum_2) OR qErrNum_2 < -1e9 OR qErrNum_2 > 1e9 OR ABS(qErrNum_2) >= 1e20) qErrNum_2_numFlag = 1.<br>
TEMPORARY.<br>
SEL IF qErrNum_2_numFlag = 1.<br>
LIST respid qErrNum_2 qErrNum_2_numFlag.<br>
DELETE VARIABLES qErrNum_2_numFlag.<br>
<br>
* ------------------------------<br>
* Check qErrNum_3 (text carrier) - empty or only whitespace<br>
TEMPORARY.<br>
SEL IF TRIM(qErrNum_3) = ''.<br>
LIST respid qErrNum_3.<br>
<br>
* ------------------------------<br>
* Combined check: If one or both numeric fields are present (not missing) then qErrNum_3 should contain the column/text label used by CompareNum3D.<br>
TEMPORARY.<br>
SEL IF ( (NOT MISSING(qErrNum_1) OR NOT MISSING(qErrNum_2)) AND TRIM(qErrNum_3) = '' ).<br>
LIST respid qErrNum_1 qErrNum_2 qErrNum_3.<br>
<br>
* ------------------------------<br>
* Additional informational check: extremely large values beyond precision (defensive) - list if magnitude approaches precision limit (Precision=20).<br>
NUMERIC qErrNum_precWarn (F1).<br>
COMPUTE qErrNum_precWarn = 0.<br>
IF ( (NOT MISSING(qErrNum_1) AND ABS(qErrNum_1) >= 1e18) OR (NOT MISSING(qErrNum_2) AND ABS(qErrNum_2) >= 1e18) ) qErrNum_precWarn = 1.<br>
TEMPORARY.<br>
SEL IF qErrNum_precWarn = 1.<br>
LIST respid qErrNum_1 qErrNum_2 qErrNum_precWarn.<br>
DELETE VARIABLES qErrNum_precWarn.<br>
<br>
* End of qErrNum checks. These checks are conservative: they flag missing/implausible or extremely large values for manual review rather than hard-failing respondents.<br>
```

* ============================================================.
* Question ID: interviewStartUTC
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "interviewStartUTC",
*   "Question Label": "interviewStartUTC",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "interviewStartUTC",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "UpperLimit": "-1.7976931348623157E+308",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "LowerLimit": "-1.7976931348623157E+308",
*     "IsDate": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "4797"
*   }
* }
* -----------------------------------------------------------

tit interviewStartUTC.<br>temporary.<br>sel if miss(interviewStartUTC).<br>list respid, interviewStartUTC.

* ============================================================.
* Question ID: interviewEndUTC
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "interviewEndUTC",
*   "Question Label": "interviewEndUTC",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "interviewEndUTC",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "UpperLimit": "-1.7976931348623157E+308",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "LowerLimit": "-1.7976931348623157E+308",
*     "IsDate": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "4798"
*   }
* }
* -----------------------------------------------------------

tit interviewEndUTC.<br>temporary.<br>sel if miss(interviewEndUTC).<br>list respid, interviewEndUTC.

* ============================================================.
* Question ID: interviewStartAEST
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "interviewStartAEST",
*   "Question Label": "interviewStartAEST",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "interviewStartAEST",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "UpperLimit": "-1.7976931348623157E+308",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "LowerLimit": "-1.7976931348623157E+308",
*     "IsDate": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "4799"
*   }
* }
* -----------------------------------------------------------

tit interviewStartAEST.<br>temporary.<br>sel if miss(interviewStartAEST).<br>list respid, interviewStartAEST.

* ============================================================.
* Question ID: interviewEndAEST
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "interviewEndAEST",
*   "Question Label": "interviewEndAEST",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "interviewEndAEST",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "UpperLimit": "-1.7976931348623157E+308",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "LowerLimit": "-1.7976931348623157E+308",
*     "IsDate": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "4800"
*   }
* }
* -----------------------------------------------------------

tit interviewEndAEST.<br>temporary.<br>sel if miss(interviewEndAEST).<br>list respid, interviewEndAEST.

* ============================================================.
* Question ID: showJumpLinks
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "showJumpLinks",
*   "Question Label": "showJumpLinks - ***Hidden question used to display jump links***",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "showJumpLinks",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "182"
*   }
* }
* -----------------------------------------------------------

tit showJumpLinks.<br>/* VariableType=Hidden and Disabled=true — no validation generated */
```

```

* ============================================================.
* Question ID: IQSvars
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "IQSvars",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "will be hidden - hidden: to store data for Imperium usage",
*   "question_attributes": {
*     "NotRequired": "true",
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "OpenText": "true",
*     "EntityId": "4481",
*     "Disabled": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "IQSvars_client_id",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "client-id (will be hidden - hidden: to store data for Imperium usage)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "IQSvars_response_id",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "response-id (will be hidden - hidden: to store data for Imperium usage)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "IQSvars_survey_id",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "survey-id (will be hidden - hidden: to store data for Imperium usage)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "IQSvars_geocode",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "geocode (will be hidden - hidden: to store data for Imperium usage)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "IQSvars_langcode",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "langcode (will be hidden - hidden: to store data for Imperium usage)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit IQSvars.<br>/* VariableType=Hidden and Disabled=true — sub-questions skipped, no validation generated */
```

* ============================================================.
* Question ID: hRAResult
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hRAResult",
*   "Question Label": "hRAResult - hidden: to store raw RealAnswer data",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hRAResult",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "ExcludeTranslation": "true",
*     "EntityId": "4809"
*   }
* }
* -----------------------------------------------------------

temporary.<br>sel if hRAResult = ''.<br>list respid hRAResult.<br>

* ============================================================.
* Question ID: hidQSlevel
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidQSlevel",
*   "Question Label": "hidQSlevel",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidQSlevel",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Poor"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Suspect"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Likely good"
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "4885"
*   }
* }
* -----------------------------------------------------------

temporary.<br>sel if miss(hidQSlevel) or ~range(hidQSlevel,1,3).<br>list respid hidQSlevel.<br>

* ============================================================.
* Question ID: hidCAPstr
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidCAPstr",
*   "Question Label": "hidCAPstr",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidCAPstr",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "ExcludeTranslation": "true",
*     "EntityId": "4858"
*   }
* }
* -----------------------------------------------------------

temporary.<br>sel if hidCAPstr = ''.<br>list respid hidCAPstr.<br>
```

* ============================================================.
* Question ID: IQSenable
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "IQSenable",
*   "Question Label": "IQSenable - hidden: to record whether quality score script is enabled or not",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "IQSenable",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "IQS turned on from MR"
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "ExcludeTranslation": "true",
*     "EntityId": "4794"
*   }
* }
* -----------------------------------------------------------

temporary.<br>sel if miss(IQSenable) or ~range(IQSenable,1,1).<br>list respid IQSenable.
```

```

* ============================================================.
* Question ID: hRecordeOn
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hRecordeOn",
*   "Question Label": "hRecordeOn - //used to prevent multiple recordings in survey settings->Validation & XSS",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hRecordeOn",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "Rows": "1",
*     "Precision": "16",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "4807"
*   }
* }
* -----------------------------------------------------------

temporary.<br>sel if miss(hRecordeOn) or ~range(hRecordeOn,0,0).<br>list respid hRecordeOn.
```

```

* ============================================================.
* Question ID: RAflags
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "RAflags",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "RAflags - IQS RA flags for DP",
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "VariableType": "Hidden",
*     "ExcludeTranslation": "true",
*     "EntityId": "4810"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "RAflags_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Pasted text",
*           "answer_attributes": {
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "RAflags_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Robot text ",
*           "answer_attributes": {
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "RAflags_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Not matching survey language",
*           "answer_attributes": {
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "RAflags_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Garbage words",
*           "answer_attributes": {
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "RAflags_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Bad Words Flag",
*           "answer_attributes": {
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "RAflags_1_other",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "",
*           "answer_attributes": {
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "RAflags_2_other",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "",
*           "answer_attributes": {
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "RAflags_3_other",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "",
*           "answer_attributes": {
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "RAflags_4_other",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "",
*           "answer_attributes": {
*             "Other": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "RAflags_5_other",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "",
*           "answer_attributes": {
*             "Other": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

DO REPEAT x = RAflags_1 TO RAflags_5.<br>IF (NOT(miss(x)) AND ~range(x,0,1)) RAflag_range_err = 1.<br>END REPEAT.<br>temporary.<br>sel if RAflag_range_err > 0.<br>list respid RAflags_1 to RAflags_5 RAflag_range_err.<br>del var RAflag_range_err.<br><br>DO REPEAT x = RAflags_1 RAflags_2 RAflags_3 RAflags_4 RAflags_5 / y = RAflags_1_other RAflags_2_other RAflags_3_other RAflags_4_other RAflags_5_other.<br>IF (x > 0 AND y = '') RAflag_other_err = 1.<br>IF ((x = 0 OR miss(x)) AND y <> '') RAflag_other_err = 2.<br>END REPEAT.<br>temporary.<br>sel if RAflag_other_err > 0.<br>list respid RAflag_other_err RAflags_1 to RAflags_5 RAflags_1_other to RAflags_5_other.<br>del var RAflag_other_err.<br><br>compute ra_sum = sum(RAflags_1 to RAflags_5).<br>temporary.<br>sel if (ra_sum > 0 AND (hRAResult = '' OR miss(hRAResult))).<br>list respid ra_sum hRAResult RAflags_1 to RAflags_5.<br>sel if (ra_sum = 0 AND NOT (hRAResult = '' OR miss(hRAResult))).<br>list respid ra_sum hRAResult RAflags_1 to RAflags_5.<br>del var ra_sum.
```

* ============================================================.
* Question ID: qPassword
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qPassword",
*   "Question Label": "  - Please enter the password provided to you by M3.",
*   "question_type": "Open",
*   "entry_conditions": [
*     "f('qSurveyType').any('2') //Pretest Interview Link"
*   ],
*   "conditions": [],
*   "Variable ID": "qPassword",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ValidationCode": "if ( f('prepwd').get().toUpperCase() != f('qPassword').get().toUpperCase() )\n errorMsg(\"password\");",
*     "Rows": "1",
*     "Columns": "10",
*     "EntityId": "2954"
*   }
* }
* -----------------------------------------------------------

tit qPassword.<br>temporary.<br>compute pwd_ok = 0.<br>if upcase(qPassword) = upcase(prepwd) pwd_ok = 1.<br>sel if f('qSurveyType').any('2') and (qPassword = "" or pwd_ok <> 1).<br>list respid qPassword prepwd.<br>del var pwd_ok.

* ============================================================.
* Question ID: hInterviewMode
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hInterviewMode",
*   "Question Label": "hInterviewMode - //HIDDEN - to store Interview Mode (Online, Telephonic)",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hInterviewMode",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Online"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Telephonic"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3598"
*   }
* }
* -----------------------------------------------------------

tit hInterviewMode.<br>temporary.<br>sel if ~missing(hInterviewMode) and not range(hInterviewMode,1,2).<br>list respid hInterviewMode.

* ============================================================.
* Question ID: hWave
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hWave",
*   "Question Label": "hWave - //HIDDEN - to store if Adhoc study or Wave with wave number",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hWave",
*   "answers": [
*     {
*       "Answer Code": "999",
*       "Answer Label": "Adhoc Study"
*     },
*     {
*       "Answer Code": "1",
*       "Answer Label": 1
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": 2
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": 3
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": 4
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": 5
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": 6
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": 7
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": 8
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": 9
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": 10
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": 11
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": 12
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": 13
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": 14
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": 15
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": 16
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": 17
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": 18
*     },
*     {
*       "Answer Code": "19",
*       "Answer Label": 19
*     },
*     {
*       "Answer Code": "20",
*       "Answer Label": 20
*     },
*     {
*       "Answer Code": "21",
*       "Answer Label": 21
*     },
*     {
*       "Answer Code": "22",
*       "Answer Label": 22
*     },
*     {
*       "Answer Code": "23",
*       "Answer Label": 23
*     },
*     {
*       "Answer Code": "24",
*       "Answer Label": 24
*     },
*     {
*       "Answer Code": "25",
*       "Answer Label": 25
*     },
*     {
*       "Answer Code": "26",
*       "Answer Label": 26
*     },
*     {
*       "Answer Code": "27",
*       "Answer Label": 27
*     },
*     {
*       "Answer Code": "28",
*       "Answer Label": 28
*     },
*     {
*       "Answer Code": "29",
*       "Answer Label": 29
*     },
*     {
*       "Answer Code": "30",
*       "Answer Label": 30
*     },
*     {
*       "Answer Code": "31",
*       "Answer Label": 31
*     },
*     {
*       "Answer Code": "32",
*       "Answer Label": 32
*     },
*     {
*       "Answer Code": "33",
*       "Answer Label": 33
*     },
*     {
*       "Answer Code": "34",
*       "Answer Label": 34
*     },
*     {
*       "Answer Code": "35",
*       "Answer Label": 35
*     },
*     {
*       "Answer Code": "36",
*       "Answer Label": 36
*     },
*     {
*       "Answer Code": "37",
*       "Answer Label": 37
*     },
*     {
*       "Answer Code": "38",
*       "Answer Label": 38
*     },
*     {
*       "Answer Code": "39",
*       "Answer Label": 39
*     },
*     {
*       "Answer Code": "40",
*       "Answer Label": 40
*     },
*     {
*       "Answer Code": "41",
*       "Answer Label": 41
*     },
*     {
*       "Answer Code": "42",
*       "Answer Label": 42
*     },
*     {
*       "Answer Code": "43",
*       "Answer Label": 43
*     },
*     {
*       "Answer Code": "44",
*       "Answer Label": 44
*     },
*     {
*       "Answer Code": "45",
*       "Answer Label": 45
*     },
*     {
*       "Answer Code": "46",
*       "Answer Label": 46
*     },
*     {
*       "Answer Code": "47",
*       "Answer Label": 47
*     },
*     {
*       "Answer Code": "48",
*       "Answer Label": 48
*     },
*     {
*       "Answer Code": "49",
*       "Answer Label": 49
*     },
*     {
*       "Answer Code": "50",
*       "Answer Label": 50
*     },
*     {
*       "Answer Code": "51",
*       "Answer Label": 51
*     },
*     {
*       "Answer Code": "52",
*       "Answer Label": 52
*     },
*     {
*       "Answer Code": "53",
*       "Answer Label": 53
*     },
*     {
*       "Answer Code": "54",
*       "Answer Label": 54
*     },
*     {
*       "Answer Code": "55",
*       "Answer Label": 55
*     },
*     {
*       "Answer Code": "56",
*       "Answer Label": 56
*     },
*     {
*       "Answer Code": "57",
*       "Answer Label": 57
*     },
*     {
*       "Answer Code": "58",
*       "Answer Label": 58
*     },
*     {
*       "Answer Code": "59",
*       "Answer Label": 59
*     },
*     {
*       "Answer Code": "60",
*       "Answer Label": 60
*     },
*     {
*       "Answer Code": "61",
*       "Answer Label": 61
*     },
*     {
*       "Answer Code": "62",
*       "Answer Label": 62
*     },
*     {
*       "Answer Code": "63",
*       "Answer Label": 63
*     },
*     {
*       "Answer Code": "64",
*       "Answer Label": 64
*     },
*     {
*       "Answer Code": "65",
*       "Answer Label": 65
*     },
*     {
*       "Answer Code": "66",
*       "Answer Label": 66
*     },
*     {
*       "Answer Code": "67",
*       "Answer Label": 67
*     },
*     {
*       "Answer Code": "68",
*       "Answer Label": 68
*     },
*     {
*       "Answer Code": "69",
*       "Answer Label": 69
*     },
*     {
*       "Answer Code": "70",
*       "Answer Label": 70
*     },
*     {
*       "Answer Code": "71",
*       "Answer Label": 71
*     },
*     {
*       "Answer Code": "72",
*       "Answer Label": 72
*     },
*     {
*       "Answer Code": "73",
*       "Answer Label": 73
*     },
*     {
*       "Answer Code": "74",
*       "Answer Label": 74
*     },
*     {
*       "Answer Code": "75",
*       "Answer Label": 75
*     },
*     {
*       "Answer Code": "76",
*       "Answer Label": 76
*     },
*     {
*       "Answer Code": "77",
*       "Answer Label": 77
*     },
*     {
*       "Answer Code": "78",
*       "Answer Label": 78
*     },
*     {
*       "Answer Code": "79",
*       "Answer Label": 79
*     },
*     {
*       "Answer Code": "80",
*       "Answer Label": 80
*     },
*     {
*       "Answer Code": "81",
*       "Answer Label": 81
*     },
*     {
*       "Answer Code": "82",
*       "Answer Label": 82
*     },
*     {
*       "Answer Code": "83",
*       "Answer Label": 83
*     },
*     {
*       "Answer Code": "84",
*       "Answer Label": 84
*     },
*     {
*       "Answer Code": "85",
*       "Answer Label": 85
*     },
*     {
*       "Answer Code": "86",
*       "Answer Label": 86
*     },
*     {
*       "Answer Code": "87",
*       "Answer Label": 87
*     },
*     {
*       "Answer Code": "88",
*       "Answer Label": 88
*     },
*     {
*       "Answer Code": "89",
*       "Answer Label": 89
*     },
*     {
*       "Answer Code": "90",
*       "Answer Label": 90
*     },
*     {
*       "Answer Code": "91",
*       "Answer Label": 91
*     },
*     {
*       "Answer Code": "92",
*       "Answer Label": 92
*     },
*     {
*       "Answer Code": "93",
*       "Answer Label": 93
*     },
*     {
*       "Answer Code": "94",
*       "Answer Label": 94
*     },
*     {
*       "Answer Code": "95",
*       "Answer Label": 95
*     },
*     {
*       "Answer Code": "96",
*       "Answer Label": 96
*     },
*     {
*       "Answer Code": "97",
*       "Answer Label": 97
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": 98
*     },
*     {
*       "Answer Code": "99",
*       "Answer Label": 99
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "Dropdown": "true",
*     "EntityId": "3599"
*   }
* }
* -----------------------------------------------------------

tit hWave.<br>temporary.<br>sel if ~missing(hWave) and not (range(hWave,1,99) or hWave = 999).<br>list respid hWave.

* ============================================================.
* Question ID: pNumber
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "pNumber",
*   "Question Label": "pNumber - //HIDDEN - to store pNumber",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "pNumber",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "EntityId": "3602"
*   }
* }
* -----------------------------------------------------------

tit pNumber.<br>compute _pnum = NUMBER(pNumber, F8.2).<br>temporary.<br>sel if pNumber <> "" and sysmis(_pnum).<br>list respid pNumber.<br>del var _pnum.

* ============================================================.
* Question ID: screenStatusBackUp
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "screenStatusBackUp",
*   "Question Label": "screenStatusBackUp - //HIDDEN - to store original status of respondents : used for data reference purpose only",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "screenStatusBackUp",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": "Complete"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Incomplete (in the screener)"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Incomplete (in the survey)"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "PRETEST"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Qual Complete"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "TEST"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "PM TEST"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Internal QC"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Client QC"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Duplicate"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Extra complete"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Bad data"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "LateScreen terminate (m360)"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "RDG Completes"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "quotaPretest"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "OVERQUOTA_quota1"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "OVERQUOTA_quota3"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "OVERQUOTA_quota5"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "OVERQUOTA_quota6"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "OVERQUOTA_qhidS10"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "OVERQUOTA_qqCountry"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "OVERQUOTA_qS5"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "OVERQUOTA_qS5x2"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "OVERQUOTA_qS5Final"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Terminate qCountry"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "No advanced scripting"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "No Javascript"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "No user_id appended"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Duplicate IP address"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "CAPTCHA screen"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "BOT DETECTED"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Username"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Terminate Specialty"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Terminate S2"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Terminate Qual"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Terminate S0"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Terminate S5"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Terminate S10"
*     },
*     {
*       "Answer Code": "0",
*       "Answer Label": "Terminate S15"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "HierarchyMode": "Drilldown",
*     "Disabled": "true",
*     "FieldWidth": "25",
*     "ExcludeTranslation": "true",
*     "EntityId": "3603"
*   }
* }
* -----------------------------------------------------------

tit screenStatusBackUp.<br>temporary.<br>sel if ~missing(screenStatusBackUp) and not (screenStatusBackUp = 'Complete' or screenStatusBackUp = 'Incomplete (in the screener)' or screenStatusBackUp = 'Incomplete (in the survey)' or screenStatusBackUp = 'PRETEST' or screenStatusBackUp = 'Qual Complete' or screenStatusBackUp = 'TEST' or screenStatusBackUp = 'PM TEST' or screenStatusBackUp = 'Internal QC' or screenStatusBackUp = 'Client QC' or screenStatusBackUp = 'Duplicate' or screenStatusBackUp = 'Extra complete' or screenStatusBackUp = 'Bad data' or screenStatusBackUp = 'LateScreen terminate (m360)' or screenStatusBackUp = 'RDG Completes' or screenStatusBackUp = 'quotaPretest' or screenStatusBackUp = 'OVERQUOTA_quota1' or screenStatusBackUp = 'OVERQUOTA_quota3' or screenStatusBackUp = 'OVERQUOTA_quota5' or screenStatusBackUp = 'OVERQUOTA_quota6' or screenStatusBackUp = 'OVERQUOTA_qhidS10' or screenStatusBackUp = 'OVERQUOTA_qqCountry' or screenStatusBackUp = 'OVERQUOTA_qS5' or screenStatusBackUp = 'OVERQUOTA_qS5x2' or screenStatusBackUp = 'OVERQUOTA_qS5Final' or screenStatusBackUp = 'Terminate qCountry' or screenStatusBackUp = 'No advanced scripting' or screenStatusBackUp = 'No Javascript' or screenStatusBackUp = 'No user_id appended' or screenStatusBackUp = 'Duplicate IP address' or screenStatusBackUp = 'CAPTCHA screen' or screenStatusBackUp = 'BOT DETECTED' or screenStatusBackUp = 'Username' or screenStatusBackUp = 'Terminate Specialty' or screenStatusBackUp = 'Terminate S2' or screenStatusBackUp = 'Terminate Qual' or screenStatusBackUp = 'Terminate S0' or screenStatusBackUp = 'Terminate S5' or screenStatusBackUp = 'Terminate S10' or screenStatusBackUp = 'Terminate S15').<br>list respid screenStatusBackUp.

* ============================================================.
* Question ID: hCAPinv
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hCAPinv",
*   "Question Label": "hCAPinv",
*   "question_type": "Open",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hCAPinv",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "ExcludeFromReporting": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "VariableType": "Hidden",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "Numeric": "true",
*     "EntityId": "4859"
*   }
* }
* -----------------------------------------------------------

/* hCAPinv is a Hidden numeric (derived) variable — no respondent validation or listing emitted.
   VariableType='Hidden' and no computation formula provided in metadata, so skip validation checks. */
```

* ============================================================.
* Question ID: hYear
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hYear",
*   "Question Label": "hYear - //HIDDEN - to store the Year interview was started",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hYear",
*   "answers": [
*     {
*       "Answer Code": "2016",
*       "Answer Label": 2016
*     },
*     {
*       "Answer Code": "2017",
*       "Answer Label": 2017
*     },
*     {
*       "Answer Code": "2018",
*       "Answer Label": 2018
*     },
*     {
*       "Answer Code": "2019",
*       "Answer Label": 2019
*     },
*     {
*       "Answer Code": "2020",
*       "Answer Label": 2020
*     },
*     {
*       "Answer Code": "2021",
*       "Answer Label": 2021
*     },
*     {
*       "Answer Code": "2022",
*       "Answer Label": 2022
*     },
*     {
*       "Answer Code": "2023",
*       "Answer Label": 2023
*     },
*     {
*       "Answer Code": "2024",
*       "Answer Label": 2024
*     },
*     {
*       "Answer Code": "2025",
*       "Answer Label": 2025
*     },
*     {
*       "Answer Code": "2026",
*       "Answer Label": 2026
*     },
*     {
*       "Answer Code": "2027",
*       "Answer Label": 2027
*     },
*     {
*       "Answer Code": "2028",
*       "Answer Label": 2028
*     },
*     {
*       "Answer Code": "2029",
*       "Answer Label": 2029
*     },
*     {
*       "Answer Code": "2030",
*       "Answer Label": 2030
*     },
*     {
*       "Answer Code": "2031",
*       "Answer Label": 2031
*     },
*     {
*       "Answer Code": "2032",
*       "Answer Label": 2032
*     },
*     {
*       "Answer Code": "2033",
*       "Answer Label": 2033
*     },
*     {
*       "Answer Code": "2034",
*       "Answer Label": 2034
*     },
*     {
*       "Answer Code": "2035",
*       "Answer Label": 2035
*     },
*     {
*       "Answer Code": "2036",
*       "Answer Label": 2036
*     },
*     {
*       "Answer Code": "2037",
*       "Answer Label": 2037
*     },
*     {
*       "Answer Code": "2038",
*       "Answer Label": 2038
*     },
*     {
*       "Answer Code": "2039",
*       "Answer Label": 2039
*     },
*     {
*       "Answer Code": "2040",
*       "Answer Label": 2040
*     },
*     {
*       "Answer Code": "2041",
*       "Answer Label": 2041
*     },
*     {
*       "Answer Code": "2042",
*       "Answer Label": 2042
*     },
*     {
*       "Answer Code": "2043",
*       "Answer Label": 2043
*     },
*     {
*       "Answer Code": "2044",
*       "Answer Label": 2044
*     },
*     {
*       "Answer Code": "2045",
*       "Answer Label": 2045
*     },
*     {
*       "Answer Code": "2046",
*       "Answer Label": 2046
*     },
*     {
*       "Answer Code": "2047",
*       "Answer Label": 2047
*     },
*     {
*       "Answer Code": "2048",
*       "Answer Label": 2048
*     },
*     {
*       "Answer Code": "2049",
*       "Answer Label": 2049
*     },
*     {
*       "Answer Code": "2050",
*       "Answer Label": 2050
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "Dropdown": "true",
*     "EntityId": "3606"
*   }
* }
* -----------------------------------------------------------

tit hYear.<br>temporary.<br>sel if miss(hYear) or ~range(hYear,2016,2050).<br>list respid, hYear.

* ============================================================.
* Question ID: hMonth
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hMonth",
*   "Question Label": "hMonth - //HIDDEN - to store the Month interview was started",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hMonth",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "January"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "February"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "March"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "April"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "May"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "June"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "July"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "August"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "September"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "October"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "November"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "December"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "Dropdown": "true",
*     "EntityId": "3607"
*   }
* }
* -----------------------------------------------------------

tit hMonth.<br>temporary.<br>sel if miss(hMonth) or ~range(hMonth,1,12).<br>list respid, hMonth.

* ============================================================.
* Question ID: hWeek
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hWeek",
*   "Question Label": "hWeek - //HIDDEN - to store the Week interview was started",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hWeek",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": 0
*     },
*     {
*       "Answer Code": "1",
*       "Answer Label": 1
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": 2
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": 3
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": 4
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": 5
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": 6
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": 7
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": 8
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": 9
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": 10
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": 11
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": 12
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": 13
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": 14
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": 15
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": 16
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": 17
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": 18
*     },
*     {
*       "Answer Code": "19",
*       "Answer Label": 19
*     },
*     {
*       "Answer Code": "20",
*       "Answer Label": 20
*     },
*     {
*       "Answer Code": "21",
*       "Answer Label": 21
*     },
*     {
*       "Answer Code": "22",
*       "Answer Label": 22
*     },
*     {
*       "Answer Code": "23",
*       "Answer Label": 23
*     },
*     {
*       "Answer Code": "24",
*       "Answer Label": 24
*     },
*     {
*       "Answer Code": "25",
*       "Answer Label": 25
*     },
*     {
*       "Answer Code": "26",
*       "Answer Label": 26
*     },
*     {
*       "Answer Code": "27",
*       "Answer Label": 27
*     },
*     {
*       "Answer Code": "28",
*       "Answer Label": 28
*     },
*     {
*       "Answer Code": "29",
*       "Answer Label": 29
*     },
*     {
*       "Answer Code": "30",
*       "Answer Label": 30
*     },
*     {
*       "Answer Code": "31",
*       "Answer Label": 31
*     },
*     {
*       "Answer Code": "32",
*       "Answer Label": 32
*     },
*     {
*       "Answer Code": "33",
*       "Answer Label": 33
*     },
*     {
*       "Answer Code": "34",
*       "Answer Label": 34
*     },
*     {
*       "Answer Code": "35",
*       "Answer Label": 35
*     },
*     {
*       "Answer Code": "36",
*       "Answer Label": 36
*     },
*     {
*       "Answer Code": "37",
*       "Answer Label": 37
*     },
*     {
*       "Answer Code": "38",
*       "Answer Label": 38
*     },
*     {
*       "Answer Code": "39",
*       "Answer Label": 39
*     },
*     {
*       "Answer Code": "40",
*       "Answer Label": 40
*     },
*     {
*       "Answer Code": "41",
*       "Answer Label": 41
*     },
*     {
*       "Answer Code": "42",
*       "Answer Label": 42
*     },
*     {
*       "Answer Code": "43",
*       "Answer Label": 43
*     },
*     {
*       "Answer Code": "44",
*       "Answer Label": 44
*     },
*     {
*       "Answer Code": "45",
*       "Answer Label": 45
*     },
*     {
*       "Answer Code": "46",
*       "Answer Label": 46
*     },
*     {
*       "Answer Code": "47",
*       "Answer Label": 47
*     },
*     {
*       "Answer Code": "48",
*       "Answer Label": 48
*     },
*     {
*       "Answer Code": "49",
*       "Answer Label": 49
*     },
*     {
*       "Answer Code": "50",
*       "Answer Label": 50
*     },
*     {
*       "Answer Code": "51",
*       "Answer Label": 51
*     },
*     {
*       "Answer Code": "52",
*       "Answer Label": 52
*     },
*     {
*       "Answer Code": "53",
*       "Answer Label": 53
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "Dropdown": "true",
*     "EntityId": "3608"
*   }
* }
* -----------------------------------------------------------

tit hWeek.<br>temporary.<br>sel if miss(hWeek) or ~range(hWeek,0,53).<br>list respid, hWeek.

* ============================================================.
* Question ID: hDay
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hDay",
*   "Question Label": "hDay - //HIDDEN - to store the Day interview was started",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hDay",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Sunday"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Monday"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Tuesday"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Wednesday"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Thursday"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Friday"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Saturday"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "Dropdown": "true",
*     "EntityId": "3609"
*   }
* }
* -----------------------------------------------------------

tit hDay.<br>temporary.<br>sel if miss(hDay) or ~range(hDay,1,7).<br>list respid, hDay.

* ============================================================.
* Question ID: hDQFlag
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hDQFlag",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hDQFlag - //HIDDEN - to capture if respondent was flagged for any Data Quality checks",
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "Disabled": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "3614"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hDQFlag_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Speeder/Racer"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDQFlag_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Straightliner"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDQFlag_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Poor OE"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDQFlag_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Inconsistent Answers "
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDQFlag_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Red Herring"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hDQFlag.<br>do repeat x = hDQFlag_1 to hDQFlag_5.<br>  if miss(x) or ~range(x,0,1) flag=1.<br>end repeat.<br>temporary.<br>sel if flag>0.<br>list respid hDQFlag_1 to hDQFlag_5 flag.<br>del var flag.

* ============================================================.
* Question ID: hDeviceInfo
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hDeviceInfo",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "hDeviceInfo - //HIDDEN - to store additional device info",
*   "question_attributes": {
*     "NotRequired": "true",
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "OpenText": "true",
*     "EntityId": "3612",
*     "Disabled": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "hDeviceInfo_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Desktop (hDeviceInfo - //HIDDEN - to store additional device info)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDeviceInfo_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Touch (hDeviceInfo - //HIDDEN - to store additional device info)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDeviceInfo_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Tablet (hDeviceInfo - //HIDDEN - to store additional device info)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDeviceInfo_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Generic (hDeviceInfo - //HIDDEN - to store additional device info)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDeviceInfo_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Mobile (hDeviceInfo - //HIDDEN - to store additional device info)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDeviceInfo_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "screenResolution (hDeviceInfo - //HIDDEN - to store additional device info)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDeviceInfo_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "DeviceType (hDeviceInfo - //HIDDEN - to store additional device info)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDeviceInfo_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "BrowserType (hDeviceInfo - //HIDDEN - to store additional device info)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDeviceInfo_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "BrowserVersion (hDeviceInfo - //HIDDEN - to store additional device info)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "hDeviceInfo_10",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": "Operating System (hDeviceInfo - //HIDDEN - to store additional device info)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit hDeviceInfo.<br>
/* Validate checkbox-style device flags (should be binary 0/1) */<br>
do repeat x = hDeviceInfo_1 to hDeviceInfo_5.<br>
  if miss(x) or ~range(x,0,1) flag_cb = 1.<br>
end repeat.<br>
temporary.<br>
sel if flag_cb > 0.<br>
list respid hDeviceInfo_1 to hDeviceInfo_5 flag_cb.<br>
del var flag_cb.<br>
<br>
/* Open-text fields (6-10) are optional. Only flag blanks when their presence is applicable.  
   Here we treat applicability as when any device-flag (1..5) indicates a device was detected (i.e. any = 1). */<br>
compute flag_ot = 0.<br>
if ( (hDeviceInfo_1 = 1 or hDeviceInfo_2 = 1 or hDeviceInfo_3 = 1 or hDeviceInfo_4 = 1 or hDeviceInfo_5 = 1) and<br>
     (hDeviceInfo_6 = "" or hDeviceInfo_7 = "" or hDeviceInfo_8 = "" or hDeviceInfo_9 = "" or hDeviceInfo_10 = "") ) flag_ot = 1.<br>
temporary.<br>
sel if flag_ot > 0.<br>
list respid hDeviceInfo_1 to hDeviceInfo_10 flag_ot.<br>
del var flag_ot.<br>
```

