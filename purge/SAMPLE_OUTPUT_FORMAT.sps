* ============================================================.
* SPSS Validation Script
* Generated: 2025-10-09 23:45:00
* Source: R79641.md
* Model: gpt-4o
* ============================================================.

* ============================================================.
* Question ID: hidS5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'hidS5', 'question_type': 'Multi', 'entry_conditions': [], 'conditions': [], 'Question Label': 'hidS5 - //hidden to classify below based on S5 response.', 'question_attributes': {'AnswerRequiredType': 'NotRequired', 'VariableType': 'Hidden', 'AutoCheckOther': 'true', 'Disabled': 'true', 'EntityId': '5872'}, 'sub_questions': [{'Variable ID': 'hidS5_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Respiratory Conditions'}]}, {'Variable ID': 'hidS5_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Type 2 Diabetes'}]}, {'Variable ID': 'hidS5_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Heart Disease'}]}, {'Variable ID': 'hidS5_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Dermatologic Conditions'}]}]}
* -----------------------------------------------------------

* Initialize classification variables
COMPUTE hidS5_1 = 0.
COMPUTE hidS5_2 = 0.
COMPUTE hidS5_3 = 0.
COMPUTE hidS5_4 = 0.

* Variable labels
VARIABLE LABELS
    hidS5_1 'Respiratory Conditions'
    hidS5_2 'Type 2 Diabetes'
    hidS5_3 'Heart Disease'
    hidS5_4 'Dermatologic Conditions'.

* Compute based on S5 responses
DO IF (S5_1 = 1 OR S5_2 = 1).
    COMPUTE hidS5_1 = 1.
END IF.

DO IF (S5_3 = 1).
    COMPUTE hidS5_2 = 1.
END IF.

DO IF (S5_6 = 1).
    COMPUTE hidS5_3 = 1.
END IF.

DO IF (S5_4 = 1 OR S5_5 = 1).
    COMPUTE hidS5_4 = 1.
END IF.

EXECUTE.


* ============================================================.
* Question ID: S0
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'S0', 'question_type': 'Multi', 'entry_conditions': ["f('qSurveyType').none('2') //SCREENER"], 'conditions': ["f('S0').any('3')"], 'Question Label': 'S0 - Welcome and thank you for participating in this market research survey...', 'question_attributes': {'ValidationCode': "if(f('S0').isect(nset(2)).size()==1)\n{\nerrorMsg('S0'); \n}", 'AnswerRequiredType': 'Required', 'AutoCheckOther': 'true', 'EntityId': '5854'}, 'sub_questions': [{'Variable ID': 'S0_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'I have read, understood and accept...'}]}, {'Variable ID': 'S0_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'I consent to providing information relating to my health/condition...'}]}, {'Variable ID': 'S0_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'No, I do not want to participate...'}]}]}
* -----------------------------------------------------------

* Entry condition check
DO IF (qSurveyType NE 2).
    
    * Initialize consent variables
    COMPUTE S0_1 = 0.
    COMPUTE S0_2 = 0.
    COMPUTE S0_3 = 0.
    
    * Variable labels
    VARIABLE LABELS 
        S0_1 'I have read, understood and accept the points above...'
        S0_2 'I consent to providing information relating to my health/condition...'
        S0_3 'No, I do not want to participate in this research'.
    
    * Validation logic
    DO IF (S0_2 = 1 AND S0_1 = 0).
        COMPUTE validation_error = 1.
    END IF.
    
    * Screen-out logic
    DO IF (S0_3 = 1).
        COMPUTE screened_out = 1.
    END IF.
    
END IF.

EXECUTE.


* ============================================================.
* End of Script - Total Questions Processed: 2
* ============================================================.



