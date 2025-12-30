* ============================================================.
* SPSS Validation Script (Multi-Agent Batched)
* Generated: 2025-12-12 09:10:57
* Source: R77904.md
* Model: gpt-5-mini
* ============================================================.

* ============================================================.
* Question ID: S9FR
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "S9FR": "details"
}
* -----------------------------------------------------------

tit S9FR - robust.<br>compute qc = qCountry.<br>temporary.<br>sel if (qc = 12 and (miss(S9FR) or ~range(S9FR,1,13)))<br>    or (qc <> 12 and ~miss(S9FR)).<br>list respid, qCountry, S9FR.<br>delete variables qc.

* ============================================================.
* Question ID: S9IT
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "S9IT": "details"
}
* -----------------------------------------------------------

tit S9IT - robust.<br>compute qc = qCountry.<br>temporary.<br>sel if (qc = 16 and (miss(S9IT) or ~range(S9IT,1,20)))<br>    or (qc <> 16 and ~miss(S9IT)).<br>list respid, qCountry, S9IT.<br>delete variables qc.

* ============================================================.
* Question ID: S9UK
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "S9UK": "details"
}
* -----------------------------------------------------------

tit S9UK - robust.<br>compute qc = qCountry.<br>temporary.<br>sel if (qc = 2057 and (miss(S9UK) or ~range(S9UK,1,12)))<br>    or (qc <> 2057 and ~miss(S9UK)).<br>list respid, qCountry, S9UK.<br>delete variables qc.

* ============================================================.
* Question ID: S9ES
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "S9ES": "details"
}
* -----------------------------------------------------------

tit S9ES - robust.<br>compute qc = qCountry.<br>temporary.<br>sel if (qc = 10 and (miss(S9ES) or ~range(S9ES,1,18)))<br>    or (qc <> 10 and ~miss(S9ES)).<br>list respid, qCountry, S9ES.<br>delete variables qc.

* ============================================================.
* Question ID: HidScn4Bn4COrder
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "HidScn4Bn4COrder": "details"
}
* -----------------------------------------------------------

tit HidScn4Bn4COrder.<br>
DO REPEAT v = HidScn4Bn4COrder_1 HidScn4Bn4COrder_2.<br>
temporary.<br>
sel if miss(v) or ~any(v,1,2).<br>
list respid, v.<br>
END REPEAT.

* ============================================================.
* Question ID: HidScn5Dn5EOrder1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "HidScn5Dn5EOrder1": "details"
}
* -----------------------------------------------------------

tit HidScn5Dn5EOrder1.<br>
temporary.<br>
sel if miss(HidScn5Dn5EOrder1) or ~any(HidScn5Dn5EOrder1,1,2).<br>
list respid, HidScn5Dn5EOrder1.

* ============================================================.
* Question ID: HidScn5Dn5EOrder2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "HidScn5Dn5EOrder2": "details"
}
* -----------------------------------------------------------

tit HidScn5Dn5EOrder2.<br>
temporary.<br>
sel if miss(HidScn5Dn5EOrder2) or ~any(HidScn5Dn5EOrder2,1,2).<br>
list respid, HidScn5Dn5EOrder2.

* ============================================================.
* Question ID: HidScn5Dn5EOrder
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
  "HidScn5Dn5EOrder": "details"
}
* -----------------------------------------------------------

{"Question ID":"HidScn5Dn5EOrder","conditions":[],"question_attributes":{"NotRequired":"true","Numeric":"true","EntityId":"6107","UpperLimitType":"SmallerOrEqual","AutoCheckOther":"true","OpenText":"true","LowerLimitType":"GreaterOrEqual"},"sub_questions":[{"Variable ID":"HidScn5Dn5EOrder_1","answers":[{"Answer Code":"1","Answer Label":"SCENARIO 5D / SCENARIO 4d ( B4k- B4l ) (HidScn5Dn5EOrder - RANDOMIZE ORDER OF B5D AND B5E IN AUSTRALIA (50% SAMPLE TO SEE B5D FIRST, REMAINING 50% TO SEE B5E FIRST)…  SHOW SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n)  SHOW SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) )"}]},{"Variable ID":"HidScn5Dn5EOrder_2","answers":[{"Answer Code":"2","Answer Label":"SCENARIO 5E / SCENARIO 4e ( B4m- B4n ) (HidScn5Dn5EOrder - RANDOMIZE ORDER OF B5D AND B5E IN AUSTRALIA (50% SAMPLE TO SEE B5D FIRST, REMAINING 50% TO SEE B5E FIRST)…  SHOW SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n)  SHOW SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) )"}]}],"Question Label":"HidScn5Dn5EOrder - RANDOMIZE ORDER OF B5D AND B5E IN AUSTRALIA (50% SAMPLE TO SEE B5D FIRST, REMAINING 50% TO SEE B5E FIRST)…  SHOW SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n)  SHOW SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l)"}
tit HidScn5Dn5EOrder.<br>
DO REPEAT v = HidScn5Dn5EOrder_1 HidScn5Dn5EOrder_2.<br>
temporary.<br>
sel if miss(v) or ~any(v,1,2).<br>
list respid, v.<br>
END REPEAT.

* ============================================================.
* Question ID: qCountry
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qCountry",
*   "Question Label": "qCountry - In which country do you practice?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //sceener questions"
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
*       "Answer Code": "12",
*       "Answer Label": "France"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Germany"
*     },
*     {
*       "Answer Code": "2057",
*       "Answer Label": "United Kingdom"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Spain",
*       "answer_attributes": {
*         "ListSource": "list_yesno"
*       }
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "Italy"
*     },
*     {
*       "Answer Code": "3081",
*       "Answer Label": "Australia"
*     },
*     {
*       "Answer Code": "98",
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

tit qCountry.<br>temporary.<br>sel if miss(qCountry) or ~any(qCountry,1033,12,7,2057,10,16,3081,98).<br>list respid, qCountry.<br><br>/* Other (please specify) consistency check - assumes OE stored in qCountry_98_other */<br>temporary.<br>sel if (qCountry = 98 and (qCountry_98_other = '' or miss(qCountry_98_other))) or (qCountry <> 98 and (qCountry_98_other <> '' and ~miss(qCountry_98_other))).<br>list respid, qCountry_98_other.
```

```

* ============================================================.
* Question ID: SI1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "SI1",
*   "Question Label": "SI1 - Thank you for agreeing to take part in this market research survey, which is conducted by Research Partnership, a healthcare market research and consulting agency, on behalf of a sponsor pharmaceutical company. The purpose of this market research is to understand your current and future management of prostate cancer treatment, and it will take approximately ^(isAU() || isUS()) ? '25' : '30'^ minutes to complete.  The Research Partnership is an independent market research agency working within the local market research and pharmaceutical industry codes, and any regional and local laws and regulations.  The information you provide during this survey will be used for market research purposes only and any personal data (e.g., name, phone number, address) will be treated confidentially by The Research Partnership and any business partners assisting in the execution of this market research. No personal information will be released to the sponsor. Your responses to the market research questions will be released to the sponsor in a blinded format that does not identify you directly. Your responses will be combined with other respondents’ responses and presented to the sponsor in an aggregated and anonymous format.  Your personal information may be transferred to a third country beyond your country of residence which may have different applicable privacy laws. The Research Partnership and the sponsor company take appropriate safeguards to make sure that your personal information is protected. These include implementing special contract clauses, known as Standard Contractual Clauses; further details can be provided upon request.  This market research is not to change your opinion, promote or sell you anything. You will not be contacted for marketing purposes based on your participation in this survey.  You have the right to access, rectify and erase the information you provide. You have the right to receive a copy of the data you provide in a commonly used format or direct us to provide the data to a third-party of your choice. In certain circumstances, you may be entitled to restrict the processing The Research Partnership or the sponsoring company performs, and to object to any further processing.  At any time, you may end taking this survey. You also have the right to withdraw this consent at any time without affecting the lawfulness of any processing based on consent before its withdrawal. Should you wish to revoke the information you provided prior to discontinuing, you must state this intention clearly and we will promptly cease to use your information. After this interview is complete, you may contact The Research Partnership to revoke your consent. You have the right to lodge a complaint with the supervisory authority in the jurisdiction where you live, work or where you believe your rights were violated if you have concerns.  For further information about how The Research Partnership protects your personal information and how you may exercise your data protection rights, you can contact The Research Partnership at the following contact details: Mehak.Nadeem@researchpartnership.com. Please also see the relevant Privacy Notice of The Research Partnership, available at https://www.researchpartnership.com/privacy-policy/.  In order to participate in this survey, you must give your permission for The Research Partnership to use the information collected during this survey including your personal data. If at any point, the purposes of this market research and use of the responses you provide change, we will contact you to explain the new purposes and ask for your consent.  Do you consent to participate in this survey? ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //sceener questions"
*   ],
*   "conditions": [
*     "f(\"SI1\").any(\"2\")  //hard-screen SI1"
*   ],
*   "Variable ID": "SI1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "YES, I CONSENT"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "NO, I DO NOT CONSENT "
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5855"
*   }
* }
* -----------------------------------------------------------

tit SI1.<br>/* Must consent (code=1). Flag missing or non-consent */<br>temporary.<br>sel if miss(SI1) or ~range(SI1,1,1).<br>list respid, SI1.<br><br>/* Explicitly list hard-screen (disqualifying) responses */<br>temporary.<br>sel if SI1 = 2.<br>list respid, SI1.
```

```

* ============================================================.
* Question ID: SI2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "SI2",
*   "Question Label": "SI2 - At the conclusion of this survey, we will provide you with the sponsor’s name and contact information.  If at the end of this survey, you object to your responses being shared with the sponsor or no longer want to participate, we ensure you that all your personal data will be deleted.  Is this acceptable to you? ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "/*SI2*/ isEU()"
*   ],
*   "conditions": [
*     "f(\"SI2\").any(\"2\")  //hard-screen SI2"
*   ],
*   "Variable ID": "SI2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Yes",
*       "answer_attributes": {
*         "ListSource": "list_yesno",
*         "ColumnWidth": "100"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "No",
*       "answer_attributes": {
*         "ListSource": "list_yesno",
*         "ColumnWidth": "100"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5861"
*   }
* }
* -----------------------------------------------------------

tit SI2.<br>/* Shown only to EU respondents (7,12,16,10,2057) */<br>compute flt = 0.<br>if any(qCountry,7,12,16,10,2057) flt = 1.<br>filter by flt.<br>temporary.<br>sel if miss(SI2) or ~any(SI2,1,2).<br>list respid, SI2.<br><br>/* Hard-screen listing (explicit No) */<br>temporary.<br>sel if SI2 = 2.<br>list respid, SI2.<br>filter off.<br><br>/* Respondents who should NOT have seen SI2 but answered it */<br>temporary.<br>sel if miss(flt) and ~miss(SI2).<br>list respid, SI2.<br>del var flt.
```

```

* ============================================================.
* Question ID: SUS1a
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "SUS1a",
*   "Question Label": "SUS1a - In what state do you primarily practice, prescribe, or otherwise work in a professional capacity?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "/*SUS1a*/ f('qCountry').any('1033')"
*   ],
*   "conditions": [
*     "f(\"SUS1a\").any(\"46\",\"20\",\"22\",\"24\")  //hard-screen SUS1a"
*   ],
*   "Variable ID": "SUS1a",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Alabama",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Alaska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Arizona",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Arkansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "California",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Colorado",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Connecticut",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "District of Columbia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Delaware",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Florida",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Georgia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "Hawaii",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "Idaho",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": "Illinois",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "Indiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "Iowa",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": "Kansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": "Kentucky",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "19",
*       "Answer Label": "Louisiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "20",
*       "Answer Label": "Maine",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "21",
*       "Answer Label": "Maryland",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "22",
*       "Answer Label": "Massachusetts",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "23",
*       "Answer Label": "Michigan",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "24",
*       "Answer Label": "Minnesota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "25",
*       "Answer Label": "Mississippi",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "26",
*       "Answer Label": "Missouri",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "27",
*       "Answer Label": "Montana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "28",
*       "Answer Label": "North Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "29",
*       "Answer Label": "North Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "30",
*       "Answer Label": "Nebraska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "31",
*       "Answer Label": "Nevada",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "32",
*       "Answer Label": "New Hampshire",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "33",
*       "Answer Label": "New Jersey",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "34",
*       "Answer Label": "New Mexico",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "35",
*       "Answer Label": "New York",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "36",
*       "Answer Label": "Ohio",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "37",
*       "Answer Label": "Oklahoma",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "38",
*       "Answer Label": "Oregon",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "39",
*       "Answer Label": "Pennsylvania",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "40",
*       "Answer Label": "Rhode Island",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "41",
*       "Answer Label": "South Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "42",
*       "Answer Label": "South Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "43",
*       "Answer Label": "Tennessee",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "44",
*       "Answer Label": "Texas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "45",
*       "Answer Label": "Utah",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "46",
*       "Answer Label": "Vermont",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "47",
*       "Answer Label": "Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "48",
*       "Answer Label": "Washington",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "49",
*       "Answer Label": "West Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "50",
*       "Answer Label": "Wisconsin",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "51",
*       "Answer Label": "Wyoming",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     }
*   ],
*   "question_attributes": {
*     "Dropdown": "true",
*     "AutoCheckOther": "true",
*     "EntityId": "5866"
*   }
* }
* -----------------------------------------------------------

tit SUS1a.<br>/* Shown only to US respondents (qCountry = 1033) */<br>compute flt = 0.<br>if qCountry = 1033 flt = 1.<br>filter by flt.<br>temporary.<br>sel if miss(SUS1a) or ~range(SUS1a,1,51) or SUS1a = 46 or SUS1a = 20 or SUS1a = 22 or SUS1a = 24.<br>list respid, SUS1a.<br>filter off.<br><br>/* Answered but should NOT have seen this question */<br>temporary.<br>sel if miss(flt) and ~miss(SUS1a).<br>list respid, SUS1a.<br>del var flt.
```

```

* ============================================================.
* Question ID: S0c
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S0c",
*   "Question Label": "S0c -  As you may be aware of the requirement to protect the personal information California residents in the California Consumer Privacy Act (CCPA) which came into effect on January 1st, 2020, should you wish to know more about what type of information we collect, store and use belonging to you, please contact Mehak Nadeem at The Research Partnership by email: Mehak.nadeem@researchpartnership.com  Privacy  The research will comply with all relevant local and regional laws including GDPR, the UK Data Protection Act of 2018, CCPA and good data protection practices. Furthermore, the research will be in accordance with the codes of conduct as set out by market research associations including but not limited to EphMRA, ESOMAR and BHBIA within the EU, Insights Association within the US and MRS, globally.  Any information you provide us with will be treated as confidential, it will be combined with feedback from others like yourself. You will remain anonymous unless you give permission to be identified.  Your information will only be used by us for market research purposes and will not be passed to any other organisation without your permission.  You have the right to refuse to answer questions or withdraw at any time. For more information about how we use your information, and what your rights are, please see our privacy notice, which is available at https://www.researchpartnership.com/privacy-notice.  We need your consent in order for us to collect and use any information about you. The only type of personal data we will collect about you is your details in the event you agree to be contacted by the client company’s safety department in relation to any adverse events. We will not keep any personal data you give us for longer than 6 months for auditing purposes which is in in accordance with our agreement with the sponsoring pharmaceutical company.    We obtained your details from our recruiting partner and their panels.  We prefer to reveal the name of the sponsoring pharmaceutical / medical device organisation at the end of the survey. This is to ensure that any potential bias is avoided, to ensure that your answers remain scientifically valid, and to not compromise the blindness of the survey at the time.    Would you be willing for the local market research agency to re-contact you within 3 months for any follow-up that is deemed relevant for this research?  ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "/*SCAL*/ true"
*   ],
*   "conditions": [],
*   "Variable ID": "S0c",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Willing to be contacted by the local market agency contact within 3 months for any relevant follow-up  "
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Unwilling to be contacted by the local market agency contact within 3 months for any relevant follow-up  "
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5871"
*   }
* }
* -----------------------------------------------------------

tit S0c.<br>temporary.<br>sel if miss(S0c) or ~range(S0c,1,2).<br>list respid, S0c.
```

```

* ============================================================.
* Question ID: FR1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "FR1",
*   "Question Label": "FR1 - France – Loi Bertrand act  Comme vous le savez, le ministère des Solidarités et de la Santé exige plus de transparence de la part des laboratoires pharmaceutiques concernant les paiements effectués au profit des médecins. Cela signifie que les sociétés d'étude de marché sont désormais obligées d'indiquer le nom des médecins qui prennent part à une étude de marché, et de préciser et les honoraires versés à ce titre.  Conformément à l'article L.1453-1 du Code de la Santé publique et au décret n° 2013-414 du 21 mai 2013 relatif à la transparence des avantages accordés par les entreprises produisant ou commercialisant des produits à finalité sanitaire et cosmétique destinés à l'homme, certaines informations concernant cet accord seront publiées sur le site Internet https://www.transparence.sante.gouv.fr. Conformément au décret n° 2013-414, vous n’avez pas le droit de vous opposer à la publication de données à caractère personnel de ce type.  Vous disposez d’un droit d’accès et de rectification aux informations qui vous concernent. Dans ce cadre, vous pouvez exercer ce droit directement sur le site Internet public unique du Ministère des Solidarités et de la Santé ou par courrier postal à l’adresse suivante : Ministère des Solidarités et de la Santé, 14 Avenue Duquesne, 75350 Paris ou par mail :  http://solidarites-sante.gouv.fr/ministere/organisation/contacter-l-administration/ .  Consentez-vous à participer à cet entretien dans ces conditions ?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('12')"
*   ],
*   "conditions": [
*     "f('FR1').any('2') //hard-screen FR1"
*   ],
*   "Variable ID": "FR1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Oui"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Non, remerciez et clôturez"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5873"
*   }
* }
* -----------------------------------------------------------

tit FR1.<br>/* Shown only to respondents in France (qCountry = 12) */<br>compute flt = 0.<br>if qCountry = 12 flt = 1.<br>filter by flt.<br>temporary.<br>sel if miss(FR1) or ~any(FR1,1,2).<br>list respid, FR1.<br><br>/* Hard-screen listing (explicit No) */<br>temporary.<br>sel if FR1 = 2.<br>list respid, FR1.<br>filter off.<br><br>/* Answered but should NOT have seen FR1 */<br>temporary.<br>sel if miss(flt) and ~miss(FR1).<br>list respid, FR1.<br>del var flt.
```

```

* ============================================================.
* Question ID: FR2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "FR2",
*   "Question Label": "FR2 - Il nous est demandé de transmettre à notre client les détails des réclamations produits qualité (y compris les notifications de contrefaçon) et/ ou des cas de pharmacovigilance (événement indésirable, mésusage/utilisation hors AMM, usage détourné, surdosage ou abus de médicament, erreur médicamenteuse, interaction médicamenteuse, inefficacité thérapeutique partielle ou totale, exposition au cours de la grossesse, exposition paternelle, exposition au cours de l’allaitement, exposition professionnelle/accidentelle, administration d’un médicament présentant un défaut de qualité ou falsifié, suspicion de transmission d’agents infectieux , effet bénéfique inattendu) qui sont mentionnés au cours des entretiens de l'Etude de Marché. Même si ce que vous direz sera traité de manière confidentielle, si vous évoquez, au cours de la discussion, des informations relevant d’une réclamation produit qualité (y compris les notifications de contrefaçon) et/ou de la pharmacovigilance chez un patient spécifique, nous devrons rapporter ces informations même si vous avez déjà rapporté directement ces informations au laboratoire ou aux autorités réglementaires.   Dans une telle situation, il vous sera demandé si vous souhaitez ou non renoncer à la confidentialité qui vous a été accordée en vertu du Code de conduite de l'Etude de Marché en ce qui concerne cette réclamation produit qualité ((y compris la notification de contrefaçon) et/ou ce cas de pharmacovigilance.   Tout ce que vous direz d'autre par ailleurs au cours de l'entretien continuera à rester confidentiel.   Etes-vous d'accord pour passer à cet entretien de sélection sur cette base ?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('12')"
*   ],
*   "conditions": [
*     "f('FR2').any('2') //hard-screen FR2"
*   ],
*   "Variable ID": "FR2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Oui"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Non"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5877"
*   }
* }
* -----------------------------------------------------------

tit FR2.<br>/* Shown only to respondents in France (qCountry = 12) */<br>compute flt = 0.<br>if qCountry = 12 flt = 1.<br>filter by flt.<br>temporary.<br>sel if miss(FR2) or ~any(FR2,1,2).<br>list respid, FR2.<br><br>/* Hard-screen listing (explicit No) */<br>temporary.<br>sel if FR2 = 2.<br>list respid, FR2.<br>filter off.<br><br>/* Answered but should NOT have seen FR2 */<br>temporary.<br>sel if miss(flt) and ~miss(FR2).<br>list respid, FR2.<br>del var flt.
```

```

* ============================================================.
* Question ID: IT1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "IT1",
*   "Question Label": "IT1 - Eventuali Eventi Avversi (incluse Situazioni Speciali) e/o Reclami sulla Qualità dei Prodotti (compresi i medicinali contraffatti) che potrebbero presentarsi nel corso di questa intervista inerente una ricerca di mercato devono essere segnalati alla società committente, anche se in precedenza sono stati segnalati direttamente all'azienda farmaceutica e/o all’Autorità Regolatoria. Il Reparto di Farmacovigilanza della società committente potrebbe dover contattarla per ulteriori informazioni sugli Eventi Avversi segnalati (incluse le Situazioni Speciali) e/o sui Reclami sulla Qualità del Prodotto. Acconsente al colloquio su questa base?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('16')"
*   ],
*   "conditions": [
*     "f('IT1').any('3') //hard-screen IT1"
*   ],
*   "Variable ID": "IT1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Sì - Acconsento che i miei dati di contatto personali vengano trasmessi al Reparto di Farmacovigilanza della società committente per contattarmi dopo questo colloquio per ulteriori informazioni su eventuali Eventi Avversi (incluse Situazioni Speciali) e/o Reclami sulla Qualità del Prodotto che potrebbero presentarsi durante questo colloquio."
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Sì - Acconsento alla segnalazione di Eventi Avversi (incluse Situazioni Speciali) e/o Reclami sulla Qualità del Prodotto, ma desidero mantenere il mio anonimato."
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "No - Non vorrei continuare "
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5885"
*   }
* }
* -----------------------------------------------------------

tit IT1.<br>/* Shown only to respondents in Italy (qCountry = 16) */<br>compute flt = 0.<br>if qCountry = 16 flt = 1.<br>filter by flt.<br>temporary.<br>sel if miss(IT1) or ~any(IT1,1,2,3).<br>list respid, IT1.<br><br>/* Hard-screen listing (explicit No - code 3) */<br>temporary.<br>sel if IT1 = 3.<br>list respid, IT1.<br>filter off.<br><br>/* Answered but should NOT have seen IT1 */<br>temporary.<br>sel if miss(flt) and ~miss(IT1).<br>list respid, IT1.<br>del var flt.
```

```

* ============================================================.
* Question ID: ES1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "ES1",
*   "Question Label": "ES1 - Cualquier acontecimiento adverso (incluyendo situaciones especiales) o reclamaciones sobre la calidad de producto (incluyendo los medicamentos falsificados) que surjan durante el curso de la entrevista de este estudio de mercado, deben ser notificados a la Compañía Farmacéutica, incluso si ya los ha notificado previamente directamente a la Compañía Farmacéutica o a las autoridades reguladoras. Es posible que el Departamento de Farmacovigilancia de la Compañía Farmacéutica deba contactar con usted de nuevo para obtener información adicional con respecto a los acontecimientos adversos (incluyendo situaciones especiales) o reclamaciones sobre la calidad de producto.   ¿Acepta la entrevista en estos términos? ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('10')"
*   ],
*   "conditions": [
*     "f('ES1').any('3') //hard-screen ES1"
*   ],
*   "Variable ID": "ES1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Sí - Doy mi consentimiento para pasar mis datos personales de contacto para que el Departamento de Farmacovigilancia de la Compañía Farmacéutica se ponga en contacto conmigo después de la entrevista, para obtener más información, sobre cualquier acontecimiento adverso (incluyendo situaciones especiales) o reclamaciones sobre la calidad de producto que puedan surgir durante esta entrevista."
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Sí - Doy mi consentimiento para notificar acontecimientos adversos (incluyendo situaciones especiales) o reclamaciones sobre la calidad de producto, pero deseo conservar mi anonimato."
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "No - No me gustaría continuar "
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5890"
*   }
* }
* -----------------------------------------------------------

tit ES1.<br>/* Shown only to respondents in Spain (qCountry = 10) */<br>compute flt = 0.<br>if qCountry = 10 flt = 1.<br>filter by flt.<br>temporary.<br>sel if miss(ES1) or ~any(ES1,1,2,3).<br>list respid, ES1.<br><br>/* Hard-screen listing (explicit No - code 3) */<br>temporary.<br>sel if ES1 = 3.<br>list respid, ES1.<br>filter off.<br><br>/* Answered but should NOT have seen ES1 */<br>temporary.<br>sel if miss(flt) and ~miss(ES1).<br>list respid, ES1.<br>del var flt.
```

```

* ============================================================.
* Question ID: UK1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "UK1",
*   "Question Label": "UK1 - Any Adverse Events (including Special Situations) and/or Product Quality Complaints (including counterfeit medicinal products) that may arise during the course of this market research interview must be reported to the commissioning company, even if you have previously reported them directly to the pharmaceutical company and/or a regulatory authority. The pharmacovigilance department of the commissioning company may need to contact you for further information regarding the reported Adverse Events (including Special Situations) and/or Product Quality Complaints. Do you consent to the interview on this basis?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "( f('qCountry').any('2057') || f('qCountry').any('3081') )"
*   ],
*   "conditions": [
*     "f('UK1').any('3') //hard-screen UK1"
*   ],
*   "Variable ID": "UK1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Yes - I consent to allow my personal contact details to be passed to the commissioning company’s pharmacovigilance department to contact me after this interview for further information about any Adverse Events (including Special Situations) and/or Product Quality Complaints that may arise during this interview."
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Yes - I consent to the reporting of Adverse Events (including Special Situations) and/or Product Quality Complaints, but I wish to retain my anonymity."
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "No - I would not like to continue"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5895"
*   }
* }
* -----------------------------------------------------------

tit UK1.<br>/* Shown to UK / Australia English variants (qCountry = 2057 or 3081 per entry_conditions) */<br>compute flt = 0.<br>if any(qCountry,2057,3081) flt = 1.<br>filter by flt.<br>temporary.<br>sel if miss(UK1) or ~any(UK1,1,2,3).<br>list respid, UK1.<br><br>/* Hard-screen listing (explicit No - code 3) */<br>temporary.<br>sel if UK1 = 3.<br>list respid, UK1.<br>filter off.<br><br>/* Answered but should NOT have seen UK1 */<br>temporary.<br>sel if miss(flt) and ~miss(UK1).<br>list respid, UK1.<br>del var flt.
```

* ============================================================.
* Question ID: US1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "US1",
*   "Question Label": "US1 - As you may be aware, the Federal Government is requesting more transparency from pharma companies on payments made to healthcare providers and has recently updated the Sunshine Act. This act now obliges market research companies to provide details of the name and honorarium amount paid to healthcare providers taking part in market research if their identity is known to the pharmaceutical company sponsoring the research.  To avoid this, we have set up this project on a double-blind basis – that is, you will not know the identity of the sponsoring company, and they will not learn your identity.    However, should this blinding be broken - either by you revealing your name during the survey, or by a member of the pharmaceutical company recognizing you - the Sunshine Act requires that any payment made to you for participating in this research is disclosed by the sponsoring pharmaceutical company. In the event that the blinding is broken, how would you prefer to proceed?   ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('1033')"
*   ],
*   "conditions": [
*     "f('US1').any('3')//hard-screen US1"
*   ],
*   "Variable ID": "US1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "If I am recognized / reveal my identity, I am willing for my name and honorarium amount to be passed to the pharmaceutical company so they can report the payment, in accordance with the provisions of the Sunshine Act "
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "If I am recognized / reveal my identity, I am willing to forgo the payment due to me for my participation in this survey so my identity does not need to be revealed by the pharmaceutical company "
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "I decline to participate"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5900"
*   }
* }
* -----------------------------------------------------------

tit US1.<br>temporary.<br>sel if (qCountry = 1033 and (miss(US1) or ~range(US1,1,3)))<br>    or (qCountry <> 1033 and ~miss(US1)).<br>list respid, US1.<br><br>/* Flag respondents who hit the hard-screen (code = 3) for manual follow-up/termination */<br>temporary.<br>sel if US1 = 3.<br>list respid, US1.

* ============================================================.
* Question ID: S4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S4",
*   "Question Label": "S4 - Which of the following best describes your primary practice setting?  ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //Section A questions"
*   ],
*   "conditions": [],
*   "Variable ID": "S4",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Office-based private practice"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Outpatient Clinic (cancer, surgical, or infusion center) "
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Hospital-based practice, non-teaching hospital "
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Hospital-based practice, teaching hospital "
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "University or medical-school based practice (i.e., employed by or primarily affiliated with an academic institution)"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Government/VA "
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Nursing home "
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Specialized Hospital/Center for Cancer"
*     },
*     {
*       "Answer Code": "21",
*       "Answer Label": "Hospital"
*     },
*     {
*       "Answer Code": "22",
*       "Answer Label": "Office-based "
*     },
*     {
*       "Answer Code": "23",
*       "Answer Label": "Mix of hospital and office-based "
*     },
*     {
*       "Answer Code": "31",
*       "Answer Label": "Teaching/university hospital "
*     },
*     {
*       "Answer Code": "32",
*       "Answer Label": "Public hospital "
*     },
*     {
*       "Answer Code": "33",
*       "Answer Label": "Private hospital "
*     },
*     {
*       "Answer Code": "34",
*       "Answer Label": "Cancer center "
*     },
*     {
*       "Answer Code": "36",
*       "Answer Label": "Office based "
*     },
*     {
*       "Answer Code": "37",
*       "Answer Label": "Mix of hospital and office based "
*     },
*     {
*       "Answer Code": "41",
*       "Answer Label": "Private hospitals HCPS"
*     },
*     {
*       "Answer Code": "42",
*       "Answer Label": "Hospital-based practice, non-teaching hospital "
*     },
*     {
*       "Answer Code": "43",
*       "Answer Label": "Hospital-based practice, teaching hospital "
*     },
*     {
*       "Answer Code": "44",
*       "Answer Label": "University or medical-school based practice (i.e., employed by or primarily affiliated with an academic institution) "
*     },
*     {
*       "Answer Code": "45",
*       "Answer Label": "Specialized Hospital/Center for Cancer "
*     },
*     {
*       "Answer Code": "51",
*       "Answer Label": "Teaching / university hospital"
*     },
*     {
*       "Answer Code": "52",
*       "Answer Label": "District general hospital"
*     },
*     {
*       "Answer Code": "53",
*       "Answer Label": "Private hospital"
*     },
*     {
*       "Answer Code": "61",
*       "Answer Label": "Office-based (single) private practice "
*     },
*     {
*       "Answer Code": "62",
*       "Answer Label": "Outpatient clinic (cancer, surgical, or infusion center) "
*     },
*     {
*       "Answer Code": "63",
*       "Answer Label": "Office-based (group, single specialty) private practice "
*     },
*     {
*       "Answer Code": "64",
*       "Answer Label": "Office-based (group, multispecialty) private practice "
*     },
*     {
*       "Answer Code": "65",
*       "Answer Label": "Hospital-based practice, non-teaching hospital "
*     },
*     {
*       "Answer Code": "66",
*       "Answer Label": "Hospital-based practice, teaching hospital "
*     },
*     {
*       "Answer Code": "67",
*       "Answer Label": "University or medical-school based practice (i.e., employed by or primarily affiliated with an academic institution) "
*     },
*     {
*       "Answer Code": "68",
*       "Answer Label": "Specialized hospital/center for cancer "
*     },
*     {
*       "Answer Code": "69",
*       "Answer Label": "Mainly public hospital"
*     },
*     {
*       "Answer Code": "70",
*       "Answer Label": "Mainly private hospital"
*     },
*     {
*       "Answer Code": "71",
*       "Answer Label": "Both public and private hospitals"
*     },
*     {
*       "Answer Code": "98",
*       "Answer Label": "Other",
*       "answer_attributes": {
*         "KeepPosition": "true"
*       }
*     }
*   ],
*   "question_attributes": {
*     "PrecodeMask": "MaskS4()",
*     "AutoCheckOther": "true",
*     "EntityId": "5941"
*   }
* }
* -----------------------------------------------------------

tit S4.<br>temporary.<br>* Validate S4 is present and is one of the expected precodes.<br>sel if missing(S4) or (S4<>1 and S4<>2 and S4<>3 and S4<>4 and S4<>5 and S4<>6 and S4<>7 and S4<>8 and S4<>21 and S4<>22 and S4<>23 and S4<>31 and S4<>32 and S4<>33 and S4<>34 and S4<>36 and S4<>37 and S4<>41 and S4<>42 and S4<>43 and S4<>44 and S4<>45 and S4<>51 and S4<>52 and S4<>53 and S4<>61 and S4<>62 and S4<>63 and S4<>64 and S4<>65 and S4<>66 and S4<>67 and S4<>68 and S4<>69 and S4<>70 and S4<>71 and S4<>98).<br>list respid S4.<br><br>* Check Other open-end consistency (S4_98_other assumed string variable).<br>temporary.<br>sel if (S4 = 98 and (S4_98_other = '' or S4_98_other IS NULL)) or (S4 <> 98 and not(S4_98_other = '' or S4_98_other IS NULL)).<br>list respid S4 S4_98_other.<br>

* ============================================================.
* Question ID: S4a
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S4a",
*   "Question Label": "S4a - Are you involved in outpatient care?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "false // f('S4').any('1')"
*   ],
*   "conditions": [],
*   "Variable ID": "S4a",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Yes",
*       "answer_attributes": {
*         "ListSource": "list_yesno",
*         "ColumnWidth": "100"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "No",
*       "answer_attributes": {
*         "ListSource": "list_yesno",
*         "ColumnWidth": "100"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5965"
*   }
* }
* -----------------------------------------------------------

tit S4a.<br>* This question is not shown (entry condition = false). If any value exists it is unexpected — list such cases.<br>temporary.<br>sel if not missing(S4a).<br>list respid S4a.<br>

* ============================================================.
* Question ID: S6
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S6",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //Section A questions"
*   ],
*   "conditions": [],
*   "Question Label": "S6 - Number of Patients",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "5999",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "var xCodes = f('S6').domainValues();\n\nif( !f(\"S6\").toBoolean() ) errorMsg(\"1\")\n \nif ( !QuestionErrors() )\n{\n\n\tfor ( var j=1;j<xCodes.length;j++ )\n\t{\n\n\t\tvar xPre = xCodes[j];\n\n\t\tif ( GetNum(\"S6_1\") == 0 && GetNum(\"S6_\"+xPre) > 0 )\n\t\t{\n\t\t\tf('qErrNum')['1'].set('0');\n\t\t\terrorMsg(f('S6')[xPre].label()+\": \"+f('qErrors')['32'].label());\n\t\t\tf('qErrNum')['1'].set('null');\n\t\t} else if ( GetNum(\"S6_1\") > 0 && GetNum(\"S6_\"+xPre) > GetNum(\"S6_1\") )\n\t\t{\n\t\t\tf('qErrNum')['1'].set(GetNum(\"S6_1\"));\n\t\t\terrorMsg(f('S6')[xPre].label()+\": \"+f('qErrors')['29'].label());\n\t\t\tf('qErrNum')['1'].set('null');\n\t\t}else if ( GetNum(\"S6_1\") > 0 &&  !f(\"S6_\"+xPre).toBoolean() )\n\t\t{\n                                           RaiseError();\n                                           AppendQuestionErrorMessage(CurrentLang(),f(\"S6_\"+xPre).label()+\": \"+f(\"qErrors\")[1].label()+\"\");\n\t\t}\t\n\t}\t\n}\n\nif ( !QuestionErrors() )\n{\n\n\tif ( GetNum(\"S6_1\") > 0 && Sum(GetNum(\"S6_2\"),GetNum(\"S6_3\"),GetNum(\"S6_4\"),GetNum(\"S6_5\"),GetNum(\"S6_6\")) > GetNum(\"S6_1\") )\n\t{\n\t\tf('qErrNum')['1'].set(GetNum(\"S6_1\"));\n\t\terrorMsg(f('S6')['2'].label()+\" & \"+f('S6')['3'].label()+\" & \"+f('S6')['4'].label()+\" & \"+f('S6')['5'].label()+\" & \"+f('S6')['6'].label()+\": \"+f('qErrors')['23'].label());\n\t\tf('qErrNum')['1'].set('null');\n\t}\t\n}",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S6_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "With prostate cancer (any) (S6 - Number of Patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S6_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "With high risk localized prostate cancer (S6 - Number of Patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S6_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "With high risk biochemical recurrent (BCR) non-metastatic hormone-sensitive prostate cancer (^f('qTitle')['SPC'].label()^) (S6 - Number of Patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S6_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "With ^f('qTitle')['mHSPCt1'].label()^ (S6 - Number of Patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S6_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "With Non-metastatic castration-resistant prostate cancer (nmCRPC) (S6 - Number of Patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S6_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "With Metastatic castration-resistant prostate cancer (mCRPC) (S6 - Number of Patients)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S6.<br>* Basic range checks for each numeric S6 cell (0-999).<br>compute flag_range = 0.<br>do repeat v = S6_1 TO S6_6.<br>  if (not missing(v) and (v < 0 or v > 999)) flag_range = 1.<br>end repeat.<br>temporary.<br>sel if flag_range > 0.<br>list respid S6_1 to S6_6 flag_range.<br>delete variables flag_range.<br><br>* Parent/child relationship checks.<br>compute flag_parent = 0.<br>do repeat child = S6_2 TO S6_6.<br>  /* child present while parent = 0 */<br>  if (S6_1 = 0 and not missing(child) and child > 0) flag_parent = 1.<br>  /* child > parent */<br>  if (S6_1 > 0 and not missing(child) and child > S6_1) flag_parent = 2.<br>  /* parent >0 but child missing */<br>  if (S6_1 > 0 and missing(child)) flag_parent = 4.<br>end repeat.<br>* sum(children) > parent<br>compute sum_children = sum(S6_2,S6_3,S6_4,S6_5,S6_6).<br>if (S6_1 > 0 and sum_children > S6_1) flag_parent = 3.<br>temporary.<br>sel if flag_parent > 0.<br>list respid S6_1 to S6_6 sum_children flag_parent.<br>delete variables flag_parent sum_children.<br>

* ============================================================.
* Question ID: S7
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S7",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "GreaterThan('HidS7Vals',0).size() > 0"
*   ],
*   "conditions": [],
*   "Question Label": "S7 - Total patients on treatment",
*   "question_attributes": {
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6005",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CompareNumQues('S7','<=','HidS7Vals','S7');",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S7_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "With high risk localized prostate cancer (S7 - Total patients on treatment)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S7_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "With high risk biochemical recurrent (BCR) non-metastatic hormone-sensitive prostate cancer (^f('qTitle')['SPC'].label()^) (S7 - Total patients on treatment)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S7_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "With ^f('qTitle')['mHSPCt1'].label()^ (S7 - Total patients on treatment)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S7_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "With Non-metastatic castration-resistant prostate cancer (nmCRPC) (S7 - Total patients on treatment)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S7_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "With Metastatic castration-resistant prostate cancer (mCRPC) (S7 - Total patients on treatment)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S7.<br>* Only validate when there are corresponding HidS7Vals entries (i.e., at least one HidS7Vals > 0).<br>compute ref_present = (not missing(HidS7Vals_1) and HidS7Vals_1 > 0) + (not missing(HidS7Vals_2) and HidS7Vals_2 > 0) + (not missing(HidS7Vals_3) and HidS7Vals_3 > 0) + (not missing(HidS7Vals_4) and HidS7Vals_4 > 0) + (not missing(HidS7Vals_5) and HidS7Vals_5 > 0).<br>compute flag_range = 0.<br>compute flag_missing = 0.<br>compute flag_exceed = 0.<br>if (ref_present > 0) <br>do.<br>  do repeat ch = S7_1 TO S7_5 /ref = HidS7Vals_1 TO HidS7Vals_5.<br>    /* S7 cell range */<br>    if (not missing(ch) and (ch < 0 or ch > 999)) flag_range = 1.<br>    /* reference exists but S7 missing */<br>    if (not missing(ref) and missing(ch)) flag_missing = 1.<br>    /* S7 greater than referenced HidS7Vals */<br>    if (not missing(ch) and not missing(ref) and ch > ref) flag_exceed = 1.<br>  end repeat.<br>end if.<br>temporary.<br>sel if ref_present > 0 and (flag_range > 0 or flag_missing > 0 or flag_exceed > 0).<br>list respid S7_1 to S7_5 HidS7Vals_1 to HidS7Vals_5 ref_present flag_range flag_missing flag_exceed.<br>delete variables ref_present flag_range flag_missing flag_exceed.<br>

* ============================================================.
* Question ID: hidS7
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidS7",
*   "Question Label": "hidS7 [SHOWN FOR TESTING PURPOSES ONLY]",
*   "question_type": "Single",
*   "entry_conditions": [
*     "isTest()"
*   ],
*   "conditions": [],
*   "Variable ID": "hidS7",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "S7_1 = 0"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "S7_1 > 0"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "6220"
*   }
* }
* -----------------------------------------------------------

tit hidS7.<br>* Derive expected hidS7 value from S7_1 and compare.<br>compute hidS7_chk = 1.<br>if (not missing(S7_1) and S7_1 > 0) hidS7_chk = 2.<br>temporary.<br>sel if missing(hidS7) or hidS7 < 1 or hidS7 > 2 or hidS7_chk <> hidS7.<br>list respid hidS7 hidS7_chk S7_1.<br>delete variables hidS7_chk.<br>

* ============================================================.
* Question ID: S4a0
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S4a0",
*   "Question Label": "S4a0 - Is your practice affiliated with LUGPAs (Large Urology Group Practice)?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('1033') && f('HidS1Group2').any('1')"
*   ],
*   "conditions": [],
*   "Variable ID": "S4a0",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Yes",
*       "answer_attributes": {
*         "ListSource": "list_yesno",
*         "ColumnWidth": "100"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "No",
*       "answer_attributes": {
*         "ListSource": "list_yesno",
*         "ColumnWidth": "100"
*       }
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5962"
*   }
* }
* -----------------------------------------------------------

tit S4a0.<br>
* Validate only for respondents for whom the question was shown: qCountry = 1033 AND HidS1Group2 = 1.<br>
temporary.<br>
sel if (qCountry = 1033 and HidS1Group2 = 1) and (miss(S4a0) or S4a0 < 1 or S4a0 > 2).<br>
list respid S4a0 qCountry HidS1Group2.<br>

* ============================================================.
* Question ID: S5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S5",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('qCountry').any('1033')"
*   ],
*   "conditions": [],
*   "Question Label": "S5 - What proportion of your patients are covered by each of the following health insurance plans?",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "InputSuffix": "%",
*     "EntityId": "5967",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "RequireCheck(CurrentForm());",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "100",
*     "MultiSumEqual": "100",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Commercial insurance plan (either private or through your employer) (S5 - What proportion of your patients are covered by each of the following health insurance plans? )"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Medicare (S5 - What proportion of your patients are covered by each of the following health insurance plans? )"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Medicaid (Medi-Cal for California residents) (S5 - What proportion of your patients are covered by each of the following health insurance plans? )"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Veterans Administration (VA), TRICARE, or military insurance (S5 - What proportion of your patients are covered by each of the following health insurance plans? )"
*         }
*       ]
*     },
*     {
*       "Variable ID": "S5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "No insurance coverage / uninsured (S5 - What proportion of your patients are covered by each of the following health insurance plans? )"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S5.<br>
* Validate numeric range (0-100) and that components sum to 100.<br>
compute flag1 = 0.<br>
compute flag2 = 0.<br>
compute totalSum = $SYSMIS.<br>
compute numNonMiss = $SYSMIS.<br>
do if qCountry = 1033.<br>
  do repeat x = S5_1 TO S5_5.<br>
    if (not missing(x) and (x < 0 or x > 100)) flag1 = 1.<br>
  end repeat.<br>
  compute totalSum = SUM(S5_1,S5_2,S5_3,S5_4,S5_5).<br>
  compute numNonMiss = 5 - NMISS(S5_1,S5_2,S5_3,S5_4,S5_5).<br>
  if (numNonMiss > 0 and totalSum <> 100) flag2 = 1.<br>
end if.<br>
temporary.<br>
sel if qCountry = 1033 and (flag1 > 0 or flag2 > 0).<br>
list respid S5_1 TO S5_5 totalSum numNonMiss flag1 flag2.<br>
delete variables flag1 flag2 totalSum numNonMiss.<br>

* ============================================================.
* Question ID: S6a
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S6a",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "f('SPECIALTY').any('3')"
*   ],
*   "conditions": [],
*   "question_attributes": {
*     "Randomize": "true",
*     "AnswerRequiredType": "Required",
*     "EntityId": "5991",
*     "AnswerlistOrder": "Randomize",
*     "MultiItemsSelectedMinimum": "1",
*     "AutoCheckOther": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "S6a_1",
*       "Question Label": "Xtandi (enzalutamide)  (S6a - Which of the following therapies, if any, have you prescribed to your prostate cancer patients in the last 12 months?)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "S6a_2",
*       "Question Label": "^!isAU()?\"Erleada\":\"Erlyand (apalutamide)\"^ (S6a - Which of the following therapies, if any, have you prescribed to your prostate cancer patients in the last 12 months?)",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "S6a_3",
*       "Question Label": "Nubeqa (darolutamide) (S6a - Which of the following therapies, if any, have you prescribed to your prostate cancer patients in the last 12 months?)",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "S6a_4",
*       "Question Label": "Abiraterone (Zytiga or generic) (S6a - Which of the following therapies, if any, have you prescribed to your prostate cancer patients in the last 12 months?)",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "S6a_99",
*       "Question Label": "None of the above (S6a - Which of the following therapies, if any, have you prescribed to your prostate cancer patients in the last 12 months?)",
*       "answers": [
*         {
*           "Answer Code": "99",
*           "Answer Label": "",
*           "answer_attributes": {
*             "Punch": "Single",
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit S6a.<br>
* Multi-checkbox checks (minimum 1 selected; 'None' exclusive).<br>
compute S6a_flag_empty = 0.<br>
compute S6a_flag_conflict = 0.<br>
do if SPECIALTY = 3.<br>
  compute S6a_selcount = SUM(S6a_1,S6a_2,S6a_3,S6a_4,S6a_99).<br>
  if (S6a_selcount = 0) S6a_flag_empty = 1.              /* nothing selected */<br>
  if (S6a_99 = 1 and SUM(S6a_1,S6a_2,S6a_3,S6a_4) > 0) S6a_flag_conflict = 1.  /* None together with others */<br>
end if.<br>
temporary.<br>
sel if SPECIALTY = 3 and (S6a_flag_empty > 0 or S6a_flag_conflict > 0).<br>
list respid S6a_1 TO S6a_4 S6a_99 S6a_selcount S6a_flag_empty S6a_flag_conflict SPECIALTY.<br>
delete variables S6a_flag_empty S6a_flag_conflict S6a_selcount.<br>

* ============================================================.
* Question ID: HidS7Vals
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "HidS7Vals",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "isTest() //Show only in test mode"
*   ],
*   "conditions": [],
*   "Question Label": "HidS7Vals - S7 Piping values from S6...",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6008",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "HidS7Vals_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "With high risk localized prostate cancer (HidS7Vals - S7 Piping values from S6...)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidS7Vals_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "With high risk biochemical recurrent (BCR) non-metastatic hormone-sensitive prostate cancer (^f('qTitle')['SPC'].label()^) (HidS7Vals - S7 Piping values from S6...)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidS7Vals_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "With ^f('qTitle')['mHSPCt1'].label()^ (HidS7Vals - S7 Piping values from S6...)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidS7Vals_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "With Non-metastatic castration-resistant prostate cancer (nmCRPC) (HidS7Vals - S7 Piping values from S6...)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidS7Vals_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "With Metastatic castration-resistant prostate cancer (mCRPC) (HidS7Vals - S7 Piping values from S6...)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit HidS7Vals.<br>
* Range checks for piped numeric values - only in test mode.<br>
compute HidS7_flag = 0.<br>
do if (qTesting = 1 or iTest = 1).<br>
  do repeat x = HidS7Vals_1 TO HidS7Vals_5.<br>
    if (not missing(x) and (x < 0 or x > 999)) HidS7_flag = 1.<br>
  end repeat.<br>
end if.<br>
temporary.<br>
sel if (qTesting = 1 or iTest = 1) and HidS7_flag > 0.<br>
list respid HidS7Vals_1 TO HidS7Vals_5 HidS7_flag qTesting iTest.<br>
delete variables HidS7_flag.<br>

* ============================================================.
* Question ID: HidS4DE
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "HidS4DE",
*   "Question Label": "HidS4DE - S4 DE QUOTA...",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('7') && isTest() //Show only in test mode"
*   ],
*   "conditions": [],
*   "Variable ID": "HidS4DE",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Hospital "
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Office-based OR Mix of hospital and office-based "
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "AutoCheckOther": "true",
*     "EntityId": "5957"
*   }
* }
* -----------------------------------------------------------

tit HidS4DE.<br>
* Compute expected HidS4DE value for DE test respondents only using S4 mapping (1=Hospital, 2=Office/Mix).<br>
DO IF (qCountry = 7 AND iTest = 1).<br>
  COMPUTE HidS4DE_chk = 2.<br>
  /* Map S4 codes that should be classified as Hospital (set HidS4DE_chk = 1) - adjust list if needed */<br>
  IF ANY(S4,3,4,8,21,31,32,33,34,42,43,45,51,52,53,65,66,68,69,70,71) HidS4DE_chk = 1.<br>
END IF.<br>
<br>
* Validation: only run for DE in test mode (qCountry=7 AND iTest=1) per reviewer instruction.<br>
TEMPORARY.<br>
SEL IF (qCountry = 7 AND iTest = 1) AND ( MISSING(HidS4DE) OR ~RANGE(HidS4DE,1,2) OR (HidS4DE_chk <> HidS4DE) ).<br>
LIST respid HidS4DE S4 HidS4DE_chk.<br>
<br>
* Clean up helper variable.<br>
DEL VAR HidS4DE_chk.

* ============================================================.
* Question ID: S9DE
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S9DE",
*   "Question Label": "S9 - In which region is your hospital or practice based?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('7')"
*   ],
*   "conditions": [],
*   "Variable ID": "S9DE",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Berlin"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Bayern (Bavaria)"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Niedersachsen (Lower Saxony)"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Baden-Württemberg"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Rheinland-Pfalz (Rhineland-Palatinate)"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Sachsen (Saxony)"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Thüringen (Thuringia)"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Hessen"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Nordrhein-Westfalen (North Rhine-Westphalia)"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Sachsen-Anhalt (Saxony-Anhalt)"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Brandenburg"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "Mecklenburg-Vorpommern"
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "Hamburg"
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": "Schleswig-Holstein"
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "Saarland"
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "Bremen"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5976"
*   }
* }
* -----------------------------------------------------------

tit S9DE.<br>temporary.<br>sel if qCountry=7 and (miss(S9DE) or ~range(S9DE,1,16)).<br>list respid, S9DE.

* ============================================================.
* Question ID: S9FR
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S9FR",
*   "Question Label": "S9 - In which region is your hospital or practice based?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('12')"
*   ],
*   "conditions": [],
*   "Variable ID": "S9FR",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Auvergne - Rhône-Alpes"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Bretagne (Brittany)"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Bourgogne - Franche-Comté"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Corse (Corsica)"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Centre - Val de Loire"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Grand Est (Alsace, Champagne, Lorraine)"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Hauts de France (Nord Pas-de-Calais - Picardie)"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Ile de France (Paris)"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Nouvelle Aquitaine (Aquitaine, Poitou-Charentes, Limousin)"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Normandie"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Occitanie (Midi-Pyrénées, Languedoc)"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "Pays de la Loire"
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "Provence - Cote d'Azur"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5978"
*   }
* }
* -----------------------------------------------------------

tit S9FR.<br>temporary.<br>sel if qCountry=12 and (miss(S9FR) or ~range(S9FR,1,13)).<br>list respid, S9FR.

* ============================================================.
* Question ID: S9IT
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S9IT",
*   "Question Label": "S9 - In which region is your hospital or practice based?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('16')"
*   ],
*   "conditions": [],
*   "Variable ID": "S9IT",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Abruzzo"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Aosta Valley"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Apulia"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Basilicata"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Calabria"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Campania"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Emilia-Romagna"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Friuli-Venezia Giulia"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Lazio"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Liguria"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Lombardy"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "Molise"
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "Piedmont"
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": "Sardinia"
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "Sicily"
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "The Marches"
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": "Trentino-Alto Adige"
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": "Tuscany"
*     },
*     {
*       "Answer Code": "19",
*       "Answer Label": "Umbria"
*     },
*     {
*       "Answer Code": "20",
*       "Answer Label": "Veneto"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5980"
*   }
* }
* -----------------------------------------------------------

tit S9IT.<br>temporary.<br>sel if qCountry=16 and (miss(S9IT) or ~range(S9IT,1,20)).<br>list respid, S9IT.

* ============================================================.
* Question ID: S9UK
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S9UK",
*   "Question Label": "S9 - In which region is your hospital or practice based?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('2057')"
*   ],
*   "conditions": [],
*   "Variable ID": "S9UK",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Scotland"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Northern Ireland"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Wales"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "North East"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "North West"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Yorkshire and the Humber"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "West Midlands"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "East Midlands"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "South West"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "South East"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "East of England"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "Greater London"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5982"
*   }
* }
* -----------------------------------------------------------

tit S9UK.<br>temporary.<br>sel if qCountry=2057 and (miss(S9UK) or ~range(S9UK,1,12)).<br>list respid, S9UK.

* ============================================================.
* Question ID: S9ES
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S9ES",
*   "Question Label": "S9 - In which region is your hospital or practice based?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('10')"
*   ],
*   "conditions": [],
*   "Variable ID": "S9ES",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Andalucía"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Aragón"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Principado de Asturias"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Baleares"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "Canarias"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Cantabria"
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Castilla-La Mancha"
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "Castilla y León"
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Cataluña"
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Extremadura"
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Galicia"
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "La Rioja"
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "Comunidad de Madrid"
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": "Región de Murcia"
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "Comunidad Foral de Navarra"
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "País Vasco"
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": "Comunidad Valenciana"
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": "Ceuta y Melilla"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5984"
*   }
* }
* -----------------------------------------------------------

tit S9ES.<br>temporary.<br>sel if qCountry=10 and (miss(S9ES) or ~range(S9ES,1,18)).<br>list respid, S9ES.

* ============================================================.
* Question ID: S9US
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S9US",
*   "Question Label": "S9 - In which region is your hospital or practice based?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('1033')"
*   ],
*   "conditions": [],
*   "Variable ID": "S9US",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "Alabama",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Alaska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Arizona",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "Arkansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "California",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "Colorado",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "7",
*       "Answer Label": "Connecticut",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "8",
*       "Answer Label": "District of Columbia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "9",
*       "Answer Label": "Delaware",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "10",
*       "Answer Label": "Florida",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "11",
*       "Answer Label": "Georgia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "12",
*       "Answer Label": "Hawaii",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "13",
*       "Answer Label": "Idaho",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "14",
*       "Answer Label": "Illinois",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "15",
*       "Answer Label": "Indiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "16",
*       "Answer Label": "Iowa",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "17",
*       "Answer Label": "Kansas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "18",
*       "Answer Label": "Kentucky",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "19",
*       "Answer Label": "Louisiana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "20",
*       "Answer Label": "Maine",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "21",
*       "Answer Label": "Maryland",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "22",
*       "Answer Label": "Massachusetts",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "23",
*       "Answer Label": "Michigan",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "24",
*       "Answer Label": "Minnesota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "25",
*       "Answer Label": "Mississippi",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "26",
*       "Answer Label": "Missouri",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "27",
*       "Answer Label": "Montana",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "28",
*       "Answer Label": "North Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "29",
*       "Answer Label": "North Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "30",
*       "Answer Label": "Nebraska",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "31",
*       "Answer Label": "Nevada",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "32",
*       "Answer Label": "New Hampshire",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "33",
*       "Answer Label": "New Jersey",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "34",
*       "Answer Label": "New Mexico",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "35",
*       "Answer Label": "New York",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "36",
*       "Answer Label": "Ohio",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "37",
*       "Answer Label": "Oklahoma",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "38",
*       "Answer Label": "Oregon",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "39",
*       "Answer Label": "Pennsylvania",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "40",
*       "Answer Label": "Rhode Island",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "41",
*       "Answer Label": "South Carolina",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "42",
*       "Answer Label": "South Dakota",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "43",
*       "Answer Label": "Tennessee",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "44",
*       "Answer Label": "Texas",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "45",
*       "Answer Label": "Utah",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "46",
*       "Answer Label": "Vermont",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "47",
*       "Answer Label": "Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "48",
*       "Answer Label": "Washington",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "49",
*       "Answer Label": "West Virginia",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "50",
*       "Answer Label": "Wisconsin",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     },
*     {
*       "Answer Code": "51",
*       "Answer Label": "Wyoming",
*       "answer_attributes": {
*         "ListSource": "list_states"
*       }
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "NotRequired": "true",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "EntityId": "5986"
*   }
* }
* -----------------------------------------------------------

tit S9US.<br>temporary.<br>sel if qCountry=1033 and (miss(S9US) or ~range(S9US,1,51)).<br>list respid, S9US.

* ============================================================.
* Question ID: S9AU
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S9AU",
*   "Question Label": "S9 - In which region is your hospital or practice based?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qCountry').any('3081')"
*   ],
*   "conditions": [],
*   "Variable ID": "S9AU",
*   "answers": [
*     {
*       "Answer Code": "52",
*       "Answer Label": "Australian Capital Territory"
*     },
*     {
*       "Answer Code": "53",
*       "Answer Label": "New South Wales"
*     },
*     {
*       "Answer Code": "54",
*       "Answer Label": "Northern Territory"
*     },
*     {
*       "Answer Code": "55",
*       "Answer Label": "Queensland"
*     },
*     {
*       "Answer Code": "56",
*       "Answer Label": "South Australia"
*     },
*     {
*       "Answer Code": "57",
*       "Answer Label": "Tasmania"
*     },
*     {
*       "Answer Code": "58",
*       "Answer Label": "Victoria"
*     },
*     {
*       "Answer Code": "59",
*       "Answer Label": "Western Australia"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5988"
*   }
* }
* -----------------------------------------------------------

tit S9AU.<br>temporary.<br>sel if qCountry=3081 and (miss(S9AU) or ~range(S9AU,52,59)).<br>list respid, S9AU.

* ============================================================.
* Question ID: HidScrQs
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "HidScrQs",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "isTest() //Show only in test mode"
*   ],
*   "conditions": [],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6014"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "HidScrQs_1",
*       "Question Label": "US1b (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_2",
*       "Question Label": "US2 (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_3",
*       "Question Label": "S0b (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_4",
*       "Question Label": "S1b/S1c (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_5",
*       "Question Label": "S2 (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_6",
*       "Question Label": "S3 (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_7",
*       "Question Label": "S4 (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_8",
*       "Question Label": "S4a0 (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_9",
*       "Question Label": "S4a (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_10",
*       "Question Label": "S5 (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "10",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_11",
*       "Question Label": "S6 (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "11",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_12",
*       "Question Label": "S6a (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "12",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_13",
*       "Question Label": "S7 (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "13",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_14",
*       "Question Label": "S8 (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "14",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScrQs_15",
*       "Question Label": "S9 (HidScrQs - USA SCREENER Question COUNTs...)",
*       "answers": [
*         {
*           "Answer Code": "15",
*           "Answer Label": ""
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit HidScrQs.<br>do repeat x=HidScrQs_1 TO HidScrQs_15.<br>  if miss(x) flag_hs=1.<br>end repeat.<br>temporary.<br>sel if isTest() and flag_hs>0.<br>list respid, HidScrQs_1 to HidScrQs_15.<br>del var flag_hs.

* ============================================================.
* Question ID: HidScrQsCnts
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "HidScrQsCnts",
*   "Question Label": "HidScrQsCnts",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "isTest() //Show only in test mode"
*   ],
*   "conditions": [],
*   "Variable ID": "HidScrQsCnts_1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "HidScrQsCnts_1 (HidScrQsCnts)"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "EntityId": "6015",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "Disabled": "true",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "Precision": "3"
*   }
* }
* -----------------------------------------------------------

tit HidScrQsCnts.<br>temporary.<br>sel if isTest() and ( miss(HidScrQsCnts_1) or ~range(HidScrQsCnts_1,0,999) ).<br>list respid, HidScrQsCnts_1.

* ============================================================.
* Question ID: S8
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "S8",
*   "Question Label": "S8 - Which of the following statements best reflects the role you play in the treatment of prostate cancer?",
*   "question_type": "Single",
*   "entry_conditions": [
*     "f('qSurveyType').none('2') //Remaining Section A questions"
*   ],
*   "conditions": [],
*   "Variable ID": "S8",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "I am the main decision maker for the treatment of prostate cancer"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "I am actively involved in the decision making of the systemic treatment of prostate cancer as part of a Multidisciplinary Board (MDT)"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "I am not directly involved or have limited involvement in the decision making for the treatment of prostate cancer"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "5970"
*   }
* }
* -----------------------------------------------------------

tit S8.<br>temporary.<br>sel if qSurveyType<>2 and (miss(S8) or ~range(S8,1,3)).<br>list respid, S8.
```

* ============================================================.
* Question ID: A1x1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A1x1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6052",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "RequireCheck3D(CurrentForm());\n//checkOS();\nCompareNum3D('A1x1','=',f('S7')['1'].toNumber(),'defaults');",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A1x1_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x1_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (A1x1 - ^f('qTitle')['PCa1'].label()^ ^GetNum('S7_1')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A1x1.<br>
* Per-cell numeric range checks for A1x1 (allowed 0..999).<br>
DO REPEAT v = A1x1_51 A1x1_1 A1x1_52 A1x1_54 A1x1_53 A1x1_7 A1x1_2 A1x1_3 A1x1_4 A1x1_56 A1x1_5 A1x1_6 A1x1_8 A1x1_9.<br>
  TEMPORARY.<br>
  SELECT IF (NOT(MISSING(v)) AND (v < 0 OR v > 999)).<br>
  LIST respid v.<br>
END REPEAT.<br>
<br>
* Row-level autosum consistency check: sum of cells must equal S7_1.<br>
COMPUTE A1x1_sum = SUM(A1x1_51, A1x1_1, A1x1_52, A1x1_54, A1x1_53, A1x1_7, A1x1_2, A1x1_3, A1x1_4, A1x1_56, A1x1_5, A1x1_6, A1x1_8, A1x1_9).<br>
EXECUTE.<br>
TEMPORARY.<br>
SELECT IF (NOT(MISSING(S7_1)) AND (A1x1_sum <> S7_1)).<br>
LIST respid A1x1_sum S7_1 A1x1_51 A1x1_1 A1x1_52 A1x1_54 A1x1_53 A1x1_7 A1x1_2 A1x1_3 A1x1_4 A1x1_56 A1x1_5 A1x1_6 A1x1_8 A1x1_9.<br>
<br>
* Other-specify consistency for code 9 (assumes open text variable A1x1_9_other).<br>
TEMPORARY.<br>
SELECT IF (NOT(MISSING(A1x1_9)) AND A1x1_9 > 0 AND (RTRIM(LTRIM(A1x1_9_other)) = "") ).<br>
LIST respid A1x1_9 A1x1_9_other.<br>
<br>
TEMPORARY.<br>
SELECT IF (RTRIM(LTRIM(A1x1_9_other)) <> "" AND (MISSING(A1x1_9) OR A1x1_9 = 0)).<br>
LIST respid A1x1_9_other A1x1_9.<br>

* ============================================================.
* Question ID: A1x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A1x2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6053",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "RequireCheck3D(CurrentForm());\n//checkOS();\nCompareNum3D('A1x2','=',f('S7')['2'].toNumber(),'defaults');",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A1x2_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x2_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (A1x2 - ^f('qTitle')['nmSPC'].label()^ ^GetNum('S7_2')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A1x2.<br>
* Per-cell numeric range checks for A1x2 (allowed 0..999).<br>
DO REPEAT v = A1x2_51 A1x2_1 A1x2_52 A1x2_54 A1x2_53 A1x2_7 A1x2_2 A1x2_3 A1x2_4 A1x2_56 A1x2_5 A1x2_6 A1x2_8 A1x2_9.<br>
  TEMPORARY.<br>
  SELECT IF (NOT(MISSING(v)) AND (v < 0 OR v > 999)).<br>
  LIST respid v.<br>
END REPEAT.<br>
<br>
* Row-level autosum consistency check: sum of cells must equal S7_2.<br>
COMPUTE A1x2_sum = SUM(A1x2_51, A1x2_1, A1x2_52, A1x2_54, A1x2_53, A1x2_7, A1x2_2, A1x2_3, A1x2_4, A1x2_56, A1x2_5, A1x2_6, A1x2_8, A1x2_9).<br>
EXECUTE.<br>
TEMPORARY.<br>
SELECT IF (NOT(MISSING(S7_2)) AND (A1x2_sum <> S7_2)).<br>
LIST respid A1x2_sum S7_2 A1x2_51 A1x2_1 A1x2_52 A1x2_54 A1x2_53 A1x2_7 A1x2_2 A1x2_3 A1x2_4 A1x2_56 A1x2_5 A1x2_6 A1x2_8 A1x2_9.<br>
<br>
* Other-specify consistency for code 9 (assumes open text variable A1x2_9_other).<br>
TEMPORARY.<br>
SELECT IF (NOT(MISSING(A1x2_9)) AND A1x2_9 > 0 AND (RTRIM(LTRIM(A1x2_9_other)) = "") ).<br>
LIST respid A1x2_9 A1x2_9_other.<br>
<br>
TEMPORARY.<br>
SELECT IF (RTRIM(LTRIM(A1x2_9_other)) <> "" AND (MISSING(A1x2_9) OR A1x2_9 = 0)).<br>
LIST respid A1x2_9_other A1x2_9.<br>

* ============================================================.
* Question ID: A1x3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A1x3",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6054",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "RequireCheck3D(CurrentForm());\n//checkOS();\nCompareNum3D('A1x3','=',f('S7')['3'].toNumber(),'defaults');",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A1x3_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x3_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (A1x3 - ^f('qTitle')['mSPC'].label()^ ^GetNum('S7_3')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A1x3.<br>
* Per-cell numeric range checks for A1x3 (allowed 0..999).<br>
DO REPEAT v = A1x3_51 A1x3_1 A1x3_52 A1x3_54 A1x3_53 A1x3_7 A1x3_2 A1x3_3 A1x3_4 A1x3_56 A1x3_5 A1x3_6 A1x3_8 A1x3_9.<br>
  TEMPORARY.<br>
  SELECT IF (NOT(MISSING(v)) AND (v < 0 OR v > 999)).<br>
  LIST respid v.<br>
END REPEAT.<br>
<br>
* Row-level autosum consistency check: sum of cells must equal S7_3.<br>
COMPUTE A1x3_sum = SUM(A1x3_51, A1x3_1, A1x3_52, A1x3_54, A1x3_53, A1x3_7, A1x3_2, A1x3_3, A1x3_4, A1x3_56, A1x3_5, A1x3_6, A1x3_8, A1x3_9).<br>
EXECUTE.<br>
TEMPORARY.<br>
SELECT IF (NOT(MISSING(S7_3)) AND (A1x3_sum <> S7_3)).<br>
LIST respid A1x3_sum S7_3 A1x3_51 A1x3_1 A1x3_52 A1x3_54 A1x3_53 A1x3_7 A1x3_2 A1x3_3 A1x3_4 A1x3_56 A1x3_5 A1x3_6 A1x3_8 A1x3_9.<br>
<br>
* Other-specify consistency for code 9 (assumes open text variable A1x3_9_other).<br>
TEMPORARY.<br>
SELECT IF (NOT(MISSING(A1x3_9)) AND A1x3_9 > 0 AND (RTRIM(LTRIM(A1x3_9_other)) = "") ).<br>
LIST respid A1x3_9 A1x3_9_other.<br>
<br>
TEMPORARY.<br>
SELECT IF (RTRIM(LTRIM(A1x3_9_other)) <> "" AND (MISSING(A1x3_9) OR A1x3_9 = 0)).<br>
LIST respid A1x3_9_other A1x3_9.<br>

* ============================================================.
* Question ID: A1x4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A1x4",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6055",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "RequireCheck3D(CurrentForm());\n//checkOS();\nCompareNum3D('A1x4','=',f('S7')['4'].toNumber(),'defaults');",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A1x4_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x4_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (A1x4 - ^f('qTitle')['nmCRPC'].label()^ ^GetNum('S7_4')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A1x4.<br>
* Per-cell numeric range checks for A1x4 (allowed 0..999).<br>
DO REPEAT v = A1x4_51 A1x4_1 A1x4_52 A1x4_54 A1x4_53 A1x4_7 A1x4_2 A1x4_3 A1x4_4 A1x4_56 A1x4_5 A1x4_6 A1x4_8 A1x4_9.<br>
  TEMPORARY.<br>
  SELECT IF (NOT(MISSING(v)) AND (v < 0 OR v > 999)).<br>
  LIST respid v.<br>
END REPEAT.<br>
<br>
* Row-level autosum consistency check: sum of cells must equal S7_4.<br>
COMPUTE A1x4_sum = SUM(A1x4_51, A1x4_1, A1x4_52, A1x4_54, A1x4_53, A1x4_7, A1x4_2, A1x4_3, A1x4_4, A1x4_56, A1x4_5, A1x4_6, A1x4_8, A1x4_9).<br>
EXECUTE.<br>
TEMPORARY.<br>
SELECT IF (NOT(MISSING(S7_4)) AND (A1x4_sum <> S7_4)).<br>
LIST respid A1x4_sum S7_4 A1x4_51 A1x4_1 A1x4_52 A1x4_54 A1x4_53 A1x4_7 A1x4_2 A1x4_3 A1x4_4 A1x4_56 A1x4_5 A1x4_6 A1x4_8 A1x4_9.<br>
<br>
* Other-specify consistency for code 9 (assumes open text variable A1x4_9_other).<br>
TEMPORARY.<br>
SELECT IF (NOT(MISSING(A1x4_9)) AND A1x4_9 > 0 AND (RTRIM(LTRIM(A1x4_9_other)) = "") ).<br>
LIST respid A1x4_9 A1x4_9_other.<br>
<br>
TEMPORARY.<br>
SELECT IF (RTRIM(LTRIM(A1x4_9_other)) <> "" AND (MISSING(A1x4_9) OR A1x4_9 = 0)).<br>
LIST respid A1x4_9_other A1x4_9.<br>

* ============================================================.
* Question ID: A1x5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A1x5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6056",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "RequireCheck3D(CurrentForm());\n//checkOS();\nCompareNum3D('A1x5','=',f('S7')['5'].toNumber(),'defaults');",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A1x5_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A1x5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (A1x5 - ^f('qTitle')['mCRPC'].label()^ ^GetNum('S7_5')^ patients)",
*           "answer_attributes": {
*             "KeepPosition": "true"
*           }
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A1x5.<br>
* Per-cell numeric range checks for A1x5 (allowed 0..999).<br>
DO REPEAT v = A1x5_51 A1x5_1 A1x5_52 A1x5_54 A1x5_53 A1x5_7 A1x5_2 A1x5_3 A1x5_4 A1x5_56 A1x5_5 A1x5_6 A1x5_8 A1x5_9.<br>
  TEMPORARY.<br>
  SELECT IF (NOT(MISSING(v)) AND (v < 0 OR v > 999)).<br>
  LIST respid v.<br>
END REPEAT.<br>
<br>
* Row-level autosum consistency check: sum of cells must equal S7_5.<br>
COMPUTE A1x5_sum = SUM(A1x5_51, A1x5_1, A1x5_52, A1x5_54, A1x5_53, A1x5_7, A1x5_2, A1x5_3, A1x5_4, A1x5_56, A1x5_5, A1x5_6, A1x5_8, A1x5_9).<br>
EXECUTE.<br>
TEMPORARY.<br>
SELECT IF (NOT(MISSING(S7_5)) AND (A1x5_sum <> S7_5)).<br>
LIST respid A1x5_sum S7_5 A1x5_51 A1x5_1 A1x5_52 A1x5_54 A1x5_53 A1x5_7 A1x5_2 A1x5_3 A1x5_4 A1x5_56 A1x5_5 A1x5_6 A1x5_8 A1x5_9.<br>
<br>
* Other-specify consistency for code 9 (assumes open text variable A1x5_9_other).<br>
TEMPORARY.<br>
SELECT IF (NOT(MISSING(A1x5_9)) AND A1x5_9 > 0 AND (RTRIM(LTRIM(A1x5_9_other)) = "") ).<br>
LIST respid A1x5_9 A1x5_9_other.<br>
<br>
TEMPORARY.<br>
SELECT IF (RTRIM(LTRIM(A1x5_9_other)) <> "" AND (MISSING(A1x5_9) OR A1x5_9 = 0)).<br>
LIST respid A1x5_9_other A1x5_9.<br>

* ============================================================.
* Question ID: A3x1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A3x1",
*   "Question Label": "A3x1 - ^f('qTitle')['PCa1'].label()^ ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A3x1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority and available for me to prescribe"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority, available for me to prescribe and reimbursed for 6 months or less"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 6 months"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 12 months"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only if the product has been recommended by treatment guidelines"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only after my peers have used it and recommended it"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6438"
*   }
* }
* -----------------------------------------------------------

tit A3x1.<br>
* Single-choice validation: A3x1 must contain a code 1..6.<br>
TEMPORARY.<br>
SELECT IF (MISSING(A3x1) OR (A3x1 < 1 OR A3x1 > 6)).<br>
LIST respid A3x1.<br>

* ============================================================.
* Question ID: A3x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A3x2",
*   "Question Label": "A3x2 - ^f('qTitle')['nmSPC'].label()^ ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A3x2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority and available for me to prescribe"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority, available for me to prescribe and reimbursed for 6 months or less"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 6 months"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 12 months"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only if the product has been recommended by treatment guidelines"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only after my peers have used it and recommended it"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6441"
*   }
* }
* -----------------------------------------------------------

tit A3x2.<br>
* Single-choice validation: A3x2 must contain a code 1..6.<br>
TEMPORARY.<br>
SELECT IF (MISSING(A3x2) OR (A3x2 < 1 OR A3x2 > 6)).<br>
LIST respid A3x2.<br>

* ============================================================.
* Question ID: A3x3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A3x3",
*   "Question Label": "A3x3 - ^f('qTitle')['mSPC'].label()^ ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A3x3",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority and available for me to prescribe"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority, available for me to prescribe and reimbursed for 6 months or less"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 6 months"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 12 months"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only if the product has been recommended by treatment guidelines"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only after my peers have used it and recommended it"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6440"
*   }
* }
* -----------------------------------------------------------

tit A3x3.<br>
* Single-choice validation: A3x3 must contain a code 1..6.<br>
TEMPORARY.<br>
SELECT IF (MISSING(A3x3) OR (A3x3 < 1 OR A3x3 > 6)).<br>
LIST respid A3x3.<br>

* ============================================================.
* Question ID: A3x4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A3x4",
*   "Question Label": "A3x4 - ^f('qTitle')['nmCRPC'].label()^ ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A3x4",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority and available for me to prescribe"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority, available for me to prescribe and reimbursed for 6 months or less"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 6 months"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 12 months"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only if the product has been recommended by treatment guidelines"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only after my peers have used it and recommended it"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6439"
*   }
* }
* -----------------------------------------------------------

tit A3x4.<br>
* Single-choice validation: A3x4 must contain a code 1..6.<br>
TEMPORARY.<br>
SELECT IF (MISSING(A3x4) OR (A3x4 < 1 OR A3x4 > 6)).<br>
LIST respid A3x4.<br>

* ============================================================.
* Question ID: HidA1ARPIS
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "HidA1ARPIS",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "isTest() //Show only in test mode"
*   ],
*   "conditions": [],
*   "Question Label": "HidA1ARPIS - A1: NET ARPIS",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "EntityId": "6064",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "HidA1ARPIS_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "High risk localized PCa ( CODES 53+7+54 ) (HidA1ARPIS - A1: NET ARPIS)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidA1ARPIS_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "HR BCR nmHSPC ( CODES 2+3+4+5+6+7 ) (HidA1ARPIS - A1: NET ARPIS)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidA1ARPIS_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "mHSPC ( CODES 2+3+4+5+6+7 ) (HidA1ARPIS - A1: NET ARPIS)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidA1ARPIS_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "nmCRPC ( CODES 2+3+4+5+6+7 ) (HidA1ARPIS - A1: NET ARPIS)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidA1ARPIS_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "mCRPC ( CODES 2+3+4+5+6+7 ) (HidA1ARPIS - A1: NET ARPIS)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit HidA1ARPIS.<br>
* This question is shown only in test mode (isTest()). All diagnostic output restricted to test mode.<br>
<br>
* 1) Negative-value check (only report in test mode).<br>
DO REPEAT hv = HidA1ARPIS_1 TO HidA1ARPIS_5.<br>
  IF (iTest = 1 AND NOT MISSING(hv) AND hv < 0) neg_flag = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SELECT IF (iTest = 1 AND neg_flag > 0).<br>
LIST respid HidA1ARPIS_1 TO HidA1ARPIS_5.<br>
DELETE VARIABLES neg_flag.<br>
<br>
* 2) Out-of-range check (numeric, allowed 0..9999). Results shown only in test mode.<br>
DO REPEAT hv = HidA1ARPIS_1 TO HidA1ARPIS_5.<br>
  IF (iTest = 1 AND NOT MISSING(hv) AND NOT RANGE(hv,0,9999)) range_flag = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SELECT IF (iTest = 1 AND range_flag > 0).<br>
LIST respid HidA1ARPIS_1 TO HidA1ARPIS_5.<br>
DELETE VARIABLES range_flag.<br>
<br>
* 3) (Optional) If you want to check presence when any value entered but entire row blank in S7 loop context, add checks gated by iTest and S7_x as needed.

* ============================================================.
* Question ID: A3x5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A3x5",
*   "Question Label": "A3x5 - ^f('qTitle')['mCRPC'].label()^",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A3x5",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority and available for me to prescribe"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority, available for me to prescribe and reimbursed for 6 months or less"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 6 months"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 12 months"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only if the product has been recommended by treatment guidelines"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only after my peers have used it and recommended it"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6442"
*   }
* }
* -----------------------------------------------------------

tit A3x5.<br>temporary.<br>* Single-choice required: check missing and out-of-range (valid codes 1..6).<br>sel if miss(A3x5) or ~range(A3x5,1,6).<br>list respid, A3x5.<br>

* ============================================================.
* Question ID: A4x1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A4x1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "A4x1 - ^f('qTitle')['nmHSPC1'].label()^",
*   "question_attributes": {
*     "OpenText": "true",
*     "NotRequired": "true",
*     "MultiItemsSelectedMinimum": "1",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('A4x1','A4DKx1')\n\n if( f('A4x1').toBoolean() )    \n  {CheckMultiOpenD1(); CheckOpenLengthMultiOE(CurrentForm(),5,0,\"chars\") }",
*     "EntityId": "6103"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A4x1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "1. (A4x1 - ^f('qTitle')['nmHSPC1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A4x1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "2. (A4x1 - ^f('qTitle')['nmHSPC1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A4x1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "3. (A4x1 - ^f('qTitle')['nmHSPC1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A4x1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "4. (A4x1 - ^f('qTitle')['nmHSPC1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A4x1_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "5. (A4x1 - ^f('qTitle')['nmHSPC1'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A4x1.<br>* Multi-checkbox with DK (A4DKx1_99) and OE minimum length 5 chars.<br>* 1) Validate subcheckbox values (expected 0/1) and DK mutual exclusivity; 2) enforce minimum selections when DK not selected.<br>count a4x1_cnt = A4x1_1 to A4x1_5 (1).<br>do repeat x = A4x1_1 TO A4x1_5.<br>  /* If DK not selected (0) subitems should be 0/1 (or 0 if not picked). If DK selected (1) subitems should be blank or 0. */<br>  if ( (miss(A4DKx1_99) or A4DKx1_99 = 0) and (miss(x) or ~range(x,0,1)) ) a4x1_flag_val = 1.<br>  if ( A4DKx1_99 = 1 and (not miss(x) and x <> 0) ) a4x1_flag_dk = 1.<br>end repeat.<br>if ( (miss(A4DKx1_99) or A4DKx1_99 = 0) and a4x1_cnt < 1 ) a4x1_flag_min = 1.<br>temporary.<br>sel if a4x1_flag_val>0 or a4x1_flag_dk>0 or a4x1_flag_min>0.<br>list respid a4x1_cnt A4x1_1 to A4x1_5 A4DKx1_99.<br>del var a4x1_flag_val a4x1_flag_dk a4x1_flag_min a4x1_cnt.<br><br>* 3) OE checks: if an 'Other' code exists (commonly 98 or 99) require corresponding text and minimum length (5 chars).<br>* Replace OE variable names if different in dataset; included checks for both common OE suffixes 98 and 99.<br>temporary.<br>/* OE = code 98 */<br>sel if (not miss(A4x1_98) and A4x1_98 = 1 and (miss(A4x1_98_other) or char.len(A4x1_98_other) < 5)).<br>list respid A4x1_98 A4x1_98_other.<br>temporary.<br>sel if (miss(A4x1_98) or A4x1_98 <> 1) and (not miss(A4x1_98_other) and char.len(A4x1_98_other) > 0).<br>list respid A4x1_98_other A4x1_98.<br><br>temporary.<br>/* OE = code 99 */<br>sel if (not miss(A4x1_99) and A4x1_99 = 1 and (miss(A4x1_99_other) or char.len(A4x1_99_other) < 5)).<br>list respid A4x1_99 A4x1_99_other.<br>temporary.<br>sel if (miss(A4x1_99) or A4x1_99 <> 1) and (not miss(A4x1_99_other) and char.len(A4x1_99_other) > 0).<br>list respid A4x1_99_other A4x1_99.<br>

* ============================================================.
* Question ID: A4x2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A4x2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "A4x2 - ^f('qTitle')['mHSPC1'].label()^",
*   "question_attributes": {
*     "OpenText": "true",
*     "NotRequired": "true",
*     "MultiItemsSelectedMinimum": "1",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('A4x2','A4DKx2')\n\n if( f('A4x2').toBoolean() )    \n  {CheckMultiOpenD1(); CheckOpenLengthMultiOE(CurrentForm(),5,0,\"chars\"); }",
*     "EntityId": "6106"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "A4x2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "1. (A4x2 - ^f('qTitle')['mHSPC1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A4x2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "2. (A4x2 - ^f('qTitle')['mHSPC1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A4x2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "3. (A4x2 - ^f('qTitle')['mHSPC1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A4x2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "4. (A4x2 - ^f('qTitle')['mHSPC1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "A4x2_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "5. (A4x2 - ^f('qTitle')['mHSPC1'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit A4x2.<br>* Multi-checkbox with DK (A4DKx2_99) and OE minimum length 5 chars.<br>count a4x2_cnt = A4x2_1 to A4x2_5 (1).<br>do repeat x = A4x2_1 TO A4x2_5.<br>  if ( (miss(A4DKx2_99) or A4DKx2_99 = 0) and (miss(x) or ~range(x,0,1)) ) a4x2_flag_val = 1.<br>  if ( A4DKx2_99 = 1 and (not miss(x) and x <> 0) ) a4x2_flag_dk = 1.<br>end repeat.<br>if ( (miss(A4DKx2_99) or A4DKx2_99 = 0) and a4x2_cnt < 1 ) a4x2_flag_min = 1.<br>temporary.<br>sel if a4x2_flag_val>0 or a4x2_flag_dk>0 or a4x2_flag_min>0.<br>list respid a4x2_cnt A4x2_1 to A4x2_5 A4DKx2_99.<br>del var a4x2_flag_val a4x2_flag_dk a4x2_flag_min a4x2_cnt.<br><br>* OE checks for common OE codes 98/99 (require text length >=5 when OE selected; text must be blank if OE not selected).<br>temporary.<br>sel if (not miss(A4x2_98) and A4x2_98 = 1 and (miss(A4x2_98_other) or char.len(A4x2_98_other) < 5)).<br>list respid A4x2_98 A4x2_98_other.<br>temporary.<br>sel if (miss(A4x2_98) or A4x2_98 <> 1) and (not miss(A4x2_98_other) and char.len(A4x2_98_other) > 0).<br>list respid A4x2_98_other A4x2_98.<br><br>temporary.<br>sel if (not miss(A4x2_99) and A4x2_99 = 1 and (miss(A4x2_99_other) or char.len(A4x2_99_other) < 5)).<br>list respid A4x2_99 A4x2_99_other.<br>temporary.<br>sel if (miss(A4x2_99) or A4x2_99 <> 1) and (not miss(A4x2_99_other) and char.len(A4x2_99_other) > 0).<br>list respid A4x2_99_other A4x2_99.<br>

* ============================================================.
* Question ID: A4DKx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A4DKx1",
*   "Question Label": "I am not aware of any upcoming therapies, data or indication approval in this prostate cancer indication (A4DKx1)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A4DKx1_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6687"
*   }
* }
* -----------------------------------------------------------

tit A4DKx1.<br>* DK indicator for A4x1. Treat as binary flag (0/1) in dataset where applicable; flag missing or out-of-domain values.<br>temporary.<br>sel if miss(A4DKx1_99) or ~range(A4DKx1_99,0,1).<br>list respid, A4DKx1_99.<br>

* ============================================================.
* Question ID: A4DKx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "A4DKx2",
*   "Question Label": "I am not aware of any upcoming therapies, data or indication approval in this prostate cancer indication (A4DKx2)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "A4DKx2_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6688"
*   }
* }
* -----------------------------------------------------------

tit A4DKx2.<br>* DK indicator for A4x2. Validate presence and domain (0/1 expected in exported data).<br>temporary.<br>sel if miss(A4DKx2_99) or ~range(A4DKx2_99,0,1).<br>list respid, A4DKx2_99.<br>

* ============================================================.
* Question ID: HidSec3ScnOrder
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "HidSec3ScnOrder",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "isTest() //Show only in test mode"
*   ],
*   "conditions": [],
*   "Question Label": "HidSec3ScnOrder - ORDER OF SCENARIOS TO BE RANDOMIZED",
*   "question_attributes": {
*     "Randomize": "true",
*     "NotRequired": "true",
*     "Numeric": "true",
*     "EntityId": "6070",
*     "UpperLimitType": "SmallerOrEqual",
*     "AnswerlistOrder": "Randomize",
*     "AutoCheckOther": "true",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "PrecodeMask": "isEU() ? a('HidSec3ScnOrder'):a('HidSec3ScnOrder').diff(set('2','3'))"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "HidSec3ScnOrder_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "SECENARIO 1 (HidSec3ScnOrder - ORDER OF SCENARIOS TO BE RANDOMIZED)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidSec3ScnOrder_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "SECENARIO 2 (HidSec3ScnOrder - ORDER OF SCENARIOS TO BE RANDOMIZED)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidSec3ScnOrder_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "SECENARIO 3 (HidSec3ScnOrder - ORDER OF SCENARIOS TO BE RANDOMIZED)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidSec3ScnOrder_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "SECENARIO 4 (HidSec3ScnOrder - ORDER OF SCENARIOS TO BE RANDOMIZED)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidSec3ScnOrder_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "SECENARIO 5 (HidSec3ScnOrder - ORDER OF SCENARIOS TO BE RANDOMIZED)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit HidSec3ScnOrder.<br>* Hidden/randomized numeric order variables (shown only in test mode). Validate any present numeric values are within expected range 1..5.<br>do repeat x = HidSec3ScnOrder_1 TO HidSec3ScnOrder_5.<br>  temporary.<br>  sel if not miss(x) and ~range(x,1,5).<br>  list respid, x.<br>end repeat.<br>

* ============================================================.
* Question ID: HidScn4Bn4COrder
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "HidScn4Bn4COrder",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "isTest() //Show only in test mode"
*   ],
*   "conditions": [],
*   "Question Label": "HidScn4Bn4COrder - ORDER OF SCENARIOS TO BE RANDOMIZED...",
*   "question_attributes": {
*     "Randomize": "true",
*     "NotRequired": "true",
*     "Numeric": "true",
*     "EntityId": "6099",
*     "UpperLimitType": "SmallerOrEqual",
*     "AnswerlistOrder": "Randomize",
*     "AutoCheckOther": "true",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "HidScn4Bn4COrder_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "SCENARIO 4b / SCENARIO 4d (HidScn4Bn4COrder - ORDER OF SCENARIOS TO BE RANDOMIZED...)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScn4Bn4COrder_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "SCENARIO 4c / SCENARIO 4e (HidScn4Bn4COrder - ORDER OF SCENARIOS TO BE RANDOMIZED...)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit HidScn4Bn4COrder.<br>* Hidden/randomized numeric order variables (test-only). Validate values when present are within 1..2.<br>do repeat x = HidScn4Bn4COrder_1 TO HidScn4Bn4COrder_2.<br>  temporary.<br>  sel if not miss(x) and ~range(x,1,2).<br>  list respid, x.<br>end repeat.<br>

* ============================================================.
* Question ID: HidScn5Dn5EOrder1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "HidScn5Dn5EOrder1",
*   "Question Label": "HidScn5Dn5EOrder1 - FIRST POSITION RANDOMIZE ORDER OF B5D AND B5E IN AUSTRALIA (50% SAMPLE TO SEE B5D FIRST, REMAINING 50% TO SEE B5E FIRST)…  SHOW SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n)  SHOW SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "isTest() //Show only in test mode"
*   ],
*   "conditions": [],
*   "Variable ID": "HidScn5Dn5EOrder1",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "SCENARIO 5D / SCENARIO 4d ( B4k- B4l )"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "SCENARIO 5E / SCENARIO 4e ( B4m- B4n )"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "AutoCheckOther": "true",
*     "EntityId": "6109"
*   }
* }
* -----------------------------------------------------------

tit HidScn5Dn5EOrder1.<br>* Single (test-only). NotRequired: allow missing; if present, value must be 1..2.<br>temporary.<br>sel if not miss(HidScn5Dn5EOrder1) and ~range(HidScn5Dn5EOrder1,1,2).<br>list respid, HidScn5Dn5EOrder1.<br>

* ============================================================.
* Question ID: HidScn5Dn5EOrder2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "HidScn5Dn5EOrder2",
*   "Question Label": "HidScn5Dn5EOrder2 - SECOND POSITION RANDOMIZE ORDER OF B5D AND B5E IN AUSTRALIA (50% SAMPLE TO SEE B5D FIRST, REMAINING 50% TO SEE B5E FIRST)…  SHOW SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n)  SHOW SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "isTest() //Show only in test mode"
*   ],
*   "conditions": [],
*   "Variable ID": "HidScn5Dn5EOrder2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "SCENARIO 5D / SCENARIO 4d ( B4k- B4l )"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "SCENARIO 5E / SCENARIO 4e ( B4m- B4n )"
*     }
*   ],
*   "question_attributes": {
*     "NotRequired": "true",
*     "AutoCheckOther": "true",
*     "EntityId": "6110"
*   }
* }
* -----------------------------------------------------------

tit HidScn5Dn5EOrder2.<br>* Single (test-only). NotRequired: allow missing; if present, value must be 1..2.<br>temporary.<br>sel if not miss(HidScn5Dn5EOrder2) and ~range(HidScn5Dn5EOrder2,1,2).<br>list respid, HidScn5Dn5EOrder2.<br>

* ============================================================.
* Question ID: HidScn5Dn5EOrder
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "HidScn5Dn5EOrder",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "isTest() //Show only in test mode"
*   ],
*   "conditions": [],
*   "Question Label": "HidScn5Dn5EOrder - RANDOMIZE ORDER OF B5D AND B5E IN AUSTRALIA (50% SAMPLE TO SEE B5D FIRST, REMAINING 50% TO SEE B5E FIRST)…  SHOW SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n)  SHOW SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l)",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "EntityId": "6107",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "HidScn5Dn5EOrder_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "SCENARIO 5D / SCENARIO 4d ( B4k- B4l ) (HidScn5Dn5EOrder - RANDOMIZE ORDER OF B5D AND B5E IN AUSTRALIA (50% SAMPLE TO SEE B5D FIRST, REMAINING 50% TO SEE B5E FIRST)…  SHOW SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n)  SHOW SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) )"
*         }
*       ]
*     },
*     {
*       "Variable ID": "HidScn5Dn5EOrder_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "SCENARIO 5E / SCENARIO 4e ( B4m- B4n ) (HidScn5Dn5EOrder - RANDOMIZE ORDER OF B5D AND B5E IN AUSTRALIA (50% SAMPLE TO SEE B5D FIRST, REMAINING 50% TO SEE B5E FIRST)…  SHOW SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n)  SHOW SCENARIO 4e: PRODUCT P = ERLEADA/ AUS: ERLYAND (B4m- B4n) QUESTIONS 1ST TO 50% SAMPLE PER MARKET, THEN SCENARIO 4d: PRODUCT P = XTANDI (B4k- B4l) )"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit HidScn5Dn5EOrder.<br>* Multi numeric randomization order (test-only). Validate any present values are within expected range 1..2.<br>do repeat x = HidScn5Dn5EOrder_1 TO HidScn5Dn5EOrder_2.<br>  temporary.<br>  sel if not miss(x) and ~range(x,1,2).<br>  list respid, x.<br>end repeat.<br>
```

* ============================================================.
* Question ID: B1a2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1a2",
*   "Question Label": "B1a2 - Please select the one statement that you feel best describes your current familiarity /experience with the reviewed clinical data on darolutamide plus androgen-deprivation therapy (ADT) in ^f('qTitle')['mSPC'].label()^. ",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B1a2",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "I have never heard of this trial data before"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "I know little more than the trial name"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "I know some basic information on this trial data"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "I am very familiar with this trial data  "
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "I have already prescribed darolutamide plus ADT"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6122"
*   }
* }
* -----------------------------------------------------------

tit B1a2.<br>temporary.<br>sel if miss(B1a2) or ~range(B1a2,1,5).<br>list respid B1a2.<br>

* ============================================================.
* Question ID: B1ba
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1ba",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B1ba_1 (B1ba - We would now like for you to answer the following questions regarding the hypothetical data you have reviewed on darolutamide plus ADT.   ^popup('Scnr1link')^  How likely would you be to personally prescribe this treatment, based on any perceived benefits in this scenario, to your ^f('qTitle')['mSPC'].label()^ patients?)",
*   "question_attributes": {
*     "Carousel": "false",
*     "EntityId": "6125",
*     "Slider": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B1ba_1",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B1ba.<br>temporary.<br>sel if miss(B1ba_1) or ~range(B1ba_1,0,10).<br>list respid B1ba_1.<br>

* ============================================================.
* Question ID: B1bb
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1bb",
*   "Question Label": "B1bb - How long will it take you to start prescribing this treatment to your ^f('qTitle')['mSPC'].label()^?   ^popup('Scnr1link')^ I would prescribe it...  ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "GreaterThan('B1ba',4).size() > 0"
*   ],
*   "conditions": [],
*   "Variable ID": "B1bb",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority and available for me to prescribe"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority, available for me to prescribe and reimbursed for 6 months or less"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 6 months"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 12 months"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only if the product has been recommended by treatment guidelines"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only after my peers have used it and recommended it"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6141"
*   }
* }
* -----------------------------------------------------------

tit B1bb - conditional on any B1ba > 4.<br>compute flt = 0.<br>if (B1ba_1 > 4) flt = 1.<br>filter by flt.<br>temporary.<br>sel if miss(B1bb) or ~range(B1bb,1,6).<br>list respid B1bb flt.<br>filter off.<br>del var flt.<br>

* ============================================================.
* Question ID: B1cx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1cx1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B1cx1 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6128",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B1cx1','B1cDKx1');\n\nif(!QuestionErrors() && f('B1cDKx1').size() == 0)\n    validateB1c(\"S7_1\",\"B1cx1\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B1cx1_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx1_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B1cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B1cx1 - DK, numeric range and sum checks.<br>* Validate DK control variable domain.<br>temporary.<br>sel if miss(B1cDKx1_99) or ~range(B1cDKx1_99,0,1).<br>list respid B1cDKx1_99.<br>* Check numeric cells depending on DK flag and value ranges.<br>do repeat x = B1cx1_51 B1cx1_1 B1cx1_52 B1cx1_54 B1cx1_53 B1cx1_7 B1cx1_2 B1cx1_3 B1cx1_4 B1cx1_56 B1cx1_5 B1cx1_6 B1cx1_8 B1cx1_9.<br>  if ((miss(B1cDKx1_99) or B1cDKx1_99 = 0) and (miss(x) or ~range(x,0,999))) flag1 = 1.<br>  if (B1cDKx1_99 = 1 and ~miss(x)) flag1 = 2.<br>end repeat.<br>temporary.<br>sel if flag1 > 0.<br>list respid flag1 B1cDKx1_99 B1cx1_51 B1cx1_1 B1cx1_52 B1cx1_54 B1cx1_53 B1cx1_7 B1cx1_2 B1cx1_3 B1cx1_4 B1cx1_56 B1cx1_5 B1cx1_6 B1cx1_8 B1cx1_9.<br>del var flag1.<br>* Sum (AutoSum) check - expected sum = 100 (mirror client-side AutoSum validation).<br>compute SumB1cx1 = sum(B1cx1_51, B1cx1_1, B1cx1_52, B1cx1_54, B1cx1_53, B1cx1_7, B1cx1_2, B1cx1_3, B1cx1_4, B1cx1_56, B1cx1_5, B1cx1_6, B1cx1_8, B1cx1_9).<br>temporary.<br>sel if (miss(B1cDKx1_99) or B1cDKx1_99 = 0) and (SumB1cx1 <> 100).<br>list respid SumB1cx1 B1cx1_51 B1cx1_1 B1cx1_52 B1cx1_54 B1cx1_53 B1cx1_7 B1cx1_2 B1cx1_3 B1cx1_4 B1cx1_56 B1cx1_5 B1cx1_6 B1cx1_8 B1cx1_9.<br>del var SumB1cx1.<br>* Other-text consistency for code 9.<br>if (B1cx1_9 > 0 and (B1cx1_9_other = '' or miss(B1cx1_9_other))) flag2 = 1.<br>if ((miss(B1cx1_9) or B1cx1_9 = 0) and (B1cx1_9_other <> '' and ~miss(B1cx1_9_other))) flag2 = 2.<br>temporary.<br>sel if flag2 > 0.<br>list respid flag2 B1cx1_9 B1cx1_9_other.<br>del var flag2.<br>

* ============================================================.
* Question ID: B1cx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1cx2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B1cx2 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6129",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B1cx2','B1cDKx2');\n\nif(!QuestionErrors() && f('B1cDKx2').size() == 0)\n    validateB1c(\"S7_2\",\"B1cx2\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B1cx2_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx2_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B1cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B1cx2 - DK, numeric range and sum checks.<br>* Validate DK control variable domain.<br>temporary.<br>sel if miss(B1cDKx2_99) or ~range(B1cDKx2_99,0,1).<br>list respid B1cDKx2_99.<br>* Check numeric cells depending on DK flag and value ranges.<br>do repeat x = B1cx2_51 B1cx2_1 B1cx2_52 B1cx2_54 B1cx2_53 B1cx2_7 B1cx2_2 B1cx2_3 B1cx2_4 B1cx2_56 B1cx2_5 B1cx2_6 B1cx2_8 B1cx2_9.<br>  if ((miss(B1cDKx2_99) or B1cDKx2_99 = 0) and (miss(x) or ~range(x,0,999))) flag1 = 1.<br>  if (B1cDKx2_99 = 1 and ~miss(x)) flag1 = 2.<br>end repeat.<br>temporary.<br>sel if flag1 > 0.<br>list respid flag1 B1cDKx2_99 B1cx2_51 B1cx2_1 B1cx2_52 B1cx2_54 B1cx2_53 B1cx2_7 B1cx2_2 B1cx2_3 B1cx2_4 B1cx2_56 B1cx2_5 B1cx2_6 B1cx2_8 B1cx2_9.<br>del var flag1.<br>* Sum (AutoSum) check - expected sum = 100.<br>compute SumB1cx2 = sum(B1cx2_51, B1cx2_1, B1cx2_52, B1cx2_54, B1cx2_53, B1cx2_7, B1cx2_2, B1cx2_3, B1cx2_4, B1cx2_56, B1cx2_5, B1cx2_6, B1cx2_8, B1cx2_9).<br>temporary.<br>sel if (miss(B1cDKx2_99) or B1cDKx2_99 = 0) and (SumB1cx2 <> 100).<br>list respid SumB1cx2 B1cx2_51 B1cx2_1 B1cx2_52 B1cx2_54 B1cx2_53 B1cx2_7 B1cx2_2 B1cx2_3 B1cx2_4 B1cx2_56 B1cx2_5 B1cx2_6 B1cx2_8 B1cx2_9.<br>del var SumB1cx2.<br>* Other-text consistency for code 9.<br>if (B1cx2_9 > 0 and (B1cx2_9_other = '' or miss(B1cx2_9_other))) flag2 = 1.<br>if ((miss(B1cx2_9) or B1cx2_9 = 0) and (B1cx2_9_other <> '' and ~miss(B1cx2_9_other))) flag2 = 2.<br>temporary.<br>sel if flag2 > 0.<br>list respid flag2 B1cx2_9 B1cx2_9_other.<br>del var flag2.<br>

* ============================================================.
* Question ID: B1cx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1cx3",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B1cx3 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6130",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B1cx3','B1cDKx3');\n\nif(!QuestionErrors() && f('B1cDKx3').size() == 0)\n    validateB1c(\"S7_3\",\"B1cx3\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B1cx3_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx3_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B1cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B1cx3 - DK, numeric range and sum checks.<br>* Validate DK control variable domain.<br>temporary.<br>sel if miss(B1cDKx3_99) or ~range(B1cDKx3_99,0,1).<br>list respid B1cDKx3_99.<br>* Check numeric cells depending on DK flag and value ranges.<br>do repeat x = B1cx3_51 B1cx3_1 B1cx3_52 B1cx3_54 B1cx3_53 B1cx3_7 B1cx3_2 B1cx3_3 B1cx3_4 B1cx3_56 B1cx3_5 B1cx3_6 B1cx3_8 B1cx3_9.<br>  if ((miss(B1cDKx3_99) or B1cDKx3_99 = 0) and (miss(x) or ~range(x,0,999))) flag1 = 1.<br>  if (B1cDKx3_99 = 1 and ~miss(x)) flag1 = 2.<br>end repeat.<br>temporary.<br>sel if flag1 > 0.<br>list respid flag1 B1cDKx3_99 B1cx3_51 B1cx3_1 B1cx3_52 B1cx3_54 B1cx3_53 B1cx3_7 B1cx3_2 B1cx3_3 B1cx3_4 B1cx3_56 B1cx3_5 B1cx3_6 B1cx3_8 B1cx3_9.<br>del var flag1.<br>* Sum (AutoSum) check - expected sum = 100.<br>compute SumB1cx3 = sum(B1cx3_51, B1cx3_1, B1cx3_52, B1cx3_54, B1cx3_53, B1cx3_7, B1cx3_2, B1cx3_3, B1cx3_4, B1cx3_56, B1cx3_5, B1cx3_6, B1cx3_8, B1cx3_9).<br>temporary.<br>sel if (miss(B1cDKx3_99) or B1cDKx3_99 = 0) and (SumB1cx3 <> 100).<br>list respid SumB1cx3 B1cx3_51 B1cx3_1 B1cx3_52 B1cx3_54 B1cx3_53 B1cx3_7 B1cx3_2 B1cx3_3 B1cx3_4 B1cx3_56 B1cx3_5 B1cx3_6 B1cx3_8 B1cx3_9.<br>del var SumB1cx3.<br>* Other-text consistency for code 9.<br>if (B1cx3_9 > 0 and (B1cx3_9_other = '' or miss(B1cx3_9_other))) flag2 = 1.<br>if ((miss(B1cx3_9) or B1cx3_9 = 0) and (B1cx3_9_other <> '' and ~miss(B1cx3_9_other))) flag2 = 2.<br>temporary.<br>sel if flag2 > 0.<br>list respid flag2 B1cx3_9 B1cx3_9_other.<br>del var flag2.<br>

* ============================================================.
* Question ID: B1cx4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1cx4",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B1cx4 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6131",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B1cx4','B1cDKx4');\n\nif(!QuestionErrors() && f('B1cDKx4').size() == 0)\n    validateB1c(\"S7_4\",\"B1cx4\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B1cx4_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx4_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B1cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B1cx4 - DK, numeric range and sum checks.<br>* Validate DK control variable domain.<br>temporary.<br>sel if miss(B1cDKx4_99) or ~range(B1cDKx4_99,0,1).<br>list respid B1cDKx4_99.<br>* Check numeric cells depending on DK flag and value ranges.<br>do repeat x = B1cx4_51 B1cx4_1 B1cx4_52 B1cx4_54 B1cx4_53 B1cx4_7 B1cx4_2 B1cx4_3 B1cx4_4 B1cx4_56 B1cx4_5 B1cx4_6 B1cx4_8 B1cx4_9.<br>  if ((miss(B1cDKx4_99) or B1cDKx4_99 = 0) and (miss(x) or ~range(x,0,999))) flag1 = 1.<br>  if (B1cDKx4_99 = 1 and ~miss(x)) flag1 = 2.<br>end repeat.<br>temporary.<br>sel if flag1 > 0.<br>list respid flag1 B1cDKx4_99 B1cx4_51 B1cx4_1 B1cx4_52 B1cx4_54 B1cx4_53 B1cx4_7 B1cx4_2 B1cx4_3 B1cx4_4 B1cx4_56 B1cx4_5 B1cx4_6 B1cx4_8 B1cx4_9.<br>del var flag1.<br>* Sum (AutoSum) check - expected sum = 100.<br>compute SumB1cx4 = sum(B1cx4_51, B1cx4_1, B1cx4_52, B1cx4_54, B1cx4_53, B1cx4_7, B1cx4_2, B1cx4_3, B1cx4_4, B1cx4_56, B1cx4_5, B1cx4_6, B1cx4_8, B1cx4_9).<br>temporary.<br>sel if (miss(B1cDKx4_99) or B1cDKx4_99 = 0) and (SumB1cx4 <> 100).<br>list respid SumB1cx4 B1cx4_51 B1cx4_1 B1cx4_52 B1cx4_54 B1cx4_53 B1cx4_7 B1cx4_2 B1cx4_3 B1cx4_4 B1cx4_56 B1cx4_5 B1cx4_6 B1cx4_8 B1cx4_9.<br>del var SumB1cx4.<br>* Other-text consistency for code 9.<br>if (B1cx4_9 > 0 and (B1cx4_9_other = '' or miss(B1cx4_9_other))) flag2 = 1.<br>if ((miss(B1cx4_9) or B1cx4_9 = 0) and (B1cx4_9_other <> '' and ~miss(B1cx4_9_other))) flag2 = 2.<br>temporary.<br>sel if flag2 > 0.<br>list respid flag2 B1cx4_9 B1cx4_9_other.<br>del var flag2.<br>

* ============================================================.
* Question ID: B1cx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1cx5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B1cx5 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6132",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B1cx5','B1cDKx5');\n\nif(!QuestionErrors() && f('B1cDKx5').size() == 0)\n    validateB1c(\"S7_5\",\"B1cx5\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B1cx5_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B1cx5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B1cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B1cx5 - DK, numeric range and sum checks.<br>* Validate DK control variable domain.<br>temporary.<br>sel if miss(B1cDKx5_99) or ~range(B1cDKx5_99,0,1).<br>list respid B1cDKx5_99.<br>* Check numeric cells depending on DK flag and value ranges.<br>do repeat x = B1cx5_51 B1cx5_1 B1cx5_52 B1cx5_54 B1cx5_53 B1cx5_7 B1cx5_2 B1cx5_3 B1cx5_4 B1cx5_56 B1cx5_5 B1cx5_6 B1cx5_8 B1cx5_9.<br>  if ((miss(B1cDKx5_99) or B1cDKx5_99 = 0) and (miss(x) or ~range(x,0,999))) flag1 = 1.<br>  if (B1cDKx5_99 = 1 and ~miss(x)) flag1 = 2.<br>end repeat.<br>temporary.<br>sel if flag1 > 0.<br>list respid flag1 B1cDKx5_99 B1cx5_51 B1cx5_1 B1cx5_52 B1cx5_54 B1cx5_53 B1cx5_7 B1cx5_2 B1cx5_3 B1cx5_4 B1cx5_56 B1cx5_5 B1cx5_6 B1cx5_8 B1cx5_9.<br>del var flag1.<br>* Sum (AutoSum) check - expected sum = 100.<br>compute SumB1cx5 = sum(B1cx5_51, B1cx5_1, B1cx5_52, B1cx5_54, B1cx5_53, B1cx5_7, B1cx5_2, B1cx5_3, B1cx5_4, B1cx5_56, B1cx5_5, B1cx5_6, B1cx5_8, B1cx5_9).<br>temporary.<br>sel if (miss(B1cDKx5_99) or B1cDKx5_99 = 0) and (SumB1cx5 <> 100).<br>list respid SumB1cx5 B1cx5_51 B1cx5_1 B1cx5_52 B1cx5_54 B1cx5_53 B1cx5_7 B1cx5_2 B1cx5_3 B1cx5_4 B1cx5_56 B1cx5_5 B1cx5_6 B1cx5_8 B1cx5_9.<br>del var SumB1cx5.<br>* Other-text consistency for code 9.<br>if (B1cx5_9 > 0 and (B1cx5_9_other = '' or miss(B1cx5_9_other))) flag2 = 1.<br>if ((miss(B1cx5_9) or B1cx5_9 = 0) and (B1cx5_9_other <> '' and ~miss(B1cx5_9_other))) flag2 = 2.<br>temporary.<br>sel if flag2 > 0.<br>list respid flag2 B1cx5_9 B1cx5_9_other.<br>del var flag2.<br>

* ============================================================.
* Question ID: B1cDKx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1cDKx1",
*   "Question Label": "My prescribing wouldn’t change at all (B1cDKx1)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B1cDKx1_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "EntityId": "6147"
*   }
* }
* -----------------------------------------------------------

tit B1cDKx1 - DK control variable domain check.<br>temporary.<br>sel if miss(B1cDKx1_99) or ~range(B1cDKx1_99,0,1).<br>list respid B1cDKx1_99.<br>

* ============================================================.
* Question ID: B1cDKx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1cDKx2",
*   "Question Label": "My prescribing wouldn’t change at all (B1cDKx2)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B1cDKx2_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "EntityId": "6148"
*   }
* }
* -----------------------------------------------------------

tit B1cDKx2 - DK control variable domain check.<br>temporary.<br>sel if miss(B1cDKx2_99) or ~range(B1cDKx2_99,0,1).<br>list respid B1cDKx2_99.<br>

* ============================================================.
* Question ID: B1cDKx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1cDKx3",
*   "Question Label": "My prescribing wouldn’t change at all (B1cDKx3)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B1cDKx3_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "EntityId": "6149"
*   }
* }
* -----------------------------------------------------------

tit B1cDKx3.<br>temporary.<br>/* DK presence/domain check for column 3 (shown when S7_3 indicates column visible) */<br>sel if (S7_3=1 and (miss(B1cDKx3_99) or ~range(B1cDKx3_99,0,1))) or (S7_3<>1 and ~miss(B1cDKx3_99)).<br>list respid B1cDKx3_99.<br>

* ============================================================.
* Question ID: B1cDKx4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1cDKx4",
*   "Question Label": "My prescribing wouldn’t change at all (B1cDKx4)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B1cDKx4_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "EntityId": "6150"
*   }
* }
* -----------------------------------------------------------

tit B1cDKx4.<br>temporary.<br>/* DK presence/domain check for column 4 (shown when S7_4 indicates column visible) */<br>sel if (S7_4=1 and (miss(B1cDKx4_99) or ~range(B1cDKx4_99,0,1))) or (S7_4<>1 and ~miss(B1cDKx4_99)).<br>list respid B1cDKx4_99.<br>

* ============================================================.
* Question ID: B1cDKx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B1cDKx5",
*   "Question Label": "My prescribing wouldn’t change at all (B1cDKx5)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B1cDKx5_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "EntityId": "6151"
*   }
* }
* -----------------------------------------------------------

tit B1cDKx5.<br>temporary.<br>/* DK presence/domain check for column 5 (shown when S7_5 indicates column visible) */<br>sel if (S7_5=1 and (miss(B1cDKx5_99) or ~range(B1cDKx5_99,0,1))) or (S7_5<>1 and ~miss(B1cDKx5_99)).<br>list respid B1cDKx5_99.<br>

* ============================================================.
* Question ID: B2b
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2b",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B2b_1 (B2b - We would now like for you to answer the following questions in the context of a generic abiraterone being approved for you to prescribe to high risk localized PCa patients.  How likely would you be to personally prescribe this generic abiraterone, based on any perceived benefits in this scenario, to your high risk localized PCa patients? )",
*   "question_attributes": {
*     "Carousel": "false",
*     "EntityId": "6161",
*     "Slider": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B2b_1",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B2b.<br>temporary.<br>/* Slider/grid range check for B2b_1 (expected 0..10) */<br>sel if miss(B2b_1) or ~range(B2b_1,0,10).<br>list respid B2b_1.<br>

* ============================================================.
* Question ID: B2ba
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2ba",
*   "Question Label": "B2ba - Given its approval, how long will it take you to increase your prescribing of generic abiraterone to your high risk localized PCa   patients? I would prescribe it... ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "GreaterThan('B2b',4).size() > 0"
*   ],
*   "conditions": [],
*   "Variable ID": "B2ba",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority and available for me to prescribe"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority, available for me to prescribe and reimbursed for 6 months or less"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 6 months"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 12 months"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only if the product has been recommended by treatment guidelines"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only after my peers have used it and recommended it"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6159"
*   }
* }
* -----------------------------------------------------------

tit B2ba.<br>/* Entry condition: any B2b cell > 4 -> B2ba should be asked. Implemented by flt flag. */<br>compute flt = 0.<br>if (B2b_1 > 4) flt = 1. /* GreaterThan('B2b',4) triggers when any slider >4; only B2b_1 exists here */<br>temporary.<br>/* If triggered (flt=1) B2ba must be present and in domain 1..6; if not triggered it must be missing */<br>sel if (flt=1 and (miss(B2ba) or ~range(B2ba,1,6))) or (flt=0 and ~miss(B2ba)).<br>list respid B2ba flt.<br>del var flt.<br>

* ============================================================.
* Question ID: B2cx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2cx1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B2cx1 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6172",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B2cx1','B2cDKx1');\n\nif(!QuestionErrors() && f('B2cDKx1').size() == 0)\n    validateB1c(\"S7_1\",\"B2cx1\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B2cx1_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx1_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B2cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B2cx1.<br>/* 1) DK presence/domain check for column 1 */<br>temporary.<br>sel if (S7_1=1 and (miss(B2cDKx1_99) or ~range(B2cDKx1_99,0,1))) or (S7_1<>1 and ~miss(B2cDKx1_99)).<br>list respid B2cDKx1_99.<br><br>/* 2) Numeric cells: required when column shown (S7_1=1) AND DK=0; otherwise cells should be blank */<br>compute flag = 0.<br>do repeat v = B2cx1_51 B2cx1_1 B2cx1_52 B2cx1_54 B2cx1_53 B2cx1_7 B2cx1_2 B2cx1_3 B2cx1_4 B2cx1_56 B2cx1_5 B2cx1_6 B2cx1_8 B2cx1_9.<br>  if (S7_1=1 and B2cDKx1_99=0 and (miss(v) or ~range(v,0,999))) flag = 1.<br>  if ((S7_1<>1 or B2cDKx1_99=1 or miss(B2cDKx1_99)) and ~miss(v)) flag = 2.<br>end repeat.<br>temporary.<br>sel if flag>0.<br>list respid flag B2cx1_51 B2cx1_1 B2cx1_52 B2cx1_54 B2cx1_53 B2cx1_7 B2cx1_2 B2cx1_3 B2cx1_4 B2cx1_56 B2cx1_5 B2cx1_6 B2cx1_8 B2cx1_9.<br>del var flag.<br><br>/* 3) AutoSum check: sum of cells must equal S7_1 when column shown and DK=0 */<br>compute SumB2cx1 = sum(B2cx1_51,B2cx1_1,B2cx1_52,B2cx1_54,B2cx1_53,B2cx1_7,B2cx1_2,B2cx1_3,B2cx1_4,B2cx1_56,B2cx1_5,B2cx1_6,B2cx1_8,B2cx1_9).<br>exe.<br>temporary.<br>sel if S7_1=1 and B2cDKx1_99=0 and (miss(SumB2cx1) or SumB2cx1 <> S7_1).<br>list respid SumB2cx1 B2cx1_51 B2cx1_1 B2cx1_52 B2cx1_54 B2cx1_53 B2cx1_7 B2cx1_2 B2cx1_3 B2cx1_4 B2cx1_56 B2cx1_5 B2cx1_6 B2cx1_8 B2cx1_9 S7_1 B2cDKx1_99.<br>del var SumB2cx1.<br>

* ============================================================.
* Question ID: B2cx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2cx2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B2cx2 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6174",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B2cx2','B2cDKx2');\n\nif(!QuestionErrors() && f('B2cDKx2').size() == 0)\n    validateB1c(\"S7_2\",\"B2cx2\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B2cx2_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx2_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B2cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B2cx2.<br>/* 1) DK presence/domain check for column 2 */<br>temporary.<br>sel if (S7_2=1 and (miss(B2cDKx2_99) or ~range(B2cDKx2_99,0,1))) or (S7_2<>1 and ~miss(B2cDKx2_99)).<br>list respid B2cDKx2_99.<br><br>/* 2) Numeric cells: required when column shown (S7_2=1) AND DK=0; otherwise cells should be blank */<br>compute flag = 0.<br>do repeat v = B2cx2_51 B2cx2_1 B2cx2_52 B2cx2_54 B2cx2_53 B2cx2_7 B2cx2_2 B2cx2_3 B2cx2_4 B2cx2_56 B2cx2_5 B2cx2_6 B2cx2_8 B2cx2_9.<br>  if (S7_2=1 and B2cDKx2_99=0 and (miss(v) or ~range(v,0,999))) flag = 1.<br>  if ((S7_2<>1 or B2cDKx2_99=1 or miss(B2cDKx2_99)) and ~miss(v)) flag = 2.<br>end repeat.<br>temporary.<br>sel if flag>0.<br>list respid flag B2cx2_51 B2cx2_1 B2cx2_52 B2cx2_54 B2cx2_53 B2cx2_7 B2cx2_2 B2cx2_3 B2cx2_4 B2cx2_56 B2cx2_5 B2cx2_6 B2cx2_8 B2cx2_9.<br>del var flag.<br><br>/* 3) AutoSum check: sum of cells must equal S7_2 when column shown and DK=0 */<br>compute SumB2cx2 = sum(B2cx2_51,B2cx2_1,B2cx2_52,B2cx2_54,B2cx2_53,B2cx2_7,B2cx2_2,B2cx2_3,B2cx2_4,B2cx2_56,B2cx2_5,B2cx2_6,B2cx2_8,B2cx2_9).<br>exe.<br>temporary.<br>sel if S7_2=1 and B2cDKx2_99=0 and (miss(SumB2cx2) or SumB2cx2 <> S7_2).<br>list respid SumB2cx2 B2cx2_51 B2cx2_1 B2cx2_52 B2cx2_54 B2cx2_53 B2cx2_7 B2cx2_2 B2cx2_3 B2cx2_4 B2cx2_56 B2cx2_5 B2cx2_6 B2cx2_8 B2cx2_9 S7_2 B2cDKx2_99.<br>del var SumB2cx2.<br>

* ============================================================.
* Question ID: B2cx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2cx3",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B2cx3 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6176",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B2cx3','B2cDKx3');\n\nif(!QuestionErrors() && f('B2cDKx3').size() == 0)\n    validateB1c(\"S7_3\",\"B2cx3\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B2cx3_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx3_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B2cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B2cx3.<br>/* 1) DK presence/domain check for column 3 */<br>temporary.<br>sel if (S7_3=1 and (miss(B2cDKx3_99) or ~range(B2cDKx3_99,0,1))) or (S7_3<>1 and ~miss(B2cDKx3_99)).<br>list respid B2cDKx3_99.<br><br>/* 2) Numeric cells: required when column shown (S7_3=1) AND DK=0; otherwise cells should be blank */<br>compute flag = 0.<br>do repeat v = B2cx3_51 B2cx3_1 B2cx3_52 B2cx3_54 B2cx3_53 B2cx3_7 B2cx3_2 B2cx3_3 B2cx3_4 B2cx3_56 B2cx3_5 B2cx3_6 B2cx3_8 B2cx3_9.<br>  if (S7_3=1 and B2cDKx3_99=0 and (miss(v) or ~range(v,0,999))) flag = 1.<br>  if ((S7_3<>1 or B2cDKx3_99=1 or miss(B2cDKx3_99)) and ~miss(v)) flag = 2.<br>end repeat.<br>temporary.<br>sel if flag>0.<br>list respid flag B2cx3_51 B2cx3_1 B2cx3_52 B2cx3_54 B2cx3_53 B2cx3_7 B2cx3_2 B2cx3_3 B2cx3_4 B2cx3_56 B2cx3_5 B2cx3_6 B2cx3_8 B2cx3_9.<br>del var flag.<br><br>/* 3) AutoSum check: sum of cells must equal S7_3 when column shown and DK=0 */<br>compute SumB2cx3 = sum(B2cx3_51,B2cx3_1,B2cx3_52,B2cx3_54,B2cx3_53,B2cx3_7,B2cx3_2,B2cx3_3,B2cx3_4,B2cx3_56,B2cx3_5,B2cx3_6,B2cx3_8,B2cx3_9).<br>exe.<br>temporary.<br>sel if S7_3=1 and B2cDKx3_99=0 and (miss(SumB2cx3) or SumB2cx3 <> S7_3).<br>list respid SumB2cx3 B2cx3_51 B2cx3_1 B2cx3_52 B2cx3_54 B2cx3_53 B2cx3_7 B2cx3_2 B2cx3_3 B2cx3_4 B2cx3_56 B2cx3_5 B2cx3_6 B2cx3_8 B2cx3_9 S7_3 B2cDKx3_99.<br>del var SumB2cx3.<br>

* ============================================================.
* Question ID: B2cx4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2cx4",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B2cx4 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6178",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B2cx4','B2cDKx4');\n\nif(!QuestionErrors() && f('B2cDKx4').size() == 0)\n    validateB1c(\"S7_4\",\"B2cx4\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B2cx4_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx4_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B2cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B2cx4.<br>/* 1) DK presence/domain check for column 4 */<br>temporary.<br>sel if (S7_4=1 and (miss(B2cDKx4_99) or ~range(B2cDKx4_99,0,1))) or (S7_4<>1 and ~miss(B2cDKx4_99)).<br>list respid B2cDKx4_99.<br><br>/* 2) Numeric cells: required when column shown (S7_4=1) AND DK=0; otherwise cells should be blank */<br>compute flag = 0.<br>do repeat v = B2cx4_51 B2cx4_1 B2cx4_52 B2cx4_54 B2cx4_53 B2cx4_7 B2cx4_2 B2cx4_3 B2cx4_4 B2cx4_56 B2cx4_5 B2cx4_6 B2cx4_8 B2cx4_9.<br>  if (S7_4=1 and B2cDKx4_99=0 and (miss(v) or ~range(v,0,999))) flag = 1.<br>  if ((S7_4<>1 or B2cDKx4_99=1 or miss(B2cDKx4_99)) and ~miss(v)) flag = 2.<br>end repeat.<br>temporary.<br>sel if flag>0.<br>list respid flag B2cx4_51 B2cx4_1 B2cx4_52 B2cx4_54 B2cx4_53 B2cx4_7 B2cx4_2 B2cx4_3 B2cx4_4 B2cx4_56 B2cx4_5 B2cx4_6 B2cx4_8 B2cx4_9.<br>del var flag.<br><br>/* 3) AutoSum check: sum of cells must equal S7_4 when column shown and DK=0 */<br>compute SumB2cx4 = sum(B2cx4_51,B2cx4_1,B2cx4_52,B2cx4_54,B2cx4_53,B2cx4_7,B2cx4_2,B2cx4_3,B2cx4_4,B2cx4_56,B2cx4_5,B2cx4_6,B2cx4_8,B2cx4_9).<br>exe.<br>temporary.<br>sel if S7_4=1 and B2cDKx4_99=0 and (miss(SumB2cx4) or SumB2cx4 <> S7_4).<br>list respid SumB2cx4 B2cx4_51 B2cx4_1 B2cx4_52 B2cx4_54 B2cx4_53 B2cx4_7 B2cx4_2 B2cx4_3 B2cx4_4 B2cx4_56 B2cx4_5 B2cx4_6 B2cx4_8 B2cx4_9 S7_4 B2cDKx4_99.<br>del var SumB2cx4.<br>

* ============================================================.
* Question ID: B2cx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2cx5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B2cx5 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6180",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B2cx5','B2cDKx5');\n\nif(!QuestionErrors() && f('B2cDKx5').size() == 0)\n    validateB1c(\"S7_5\",\"B2cx5\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B2cx5_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B2cx5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B2cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B2cx5.<br>/* 1) DK presence/domain check for column 5 */<br>temporary.<br>sel if (S7_5=1 and (miss(B2cDKx5_99) or ~range(B2cDKx5_99,0,1))) or (S7_5<>1 and ~miss(B2cDKx5_99)).<br>list respid B2cDKx5_99.<br><br>/* 2) Numeric cells: required when column shown (S7_5=1) AND DK=0; otherwise cells should be blank */<br>compute flag = 0.<br>do repeat v = B2cx5_51 B2cx5_1 B2cx5_52 B2cx5_54 B2cx5_53 B2cx5_7 B2cx5_2 B2cx5_3 B2cx5_4 B2cx5_56 B2cx5_5 B2cx5_6 B2cx5_8 B2cx5_9.<br>  if (S7_5=1 and B2cDKx5_99=0 and (miss(v) or ~range(v,0,999))) flag = 1.<br>  if ((S7_5<>1 or B2cDKx5_99=1 or miss(B2cDKx5_99)) and ~miss(v)) flag = 2.<br>end repeat.<br>temporary.<br>sel if flag>0.<br>list respid flag B2cx5_51 B2cx5_1 B2cx5_52 B2cx5_54 B2cx5_53 B2cx5_7 B2cx5_2 B2cx5_3 B2cx5_4 B2cx5_56 B2cx5_5 B2cx5_6 B2cx5_8 B2cx5_9.<br>del var flag.<br><br>/* 3) AutoSum check: sum of cells must equal S7_5 when column shown and DK=0 */<br>compute SumB2cx5 = sum(B2cx5_51,B2cx5_1,B2cx5_52,B2cx5_54,B2cx5_53,B2cx5_7,B2cx5_2,B2cx5_3,B2cx5_4,B2cx5_56,B2cx5_5,B2cx5_6,B2cx5_8,B2cx5_9).<br>exe.<br>temporary.<br>sel if S7_5=1 and B2cDKx5_99=0 and (miss(SumB2cx5) or SumB2cx5 <> S7_5).<br>list respid SumB2cx5 B2cx5_51 B2cx5_1 B2cx5_52 B2cx5_54 B2cx5_53 B2cx5_7 B2cx5_2 B2cx5_3 B2cx5_4 B2cx5_56 B2cx5_5 B2cx5_6 B2cx5_8 B2cx5_9 S7_5 B2cDKx5_99.<br>del var SumB2cx5.<br>

* ============================================================.
* Question ID: B2cDKx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2cDKx1",
*   "Question Label": "My prescribing wouldn’t change at all (B2cDKx1)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B2cDKx1_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "EntityId": "6183"
*   }
* }
* -----------------------------------------------------------

tit B2cDKx1.<br>/* Count anchor responses that put this column in-scope (treat >4 as selected) */<br>count cnt=b3bb_1 to b3bb_3(5,6,7,8,9,10). exe.<br>/* If any anchor in-scope then DK must be present and coded 0/1; if none in-scope DK should be missing */<br>if cnt>0 and (miss(B2cDKx1_99) or ~range(B2cDKx1_99,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B2cDKx1_99) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag cnt b3bb_1 to b3bb_3 B2cDKx1_99.<br>delete variables flag cnt.

* ============================================================.
* Question ID: B2cDKx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2cDKx2",
*   "Question Label": "My prescribing wouldn’t change at all (B2cDKx2)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B2cDKx2_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "EntityId": "6185"
*   }
* }
* -----------------------------------------------------------

tit B2cDKx2.<br>/* Count anchor responses that put this column in-scope (treat >4 as selected) */<br>count cnt=b3bb_1 to b3bb_3(5,6,7,8,9,10). exe.<br>/* If any anchor in-scope then DK must be present and coded 0/1; if none in-scope DK should be missing */<br>if cnt>0 and (miss(B2cDKx2_99) or ~range(B2cDKx2_99,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B2cDKx2_99) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag cnt b3bb_1 to b3bb_3 B2cDKx2_99.<br>delete variables flag cnt.

* ============================================================.
* Question ID: B2cDKx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2cDKx3",
*   "Question Label": "My prescribing wouldn’t change at all (B2cDKx3)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B2cDKx3_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "EntityId": "6187"
*   }
* }
* -----------------------------------------------------------

tit B2cDKx3.<br>/* Count anchor responses that put this column in-scope (treat >4 as selected) */<br>count cnt=b3bb_1 to b3bb_3(5,6,7,8,9,10). exe.<br>/* If any anchor in-scope then DK must be present and coded 0/1; if none in-scope DK should be missing */<br>if cnt>0 and (miss(B2cDKx3_99) or ~range(B2cDKx3_99,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B2cDKx3_99) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag cnt b3bb_1 to b3bb_3 B2cDKx3_99.<br>delete variables flag cnt.

* ============================================================.
* Question ID: B2cDKx4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2cDKx4",
*   "Question Label": "My prescribing wouldn’t change at all (B2cDKx4)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B2cDKx4_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "EntityId": "6189"
*   }
* }
* -----------------------------------------------------------

tit B2cDKx4.<br>/* Count anchor responses that put this column in-scope (treat >4 as selected) */<br>count cnt=b3bb_1 to b3bb_3(5,6,7,8,9,10). exe.<br>/* If any anchor in-scope then DK must be present and coded 0/1; if none in-scope DK should be missing */<br>if cnt>0 and (miss(B2cDKx4_99) or ~range(B2cDKx4_99,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B2cDKx4_99) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag cnt b3bb_1 to b3bb_3 B2cDKx4_99.<br>delete variables flag cnt.

* ============================================================.
* Question ID: B2cDKx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B2cDKx5",
*   "Question Label": "My prescribing wouldn’t change at all (B2cDKx5)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B2cDKx5_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "EntityId": "6191"
*   }
* }
* -----------------------------------------------------------

tit B2cDKx5.<br>/* Count anchor responses that put this column in-scope (treat >4 as selected) */<br>count cnt=b3bb_1 to b3bb_3(5,6,7,8,9,10). exe.<br>/* If any anchor in-scope then DK must be present and coded 0/1; if none in-scope DK should be missing */<br>if cnt>0 and (miss(B2cDKx5_99) or ~range(B2cDKx5_99,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B2cDKx5_99) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag cnt b3bb_1 to b3bb_3 B2cDKx5_99.<br>delete variables flag cnt.

* ============================================================.
* Question ID: B3bb
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3bb",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "Carousel": "false",
*     "EntityId": "6165",
*     "Slider": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B3bb_1",
*       "Question Label": "(Any) Patients with ^f('qTitle')['mSPC'].label()^  (B3bb - We would now like for you to answer the following questions in the context of a generic abiraterone being approved for you to prescribe to low volume ^f('qTitle')['mSPC'].label()^ patients.   How likely would you be to personally prescribe this generic abiraterone, based on any perceived benefits in this scenario, to the following patients? )",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3bb_2",
*       "Question Label": "Patients with low volume ^f('qTitle')['mSPC'].label()^ (B3bb - We would now like for you to answer the following questions in the context of a generic abiraterone being approved for you to prescribe to low volume ^f('qTitle')['mSPC'].label()^ patients.   How likely would you be to personally prescribe this generic abiraterone, based on any perceived benefits in this scenario, to the following patients? )",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3bb_3",
*       "Question Label": "Patients with high volume ^f('qTitle')['mSPC'].label()^ (B3bb - We would now like for you to answer the following questions in the context of a generic abiraterone being approved for you to prescribe to low volume ^f('qTitle')['mSPC'].label()^ patients.   How likely would you be to personally prescribe this generic abiraterone, based on any perceived benefits in this scenario, to the following patients? )",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B3bb.<br>/* Validate each slider cell present and within 0..10. Flag any respondent with missing/invalid slider answers. */<br>do repeat v = B3bb_1 B3bb_2 B3bb_3.<br>  if (miss(v) or ~range(v,0,10)) b3bb_flag=1.<br>end repeat.<br>temporary.<br>sel if b3bb_flag>0.<br>list respid B3bb_1 to B3bb_3.<br>delete variables b3bb_flag.

* ============================================================.
* Question ID: B3bc
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3bc",
*   "Question Label": "B3bc - How long will it take you to start prescribing generic abiraterone product to your low volume ^f('qTitle')['mSPC'].label()^ patients?  I would prescribe it... ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "GetNum('B3bb_2')>4"
*   ],
*   "conditions": [],
*   "Variable ID": "B3bc",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority and available for me to prescribe"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority, available for me to prescribe and reimbursed for 6 months or less"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 6 months"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 12 months"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only if the product has been recommended by treatment guidelines"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only after my peers have used it and recommended it"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6167"
*   }
* }
* -----------------------------------------------------------

tit B3bc.<br>/* B3bc is asked only if B3bb_2 > 4. If asked it must be coded 1..6. If not asked it should be missing. */<br>temporary.<br>sel if (B3bb_2>4 and (miss(B3bc) or ~range(B3bc,1,6))) or ((B3bb_2<=4 or miss(B3bb_2)) and ~miss(B3bc)).<br>list respid B3bb_2 B3bc.

* ============================================================.
* Question ID: B3cx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3cx1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B3cx1 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6196",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B3cx1','B3cDKx1');\n\nif(!QuestionErrors() && f('B3cDKx1').size() == 0)\n    validateB1c(\"S7_1\",\"B3cx1\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B3cx1_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx1_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B3cx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B3cx1.<br>/* Determine whether this column is in-scope: MaskSec2Cols().isect(set("1")) => S7_1 > 0 */<br>compute cnt = (S7_1 > 0).<br>exe.<br>/* DK indicator checks: expected DK var for this 3D column is B3cDKx1_99 (0/1) */<br>if (cnt>0 and (miss(B3cDKx1_99) or ~range(B3cDKx1_99,0,1))) flag_dk=1. /* DK missing/invalid when column in-scope */<br>if (sum(0,cnt)=0 and ~miss(B3cDKx1_99)) flag_dk=2. /* DK present when column not in-scope */<br><br>/* Per-cell numeric validity depending on DK and column in-scope */<br>do repeat y = B3cx1_51 B3cx1_1 B3cx1_52 B3cx1_54 B3cx1_53 B3cx1_7 B3cx1_2 B3cx1_3 B3cx1_4 B3cx1_56 B3cx1_5 B3cx1_6 B3cx1_8 B3cx1_9.<br>  /* If DK = 0 (not selected) AND column in-scope => numeric required and within 0..999 */<br>  if ((B3cDKx1_99 = 0 and cnt>0) and (miss(y) or ~range(y,0,999))) flag_cell=1.<br>  /* If DK = 1 OR column not in-scope => numeric should be missing */<br>  if ((B3cDKx1_99 = 1 or miss(B3cDKx1_99) or cnt=0) and ~miss(y)) flag_cell=2.<br>end repeat.<br><br>/* OE (Other) text handling for code 9: variable assumed B3cx1_9_other (OpenText) */<br>/* If numeric other present (>0) when answers expected, OE text required */<br>if ((B3cDKx1_99 = 0 and cnt>0) and (not miss(B3cx1_9) and B3cx1_9 > 0) and (B3cx1_9_other = '' or missing(B3cx1_9_other))) flag_oe=1.<br>/* If OE text present but numeric Other not provided (or column not in-scope/DK=1) => flag */<br>if ((B3cDKx1_99 = 1 or miss(B3cDKx1_99) or cnt=0) and (not (B3cx1_9_other = '' or missing(B3cx1_9_other)))) flag_oe=2.<br><br>/* AutoSum / validateB1c equivalent: only when no question-errors and DK NOT selected (i.e. DK=0) */<br>compute sum_B3cx1 = SUM(B3cx1_51, B3cx1_1, B3cx1_52, B3cx1_54, B3cx1_53, B3cx1_7, B3cx1_2, B3cx1_3, B3cx1_4, B3cx1_56, B3cx1_5, B3cx1_6, B3cx1_8, B3cx1_9).<br>exe.<br>/* Only enforce the sum check when column is in-scope AND DK is NOT selected (B3cDKx1_99 = 0) AND there are no earlier question-errors */<br>if (cnt>0 and B3cDKx1_99 = 0 and ( (missing(flag_dk) or flag_dk=0) and (missing(flag_cell) or flag_cell=0) and (missing(flag_oe) or flag_oe=0) ) and (missing(sum_B3cx1) or sum_B3cx1 <> S7_1)) flag_sum=1.<br><br>/* Report any findings */<br>temporary.<br>sel if ( (not missing(flag_dk) and flag_dk>0) or (not missing(flag_cell) and flag_cell>0) or (not missing(flag_oe) and flag_oe>0) or (not missing(flag_sum) and flag_sum>0) ).<br>list respid cnt S7_1 B3cDKx1_99 B3cx1_51 to B3cx1_9 B3cx1_9_other flag_dk flag_cell flag_oe flag_sum sum_B3cx1.<br><br>/* Clean up temporary flags */<br>delete variables cnt flag_dk flag_cell flag_oe flag_sum sum_B3cx1.

* ============================================================.
* Question ID: B3cx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3cx2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B3cx2 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6198",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B3cx2','B3cDKx2');\n\nif(!QuestionErrors() && f('B3cDKx2').size() == 0)\n    validateB1c(\"S7_2\",\"B3cx2\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B3cx2_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx2_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B3cx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B3cx2.<br>/* Column in-scope test: MaskSec2Cols().isect(set("2")) => S7_2 > 0 */<br>compute cnt = (S7_2 > 0).<br>exe.<br>/* DK indicator checks: expected DK var is B3cDKx2_99 (0/1) */<br>if (cnt>0 and (miss(B3cDKx2_99) or ~range(B3cDKx2_99,0,1))) flag_dk=1.<br>if (sum(0,cnt)=0 and ~miss(B3cDKx2_99)) flag_dk=2.<br><br>/* Per-cell numeric checks */<br>do repeat y = B3cx2_51 B3cx2_1 B3cx2_52 B3cx2_54 B3cx2_53 B3cx2_7 B3cx2_2 B3cx2_3 B3cx2_4 B3cx2_56 B3cx2_5 B3cx2_6 B3cx2_8 B3cx2_9.<br>  if ((B3cDKx2_99 = 0 and cnt>0) and (miss(y) or ~range(y,0,999))) flag_cell=1.<br>  if ((B3cDKx2_99 = 1 or miss(B3cDKx2_99) or cnt=0) and ~miss(y)) flag_cell=2.<br>end repeat.<br><br>/* OE checks for code 9 (assumed OE variable B3cx2_9_other) */<br>if ((B3cDKx2_99 = 0 and cnt>0) and (not miss(B3cx2_9) and B3cx2_9 > 0) and (B3cx2_9_other = '' or missing(B3cx2_9_other))) flag_oe=1.<br>if ((B3cDKx2_99 = 1 or miss(B3cDKx2_99) or cnt=0) and (not (B3cx2_9_other = '' or missing(B3cx2_9_other)))) flag_oe=2.<br><br>/* AutoSum / validateB1c equivalent */<br>compute sum_B3cx2 = SUM(B3cx2_51, B3cx2_1, B3cx2_52, B3cx2_54, B3cx2_53, B3cx2_7, B3cx2_2, B3cx2_3, B3cx2_4, B3cx2_56, B3cx2_5, B3cx2_6, B3cx2_8, B3cx2_9).<br>exe.<br>if (cnt>0 and B3cDKx2_99 = 0 and ( (missing(flag_dk) or flag_dk=0) and (missing(flag_cell) or flag_cell=0) and (missing(flag_oe) or flag_oe=0) ) and (missing(sum_B3cx2) or sum_B3cx2 <> S7_2)) flag_sum=1.<br><br>temporary.<br>sel if ( (not missing(flag_dk) and flag_dk>0) or (not missing(flag_cell) and flag_cell>0) or (not missing(flag_oe) and flag_oe>0) or (not missing(flag_sum) and flag_sum>0) ).<br>list respid cnt S7_2 B3cDKx2_99 B3cx2_51 to B3cx2_9 B3cx2_9_other flag_dk flag_cell flag_oe flag_sum sum_B3cx2.<br><br>delete variables cnt flag_dk flag_cell flag_oe flag_sum sum_B3cx2.

* ============================================================.
* Question ID: B3cx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3cx3",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B3cx3 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6200",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B3cx3','B3cDKx3');\n\nif(!QuestionErrors() && f('B3cDKx3').size() == 0)\n    validateB1c(\"S7_3\",\"B3cx3\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B3cx3_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx3_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B3cx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B3cx3.<br>/* Column in-scope: MaskSec2Cols().isect(set("3")) => S7_3 > 0 */<br>compute cnt = (S7_3 > 0).<br>exe.<br>/* DK indicator checks: expected DK var B3cDKx3_99 */<br>if (cnt>0 and (miss(B3cDKx3_99) or ~range(B3cDKx3_99,0,1))) flag_dk=1.<br>if (sum(0,cnt)=0 and ~miss(B3cDKx3_99)) flag_dk=2.<br><br>/* Numeric cell checks */<br>do repeat y = B3cx3_51 B3cx3_1 B3cx3_52 B3cx3_54 B3cx3_53 B3cx3_7 B3cx3_2 B3cx3_3 B3cx3_4 B3cx3_56 B3cx3_5 B3cx3_6 B3cx3_8 B3cx3_9.<br>  if ((B3cDKx3_99 = 0 and cnt>0) and (miss(y) or ~range(y,0,999))) flag_cell=1.<br>  if ((B3cDKx3_99 = 1 or miss(B3cDKx3_99) or cnt=0) and ~miss(y)) flag_cell=2.<br>end repeat.<br><br>/* OE checks for code 9 (assumed B3cx3_9_other) */<br>if ((B3cDKx3_99 = 0 and cnt>0) and (not miss(B3cx3_9) and B3cx3_9 > 0) and (B3cx3_9_other = '' or missing(B3cx3_9_other))) flag_oe=1.<br>if ((B3cDKx3_99 = 1 or miss(B3cDKx3_99) or cnt=0) and (not (B3cx3_9_other = '' or missing(B3cx3_9_other)))) flag_oe=2.<br><br>/* AutoSum / validateB1c equivalent */<br>compute sum_B3cx3 = SUM(B3cx3_51, B3cx3_1, B3cx3_52, B3cx3_54, B3cx3_53, B3cx3_7, B3cx3_2, B3cx3_3, B3cx3_4, B3cx3_56, B3cx3_5, B3cx3_6, B3cx3_8, B3cx3_9).<br>exe.<br>if (cnt>0 and B3cDKx3_99 = 0 and ( (missing(flag_dk) or flag_dk=0) and (missing(flag_cell) or flag_cell=0) and (missing(flag_oe) or flag_oe=0) ) and (missing(sum_B3cx3) or sum_B3cx3 <> S7_3)) flag_sum=1.<br><br>temporary.<br>sel if ( (not missing(flag_dk) and flag_dk>0) or (not missing(flag_cell) and flag_cell>0) or (not missing(flag_oe) and flag_oe>0) or (not missing(flag_sum) and flag_sum>0) ).<br>list respid cnt S7_3 B3cDKx3_99 B3cx3_51 to B3cx3_9 B3cx3_9_other flag_dk flag_cell flag_oe flag_sum sum_B3cx3.<br><br>delete variables cnt flag_dk flag_cell flag_oe flag_sum sum_B3cx3.

* ============================================================.
* Question ID: B3cDKx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3cDKx1",
*   "Question Label": "My prescribing wouldn’t change at all (B3cDKx1)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B3cDKx1_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "EntityId": "6207"
*   }
* }
* -----------------------------------------------------------

tit B3cDKx1.<br><br>* Validate DK variable (expected as 0/1 flag for column 1).<br>temporary.<br>sel if miss(B3cDKx1_99) or ~range(B3cDKx1_99,0,1).<br>list respid, B3cDKx1_99.<br><br>* End B3cDKx1 check.

* ============================================================.
* Question ID: B3cDKx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3cDKx2",
*   "Question Label": "My prescribing wouldn’t change at all (B3cDKx2)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B3cDKx2_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "EntityId": "6209"
*   }
* }
* -----------------------------------------------------------

tit B3cDKx2.<br><br>* Validate DK variable (expected as 0/1 flag for column 2).<br>temporary.<br>sel if miss(B3cDKx2_99) or ~range(B3cDKx2_99,0,1).<br>list respid, B3cDKx2_99.<br><br>* End B3cDKx2 check.

* ============================================================.
* Question ID: B3cDKx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3cDKx3",
*   "Question Label": "My prescribing wouldn’t change at all (B3cDKx3)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B3cDKx3_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "EntityId": "6211"
*   }
* }
* -----------------------------------------------------------

tit B3cDKx3.<br><br>* Validate DK variable (expected as 0/1 flag for column 3).<br>temporary.<br>sel if miss(B3cDKx3_99) or ~range(B3cDKx3_99,0,1).<br>list respid, B3cDKx3_99.<br><br>* End B3cDKx3 check.

* ============================================================.
* Question ID: B3cDKx4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3cDKx4",
*   "Question Label": "My prescribing wouldn’t change at all (B3cDKx4)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B3cDKx4_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "EntityId": "6213"
*   }
* }
* -----------------------------------------------------------

tit B3cDKx4.<br><br>* Validate DK variable (expected as 0/1 flag for column 4).<br>temporary.<br>sel if miss(B3cDKx4_99) or ~range(B3cDKx4_99,0,1).<br>list respid, B3cDKx4_99.<br><br>* End B3cDKx4 check.

* ============================================================.
* Question ID: B3cDKx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3cDKx5",
*   "Question Label": "My prescribing wouldn’t change at all (B3cDKx5)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B3cDKx5_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "EntityId": "6215"
*   }
* }
* -----------------------------------------------------------

tit B3cDKx5.<br><br>* Validate DK variable (expected as 0/1 flag for column 5).<br>temporary.<br>sel if miss(B3cDKx5_99) or ~range(B3cDKx5_99,0,1).<br>list respid, B3cDKx5_99.<br><br>* End B3cDKx5 check.

* ============================================================.
* Question ID: B4ba
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4ba",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4ba_1 (B4ba - We would now like for you to answer the following questions regarding this new treatment, Product P.   ^popup('Scnr4link')^  If this product was approved and available to you, how likely would you be to personally prescribe this product, based on any perceived benefits in this scenario, to your high risk localized PCa patients?)",
*   "question_attributes": {
*     "Carousel": "false",
*     "EntityId": "6224",
*     "Slider": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4ba_1",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)"
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4ba.<br><br>* Validate slider/grid value (expected 0..10).<br>temporary.<br>sel if miss(B4ba_1) or ~range(B4ba_1,0,10).<br>list respid, B4ba_1.<br><br>* End B4ba check.

* ============================================================.
* Question ID: B4bbx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4bbx1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "AnswerRequiredType": "Required",
*     "AutoCheckOther": "true",
*     "EntityId": "6226"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4bbx1_1",
*       "Question Label": "Background (B4bbx1 - ^getInstLabel('m')^)",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx1_2",
*       "Question Label": "Eligible Patients (B4bbx1 - ^getInstLabel('m')^)",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx1_3",
*       "Question Label": "Dosing & Administration (B4bbx1 - ^getInstLabel('m')^)",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx1_4",
*       "Question Label": "Indication (B4bbx1 - ^getInstLabel('m')^)",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx1_5",
*       "Question Label": "Metastasis-Free Survival (MFS) (B4bbx1 - ^getInstLabel('m')^)",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx1_6",
*       "Question Label": "Overall Survival (OS) (B4bbx1 - ^getInstLabel('m')^)",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx1_7",
*       "Question Label": "Prostate cancer-specific survival (B4bbx1 - ^getInstLabel('m')^)",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx1_8",
*       "Question Label": "Safety  (B4bbx1 - ^getInstLabel('m')^)",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": ""
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx1_9",
*       "Question Label": "I don’t like anything from this profile (B4bbx1 - ^getInstLabel('m')^)",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": ""
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4bbx1.<br><br>* Check that each checkbox variable is coded 0/1 (if present) and that at least one is selected (required).<br>do repeat v = B4bbx1_1 B4bbx1_2 B4bbx1_3 B4bbx1_4 B4bbx1_5 B4bbx1_6 B4bbx1_7 B4bbx1_8 B4bbx1_9.<br>  if (~miss(v) and ~range(v,0,1)) flag_range = 1.<br>end repeat.<br><br>* Check required: at least one selected.<br>compute AnySel = SUM(B4bbx1_1, B4bbx1_2, B4bbx1_3, B4bbx1_4, B4bbx1_5, B4bbx1_6, B4bbx1_7, B4bbx1_8, B4bbx1_9).<br>if (AnySel = 0) flag_none = 1.<br><br>temporary.<br>sel if flag_range > 0 or flag_none > 0.<br>list respid flag_range flag_none B4bbx1_1 B4bbx1_2 B4bbx1_3 B4bbx1_4 B4bbx1_5 B4bbx1_6 B4bbx1_7 B4bbx1_8 B4bbx1_9 AnySel.<br>del var flag_range flag_none AnySel.<br><br>* End B4bbx1 checks.

* ============================================================.
* Question ID: B4bbx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4bbx2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4bbx2 - Please rank",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Ordered": "true",
*     "FieldWidth": "2",
*     "EntityId": "6227",
*     "MultiItemsSelectedMinimum": "1",
*     "AutoCheckOther": "true",
*     "ValidationCode": "if ( !QuestionErrors() )\n{\n\n\n   if ( f('B4bbx1').diff(set(\"9\")).size() != f(\"B4bbx2\").size() )\n  {\n    RaiseError();\n    SetQuestionErrorMessage(CurrentLang(),f(\"B4bbx2\").text()+\": \"+f(\"qErrors\")[1].label()+\"\");\n  }\n\n}",
*     "ColumnMask": "f('B4bbx1').size() > 1"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4bbx2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Background (B4bbx2 - Please rank)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Eligible Patients (B4bbx2 - Please rank)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Dosing & Administration (B4bbx2 - Please rank)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "Indication (B4bbx2 - Please rank)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx2_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Metastasis-Free Survival (MFS) (B4bbx2 - Please rank)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx2_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Overall Survival (OS) (B4bbx2 - Please rank)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx2_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Prostate cancer-specific survival (B4bbx2 - Please rank)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx2_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Safety  (B4bbx2 - Please rank)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4bbx2_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "I don’t like anything from this profile (B4bbx2 - Please rank)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4bbx2.<br>
* Basic range checks for ranking cells (expected numeric ranks 1..9 when provided).<br>
compute range_flag = 0.<br>
do repeat r = B4bbx2_1 B4bbx2_2 B4bbx2_3 B4bbx2_4 B4bbx2_5 B4bbx2_6 B4bbx2_7 B4bbx2_8 B4bbx2_9.<br>
  if (not miss(r) and ~range(r,1,9)) range_flag = 1.<br>
end repeat.<br>

* Duplicate rank detection (if the same rank appears more than once among provided ranks).<br>
vector rv = B4bbx2_1 to B4bbx2_9.<br>
compute dup_flag = 0.<br>
do repeat #i = 1 to 9.<br>
  do repeat #j = 1 to 9.<br>
    if (#j > #i) if (not missing(rv(#i)) and not missing(rv(#j)) and rv(#i) = rv(#j)) dup_flag = 1.<br>
  end repeat.<br>
end repeat.<br>

* Count how many items were ranked (non-missing) in B4bbx2.<br>
compute cnt_ranked = 0.<br>
do repeat r = B4bbx2_1 B4bbx2_2 B4bbx2_3 B4bbx2_4 B4bbx2_5 B4bbx2_6 B4bbx2_7 B4bbx2_8 B4bbx2_9.<br>
  if (not missing(r)) cnt_ranked = cnt_ranked + 1.<br>
end repeat.<br>

* Count how many items were selected in B4bbx1 excluding code 9 (i.e., selected checkboxes that should be ranked).<br>
* Assumes B4bbx1_1..B4bbx1_9 exist and are coded 0/1 (or missing). Exclude B4bbx1_9 from the count per the JS rule f('B4bbx1').diff(set('9')).size().<br>
compute cnt_selected = sum( (B4bbx1_1) , (B4bbx1_2) , (B4bbx1_3) , (B4bbx1_4) , (B4bbx1_5) , (B4bbx1_6) , (B4bbx1_7) , (B4bbx1_8) ).<br>
* If any of B4bbx1_1..8 are system-missing this sum will be system-missing; coerce missing-to-0 for safety:<br>
if (missing(cnt_selected)) cnt_selected = 0.<br>

* Cross-check: number of selected items in B4bbx1 (excluding code 9) must equal number of provided ranks in B4bbx2.<br>
compute cross_flag = 0.<br>
if ( cnt_selected <> cnt_ranked ) cross_flag = 1.<br>

* List respondents failing any check: invalid range, duplicate ranks, or mismatch between selections and ranks.<br>
temporary.<br>
sel if range_flag > 0 or dup_flag > 0 or cross_flag > 0.<br>
list respid B4bbx1_1 to B4bbx1_9 B4bbx2_1 to B4bbx2_9 cnt_selected cnt_ranked range_flag dup_flag cross_flag.<br>

* Clean up helper variables.<br>
delete variables range_flag dup_flag cnt_ranked cnt_selected cross_flag.<br>

* End B4bbx2.<br>
```

* ============================================================.
* Question ID: B3cx4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3cx4",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B3cx4 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6202",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B3cx4','B3cDKx4');\n\nif(!QuestionErrors() && f('B3cDKx4').size() == 0)\n    validateB1c(\"S7_4\",\"B3cx4\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B3cx4_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx4_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B3cx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

* B3cx4 validation.<br>
* Note: unified definition of "DK not selected" = (MISSING(B3cDKx4_99) OR B3cDKx4_99 = 0).<br>
<br>
* 1) Validate DK variable only when it is non-missing (flag invalid codes).<br>
TEMPORARY.<br>
SELECT IF (NOT MISSING(B3cDKx4_99) AND (B3cDKx4_99 < 0 OR B3cDKx4_99 > 1)).<br>
LIST respid B3cDKx4_99.<br>
EXECUTE.<br>
<br>
* 2) Per-item numeric checks gated consistently by DK (0 or system-missing => numeric answers required).<br>
COMPUTE flag1 = 0.  /* missing or out-of-range when numbers are required */<br>
COMPUTE flag2 = 0.  /* non-missing answers when DK = 1 (should be blank) */<br>
DO REPEAT x = B3cx4_51 B3cx4_1 B3cx4_52 B3cx4_54 B3cx4_53 B3cx4_7 B3cx4_2 B3cx4_3 B3cx4_4 B3cx4_56 B3cx4_5 B3cx4_6 B3cx4_8 B3cx4_9.<br>
  /* If DK not selected (missing OR 0) then each cell must be present and between 0 and 999 inclusive */<br>
  IF ( (MISSING(B3cDKx4_99) OR B3cDKx4_99 = 0) AND (MISSING(x) OR x < 0 OR x > 999) ) flag1 = 1.<br>
  /* If DK explicitly selected (1) then numeric cells should be blank */<br>
  IF ( (NOT MISSING(B3cDKx4_99) AND B3cDKx4_99 = 1) AND (NOT MISSING(x)) ) flag2 = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SELECT IF (flag1 > 0 OR flag2 > 0).<br>
LIST respid flag1 flag2 B3cx4_51 B3cx4_1 B3cx4_52 B3cx4_54 B3cx4_53 B3cx4_7 B3cx4_2 B3cx4_3 B3cx4_4 B3cx4_56 B3cx4_5 B3cx4_6 B3cx4_8 B3cx4_9 B3cDKx4_99.<br>
EXECUTE.<br>
DELETE VARIABLES flag1 flag2.<br>
<br>
* 3) "Other" open-text consistency check (assumes open-text var named B3cx4_9_other exists).<br>
TEMPORARY.<br>
SELECT IF ( (NOT MISSING(B3cx4_9) AND B3cx4_9 > 0 AND (B3cx4_9_other = "")) OR ((MISSING(B3cx4_9) OR B3cx4_9 = 0) AND (B3cx4_9_other <> "")) ).<br>
LIST respid B3cx4_9 B3cx4_9_other.<br>
EXECUTE.<br>
<br>
* 4) AutoSum / validateB1c replication (conservative: sum of cells must equal S7_4 when DK is not selected).<br>
COMPUTE SumB3cx4 = SUM(B3cx4_51, B3cx4_1, B3cx4_52, B3cx4_54, B3cx4_53, B3cx4_7, B3cx4_2, B3cx4_3, B3cx4_4, B3cx4_56, B3cx4_5, B3cx4_6, B3cx4_8, B3cx4_9).<br>
COMPUTE flag_sum_b3cx4 = 0.<br>
IF ( (MISSING(B3cDKx4_99) OR B3cDKx4_99 = 0) AND ( MISSING(S7_4) OR MISSING(SumB3cx4) OR (SumB3cx4 <> S7_4) ) ) flag_sum_b3cx4 = 1.<br>
TEMPORARY.<br>
SELECT IF (flag_sum_b3cx4 > 0).<br>
LIST respid S7_4 SumB3cx4 B3cx4_51 B3cx4_1 B3cx4_52 B3cx4_54 B3cx4_53 B3cx4_7 B3cx4_2 B3cx4_3 B3cx4_4 B3cx4_56 B3cx4_5 B3cx4_6 B3cx4_8 B3cx4_9 B3cDKx4_99.<br>
EXECUTE.<br>
DELETE VARIABLES SumB3cx4 flag_sum_b3cx4.<br>
<br>
* End B3cx4 checks.<br>

* ============================================================.
* Question ID: B3cx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B3cx5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B3cx5 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6204",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B3cx5','B3cDKx5');\n\nif(!QuestionErrors() && f('B3cDKx5').size() == 0)\n    validateB1c(\"S7_5\",\"B3cx5\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B3cx5_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B3cx5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B3cx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

* B3cx5 validation.<br>
* Note: unified definition of "DK not selected" = (MISSING(B3cDKx5_99) OR B3cDKx5_99 = 0).<br>
<br>
* 1) Validate DK variable only when it is non-missing (flag invalid codes).<br>
TEMPORARY.<br>
SELECT IF (NOT MISSING(B3cDKx5_99) AND (B3cDKx5_99 < 0 OR B3cDKx5_99 > 1)).<br>
LIST respid B3cDKx5_99.<br>
EXECUTE.<br>
<br>
* 2) Per-item numeric checks gated consistently by DK (0 or system-missing => numeric answers required).<br>
COMPUTE flag1 = 0.  /* missing or out-of-range when numbers are required */<br>
COMPUTE flag2 = 0.  /* non-missing answers when DK = 1 (should be blank) */<br>
DO REPEAT x = B3cx5_51 B3cx5_1 B3cx5_52 B3cx5_54 B3cx5_53 B3cx5_7 B3cx5_2 B3cx5_3 B3cx5_4 B3cx5_56 B3cx5_5 B3cx5_6 B3cx5_8 B3cx5_9.<br>
  /* If DK not selected (missing OR 0) then each cell must be present and between 0 and 999 inclusive */<br>
  IF ( (MISSING(B3cDKx5_99) OR B3cDKx5_99 = 0) AND (MISSING(x) OR x < 0 OR x > 999) ) flag1 = 1.<br>
  /* If DK explicitly selected (1) then numeric cells should be blank */<br>
  IF ( (NOT MISSING(B3cDKx5_99) AND B3cDKx5_99 = 1) AND (NOT MISSING(x)) ) flag2 = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SELECT IF (flag1 > 0 OR flag2 > 0).<br>
LIST respid flag1 flag2 B3cx5_51 B3cx5_1 B3cx5_52 B3cx5_54 B3cx5_53 B3cx5_7 B3cx5_2 B3cx5_3 B3cx5_4 B3cx5_56 B3cx5_5 B3cx5_6 B3cx5_8 B3cx5_9 B3cDKx5_99.<br>
EXECUTE.<br>
DELETE VARIABLES flag1 flag2.<br>
<br>
* 3) "Other" open-text consistency check (assumes open-text var named B3cx5_9_other exists).<br>
TEMPORARY.<br>
SELECT IF ( (NOT MISSING(B3cx5_9) AND B3cx5_9 > 0 AND (B3cx5_9_other = "")) OR ((MISSING(B3cx5_9) OR B3cx5_9 = 0) AND (B3cx5_9_other <> "")) ).<br>
LIST respid B3cx5_9 B3cx5_9_other.<br>
EXECUTE.<br>
<br>
* 4) AutoSum / validateB1c replication (conservative: sum of cells must equal S7_5 when DK is not selected).<br>
COMPUTE SumB3cx5 = SUM(B3cx5_51, B3cx5_1, B3cx5_52, B3cx5_54, B3cx5_53, B3cx5_7, B3cx5_2, B3cx5_3, B3cx5_4, B3cx5_56, B3cx5_5, B3cx5_6, B3cx5_8, B3cx5_9).<br>
COMPUTE flag_sum_b3cx5 = 0.<br>
IF ( (MISSING(B3cDKx5_99) OR B3cDKx5_99 = 0) AND ( MISSING(S7_5) OR MISSING(SumB3cx5) OR (SumB3cx5 <> S7_5) ) ) flag_sum_b3cx5 = 1.<br>
TEMPORARY.<br>
SELECT IF (flag_sum_b3cx5 > 0).<br>
LIST respid S7_5 SumB3cx5 B3cx5_51 B3cx5_1 B3cx5_52 B3cx5_54 B3cx5_53 B3cx5_7 B3cx5_2 B3cx5_3 B3cx5_4 B3cx5_56 B3cx5_5 B3cx5_6 B3cx5_8 B3cx5_9 B3cDKx5_99.<br>
EXECUTE.<br>
DELETE VARIABLES SumB3cx5 flag_sum_b3cx5.<br>
<br>
* End B3cx5 checks.

* ============================================================.
* Question ID: B4dx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4dx1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4dx1 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6232",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B4dx1','B4dDKx1');\n\nif(!QuestionErrors() && f('B4dDKx1').size() == 0)\n    validateB1c(\"S7_1\",\"B4dx1\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4dx1_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Product P + ADT + RT (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx1_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B4dx1 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4dx1.<br>/* Build DK and shown flags */<br>compute dk1 = 0.<br>if (B4dDKx1_99 = 1) dk1 = 1.<br>compute shown1 = 0.<br>if (S7_1 > 0) shown1 = 1.<br>exe.<br><br>/* 1) Validate numeric cells when shown and DK NOT selected (range 0..999). If not shown, cells must be missing */<br>temporary.<br>do repeat x = B4dx1_98 B4dx1_51 B4dx1_1 B4dx1_52 B4dx1_54 B4dx1_53 B4dx1_7 B4dx1_2 B4dx1_3 B4dx1_4 B4dx1_56 B4dx1_5 B4dx1_6 B4dx1_8 B4dx1_9.<br>    if (shown1 = 1 and dk1 = 0 and (miss(x) or ~range(x,0,999))) flag1 = 1.<br>    if (shown1 = 0 and ~miss(x)) flag1 = 2.<br>end repeat.<br>sel if flag1 > 0.<br>list respid flag1.<br>delete variables flag1.<br><br>/* 2) If DK selected but there are numeric answers -> flag */<br>temporary.<br>do repeat x = B4dx1_98 B4dx1_51 B4dx1_1 B4dx1_52 B4dx1_54 B4dx1_53 B4dx1_7 B4dx1_2 B4dx1_3 B4dx1_4 B4dx1_56 B4dx1_5 B4dx1_6 B4dx1_8 B4dx1_9.<br>    if (dk1 = 1 and ~miss(x)) flag2 = 1.<br>end repeat.<br>sel if flag2 > 0.<br>list respid flag2.<br>delete variables flag2.<br><br>/* 3) Sum check using validateB1c pattern: Sum of column must equal S7_1 when shown and DK not selected */<br>compute SumB4dx1 = sum(B4dx1_98, B4dx1_51, B4dx1_1, B4dx1_52, B4dx1_54, B4dx1_53, B4dx1_7, B4dx1_2, B4dx1_3, B4dx1_4, B4dx1_56, B4dx1_5, B4dx1_6, B4dx1_8, B4dx1_9).<br>temporary.<br>sel if shown1 = 1 and dk1 = 0 and ~miss(S7_1) and SumB4dx1 <> S7_1.<br>list respid SumB4dx1 S7_1 B4dx1_98 to B4dx1_9.<br>del var SumB4dx1 dk1 shown1.<br><br>/* 4) Other-text consistency for code 9 (Other) */<br>temporary.<br>sel if ( ( (shown1 = 1 and dk1 = 0) and ( (B4dx1_9 > 0 and (miss(B4dx1_9_other) or B4dx1_9_other = \"\")) ) ) or ( (B4dx1_9 = 0 or miss(B4dx1_9)) and (not miss(B4dx1_9_other) and B4dx1_9_other <> \"\") ) ).<br>list respid B4dx1_9 B4dx1_9_other.<br>
```

```

* ============================================================.
* Question ID: B4dx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4dx2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4dx2 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6234",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B4dx2','B4dDKx2');\n\nif(!QuestionErrors() && f('B4dDKx2').size() == 0)\n    validateB1c(\"S7_2\",\"B4dx2\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4dx2_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Product P + ADT + RT (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx2_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B4dx2 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4dx2.<br>/* Build DK and shown flags */<br>compute dk2 = 0.<br>if (B4dDKx2_99 = 1) dk2 = 1.<br>compute shown2 = 0.<br>if (S7_2 > 0) shown2 = 1.<br>exe.<br><br>/* 1) Validate numeric cells when shown and DK NOT selected (range 0..999). If not shown, cells must be missing */<br>temporary.<br>do repeat x = B4dx2_98 B4dx2_51 B4dx2_1 B4dx2_52 B4dx2_54 B4dx2_53 B4dx2_7 B4dx2_2 B4dx2_3 B4dx2_4 B4dx2_56 B4dx2_5 B4dx2_6 B4dx2_8 B4dx2_9.<br>    if (shown2 = 1 and dk2 = 0 and (miss(x) or ~range(x,0,999))) flag1 = 1.<br>    if (shown2 = 0 and ~miss(x)) flag1 = 2.<br>end repeat.<br>sel if flag1 > 0.<br>list respid flag1.<br>delete variables flag1.<br><br>/* 2) If DK selected but there are numeric answers -> flag */<br>temporary.<br>do repeat x = B4dx2_98 B4dx2_51 B4dx2_1 B4dx2_52 B4dx2_54 B4dx2_53 B4dx2_7 B4dx2_2 B4dx2_3 B4dx2_4 B4dx2_56 B4dx2_5 B4dx2_6 B4dx2_8 B4dx2_9.<br>    if (dk2 = 1 and ~miss(x)) flag2 = 1.<br>end repeat.<br>sel if flag2 > 0.<br>list respid flag2.<br>delete variables flag2.<br><br>/* 3) Sum check using validateB1c pattern: Sum of column must equal S7_2 when shown and DK not selected */<br>compute SumB4dx2 = sum(B4dx2_98, B4dx2_51, B4dx2_1, B4dx2_52, B4dx2_54, B4dx2_53, B4dx2_7, B4dx2_2, B4dx2_3, B4dx2_4, B4dx2_56, B4dx2_5, B4dx2_6, B4dx2_8, B4dx2_9).<br>temporary.<br>sel if shown2 = 1 and dk2 = 0 and ~miss(S7_2) and SumB4dx2 <> S7_2.<br>list respid SumB4dx2 S7_2 B4dx2_98 to B4dx2_9.<br>del var SumB4dx2 dk2 shown2.<br><br>/* 4) Other-text consistency for code 9 (Other) */<br>temporary.<br>sel if ( ( (shown2 = 1 and dk2 = 0) and ( (B4dx2_9 > 0 and (miss(B4dx2_9_other) or B4dx2_9_other = \"\")) ) ) or ( (B4dx2_9 = 0 or miss(B4dx2_9)) and (not miss(B4dx2_9_other) and B4dx2_9_other <> \"\") ) ).<br>list respid B4dx2_9 B4dx2_9_other.<br>
```

```

* ============================================================.
* Question ID: B4dx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4dx3",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4dx3 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6236",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B4dx3','B4dDKx3');\n\nif(!QuestionErrors() && f('B4dDKx3').size() == 0)\n    validateB1c(\"S7_3\",\"B4dx3\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4dx3_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Product P + ADT + RT (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx3_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B4dx3 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4dx3.<br>/* Build DK and shown flags */<br>compute dk3 = 0.<br>if (B4dDKx3_99 = 1) dk3 = 1.<br>compute shown3 = 0.<br>if (S7_3 > 0) shown3 = 1.<br>exe.<br><br>/* 1) Validate numeric cells when shown and DK NOT selected (range 0..999). If not shown, cells must be missing */<br>temporary.<br>do repeat x = B4dx3_98 B4dx3_51 B4dx3_1 B4dx3_52 B4dx3_54 B4dx3_53 B4dx3_7 B4dx3_2 B4dx3_3 B4dx3_4 B4dx3_56 B4dx3_5 B4dx3_6 B4dx3_8 B4dx3_9.<br>    if (shown3 = 1 and dk3 = 0 and (miss(x) or ~range(x,0,999))) flag1 = 1.<br>    if (shown3 = 0 and ~miss(x)) flag1 = 2.<br>end repeat.<br>sel if flag1 > 0.<br>list respid flag1.<br>delete variables flag1.<br><br>/* 2) If DK selected but there are numeric answers -> flag */<br>temporary.<br>do repeat x = B4dx3_98 B4dx3_51 B4dx3_1 B4dx3_52 B4dx3_54 B4dx3_53 B4dx3_7 B4dx3_2 B4dx3_3 B4dx3_4 B4dx3_56 B4dx3_5 B4dx3_6 B4dx3_8 B4dx3_9.<br>    if (dk3 = 1 and ~miss(x)) flag2 = 1.<br>end repeat.<br>sel if flag2 > 0.<br>list respid flag2.<br>delete variables flag2.<br><br>/* 3) Sum check using validateB1c pattern: Sum of column must equal S7_3 when shown and DK not selected */<br>compute SumB4dx3 = sum(B4dx3_98, B4dx3_51, B4dx3_1, B4dx3_52, B4dx3_54, B4dx3_53, B4dx3_7, B4dx3_2, B4dx3_3, B4dx3_4, B4dx3_56, B4dx3_5, B4dx3_6, B4dx3_8, B4dx3_9).<br>temporary.<br>sel if shown3 = 1 and dk3 = 0 and ~miss(S7_3) and SumB4dx3 <> S7_3.<br>list respid SumB4dx3 S7_3 B4dx3_98 to B4dx3_9.<br>del var SumB4dx3 dk3 shown3.<br><br>/* 4) Other-text consistency for code 9 (Other) */<br>temporary.<br>sel if ( ( (shown3 = 1 and dk3 = 0) and ( (B4dx3_9 > 0 and (miss(B4dx3_9_other) or B4dx3_9_other = \"\")) ) ) or ( (B4dx3_9 = 0 or miss(B4dx3_9)) and (not miss(B4dx3_9_other) and B4dx3_9_other <> \"\") ) ).<br>list respid B4dx3_9 B4dx3_9_other.<br>
```

```

* ============================================================.
* Question ID: B4dx4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4dx4",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4dx4 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6238",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B4dx4','B4dDKx4');\n\nif(!QuestionErrors() && f('B4dDKx4').size() == 0)\n    validateB1c(\"S7_4\",\"B4dx4\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4dx4_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Product P + ADT + RT (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx4_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B4dx4 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4dx4.<br>/* Build DK and shown flags */<br>compute dk4 = 0.<br>if (B4dDKx4_99 = 1) dk4 = 1.<br>compute shown4 = 0.<br>if (S7_4 > 0) shown4 = 1.<br>exe.<br><br>/* 1) Validate numeric cells when shown and DK NOT selected (range 0..999). If not shown, cells must be missing */<br>temporary.<br>do repeat x = B4dx4_98 B4dx4_51 B4dx4_1 B4dx4_52 B4dx4_54 B4dx4_53 B4dx4_7 B4dx4_2 B4dx4_3 B4dx4_4 B4dx4_56 B4dx4_5 B4dx4_6 B4dx4_8 B4dx4_9.<br>    if (shown4 = 1 and dk4 = 0 and (miss(x) or ~range(x,0,999))) flag1 = 1.<br>    if (shown4 = 0 and ~miss(x)) flag1 = 2.<br>end repeat.<br>sel if flag1 > 0.<br>list respid flag1.<br>delete variables flag1.<br><br>/* 2) If DK selected but there are numeric answers -> flag */<br>temporary.<br>do repeat x = B4dx4_98 B4dx4_51 B4dx4_1 B4dx4_52 B4dx4_54 B4dx4_53 B4dx4_7 B4dx4_2 B4dx4_3 B4dx4_4 B4dx4_56 B4dx4_5 B4dx4_6 B4dx4_8 B4dx4_9.<br>    if (dk4 = 1 and ~miss(x)) flag2 = 1.<br>end repeat.<br>sel if flag2 > 0.<br>list respid flag2.<br>delete variables flag2.<br><br>/* 3) Sum check using validateB1c pattern: Sum of column must equal S7_4 when shown and DK not selected */<br>compute SumB4dx4 = sum(B4dx4_98, B4dx4_51, B4dx4_1, B4dx4_52, B4dx4_54, B4dx4_53, B4dx4_7, B4dx4_2, B4dx4_3, B4dx4_4, B4dx4_56, B4dx4_5, B4dx4_6, B4dx4_8, B4dx4_9).<br>temporary.<br>sel if shown4 = 1 and dk4 = 0 and ~miss(S7_4) and SumB4dx4 <> S7_4.<br>list respid SumB4dx4 S7_4 B4dx4_98 to B4dx4_9.<br>del var SumB4dx4 dk4 shown4.<br><br>/* 4) Other-text consistency for code 9 (Other) */<br>temporary.<br>sel if ( ( (shown4 = 1 and dk4 = 0) and ( (B4dx4_9 > 0 and (miss(B4dx4_9_other) or B4dx4_9_other = \"\")) ) ) or ( (B4dx4_9 = 0 or miss(B4dx4_9)) and (not miss(B4dx4_9_other) and B4dx4_9_other <> \"\") ) ).<br>list respid B4dx4_9 B4dx4_9_other.<br>
```

```

* ============================================================.
* Question ID: B4dx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4dx5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4dx5 - ^f('qTitle')['B1cCols2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6240",
*     "AutoSum": "true",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "CheckDK3D('B4dx5','B4dDKx5');\n\nif(!QuestionErrors() && f('B4dDKx5').size() == 0)\n    validateB1c(\"S7_5\",\"B4dx5\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4dx5_98",
*       "answers": [
*         {
*           "Answer Code": "98",
*           "Answer Label": "Product P + ADT + RT (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_51",
*       "answers": [
*         {
*           "Answer Code": "51",
*           "Answer Label": "Radiation therapy (RT) alone (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Androgen Deprivation Therapy (ADT) alone (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_52",
*       "answers": [
*         {
*           "Answer Code": "52",
*           "Answer Label": "Radiation therapy (RT) + ADT (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_54",
*       "answers": [
*         {
*           "Answer Code": "54",
*           "Answer Label": "Other androgen receptor pathway inhibitors (ARPis) such as apalutamide, darolutamide, enzalutamide  +/- ADT +/- Chemotherapy (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_53",
*       "answers": [
*         {
*           "Answer Code": "53",
*           "Answer Label": "Radiation therapy (RT) + ADT + Abiraterone (Zytiga or generic) (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_7",
*       "answers": [
*         {
*           "Answer Code": "7",
*           "Answer Label": "Abiraterone (Zytiga or generic) +/- ADT +/- Chemotherapy (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Xtandi (enzalutamide) monotherapy (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Xtandi (enzalutamide) +/- ADT (+/- Chemotherapy) (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "^isAU() ? \"Erlyand (apalutamide)\":\"Erleada (apalutamide)\"^ +/- ADT (+/- Chemotherapy) (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_56",
*       "answers": [
*         {
*           "Answer Code": "56",
*           "Answer Label": "Nubeqa (darolutamide) +/- ADT (+/- Chemotherapy)　 (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_5",
*       "answers": [
*         {
*           "Answer Code": "5",
*           "Answer Label": "Nubeqa (darolutamide) + ADT  (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_6",
*       "answers": [
*         {
*           "Answer Code": "6",
*           "Answer Label": "Nubeqa (darolutamide) + ADT + Chemotherapy (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_8",
*       "answers": [
*         {
*           "Answer Code": "8",
*           "Answer Label": "Chemotherapy +/- ADT (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4dx5_9",
*       "answers": [
*         {
*           "Answer Code": "9",
*           "Answer Label": "Other (B4dx5 - ^f('qTitle')['B1cCols2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4dx5.<br>/* Build DK and shown flags */<br>compute dk5 = 0.<br>if (B4dDKx5_99 = 1) dk5 = 1.<br>compute shown5 = 0.<br>if (S7_5 > 0) shown5 = 1.<br>exe.<br><br>/* 1) Validate numeric cells when shown and DK NOT selected (range 0..999). If not shown, cells must be missing */<br>temporary.<br>do repeat x = B4dx5_98 B4dx5_51 B4dx5_1 B4dx5_52 B4dx5_54 B4dx5_53 B4dx5_7 B4dx5_2 B4dx5_3 B4dx5_4 B4dx5_56 B4dx5_5 B4dx5_6 B4dx5_8 B4dx5_9.<br>    if (shown5 = 1 and dk5 = 0 and (miss(x) or ~range(x,0,999))) flag1 = 1.<br>    if (shown5 = 0 and ~miss(x)) flag1 = 2.<br>end repeat.<br>sel if flag1 > 0.<br>list respid flag1.<br>delete variables flag1.<br><br>/* 2) If DK selected but there are numeric answers -> flag */<br>temporary.<br>do repeat x = B4dx5_98 B4dx5_51 B4dx5_1 B4dx5_52 B4dx5_54 B4dx5_53 B4dx5_7 B4dx5_2 B4dx5_3 B4dx5_4 B4dx5_56 B4dx5_5 B4dx5_6 B4dx5_8 B4dx5_9.<br>    if (dk5 = 1 and ~miss(x)) flag2 = 1.<br>end repeat.<br>sel if flag2 > 0.<br>list respid flag2.<br>delete variables flag2.<br><br>/* 3) Sum check using validateB1c pattern: Sum of column must equal S7_5 when shown and DK not selected */<br>compute SumB4dx5 = sum(B4dx5_98, B4dx5_51, B4dx5_1, B4dx5_52, B4dx5_54, B4dx5_53, B4dx5_7, B4dx5_2, B4dx5_3, B4dx5_4, B4dx5_56, B4dx5_5, B4dx5_6, B4dx5_8, B4dx5_9).<br>temporary.<br>sel if shown5 = 1 and dk5 = 0 and ~miss(S7_5) and SumB4dx5 <> S7_5.<br>list respid SumB4dx5 S7_5 B4dx5_98 to B4dx5_9.<br>del var SumB4dx5 dk5 shown5.<br><br>/* 4) Other-text consistency for code 9 (Other) */<br>temporary.<br>sel if ( ( (shown5 = 1 and dk5 = 0) and ( (B4dx5_9 > 0 and (miss(B4dx5_9_other) or B4dx5_9_other = \"\")) ) ) or ( (B4dx5_9 = 0 or miss(B4dx5_9)) and (not miss(B4dx5_9_other) and B4dx5_9_other <> \"\") ) ).<br>list respid B4dx5_9 B4dx5_9_other.<br>
```

```

* ============================================================.
* Question ID: B4dDKx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4dDKx1",
*   "Question Label": "My prescribing wouldn’t change at all (B4dDKx1)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B4dDKx1_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "EntityId": "6243"
*   }
* }
* -----------------------------------------------------------

tit B4dDKx1.<br>/* Validate DK checkbox for column 1 vs column visibility S7_1 */<br>compute shown1 = 0.<br>if (S7_1 > 0) shown1 = 1.<br>exe.<br>temporary.<br>/* If column shown, DK must be present (0/1 or 1); if not shown, DK should be missing */<br>sel if (shown1 = 1 and (miss(B4dDKx1_99) or ~range(B4dDKx1_99,0,1))) or (shown1 = 0 and ~miss(B4dDKx1_99)).<br>list respid shown1 B4dDKx1_99.<br>del var shown1.<br>
```

```

* ============================================================.
* Question ID: B4dDKx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4dDKx2",
*   "Question Label": "My prescribing wouldn’t change at all (B4dDKx2)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B4dDKx2_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "EntityId": "6245"
*   }
* }
* -----------------------------------------------------------

tit B4dDKx2.<br>/* Validate DK checkbox for column 2 vs column visibility S7_2 */<br>compute shown2 = 0.<br>if (S7_2 > 0) shown2 = 1.<br>exe.<br>temporary.<br>sel if (shown2 = 1 and (miss(B4dDKx2_99) or ~range(B4dDKx2_99,0,1))) or (shown2 = 0 and ~miss(B4dDKx2_99)).<br>list respid shown2 B4dDKx2_99.<br>del var shown2.<br>
```

```

* ============================================================.
* Question ID: B4dDKx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4dDKx3",
*   "Question Label": "My prescribing wouldn’t change at all (B4dDKx3)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B4dDKx3_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "EntityId": "6247"
*   }
* }
* -----------------------------------------------------------

tit B4dDKx3.<br>/* Validate DK checkbox for column 3 vs column visibility S7_3 */<br>compute shown3 = 0.<br>if (S7_3 > 0) shown3 = 1.<br>exe.<br>temporary.<br>sel if (shown3 = 1 and (miss(B4dDKx3_99) or ~range(B4dDKx3_99,0,1))) or (shown3 = 0 and ~miss(B4dDKx3_99)).<br>list respid shown3 B4dDKx3_99.<br>del var shown3.<br>
```

```

* ============================================================.
* Question ID: B4dDKx4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4dDKx4",
*   "Question Label": "My prescribing wouldn’t change at all (B4dDKx4)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B4dDKx4_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "EntityId": "6249"
*   }
* }
* -----------------------------------------------------------

tit B4dDKx4.<br>/* Validate DK checkbox for column 4 vs column visibility S7_4 */<br>compute shown4 = 0.<br>if (S7_4 > 0) shown4 = 1.<br>exe.<br>temporary.<br>sel if (shown4 = 1 and (miss(B4dDKx4_99) or ~range(B4dDKx4_99,0,1))) or (shown4 = 0 and ~miss(B4dDKx4_99)).<br>list respid shown4 B4dDKx4_99.<br>del var shown4.<br>
```

* ============================================================.
* Question ID: B4bc
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4bc",
*   "Question Label": "B4bc - How long will it take you to start prescribing PRODUCT P to your high risk localized PCa patients?   ^popup('Scnr4link')^ I would prescribe it... ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "GreaterThan('B4ba',4).size() > 0"
*   ],
*   "conditions": [],
*   "Variable ID": "B4bc",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority and available for me to prescribe"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority, available for me to prescribe and reimbursed for 6 months or less"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 6 months"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 12 months"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only if the product has been recommended by treatment guidelines"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only after my peers have used it and recommended it"
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "EntityId": "6229"
*   }
* }
* -----------------------------------------------------------

tit B4bc.<br>* Validate B4bc only when entry condition GreaterThan('B4ba',4).size() > 0 is true (i.e. B4ba > 4).<br>* If entry condition true => B4bc must be non-missing and in range 1..6.<br>* If entry condition false (including missing B4ba) => B4bc must be missing (respondent should not have answered).<br>temporary.<br>sel if ( (B4ba > 4 and (miss(B4bc) or ~range(B4bc,1,6))) or ((miss(B4ba) or B4ba <= 4) and ~miss(B4bc)) ).<br>list respid, B4ba B4bc.<br>

* ============================================================.
* Question ID: B4dDKx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4dDKx5",
*   "Question Label": "My prescribing wouldn’t change at all (B4dDKx5)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B4dDKx5_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "EntityId": "6251"
*   }
* }
* -----------------------------------------------------------

tit B4dDKx5.<br>temporary.<br>sel if miss(B4dDKx5_99) or ~range(B4dDKx5_99,0,1).<br>list respid B4dDKx5_99.<br>

* ============================================================.
* Question ID: B4f
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4f",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "Carousel": "false",
*     "ValidationCode": "if( GetNum('B4f_2') < GetNum('B4ba_1') )\n  {errorMsg(\"B4ferr1\")}",
*     "EntityId": "6257",
*     "Slider": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4f_1",
*       "Question Label": "^popup(\"ProdPlink,ProdP\")^ (B4f - Imagine that PRODUCT PU is available and approved for you to prescribe, how likely would you now be to personally prescribe PRODUCT PU to your high risk localized PCa patients?  ^popup('Scnr4Blink')^   If you would like to view the complete product profiles, please click over each product name below.)",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4f_2",
*       "Question Label": "^popup(\"ProdPUlink,ProdPU\")^ (B4f - Imagine that PRODUCT PU is available and approved for you to prescribe, how likely would you now be to personally prescribe PRODUCT PU to your high risk localized PCa patients?  ^popup('Scnr4Blink')^   If you would like to view the complete product profiles, please click over each product name below.)",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4f - slider/grid checks and relational validation.<br>/* per-cell range/missing checks (0-10 sliders) */<br>do repeat v = B4f_1 B4f_2.<br>  temporary.<br>  sel if miss(v) or ~range(v,0,10).<br>  list respid v.<br>end repeat.<br>/* relational validation: B4f_2 should NOT be less than B4ba_1 */<br>temporary.<br>sel if (not miss(B4f_2) and not miss(B4ba_1) and B4f_2 < B4ba_1).<br>list respid B4f_2 B4ba_1.<br>

* ============================================================.
* Question ID: B4i
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4i",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "Carousel": "false",
*     "ValidationCode": "if( GetNum('B4i_2') > GetNum('B4ba_1') )\n  {errorMsg(\"B4ierr1\")}",
*     "EntityId": "6299",
*     "Slider": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4i_1",
*       "Question Label": "^popup(\"ProdPlink,ProdP\")^ (B4i - Imagine that PRODUCT PC is available and approved for you to prescribe, how likely would you now be to personally prescribe PRODUCT PC to your high risk localized PCa patients?  If you would like to view the complete product profiles, please click over each product name below.)",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4i_2",
*       "Question Label": "^popup(\"ProdPClink,ProdPC\")^ (B4i - Imagine that PRODUCT PC is available and approved for you to prescribe, how likely would you now be to personally prescribe PRODUCT PC to your high risk localized PCa patients?  If you would like to view the complete product profiles, please click over each product name below.)",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4i - slider/grid checks and relational validation.<br>/* per-cell range/missing checks (0-10 sliders) */<br>do repeat v = B4i_1 B4i_2.<br>  temporary.<br>  sel if miss(v) or ~range(v,0,10).<br>  list respid v.<br>end repeat.<br>/* relational validation: B4i_2 should NOT be greater than B4ba_1 */<br>temporary.<br>sel if (not miss(B4i_2) and not miss(B4ba_1) and B4i_2 > B4ba_1).<br>list respid B4i_2 B4ba_1.<br>

* ============================================================.
* Question ID: B4g
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4g",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "GetNum('S7_1') > 0"
*   ],
*   "conditions": [],
*   "Question Label": "B4g - ^f('qTitle')['B1cH1'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6269",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "RequireCheck(CurrentForm())\n  \n\n  if( (GetNum('B4g_2') > GetNum('S7_1')) || (GetNum('B4g_2') < GetNum('B4dx1_98')) )\n    {errorMsg(\"B4jerr1\")}",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4g_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "^popup(\"ProdPlink,ProdP\")^ (B4g - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4g_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "^popup(\"ProdPUlink,ProdPU\")^ (B4g - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

TIT B4g.<br>
<br>
* Entry-condition: question in-scope when S7_1>0 (use explicit missing check).<br>
<br>
* B4g_1: required when S7_1>0, otherwise should be missing. Range 0..999 when present.<br>
TEMPORARY.<br>
SEL IF ( (NOT MISSING(S7_1) AND S7_1 > 0 AND ( MISSING(B4g_1) OR B4g_1 < 0 OR B4g_1 > 999 )) OR ((MISSING(S7_1) OR S7_1 <= 0) AND NOT MISSING(B4g_1)) ).<br>
LIST respid B4g_1 S7_1.<br>
<br>
* B4g_2: required when S7_1>0, otherwise should be missing. Range 0..999 when present.<br>
TEMPORARY.<br>
SEL IF ( (NOT MISSING(S7_1) AND S7_1 > 0 AND ( MISSING(B4g_2) OR B4g_2 < 0 OR B4g_2 > 999 )) OR ((MISSING(S7_1) OR S7_1 <= 0) AND NOT MISSING(B4g_2)) ).<br>
LIST respid B4g_2 S7_1.<br>
<br>
* Relational validation for B4g_2 vs S7_1 and B4dx1_98 (mirror ValidationCode):<br>
TEMPORARY.<br>
SEL IF ( NOT MISSING(B4g_2) AND NOT MISSING(S7_1) AND NOT MISSING(B4dx1_98) AND ( B4g_2 > S7_1 OR B4g_2 < B4dx1_98 ) ).<br>
LIST respid B4g_2 S7_1 B4dx1_98.<br>
<br>
* End B4g checks.<br>

* ============================================================.
* Question ID: B4j
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4j",
*   "question_type": "Multi",
*   "entry_conditions": [
*     "GetNum('S7_1') > 0 && GetNum('B4dx1_98')>0"
*   ],
*   "conditions": [],
*   "Question Label": "B4j - ^f('qTitle')['B1cH1'].label()^",
*   "question_attributes": {
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6326",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "RequireCheck(CurrentForm())\n  \n  if( (GetNum('B4j_2') > GetNum('B4dx1_98')) )\n    {errorMsg(\"B4jerr2\")}",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "999",
*     "Precision": "3"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4j_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "^popup(\"ProdPlink,ProdP\")^ (B4j - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4j_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "^popup(\"ProdPClink,ProdPC\")^ (B4j - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

TIT B4j.<br>
<br>
* Entry condition: in-scope when S7_1>0 AND B4dx1_98>0 (use explicit missing checks).<br>
<br>
* B4j_1: required when in-scope; otherwise should be missing. Range 0..999 when present.<br>
TEMPORARY.<br>
SEL IF ( (NOT MISSING(S7_1) AND S7_1 > 0 AND NOT MISSING(B4dx1_98) AND B4dx1_98 > 0 AND ( MISSING(B4j_1) OR B4j_1 < 0 OR B4j_1 > 999 )) OR ( (MISSING(S7_1) OR S7_1 <= 0 OR MISSING(B4dx1_98) OR B4dx1_98 <= 0) AND NOT MISSING(B4j_1)) ).<br>
LIST respid B4j_1 S7_1 B4dx1_98.<br>
<br>
* B4j_2: required when in-scope; otherwise should be missing. Range 0..999 when present.<br>
TEMPORARY.<br>
SEL IF ( (NOT MISSING(S7_1) AND S7_1 > 0 AND NOT MISSING(B4dx1_98) AND B4dx1_98 > 0 AND ( MISSING(B4j_2) OR B4j_2 < 0 OR B4j_2 > 999 )) OR ( (MISSING(S7_1) OR S7_1 <= 0 OR MISSING(B4dx1_98) OR B4dx1_98 <= 0) AND NOT MISSING(B4j_2)) ).<br>
LIST respid B4j_2 S7_1 B4dx1_98.<br>
<br>
* Relational validation: B4j_2 must not exceed B4dx1_98.<br>
TEMPORARY.<br>
SEL IF ( NOT MISSING(B4j_2) AND NOT MISSING(B4dx1_98) AND B4j_2 > B4dx1_98 ).<br>
LIST respid B4j_2 B4dx1_98.<br>
<br>
* End B4j checks.<br>

* ============================================================.
* Question ID: B4k
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4k",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "Carousel": "false",
*     "EntityId": "6338",
*     "Slider": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4k_1",
*       "Question Label": "Product P (B4k - Now let’s go back to the original Product P. Imagine that, hypothetically, this clinical data belonged to an androgen receptor pathway inhibitor brand that you are already familiar with, XTANDI. In that case, how likely would you be to personally prescribe it?    ^popup('Scnr4link')^  ^f('qTitle')['B4k'].label()^ )",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4k_2",
*       "Question Label": "Product P = XTANDI (B4k - Now let’s go back to the original Product P. Imagine that, hypothetically, this clinical data belonged to an androgen receptor pathway inhibitor brand that you are already familiar with, XTANDI. In that case, how likely would you be to personally prescribe it?    ^popup('Scnr4link')^  ^f('qTitle')['B4k'].label()^ )",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

TIT B4k.<br>
<br>
* Slider/grid values expected 0..10 for each sub-question. Initialize flag before DO REPEAT to avoid reinitialisation per iteration.<br>
COMPUTE flag = 0.<br>
DO REPEAT x = B4k_1 B4k_2.<br>
  IF ( MISSING(x) OR x < 0 OR x > 10 ) flag = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SEL IF flag > 0.<br>
LIST respid flag B4k_1 B4k_2.<br>
DELETE VARIABLES flag.<br>
<br>
* Alternatively, per-variable temporary checks (useful for pinpointing which cell):<br>
TEMPORARY.<br>
SEL IF MISSING(B4k_1) OR B4k_1 < 0 OR B4k_1 > 10.<br>
LIST respid B4k_1.<br>
TEMPORARY.<br>
SEL IF MISSING(B4k_2) OR B4k_2 < 0 OR B4k_2 > 10.<br>
LIST respid B4k_2.<br>
<br>
* End B4k checks.<br>

* ============================================================.
* Question ID: B4lx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4lx1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4lx1 - ^f('qTitle')['B1cH1'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6380",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_1\",\"B4lx1_4\",\"hDUMB4lCol1_2\",\"B4lDKx1\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4lx1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product P + ADT + RT  (B4lx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4lx1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "XTANDI (pre-product P information) (B4lx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4lx1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product P and XTANDI combined (B4lx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4lx1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW XTANDI USE(Post-product P information) (B4lx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

TIT B4lx1.<br>
<br>
* Column visibility: column 1 is visible when S7_1>0. Use explicit missing checks to replicate MaskSec2Cols behaviour.<br>
COMPUTE mask_B4lx1 = (NOT MISSING(S7_1) AND S7_1 > 0).<br>
EXECUTE.<br>
<br>
* Range checks for each numeric cell (only validate range when a value is present). Valid range 0..9999.<br>
COMPUTE flag = 0.<br>
DO REPEAT x = B4lx1_1 TO B4lx1_4.<br>
  IF (NOT MISSING(x) AND (x < 0 OR x > 9999)) flag = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SEL IF flag > 0.<br>
LIST respid B4lx1_1 TO B4lx1_4 S7_1.<br>
DELETE VARIABLES flag.<br>
<br>
* DK binary (B4lDKx1_5) checks when column visible; expect 0/1.<br>
TEMPORARY.<br>
SEL IF (mask_B4lx1 = 1 AND ( MISSING(B4lDKx1_5) OR B4lDKx1_5 < 0 OR B4lDKx1_5 > 1 ) ).<br>
LIST respid B4lDKx1_5 S7_1.<br>
<br>
* If column not visible, the numeric cells and DK should be empty (two-way consistency).<br>
TEMPORARY.<br>
SEL IF (mask_B4lx1 = 0 AND ( NOT MISSING(B4lx1_1) OR NOT MISSING(B4lx1_2) OR NOT MISSING(B4lx1_3) OR NOT MISSING(B4lx1_4) OR NOT MISSING(B4lDKx1_5) ) ).<br>
LIST respid B4lx1_1 TO B4lx1_4 B4lDKx1_5 S7_1.<br>
<br>
* Require: when column visible, at least one numeric value > 0 OR DK selected (B4lDKx1_5 = 1). Use SUM() which ignores system-missings.<br>
COMPUTE SumB4lx1 = SUM(B4lx1_1, B4lx1_2, B4lx1_3, B4lx1_4).<br>
TEMPORARY.<br>
SEL IF (mask_B4lx1 = 1 AND ( (MISSING(B4lDKx1_5) OR B4lDKx1_5 <> 1) AND SumB4lx1 <= 0 ) ).<br>
LIST respid B4lx1_1 TO B4lx1_4 B4lDKx1_5 SumB4lx1 S7_1.<br>
<br>
* Mutual exclusivity: when column visible, cannot have numeric allocation >0 AND DK=1 at same time.<br>
TEMPORARY.<br>
SEL IF (mask_B4lx1 = 1 AND SumB4lx1 > 0 AND B4lDKx1_5 = 1 ).<br>
LIST respid B4lx1_1 TO B4lx1_4 B4lDKx1_5 SumB4lx1 S7_1.<br>
<br>
* Numeric upper bound relative to S7_1: B4lx1_4 should not exceed S7_1 when both present.<br>
TEMPORARY.<br>
SEL IF (mask_B4lx1 = 1 AND NOT MISSING(B4lx1_4) AND NOT MISSING(S7_1) AND B4lx1_4 > S7_1 ).<br>
LIST respid B4lx1_4 S7_1 SumB4lx1 B4lDKx1_5.<br>
<br>
* Clean up helper variables.<br>
DELETE VARIABLES SumB4lx1 mask_B4lx1.<br>
<br>
* End B4lx1 checks.<br>

* ============================================================.
* Question ID: B4lx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4lx2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4lx2 - ^f('qTitle')['B1cH2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6381",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_2\",\"B4lx2_4\",\"hDUMB4lCol2_2\",\"B4lDKx2\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4lx2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product P + ADT + RT  (B4lx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4lx2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "XTANDI (pre-product P information) (B4lx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4lx2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product P and XTANDI combined (B4lx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4lx2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW XTANDI USE(Post-product P information) (B4lx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

TIT B4lx2.<br>
<br>
* Column visibility: column 2 is visible when S7_2>0.<br>
COMPUTE mask_B4lx2 = (NOT MISSING(S7_2) AND S7_2 > 0).<br>
EXECUTE.<br>
<br>
* Range checks for each numeric cell (validate range only when present). Valid range 0..9999.<br>
COMPUTE flag = 0.<br>
DO REPEAT x = B4lx2_1 TO B4lx2_4.<br>
  IF (NOT MISSING(x) AND (x < 0 OR x > 9999)) flag = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SEL IF flag > 0.<br>
LIST respid B4lx2_1 TO B4lx2_4 S7_2.<br>
DELETE VARIABLES flag.<br>
<br>
* DK binary check for B4lDKx2_5 when visible; expect 0/1.<br>
TEMPORARY.<br>
SEL IF (mask_B4lx2 = 1 AND ( MISSING(B4lDKx2_5) OR B4lDKx2_5 < 0 OR B4lDKx2_5 > 1 ) ).<br>
LIST respid B4lDKx2_5 S7_2.<br>
<br>
* If column not visible, numeric cells and DK should be empty (two-way consistency).<br>
TEMPORARY.<br>
SEL IF (mask_B4lx2 = 0 AND ( NOT MISSING(B4lx2_1) OR NOT MISSING(B4lx2_2) OR NOT MISSING(B4lx2_3) OR NOT MISSING(B4lx2_4) OR NOT MISSING(B4lDKx2_5) ) ).<br>
LIST respid B4lx2_1 TO B4lx2_4 B4lDKx2_5 S7_2.<br>
<br>
* Require: when visible, at least one numeric >0 OR DK selected.<br>
COMPUTE SumB4lx2 = SUM(B4lx2_1, B4lx2_2, B4lx2_3, B4lx2_4).<br>
TEMPORARY.<br>
SEL IF (mask_B4lx2 = 1 AND ( (MISSING(B4lDKx2_5) OR B4lDKx2_5 <> 1) AND SumB4lx2 <= 0 ) ).<br>
LIST respid B4lx2_1 TO B4lx2_4 B4lDKx2_5 SumB4lx2 S7_2.<br>
<br>
* Mutual exclusivity: numeric >0 AND DK=1 both present is invalid.<br>
TEMPORARY.<br>
SEL IF (mask_B4lx2 = 1 AND SumB4lx2 > 0 AND B4lDKx2_5 = 1 ).<br>
LIST respid B4lx2_1 TO B4lx2_4 B4lDKx2_5 SumB4lx2 S7_2.<br>
<br>
* Numeric upper bound relative to S7_2: B4lx2_4 should not exceed S7_2 when both present.<br>
TEMPORARY.<br>
SEL IF (mask_B4lx2 = 1 AND NOT MISSING(B4lx2_4) AND NOT MISSING(S7_2) AND B4lx2_4 > S7_2 ).<br>
LIST respid B4lx2_4 S7_2 SumB4lx2 B4lDKx2_5.<br>
<br>
DELETE VARIABLES SumB4lx2 mask_B4lx2.<br>
<br>
* End B4lx2 checks.<br>

* ============================================================.
* Question ID: B4lx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4lx3",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4lx3 - ^f('qTitle')['B1cH3'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6382",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_3\",\"B4lx3_4\",\"hDUMB4lCol3_2\",\"B4lDKx3\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4lx3_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product P + ADT + RT  (B4lx3 - ^f('qTitle')['B1cH3'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4lx3_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "XTANDI (pre-product P information) (B4lx3 - ^f('qTitle')['B1cH3'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4lx3_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product P and XTANDI combined (B4lx3 - ^f('qTitle')['B1cH3'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4lx3_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW XTANDI USE(Post-product P information) (B4lx3 - ^f('qTitle')['B1cH3'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

TIT B4lx3.<br>
<br>
* Column visibility: column 3 is visible when S7_3>0.<br>
COMPUTE mask_B4lx3 = (NOT MISSING(S7_3) AND S7_3 > 0).<br>
EXECUTE.<br>
<br>
* Range checks for present numeric cells (valid 0..9999).<br>
COMPUTE flag = 0.<br>
DO REPEAT x = B4lx3_1 TO B4lx3_4.<br>
  IF (NOT MISSING(x) AND (x < 0 OR x > 9999)) flag = 1.<br>
END REPEAT.<br>
TEMPORARY.<br>
SEL IF flag > 0.<br>
LIST respid B4lx3_1 TO B4lx3_4 S7_3.<br>
DELETE VARIABLES flag.<br>
<br>
* DK binary check for B4lDKx3_5 when visible; expect 0/1.<br>
TEMPORARY.<br>
SEL IF (mask_B4lx3 = 1 AND ( MISSING(B4lDKx3_5) OR B4lDKx3_5 < 0 OR B4lDKx3_5 > 1 ) ).<br>
LIST respid B4lDKx3_5 S7_3.<br>
<br>
* If column not visible then numeric cells and DK should be empty (two-way consistency).<br>
TEMPORARY.<br>
SEL IF (mask_B4lx3 = 0 AND ( NOT MISSING(B4lx3_1) OR NOT MISSING(B4lx3_2) OR NOT MISSING(B4lx3_3) OR NOT MISSING(B4lx3_4) OR NOT MISSING(B4lDKx3_5) ) ).<br>
LIST respid B4lx3_1 TO B4lx3_4 B4lDKx3_5 S7_3.<br>
<br>
* Require: when visible, at least one numeric >0 OR DK selected.<br>
COMPUTE SumB4lx3 = SUM(B4lx3_1, B4lx3_2, B4lx3_3, B4lx3_4).<br>
TEMPORARY.<br>
SEL IF (mask_B4lx3 = 1 AND ( (MISSING(B4lDKx3_5) OR B4lDKx3_5 <> 1) AND SumB4lx3 <= 0 ) ).<br>
LIST respid B4lx3_1 TO B4lx3_4 B4lDKx3_5 SumB4lx3 S7_3.<br>
<br>
* Mutual exclusivity when visible: numeric >0 AND DK=1 invalid.<br>
TEMPORARY.<br>
SEL IF (mask_B4lx3 = 1 AND SumB4lx3 > 0 AND B4lDKx3_5 = 1 ).<br>
LIST respid B4lx3_1 TO B4lx3_4 B4lDKx3_5 SumB4lx3 S7_3.<br>
<br>
* Numeric upper bound relative to S7_3: B4lx3_4 should not exceed S7_3 when both present.<br>
TEMPORARY.<br>
SEL IF (mask_B4lx3 = 1 AND NOT MISSING(B4lx3_4) AND NOT MISSING(S7_3) AND B4lx3_4 > S7_3 ).<br>
LIST respid B4lx3_4 S7_3 SumB4lx3 B4lDKx3_5.<br>
<br>
DELETE VARIABLES SumB4lx3 mask_B4lx3.<br>
<br>
* End B4lx3 checks.<br>

* ============================================================.
* Question ID: B4lDKx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4lDKx1",
*   "Question Label": "I don’t expect any change on my XTANDI use (B4lDKx1)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B4lDKx1_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "EntityId": "6386"
*   }
* }
* -----------------------------------------------------------

* TIT B4lDKx1. <br>
* Mask-aware DK/None validation for B4lDKx1_5 (column 1 controlled by MaskSec2Cols -> S7_1 > 0). <br>
TEMPORARY. <br>
SELECT IF ( NOT MISSING(S7_1) AND S7_1 > 0 AND ( MISSING(B4lDKx1_5) OR B4lDKx1_5 < 0 OR B4lDKx1_5 > 1 ) ). <br>
LIST respid B4lDKx1_5 S7_1. <br>
<br>
* Ensure the DK variable is empty when the column is not visible (S7_1 missing or <= 0). <br>
TEMPORARY. <br>
SELECT IF ( (MISSING(S7_1) OR S7_1 <= 0) AND ( NOT MISSING(B4lDKx1_5) ) ). <br>
LIST respid B4lDKx1_5 S7_1. <br>

* ============================================================.
* Question ID: B4lDKx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4lDKx2",
*   "Question Label": "I don’t expect any change on my XTANDI use (B4lDKx2)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B4lDKx2_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "EntityId": "6387"
*   }
* }
* -----------------------------------------------------------

tit B4lDKx2.<br>compute cnt = S7_2.<br>exe.<br>if cnt>0 and (miss(B4lDKx2_5) or ~range(B4lDKx2_5,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B4lDKx2_5) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag B4lDKx2_5.<br>delete variables flag cnt.

* ============================================================.
* Question ID: B4lDKx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4lDKx3",
*   "Question Label": "I don’t expect any change on my XTANDI use (B4lDKx3)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B4lDKx3_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "EntityId": "6388"
*   }
* }
* -----------------------------------------------------------

tit B4lDKx3.<br>compute cnt = S7_3.<br>exe.<br>if cnt>0 and (miss(B4lDKx3_5) or ~range(B4lDKx3_5,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B4lDKx3_5) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag B4lDKx3_5.<br>delete variables flag cnt.

* ============================================================.
* Question ID: B4m
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4m",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "Carousel": "false",
*     "EntityId": "6341",
*     "Slider": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4m_1",
*       "Question Label": "Product P (B4m - Now let’s go back to the original Product P. Imagine that, hypothetically, this clinical data belonged to an androgen receptor pathway inhibitor brand that you are already familiar with, ^isAU()? 'ERLYAND' : 'ERLEADA'^. In that case, how likely would you be to personally prescribe it?    ^popup('Scnr4link')^  ^f('qTitle')['B4k'].label()^)",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4m_2",
*       "Question Label": "Product P = ^isAU()? \"ERLYAND\" : \"ERLEADA\"^ (B4m - Now let’s go back to the original Product P. Imagine that, hypothetically, this clinical data belonged to an androgen receptor pathway inhibitor brand that you are already familiar with, ^isAU()? 'ERLYAND' : 'ERLEADA'^. In that case, how likely would you be to personally prescribe it?    ^popup('Scnr4link')^  ^f('qTitle')['B4k'].label()^)",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)"
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4m.<br>do repeat v = B4m_1 to B4m_2.<br>  temporary.<br>  sel if miss(v) or ~range(v,0,10).<br>  list respid v.<br>end repeat.<br>

* ============================================================.
* Question ID: B4nx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4nx1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4nx1 - ^f('qTitle')['B1cH1'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6402",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_1\",\"B4nx1_4\",\"hDUMB4nCol1_2\",\"B4nDKx1\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4nx1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product P + ADT + RT (B4nx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4nx1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ (pre-product P information) (B4nx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4nx1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product P and ^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ combined (B4nx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4nx1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW ^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ USE(Post-product P information) (B4nx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4nx1.<br>* Validate DK flag presence/absence for column 1 (proxy: S7_1).<br>compute cnt = S7_1.<br>exe.<br>if cnt>0 and (miss(B4nDKx1_5) or ~range(B4nDKx1_5,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B4nDKx1_5) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag B4nDKx1_5 cnt.<br>delete variables flag cnt.<br><br>* Validate numeric cells for column 1 (must be present when column visible and DK not checked; must be missing otherwise).<br>do repeat y = B4nx1_1 to B4nx1_4.<br>  if (B4nDKx1_5=0 and S7_1>0 and (miss(y) or ~range(y,0,9999))) flg=1.<br>  if ((B4nDKx1_5=1 or miss(B4nDKx1_5) or S7_1=0) and ~miss(y)) flg=2.<br>end repeat.<br>temporary.<br>sel if flg>0.<br>list respid flg B4nx1_1 B4nx1_2 B4nx1_3 B4nx1_4 B4nDKx1_5 S7_1.<br>delete variables flg.

* ============================================================.
* Question ID: B4nx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4nx2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4nx2 - ^f('qTitle')['B1cH2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6403",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_2\",\"B4nx2_4\",\"hDUMB4nCol2_2\",\"B4nDKx2\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4nx2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product P + ADT + RT (B4nx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4nx2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ (pre-product P information) (B4nx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4nx2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product P and ^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ combined (B4nx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4nx2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW ^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ USE(Post-product P information) (B4nx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4nx2.<br>* Validate DK flag presence/absence for column 2 (proxy: S7_2).<br>compute cnt = S7_2.<br>exe.<br>if cnt>0 and (miss(B4nDKx2_5) or ~range(B4nDKx2_5,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B4nDKx2_5) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag B4nDKx2_5 cnt.<br>delete variables flag cnt.<br><br>* Validate numeric cells for column 2.<br>do repeat y = B4nx2_1 to B4nx2_4.<br>  if (B4nDKx2_5=0 and S7_2>0 and (miss(y) or ~range(y,0,9999))) flg=1.<br>  if ((B4nDKx2_5=1 or miss(B4nDKx2_5) or S7_2=0) and ~miss(y)) flg=2.<br>end repeat.<br>temporary.<br>sel if flg>0.<br>list respid flg B4nx2_1 B4nx2_2 B4nx2_3 B4nx2_4 B4nDKx2_5 S7_2.<br>delete variables flg.

* ============================================================.
* Question ID: B4nx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4nx3",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B4nx3 - ^f('qTitle')['B1cH3'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6404",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_3\",\"B4nx3_4\",\"hDUMB4nCol3_2\",\"B4nDKx3\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B4nx3_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product P + ADT + RT (B4nx3 - ^f('qTitle')['B1cH3'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4nx3_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ (pre-product P information) (B4nx3 - ^f('qTitle')['B1cH3'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4nx3_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product P and ^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ combined (B4nx3 - ^f('qTitle')['B1cH3'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B4nx3_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW ^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ USE(Post-product P information) (B4nx3 - ^f('qTitle')['B1cH3'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B4nx3.<br>* Validate DK flag presence/absence for column 3 (proxy: S7_3).<br>compute cnt = S7_3.<br>exe.<br>if cnt>0 and (miss(B4nDKx3_5) or ~range(B4nDKx3_5,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B4nDKx3_5) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag B4nDKx3_5 cnt.<br>delete variables flag cnt.<br><br>* Validate numeric cells for column 3.<br>do repeat y = B4nx3_1 to B4nx3_4.<br>  if (B4nDKx3_5=0 and S7_3>0 and (miss(y) or ~range(y,0,9999))) flg=1.<br>  if ((B4nDKx3_5=1 or miss(B4nDKx3_5) or S7_3=0) and ~miss(y)) flg=2.<br>end repeat.<br>temporary.<br>sel if flg>0.<br>list respid flg B4nx3_1 B4nx3_2 B4nx3_3 B4nx3_4 B4nDKx3_5 S7_3.<br>delete variables flg.

* ============================================================.
* Question ID: B4nDKx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4nDKx1",
*   "Question Label": "I don’t expect any change on my ^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ use (B4nDKx1)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B4nDKx1_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "EntityId": "6408"
*   }
* }
* -----------------------------------------------------------

tit B4nDKx1.<br>compute cnt = S7_1.<br>exe.<br>if cnt>0 and (miss(B4nDKx1_5) or ~range(B4nDKx1_5,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B4nDKx1_5) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag B4nDKx1_5 cnt.<br>delete variables flag cnt.

* ============================================================.
* Question ID: B4nDKx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4nDKx2",
*   "Question Label": "I don’t expect any change on my ^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ use (B4nDKx2)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B4nDKx2_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "EntityId": "6409"
*   }
* }
* -----------------------------------------------------------

tit B4nDKx2.<br>compute cnt = S7_2.<br>exe.<br>if cnt>0 and (miss(B4nDKx2_5) or ~range(B4nDKx2_5,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B4nDKx2_5) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag B4nDKx2_5 cnt.<br>delete variables flag cnt.

* ============================================================.
* Question ID: B4nDKx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B4nDKx3",
*   "Question Label": "I don’t expect any change on my ^isAU() ? \"ERLYAND\" : \"ERLEADA\"^ use (B4nDKx3)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B4nDKx3_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "EntityId": "6410"
*   }
* }
* -----------------------------------------------------------

tit B4nDKx3.<br>compute cnt = S7_3.<br>exe.<br>if cnt>0 and (miss(B4nDKx3_5) or ~range(B4nDKx3_5,0,1)) flag=1.<br>if sum(0,cnt)=0 and ~miss(B4nDKx3_5) flag=2.<br>temporary.<br>sel if flag>0.<br>list respid flag B4nDKx3_5 cnt.<br>delete variables flag cnt.

* ============================================================.
* Question ID: B5ba
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5ba",
*   "question_type": "Grid",
*   "entry_conditions": [],
*   "conditions": [],
*   "question_attributes": {
*     "Randomize": "true",
*     "AnswerlistOrder": "Randomize",
*     "Carousel": "false",
*     "EntityId": "6265",
*     "Slider": "true"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5ba_1",
*       "Question Label": "Overall  (B5ba - We would now like for you to answer the following questions regarding ^isAU() ? 'PRODUCT M':'the Xtandi'^ clinical data you have just reviewed.   ^popup('Scnr5link')^  How likely would you be to personally prescribe ^isAU() ? 'PRODUCT M':'Xtandi'^, based on any perceived benefits in this data, to your high risk biochemical recurrent (BCR) non-metastatic hormone-sensitive prostate cancer (nmHSPC) patients?)",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0",
*             "KeepPosition": "true"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ba_2",
*       "Question Label": "In monotherapy (B5ba - We would now like for you to answer the following questions regarding ^isAU() ? 'PRODUCT M':'the Xtandi'^ clinical data you have just reviewed.   ^popup('Scnr5link')^  How likely would you be to personally prescribe ^isAU() ? 'PRODUCT M':'Xtandi'^, based on any perceived benefits in this data, to your high risk biochemical recurrent (BCR) non-metastatic hormone-sensitive prostate cancer (nmHSPC) patients?)",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0",
*             "KeepPosition": "true"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ba_3",
*       "Question Label": "In combination  (B5ba - We would now like for you to answer the following questions regarding ^isAU() ? 'PRODUCT M':'the Xtandi'^ clinical data you have just reviewed.   ^popup('Scnr5link')^  How likely would you be to personally prescribe ^isAU() ? 'PRODUCT M':'Xtandi'^, based on any perceived benefits in this data, to your high risk biochemical recurrent (BCR) non-metastatic hormone-sensitive prostate cancer (nmHSPC) patients?)",
*       "answers": [
*         {
*           "Answer Code": "0",
*           "Answer Label": "No chance, almost no chance(1 in 100)"
*         },
*         {
*           "Answer Code": "1",
*           "Answer Label": "Very slight possibility(1 in 10)",
*           "answer_attributes": {
*             "FieldId": "0",
*             "KeepPosition": "true"
*           }
*         },
*         {
*           "Answer Code": "2",
*           "Answer Label": "Slight possibility(2 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "3",
*           "Answer Label": "Some possibility(3 in 10)",
*           "answer_attributes": {
*             "FieldId": "0"
*           }
*         },
*         {
*           "Answer Code": "4",
*           "Answer Label": "Fair possibility(4 in 10)"
*         },
*         {
*           "Answer Code": "5",
*           "Answer Label": "Fairly good possibility(5 in 10)"
*         },
*         {
*           "Answer Code": "6",
*           "Answer Label": "Good possibility(6 in 10)"
*         },
*         {
*           "Answer Code": "7",
*           "Answer Label": "Probable(7 in 10)"
*         },
*         {
*           "Answer Code": "8",
*           "Answer Label": "Very probable(8 in 10)"
*         },
*         {
*           "Answer Code": "9",
*           "Answer Label": "Almost sure(9 in 10)"
*         },
*         {
*           "Answer Code": "10",
*           "Answer Label": "Certain, practically certain(99 in 100)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5ba.<br>do repeat v = B5ba_1 to B5ba_3.<br>  temporary.<br>  sel if miss(v) or ~range(v,0,10).<br>  list respid v.<br>end repeat.<br>

* ============================================================.
* Question ID: B5bb
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5bb",
*   "Question Label": "B5bb - How long will it take you to start prescribing ^isAU() ? 'PRODUCT M':'Xtandi'^ to your patients?  ^popup('Scnr5link')^ I would prescribe it... ",
*   "question_type": "Single",
*   "entry_conditions": [
*     "GreaterThan('B5ba',4).size() > 0"
*   ],
*   "conditions": [],
*   "Variable ID": "B5bb",
*   "answers": [
*     {
*       "Answer Code": "0",
*       "Answer Label": "I am currently prescribing this treatment in high risk biochemical recurrent (BCR) ^f('qTitle')['nmHSPC2'].label()^"
*     },
*     {
*       "Answer Code": "1",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority and available for me to prescribe "
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "As soon as the drug is approved by the regulatory authority, available for me to prescribe and reimbursed for 6 months or less"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 6 months"
*     },
*     {
*       "Answer Code": "4",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe for at least 12 months"
*     },
*     {
*       "Answer Code": "5",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only if the product has been recommended by treatment guidelines"
*     },
*     {
*       "Answer Code": "6",
*       "Answer Label": "After the product has been available and reimbursed for me to prescribe but only after my peers have used it and recommended it"
*     }
*   ],
*   "question_attributes": {
*     "PrecodeMask": "isAU() ? a('B5bb').diff(set('0')):a('B5bb')",
*     "AutoCheckOther": "true",
*     "EntityId": "6270"
*   }
* }
* -----------------------------------------------------------

tit B5bb.<br>
* Replicate entry condition: respondent saw B5bb if any B5ba_* > 4. MODIFY the B5ba list to match your dataset.<br>
compute flt = 0.<br>
if ( MAX(B5ba_1 TO B5ba_10) > 4 ) flt = 1.  /* MODIFY: put the actual B5ba_ variables inside MAX() */<br>
exe.<br>
<br>
* 1) Basic single-choice domain / missing check, respecting PrecodeMask (Australia excludes code 0).<br>
temporary.<br>
sel if flt = 1 and qCountry = 3081 and ( miss(B5bb) or ~any(B5bb,1,2,3,4,5,6) ).  /* Australia: do NOT allow code 0 */<br>
list respid B5bb qCountry.<br>
<br>
temporary.<br>
sel if flt = 1 and qCountry <> 3081 and ( miss(B5bb) or ~any(B5bb,0,1,2,3,4,5,6) ).  /* Non-Australia: allow code 0 */<br>
list respid B5bb qCountry.<br>
<br>
* 2) Other-specify (OE) consistency check: if code 98 selected then text must exist and vice versa.<br>
temporary.<br>
sel if flt = 1 and ( (B5bb = 98 and (B5bb_98_other = '' or LENGTH(RTRIM(LTRIM(B5bb_98_other))) = 0)) or ((B5bb <> 98 or miss(B5bb)) and (B5bb_98_other <> '' and LENGTH(RTRIM(LTRIM(B5bb_98_other))) > 0)) ).<br>
list respid B5bb B5bb_98_other.<br>
<br>
* 3) Cleanup helper variable.<br>
del var flt.

* ============================================================.
* Question ID: B5cDKx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5cDKx5",
*   "Question Label": "My prescribing wouldn’t change at all (B5cDKx5)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B5cDKx5_99",
*   "answers": [
*     {
*       "Answer Code": "99",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "EntityId": "6293"
*   }
* }
* -----------------------------------------------------------

tit B5cDKx5.<br>
* Validate "My prescribing wouldn’t change at all" DK for column 5 (stored as B5cDKx5_99).<br>
compute B5cDKx5_flag = 0.<br>
* If column 5 is active (hDUMB5dCol5_2=1) then DK should be present and binary (0/1).<br>
if (hDUMB5dCol5_2 = 1 and (miss(B5cDKx5_99) or ~range(B5cDKx5_99,0,1))) B5cDKx5_flag = 1.<br>
* If column 5 is not active then DK should be blank/missing.<br>
if ((hDUMB5dCol5_2 <> 1 or miss(hDUMB5dCol5_2)) and ~miss(B5cDKx5_99)) B5cDKx5_flag = 2.<br>
* DK mutual exclusivity with numeric B5dx5 cells: if DK is selected but numeric cells are provided -> flag.<br>
if (hDUMB5dCol5_2 = 1 and B5cDKx5_99 > 0 and ( ~miss(B5dx5_1) or ~miss(B5dx5_2) or ~miss(B5dx5_3) or ~miss(B5dx5_4) )) B5cDKx5_flag = 3.<br>
temporary.<br>
sel if B5cDKx5_flag > 0.<br>
list respid B5cDKx5_flag hDUMB5dCol5_2 S7_5 B5cDKx5_99 B5dx5_1 to B5dx5_4.<br>
del variables B5cDKx5_flag.<br>

* ============================================================.
* Question ID: B5dx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5dx1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5dx1 - ^f('qTitle')['B1cH1'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6318",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_1\",\"B5dx1_4\",\"hDUMB5dCol1_2\",\"B5dDKx1\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5dx1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product M (B5dx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "XTANDI (pre-product M information) (B5dx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product M and XTANDI combined (B5dx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW XTANDI USE(pre-product M information) (B5dx1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5dx1.<br>
* Numeric cell validation for B5dx1_1..B5dx1_4 conditioned on column-active indicator(s) (hDUMB5dCol1_2 and S7_1 shown for context). Range 0..9999.<br>
compute B5dx1_numflag = 0.<br>
do repeat bx = B5dx1_1 to B5dx1_4.<br>
  /* Column is shown/active when hDUMB5dCol1_2 = 1 (and/or S7_1 > 0). When active, numeric must be present and in range. When not active, numeric must be blank. */<br>
  if (hDUMB5dCol1_2 = 1 and (miss(bx) or ~range(bx,0,9999))) B5dx1_numflag = 1.<br>
  if ((hDUMB5dCol1_2 <> 1 or miss(hDUMB5dCol1_2)) and ~miss(bx)) B5dx1_numflag = 2.<br>
end repeat.<br>
temporary.<br>
sel if B5dx1_numflag > 0.<br>
list respid B5dx1_numflag hDUMB5dCol1_2 S7_1 B5dx1_1 to B5dx1_4 B5dDKx1_5.<br>
del variables B5dx1_numflag.<br>
<br>
* DK checks and exclusivity for B5dDKx1 (stored as B5dDKx1_5).<br>
compute B5dx1_dkflag = 0.<br>
* If column active then DK must be present/valid (binary 0/1), otherwise DK should be blank.<br>
if (hDUMB5dCol1_2 = 1 and (miss(B5dDKx1_5) or ~range(B5dDKx1_5,0,1))) B5dx1_dkflag = 1.<br>
if ((hDUMB5dCol1_2 <> 1 or miss(hDUMB5dCol1_2)) and ~miss(B5dDKx1_5)) B5dx1_dkflag = 2.<br>
* Mutual exclusivity: DK selected but numeric cells provided -> flag.<br>
if (hDUMB5dCol1_2 = 1 and B5dDKx1_5 > 0 and ( ~miss(B5dx1_1) or ~miss(B5dx1_2) or ~miss(B5dx1_3) or ~miss(B5dx1_4) )) B5dx1_dkflag = 3.<br>
temporary.<br>
sel if B5dx1_dkflag > 0.<br>
list respid B5dx1_dkflag hDUMB5dCol1_2 S7_1 B5dDKx1_5 B5dx1_1 to B5dx1_4.<br>
del variables B5dx1_dkflag.<br>

* ============================================================.
* Question ID: B5dx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5dx2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5dx2 - ^f('qTitle')['B1cH2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6319",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_2\",\"B5dx2_4\",\"hDUMB5dCol2_2\",\"B5dDKx2\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5dx2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product M (B5dx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "XTANDI (pre-product M information) (B5dx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product M and XTANDI combined (B5dx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW XTANDI USE(pre-product M information) (B5dx2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5dx2.<br>
* Numeric cell validation for B5dx2_1..B5dx2_4 conditioned on column-active indicator(s) (hDUMB5dCol2_2 and S7_2 shown for context). Range 0..9999.<br>
compute B5dx2_numflag = 0.<br>
do repeat bx = B5dx2_1 to B5dx2_4.<br>
  if (hDUMB5dCol2_2 = 1 and (miss(bx) or ~range(bx,0,9999))) B5dx2_numflag = 1.<br>
  if ((hDUMB5dCol2_2 <> 1 or miss(hDUMB5dCol2_2)) and ~miss(bx)) B5dx2_numflag = 2.<br>
end repeat.<br>
temporary.<br>
sel if B5dx2_numflag > 0.<br>
list respid B5dx2_numflag hDUMB5dCol2_2 S7_2 B5dx2_1 to B5dx2_4 B5dDKx2_5.<br>
del variables B5dx2_numflag.<br>
<br>
* DK checks and exclusivity for B5dDKx2 (stored as B5dDKx2_5).<br>
compute B5dx2_dkflag = 0.<br>
if (hDUMB5dCol2_2 = 1 and (miss(B5dDKx2_5) or ~range(B5dDKx2_5,0,1))) B5dx2_dkflag = 1.<br>
if ((hDUMB5dCol2_2 <> 1 or miss(hDUMB5dCol2_2)) and ~miss(B5dDKx2_5)) B5dx2_dkflag = 2.<br>
if (hDUMB5dCol2_2 = 1 and B5dDKx2_5 > 0 and ( ~miss(B5dx2_1) or ~miss(B5dx2_2) or ~miss(B5dx2_3) or ~miss(B5dx2_4) )) B5dx2_dkflag = 3.<br>
temporary.<br>
sel if B5dx2_dkflag > 0.<br>
list respid B5dx2_dkflag hDUMB5dCol2_2 S7_2 B5dDKx2_5 B5dx2_1 to B5dx2_4.<br>
del variables B5dx2_dkflag.<br>

* ============================================================.
* Question ID: B5dx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5dx3",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5dx3 - ^f('qTitle')['B1cH3a'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6320",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_3\",\"B5dx3_4\",\"hDUMB5dCol3_2\",\"B5dDKx3\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5dx3_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product M (B5dx3 - ^f('qTitle')['B1cH3a'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx3_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "XTANDI (pre-product M information) (B5dx3 - ^f('qTitle')['B1cH3a'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx3_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product M and XTANDI combined (B5dx3 - ^f('qTitle')['B1cH3a'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx3_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW XTANDI USE(pre-product M information) (B5dx3 - ^f('qTitle')['B1cH3a'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5dx3.<br>
* Numeric cell validation for B5dx3_1..B5dx3_4 conditioned on column-active indicator(s) (hDUMB5dCol3_2 and S7_3 shown for context). Range 0..9999.<br>
compute B5dx3_numflag = 0.<br>
do repeat bx = B5dx3_1 to B5dx3_4.<br>
  if (hDUMB5dCol3_2 = 1 and (miss(bx) or ~range(bx,0,9999))) B5dx3_numflag = 1.<br>
  if ((hDUMB5dCol3_2 <> 1 or miss(hDUMB5dCol3_2)) and ~miss(bx)) B5dx3_numflag = 2.<br>
end repeat.<br>
temporary.<br>
sel if B5dx3_numflag > 0.<br>
list respid B5dx3_numflag hDUMB5dCol3_2 S7_3 B5dx3_1 to B5dx3_4 B5dDKx3_5.<br>
del variables B5dx3_numflag.<br>
<br>
* DK checks and exclusivity for B5dDKx3 (stored as B5dDKx3_5).<br>
compute B5dx3_dkflag = 0.<br>
if (hDUMB5dCol3_2 = 1 and (miss(B5dDKx3_5) or ~range(B5dDKx3_5,0,1))) B5dx3_dkflag = 1.<br>
if ((hDUMB5dCol3_2 <> 1 or miss(hDUMB5dCol3_2)) and ~miss(B5dDKx3_5)) B5dx3_dkflag = 2.<br>
if (hDUMB5dCol3_2 = 1 and B5dDKx3_5 > 0 and ( ~miss(B5dx3_1) or ~miss(B5dx3_2) or ~miss(B5dx3_3) or ~miss(B5dx3_4) )) B5dx3_dkflag = 3.<br>
temporary.<br>
sel if B5dx3_dkflag > 0.<br>
list respid B5dx3_dkflag hDUMB5dCol3_2 S7_3 B5dDKx3_5 B5dx3_1 to B5dx3_4.<br>
del variables B5dx3_dkflag.<br>

* ============================================================.
* Question ID: B5dx4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5dx4",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5dx4 - ^f('qTitle')['B1cH4'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6321",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_4\",\"B5dx4_4\",\"hDUMB5dCol4_2\",\"B5dDKx4\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5dx4_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product M (B5dx4 - ^f('qTitle')['B1cH4'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx4_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "XTANDI (pre-product M information) (B5dx4 - ^f('qTitle')['B1cH4'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx4_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product M and XTANDI combined (B5dx4 - ^f('qTitle')['B1cH4'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx4_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW XTANDI USE(pre-product M information) (B5dx4 - ^f('qTitle')['B1cH4'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5dx4.<br>
* Numeric cell validation for B5dx4_1..B5dx4_4 conditioned on column-active indicator(s) (hDUMB5dCol4_2 and S7_4 shown for context). Range 0..9999.<br>
compute B5dx4_numflag = 0.<br>
do repeat bx = B5dx4_1 to B5dx4_4.<br>
  if (hDUMB5dCol4_2 = 1 and (miss(bx) or ~range(bx,0,9999))) B5dx4_numflag = 1.<br>
  if ((hDUMB5dCol4_2 <> 1 or miss(hDUMB5dCol4_2)) and ~miss(bx)) B5dx4_numflag = 2.<br>
end repeat.<br>
temporary.<br>
sel if B5dx4_numflag > 0.<br>
list respid B5dx4_numflag hDUMB5dCol4_2 S7_4 B5dx4_1 to B5dx4_4 B5dDKx4_5.<br>
del variables B5dx4_numflag.<br>
<br>
* DK checks and exclusivity for B5dDKx4 (stored as B5dDKx4_5).<br>
compute B5dx4_dkflag = 0.<br>
if (hDUMB5dCol4_2 = 1 and (miss(B5dDKx4_5) or ~range(B5dDKx4_5,0,1))) B5dx4_dkflag = 1.<br>
if ((hDUMB5dCol4_2 <> 1 or miss(hDUMB5dCol4_2)) and ~miss(B5dDKx4_5)) B5dx4_dkflag = 2.<br>
if (hDUMB5dCol4_2 = 1 and B5dDKx4_5 > 0 and ( ~miss(B5dx4_1) or ~miss(B5dx4_2) or ~miss(B5dx4_3) or ~miss(B5dx4_4) )) B5dx4_dkflag = 3.<br>
temporary.<br>
sel if B5dx4_dkflag > 0.<br>
list respid B5dx4_dkflag hDUMB5dCol4_2 S7_4 B5dDKx4_5 B5dx4_1 to B5dx4_4.<br>
del variables B5dx4_dkflag.<br>

* ============================================================.
* Question ID: B5dx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5dx5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5dx5 - ^f('qTitle')['B1cH5'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6322",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_5\",\"B5dx5_4\",\"hDUMB5dCol5_2\",\"B5dDKx5\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5dx5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product M (B5dx5 - ^f('qTitle')['B1cH5'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "XTANDI (pre-product M information) (B5dx5 - ^f('qTitle')['B1cH5'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product M and XTANDI combined (B5dx5 - ^f('qTitle')['B1cH5'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5dx5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW XTANDI USE(pre-product M information) (B5dx5 - ^f('qTitle')['B1cH5'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5dx5.<br>
* Numeric cell validation for B5dx5_1..B5dx5_4 conditioned on column-active indicator(s) (hDUMB5dCol5_2 and S7_5 shown for context). Range 0..9999.<br>
compute B5dx5_numflag = 0.<br>
do repeat bx = B5dx5_1 to B5dx5_4.<br>
  if (hDUMB5dCol5_2 = 1 and (miss(bx) or ~range(bx,0,9999))) B5dx5_numflag = 1.<br>
  if ((hDUMB5dCol5_2 <> 1 or miss(hDUMB5dCol5_2)) and ~miss(bx)) B5dx5_numflag = 2.<br>
end repeat.<br>
temporary.<br>
sel if B5dx5_numflag > 0.<br>
list respid B5dx5_numflag hDUMB5dCol5_2 S7_5 B5dx5_1 to B5dx5_4 B5dDKx5_5 B5cDKx5_99.<br>
del variables B5dx5_numflag.<br>
<br>
* DK checks and exclusivity for B5dDKx5 (expected stored as B5dDKx5_5) and also check B5cDKx5_99 (alternate DK label present in dataset).<br>
compute B5dx5_dkflag = 0.<br>
if (hDUMB5dCol5_2 = 1 and (miss(B5dDKx5_5) or ~range(B5dDKx5_5,0,1))) B5dx5_dkflag = 1.<br>
if ((hDUMB5dCol5_2 <> 1 or miss(hDUMB5dCol5_2)) and ~miss(B5dDKx5_5)) B5dx5_dkflag = 2.<br>
* Mutual exclusivity when either DK variable indicates DK and numeric cells are provided -> flag.<br>
if (hDUMB5dCol5_2 = 1 and ( (B5dDKx5_5 > 0) or (B5cDKx5_99 > 0) ) and ( ~miss(B5dx5_1) or ~miss(B5dx5_2) or ~miss(B5dx5_3) or ~miss(B5dx5_4) )) B5dx5_dkflag = 3.<br>
temporary.<br>
sel if B5dx5_dkflag > 0.<br>
list respid B5dx5_dkflag hDUMB5dCol5_2 S7_5 B5dDKx5_5 B5cDKx5_99 B5dx5_1 to B5dx5_4.<br>
del variables B5dx5_dkflag.<br>

* ============================================================.
* Question ID: B5dDKx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5dDKx1",
*   "Question Label": "I don't expect any change on my XTANDI use (B5dDKx1)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B5dDKx1_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "EntityId": "6330"
*   }
* }
* -----------------------------------------------------------

tit B5dDKx1.<br>
* Validate DK variable for column 1 (B5dDKx1_5). Must be present only when column 1 active (hDUMB5dCol1_2). Should be binary (0/1).<br>
compute B5dDKx1_flag = 0.<br>
if (hDUMB5dCol1_2 = 1 and (miss(B5dDKx1_5) or ~range(B5dDKx1_5,0,1))) B5dDKx1_flag = 1.<br>
if ((hDUMB5dCol1_2 <> 1 or miss(hDUMB5dCol1_2)) and ~miss(B5dDKx1_5)) B5dDKx1_flag = 2.<br>
temporary.<br>
sel if B5dDKx1_flag > 0.<br>
list respid B5dDKx1_flag hDUMB5dCol1_2 S7_1 B5dDKx1_5 B5dx1_1 to B5dx1_4.<br>
del variables B5dDKx1_flag.<br>

* ============================================================.
* Question ID: B5dDKx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5dDKx2",
*   "Question Label": "I don't expect any change on my XTANDI use (B5dDKx2)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B5dDKx2_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "EntityId": "6331"
*   }
* }
* -----------------------------------------------------------

tit B5dDKx2.<br>
* Validate DK variable for column 2 (B5dDKx2_5). Must be present only when column 2 active (hDUMB5dCol2_2). Should be binary (0/1).<br>
compute B5dDKx2_flag = 0.<br>
if (hDUMB5dCol2_2 = 1 and (miss(B5dDKx2_5) or ~range(B5dDKx2_5,0,1))) B5dDKx2_flag = 1.<br>
if ((hDUMB5dCol2_2 <> 1 or miss(hDUMB5dCol2_2)) and ~miss(B5dDKx2_5)) B5dDKx2_flag = 2.<br>
temporary.<br>
sel if B5dDKx2_flag > 0.<br>
list respid B5dDKx2_flag hDUMB5dCol2_2 S7_2 B5dDKx2_5 B5dx2_1 to B5dx2_4.<br>
del variables B5dDKx2_flag.<br>

* ============================================================.
* Question ID: B5dDKx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5dDKx3",
*   "Question Label": "I don't expect any change on my XTANDI use (B5dDKx3)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B5dDKx3_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "EntityId": "6332"
*   }
* }
* -----------------------------------------------------------

tit B5dDKx3.<br>
* Validate DK variable for column 3 (B5dDKx3_5). Must be present only when column 3 active (hDUMB5dCol3_2). Should be binary (0/1).<br>
compute B5dDKx3_flag = 0.<br>
if (hDUMB5dCol3_2 = 1 and (miss(B5dDKx3_5) or ~range(B5dDKx3_5,0,1))) B5dDKx3_flag = 1.<br>
if ((hDUMB5dCol3_2 <> 1 or miss(hDUMB5dCol3_2)) and ~miss(B5dDKx3_5)) B5dDKx3_flag = 2.<br>
temporary.<br>
sel if B5dDKx3_flag > 0.<br>
list respid B5dDKx3_flag hDUMB5dCol3_2 S7_3 B5dDKx3_5 B5dx3_1 to B5dx3_4.<br>
del variables B5dDKx3_flag.<br>

* ============================================================.
* Question ID: B5dDKx4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5dDKx4",
*   "Question Label": "I don't expect any change on my XTANDI use (B5dDKx4)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B5dDKx4_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "EntityId": "6333"
*   }
* }
* -----------------------------------------------------------

tit B5dDKx4.<br>
* Validate DK variable for column 4 (B5dDKx4_5). Must be present only when column 4 active (hDUMB5dCol4_2). Should be binary (0/1).<br>
compute B5dDKx4_flag = 0.<br>
if (hDUMB5dCol4_2 = 1 and (miss(B5dDKx4_5) or ~range(B5dDKx4_5,0,1))) B5dDKx4_flag = 1.<br>
if ((hDUMB5dCol4_2 <> 1 or miss(hDUMB5dCol4_2)) and ~miss(B5dDKx4_5)) B5dDKx4_flag = 2.<br>
temporary.<br>
sel if B5dDKx4_flag > 0.<br>
list respid B5dDKx4_flag hDUMB5dCol4_2 S7_4 B5dDKx4_5 B5dx4_1 to B5dx4_4.<br>
del variables B5dDKx4_flag.<br>

* ============================================================.
* Question ID: B5dDKx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5dDKx5",
*   "Question Label": "I don't expect any change on my XTANDI use (B5dDKx5)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B5dDKx5_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "EntityId": "6334"
*   }
* }
* -----------------------------------------------------------

tit B5dDKx5.<br>temporary.<br>sel if miss(B5dDKx5_5) or ~range(B5dDKx5_5,0,1).<br>list respid B5dDKx5_5.<br>

* ============================================================.
* Question ID: B5ex1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5ex1",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5ex1 - ^f('qTitle')['B1cH1'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6355",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_1\",\"B5ex1_4\",\"hDUMB5eCol1_2\",\"B5eDKx1\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5ex1_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product M (B5ex1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex1_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Erlyand (pre-product M information) (B5ex1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex1_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product M and Erlyand combined (B5ex1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex1_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW Erlyand USE(pre-product M information) (B5ex1 - ^f('qTitle')['B1cH1'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5ex1.<br>* Derive column visibility (use helper hDUMB5eCol1_2 if present, otherwise use trigger S7_1).<br>compute vis1 = 0.<br>if (NOT missing(hDUMB5eCol1_2) and hDUMB5eCol1_2 = 0) vis1 = 1.<br>if (missing(hDUMB5eCol1_2) and NOT missing(S7_1) and S7_1 > 0) vis1 = 1.<br>exe.<br>* Initialize flag.<br>compute flag1 = 0.<br>do repeat x = B5ex1_1 to B5ex1_4.<br>  /* When visible: values should be present and in range (0..9999) unless DK selected */<br>  if (vis1 = 1 and (miss(x) or ~range(x,0,9999)) and (missing(B5eDKx1_5) or B5eDKx1_5 <> 1)) flag1 = 1.<br>  /* When hidden: values must be missing */<br>  if (vis1 = 0 and ~miss(x)) flag1 = 2.<br>  /* If DK flagged, numeric answers should be missing */<br>  if (not missing(B5eDKx1_5) and B5eDKx1_5 = 1 and ~miss(x)) flag1 = 3.<br>end repeat.<br>* Check total consistency: B5ex1_3 should equal B5ex1_1 + B5ex1_2 when both parts present.<br>compute tot1 = B5ex1_1 + B5ex1_2.<br>temporary.<br>sel if flag1 > 0 or (not missing(B5ex1_3) and not missing(tot1) and B5ex1_3 <> tot1).<br>list respid flag1 B5eDKx1_5 B5ex1_1 to B5ex1_4 tot1 vis1.<br>del var flag1 tot1 vis1.<br>

* ============================================================.
* Question ID: B5ex2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5ex2",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5ex2 - ^f('qTitle')['B1cH2'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6356",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_2\",\"B5ex2_4\",\"hDUMB5eCol2_2\",\"B5eDKx2\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5ex2_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product M (B5ex2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex2_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Erlyand (pre-product M information) (B5ex2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex2_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product M and Erlyand combined (B5ex2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex2_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW Erlyand USE(pre-product M information) (B5ex2 - ^f('qTitle')['B1cH2'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5ex2.<br>* Derive column visibility (use helper hDUMB5eCol2_2 if present, otherwise use trigger S7_2).<br>compute vis2 = 0.<br>if (NOT missing(hDUMB5eCol2_2) and hDUMB5eCol2_2 = 0) vis2 = 1.<br>if (missing(hDUMB5eCol2_2) and NOT missing(S7_2) and S7_2 > 0) vis2 = 1.<br>exe.<br>* Initialize flag.<br>compute flag2 = 0.<br>do repeat x = B5ex2_1 to B5ex2_4.<br>  if (vis2 = 1 and (miss(x) or ~range(x,0,9999)) and (missing(B5eDKx2_5) or B5eDKx2_5 <> 1)) flag2 = 1.<br>  if (vis2 = 0 and ~miss(x)) flag2 = 2.<br>  if (not missing(B5eDKx2_5) and B5eDKx2_5 = 1 and ~miss(x)) flag2 = 3.<br>end repeat.<br>compute tot2 = B5ex2_1 + B5ex2_2.<br>temporary.<br>sel if flag2 > 0 or (not missing(B5ex2_3) and not missing(tot2) and B5ex2_3 <> tot2).<br>list respid flag2 B5eDKx2_5 B5ex2_1 to B5ex2_4 tot2 vis2.<br>del var flag2 tot2 vis2.<br>

* ============================================================.
* Question ID: B5ex3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5ex3",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5ex3 - ^f('qTitle')['B1cH3a'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6357",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_3\",\"B5ex3_4\",\"hDUMB5eCol3_2\",\"B5eDKx3\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5ex3_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product M (B5ex3 - ^f('qTitle')['B1cH3a'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex3_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Erlyand (pre-product M information) (B5ex3 - ^f('qTitle')['B1cH3a'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex3_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product M and Erlyand combined (B5ex3 - ^f('qTitle')['B1cH3a'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex3_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW Erlyand USE(pre-product M information) (B5ex3 - ^f('qTitle')['B1cH3a'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5ex3.<br>* Derive column visibility (use helper hDUMB5eCol3_2 if present, otherwise use trigger S7_3).<br>compute vis3 = 0.<br>if (NOT missing(hDUMB5eCol3_2) and hDUMB5eCol3_2 = 0) vis3 = 1.<br>if (missing(hDUMB5eCol3_2) and NOT missing(S7_3) and S7_3 > 0) vis3 = 1.<br>exe.<br>* Initialize flag.<br>compute flag3 = 0.<br>do repeat x = B5ex3_1 to B5ex3_4.<br>  if (vis3 = 1 and (miss(x) or ~range(x,0,9999)) and (missing(B5eDKx3_5) or B5eDKx3_5 <> 1)) flag3 = 1.<br>  if (vis3 = 0 and ~miss(x)) flag3 = 2.<br>  if (not missing(B5eDKx3_5) and B5eDKx3_5 = 1 and ~miss(x)) flag3 = 3.<br>end repeat.<br>compute tot3 = B5ex3_1 + B5ex3_2.<br>temporary.<br>sel if flag3 > 0 or (not missing(B5ex3_3) and not missing(tot3) and B5ex3_3 <> tot3).<br>list respid flag3 B5eDKx3_5 B5ex3_1 to B5ex3_4 tot3 vis3.<br>del var flag3 tot3 vis3.<br>

* ============================================================.
* Question ID: B5ex4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5ex4",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5ex4 - ^f('qTitle')['B1cH4'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6358",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_4\",\"B5ex4_4\",\"hDUMB5eCol4_2\",\"B5eDKx4\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5ex4_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product M (B5ex4 - ^f('qTitle')['B1cH4'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex4_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Erlyand (pre-product M information) (B5ex4 - ^f('qTitle')['B1cH4'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex4_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product M and Erlyand combined (B5ex4 - ^f('qTitle')['B1cH4'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex4_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW Erlyand USE(pre-product M information) (B5ex4 - ^f('qTitle')['B1cH4'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5ex4.<br>* Derive column visibility (use helper hDUMB5eCol4_2 if present, otherwise use trigger S7_4).<br>compute vis4 = 0.<br>if (NOT missing(hDUMB5eCol4_2) and hDUMB5eCol4_2 = 0) vis4 = 1.<br>if (missing(hDUMB5eCol4_2) and NOT missing(S7_4) and S7_4 > 0) vis4 = 1.<br>exe.<br>* Initialize flag.<br>compute flag4 = 0.<br>do repeat x = B5ex4_1 to B5ex4_4.<br>  if (vis4 = 1 and (miss(x) or ~range(x,0,9999)) and (missing(B5eDKx4_5) or B5eDKx4_5 <> 1)) flag4 = 1.<br>  if (vis4 = 0 and ~miss(x)) flag4 = 2.<br>  if (not missing(B5eDKx4_5) and B5eDKx4_5 = 1 and ~miss(x)) flag4 = 3.<br>end repeat.<br>compute tot4 = B5ex4_1 + B5ex4_2.<br>temporary.<br>sel if flag4 > 0 or (not missing(B5ex4_3) and not missing(tot4) and B5ex4_3 <> tot4).<br>list respid flag4 B5eDKx4_5 B5ex4_1 to B5ex4_4 tot4 vis4.<br>del var flag4 tot4 vis4.<br>

* ============================================================.
* Question ID: B5ex5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5ex5",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Question Label": "B5ex5 - ^f('qTitle')['B1cH5'].label()^",
*   "question_attributes": {
*     "NotRequired": "true",
*     "Numeric": "true",
*     "LowerLimit": "0",
*     "EntityId": "6359",
*     "UpperLimitType": "SmallerOrEqual",
*     "AutoCheckOther": "true",
*     "ValidationCode": "validateB5d(\"S7_5\",\"B5ex5_4\",\"hDUMB5eCol5_2\",\"B5eDKx5\");",
*     "OpenText": "true",
*     "LowerLimitType": "GreaterOrEqual",
*     "UpperLimit": "9999",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "Precision": "4"
*   },
*   "sub_questions": [
*     {
*       "Variable ID": "B5ex5_1",
*       "answers": [
*         {
*           "Answer Code": "1",
*           "Answer Label": "Product M (B5ex5 - ^f('qTitle')['B1cH5'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex5_2",
*       "answers": [
*         {
*           "Answer Code": "2",
*           "Answer Label": "Erlyand (pre-product M information) (B5ex5 - ^f('qTitle')['B1cH5'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex5_3",
*       "answers": [
*         {
*           "Answer Code": "3",
*           "Answer Label": "Total assigned to Product M and Erlyand combined (B5ex5 - ^f('qTitle')['B1cH5'].label()^)"
*         }
*       ]
*     },
*     {
*       "Variable ID": "B5ex5_4",
*       "answers": [
*         {
*           "Answer Code": "4",
*           "Answer Label": "NEW Erlyand USE(pre-product M information) (B5ex5 - ^f('qTitle')['B1cH5'].label()^)"
*         }
*       ]
*     }
*   ]
* }
* -----------------------------------------------------------

tit B5ex5.<br>* Derive column visibility (use helper hDUMB5eCol5_2 if present, otherwise use trigger S7_5).<br>compute vis5 = 0.<br>if (NOT missing(hDUMB5eCol5_2) and hDUMB5eCol5_2 = 0) vis5 = 1.<br>if (missing(hDUMB5eCol5_2) and NOT missing(S7_5) and S7_5 > 0) vis5 = 1.<br>exe.<br>* Initialize flag.<br>compute flag5 = 0.<br>do repeat x = B5ex5_1 to B5ex5_4.<br>  if (vis5 = 1 and (miss(x) or ~range(x,0,9999)) and (missing(B5eDKx5_5) or B5eDKx5_5 <> 1)) flag5 = 1.<br>  if (vis5 = 0 and ~miss(x)) flag5 = 2.<br>  if (not missing(B5eDKx5_5) and B5eDKx5_5 = 1 and ~miss(x)) flag5 = 3.<br>end repeat.<br>compute tot5 = B5ex5_1 + B5ex5_2.<br>temporary.<br>sel if flag5 > 0 or (not missing(B5ex5_3) and not missing(tot5) and B5ex5_3 <> tot5).<br>list respid flag5 B5eDKx5_5 B5ex5_1 to B5ex5_4 tot5 vis5.<br>del var flag5 tot5 vis5.<br>

* ============================================================.
* Question ID: B5eDKx1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5eDKx1",
*   "Question Label": "I don’t expect any change on my Erlyand use (B5eDKx1)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B5eDKx1_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"1\")).size() > 0",
*     "EntityId": "6361"
*   }
* }
* -----------------------------------------------------------

tit B5eDKx1.<br>temporary.<br>sel if miss(B5eDKx1_5) or ~range(B5eDKx1_5,0,1).<br>list respid B5eDKx1_5.<br>

* ============================================================.
* Question ID: B5eDKx2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5eDKx2",
*   "Question Label": "I don’t expect any change on my Erlyand use (B5eDKx2)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B5eDKx2_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"2\")).size() > 0",
*     "EntityId": "6362"
*   }
* }
* -----------------------------------------------------------

tit B5eDKx2.<br>temporary.<br>sel if miss(B5eDKx2_5) or ~range(B5eDKx2_5,0,1).<br>list respid B5eDKx2_5.<br>

* ============================================================.
* Question ID: B5eDKx3
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5eDKx3",
*   "Question Label": "I don’t expect any change on my Erlyand use (B5eDKx3)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B5eDKx3_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"3\")).size() > 0",
*     "EntityId": "6363"
*   }
* }
* -----------------------------------------------------------

tit B5eDKx3.<br>temporary.<br>sel if miss(B5eDKx3_5) or ~range(B5eDKx3_5,0,1).<br>list respid B5eDKx3_5.<br>

* ============================================================.
* Question ID: B5eDKx4
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5eDKx4",
*   "Question Label": "I don’t expect any change on my Erlyand use (B5eDKx4)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B5eDKx4_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"4\")).size() > 0",
*     "EntityId": "6364"
*   }
* }
* -----------------------------------------------------------

tit B5eDKx4.<br>temporary.<br>sel if miss(B5eDKx4_5) or ~range(B5eDKx4_5,0,1).<br>list respid B5eDKx4_5.<br>

* ============================================================.
* Question ID: B5eDKx5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "B5eDKx5",
*   "Question Label": "I don’t expect any change on my Erlyand use (B5eDKx5)",
*   "question_type": "Multi",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "B5eDKx5_5",
*   "answers": [
*     {
*       "Answer Code": "5",
*       "Answer Label": ""
*     }
*   ],
*   "question_attributes": {
*     "AutoCheckOther": "true",
*     "ColumnMask": "MaskSec2Cols().isect(set(\"5\")).size() > 0",
*     "EntityId": "6365"
*   }
* }
* -----------------------------------------------------------

tit B5eDKx5.<br>* Column 5 DK checkbox should exist only when MaskSec2Cols().isect(set(\"5\")) indicates column 5 shown.<br>* MaskSec2Cols() in JS uses GetNum(\"S7_5\")>0 as indicator for column 5; replicate that here by checking S7_5>0.<br>compute cnt = 0.<br>if (not(miss(S7_5)) and S7_5 > 0) cnt = 1.<br>compute flag = 0.<br>* When column 5 was shown (cnt=1) the DK variable must be present and coded 0/1.<br>if (cnt = 1 and (miss(B5eDKx5_5) or ~range(B5eDKx5_5,0,1))) flag = 1.<br>* When column 5 was not shown the DK variable should be missing.<br>if (cnt = 0 and ~miss(B5eDKx5_5)) flag = 2.<br>exe.<br>temporary.<br>sel if flag > 0.<br>list respid flag cnt B5eDKx5_5 S7_5.<br>del var flag cnt.<br>

```

```

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
*     "Scale": "2",
*     "VariableType": "Hidden",
*     "UpperLimitType": "SmallerOrEqual",
*     "LowerLimitType": "GreaterOrEqual",
*     "Numeric": "true",
*     "Precision": "20",
*     "LowerLimit": "0",
*     "Rows": "1",
*     "ExcludeTranslation": "true",
*     "EntityId": "2753912551",
*     "Columns": "20"
*   }
* }
* -----------------------------------------------------------

tit surveyLOI.<br>* Hidden LOI (minutes) — numeric. Enforce LowerLimit >= 0. No explicit upper limit provided in details_normalized; use a large sensible upper bound (adjust if project-specific upper limit available).<br>temporary.<br>* Flag if missing or out of expected numeric range.<br>sel if miss(surveyLOI) or ~range(surveyLOI,0,9999).<br>list respid surveyLOI.<br>

```

```

* ============================================================.
* Question ID: qList
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "qList",
*   "Question Label": "qList",
*   "question_type": "Single",
*   "entry_conditions": [
*     "IsInProductionMode()"
*   ],
*   "conditions": [],
*   "Variable ID": "qList",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "List"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "Off-List"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "ExcludeTranslation": "true",
*     "EntityId": "2934"
*   }
* }
* -----------------------------------------------------------

tit qList.<br>
* Validate qList only for production-mode responses.<br>
* Preferred: use dataset field hProdMode (1 = production). If your dataset uses a different production flag variable, replace hProdMode with that field name.<br>
temporary.<br>
sel if hProdMode = 1 and ( miss(qList) or ~range(qList,1,2) ).<br>
list respid qList hProdMode.<br>
* If your environment supports an IsInProductionMode() call and you do NOT have hProdMode in the dataset, you may use the alternative below (uncomment and remove the hProdMode-based block above):<br>
* temporary.<br>
* sel if IsInProductionMode() and ( miss(qList) or ~range(qList,1,2) ).<br>
* list respid qList.<br>

* ============================================================.
* Question ID: hidTier
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {
*   "Question ID": "hidTier",
*   "Question Label": "hidTier",
*   "question_type": "Single",
*   "entry_conditions": [],
*   "conditions": [],
*   "Variable ID": "hidTier",
*   "answers": [
*     {
*       "Answer Code": "1",
*       "Answer Label": "US tier list 1-2"
*     },
*     {
*       "Answer Code": "2",
*       "Answer Label": "US tier list 3-5"
*     },
*     {
*       "Answer Code": "3",
*       "Answer Label": "Off-list"
*     }
*   ],
*   "question_attributes": {
*     "VariableType": "Hidden",
*     "AutoCheckOther": "true",
*     "EntityId": "6057"
*   }
* }
* -----------------------------------------------------------

tit hidTier.<br>
* Compute expected hidTier (hidTier_chk) from on-list flag (qList) and the respondent's tier variable (replace resp_tier with the actual tier variable name if different).<br>
* Default = 3 (Off-list). If qList=1 and resp_tier in 1..2 -> 1; if qList=1 and resp_tier in 3..5 -> 2.<br>
compute hidTier_chk = 3.<br>
if (qList = 1 and not(missing(resp_tier)) and (resp_tier = 1 or resp_tier = 2)) hidTier_chk = 1.<br>
if (qList = 1 and not(missing(resp_tier)) and (resp_tier = 3 or resp_tier = 4 or resp_tier = 5)) hidTier_chk = 2.<br>
exe.<br>
temporary.<br>
sel if miss(hidTier) or ~range(hidTier,1,3) or (hidTier_chk <> hidTier).<br>
list respid hidTier qList resp_tier hidTier_chk.<br>
del var hidTier_chk.

