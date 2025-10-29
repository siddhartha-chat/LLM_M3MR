# Output Format Guide

## 📋 Enhanced .sps Output Format

The generated SPSS scripts now include the **original question details** (`details_normalized`) as comment blocks for easy reference!

---

## 🎯 New Output Structure

### **Before (Old Format):**

```spss
* ============================================================.
* Question ID: hidS5
* ============================================================.

tit hidS5.
COMPUTE hidS5_1 = 0.
...
```

### **After (New Format with Details):**

```spss
* ============================================================.
* Question ID: hidS5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'hidS5', 'question_type': 'Multi', 
*  'entry_conditions': [], 'conditions': [], 
*  'Question Label': 'hidS5 - //hidden to classify below based on S5 response.',
*  'question_attributes': {'AnswerRequiredType': 'NotRequired', 
*                          'VariableType': 'Hidden', 
*                          'Disabled': 'true', 
*                          'EntityId': '5872'}, 
*  'sub_questions': [
*    {'Variable ID': 'hidS5_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'Respiratory Conditions'}]},
*    {'Variable ID': 'hidS5_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Type 2 Diabetes'}]},
*    {'Variable ID': 'hidS5_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Heart Disease'}]},
*    {'Variable ID': 'hidS5_4', 'answers': [{'Answer Code': '4', 'Answer Label': 'Dermatologic Conditions'}]}
*  ]}
* -----------------------------------------------------------

tit hidS5.
COMPUTE hidS5_1 = 0.
...
```

---

## ✅ Benefits

### **1. Better Understanding**
Each SPSS script block now shows:
- ✅ **Question type** (Single, Multi, Open, etc.)
- ✅ **Entry conditions** (when question is shown)
- ✅ **Post-response conditions** (screen-outs, validations)
- ✅ **Question attributes** (Hidden, Required, Validation code, etc.)
- ✅ **Sub-questions and answer codes**

### **2. Easier Debugging**
When reviewing generated SPSS scripts, you can:
- ✅ See the original logic alongside the generated code
- ✅ Verify the transformation is correct
- ✅ Understand why certain SPSS commands were used
- ✅ Identify missing logic or errors

### **3. Better Documentation**
The .sps file becomes self-documenting:
- ✅ No need to reference the original .md file
- ✅ All context is in one place
- ✅ Easier to share and review
- ✅ Future maintainers can understand the logic

### **4. Quality Assurance**
You can easily:
- ✅ Compare original logic with generated code
- ✅ Spot missing features (e.g., Hidden variables not computed)
- ✅ Verify validation rules were implemented
- ✅ Check entry/exit conditions

---

## 📄 Example Output Sections

### **Example 1: Multi-Select Question with Validation**

```spss
* ============================================================.
* Question ID: S0
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'S0', 
*  'question_type': 'Multi',
*  'entry_conditions': ["f('qSurveyType').none('2') //SCREENER"],
*  'conditions': ["f('S0').any('3')"],
*  'Question Label': 'S0 - Welcome and thank you...',
*  'question_attributes': {
*    'ValidationCode': "if(f('S0').isect(nset(2)).size()==1){\nerrorMsg('S0');\n}",
*    'AnswerRequiredType': 'Required',
*    'EntityId': '5854'
*  },
*  'sub_questions': [
*    {'Variable ID': 'S0_1', 'answers': [{'Answer Code': '1', 'Answer Label': 'I consent...'}]},
*    {'Variable ID': 'S0_2', 'answers': [{'Answer Code': '2', 'Answer Label': 'Health consent...'}]},
*    {'Variable ID': 'S0_3', 'answers': [{'Answer Code': '3', 'Answer Label': 'Decline...'}]}
*  ]}
* -----------------------------------------------------------

* Entry condition: Show only if qSurveyType ≠ 2
DO IF (qSurveyType NE 2).
    COMPUTE S0_1 = 0.
    COMPUTE S0_2 = 0.
    COMPUTE S0_3 = 0.
    ...
END IF.
```

**What you can see:**
- ✅ Entry condition clearly stated
- ✅ Validation code visible
- ✅ Screen-out condition listed
- ✅ All answer codes and labels

---

### **Example 2: Hidden/Computed Variable**

```spss
* ============================================================.
* Question ID: hidS5
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'hidS5',
*  'question_type': 'Multi',
*  'Question Label': 'hidS5 - //hidden to classify below based on S5 response.',
*  'question_attributes': {
*    'VariableType': 'Hidden',          ← KEY INDICATOR
*    'Disabled': 'true',                 ← COMPUTED VARIABLE
*    'AnswerRequiredType': 'NotRequired'
*  },
*  'sub_questions': [...]}
* -----------------------------------------------------------

* This should COMPUTE hidS5 from S5 responses
* NOT just validate!
```

**What you can immediately spot:**
- ✅ `VariableType: 'Hidden'` → This is computed, not asked
- ✅ `Disabled: 'true'` → System-generated value
- ✅ Label says "based on S5 response" → Needs derivation logic
- ✅ Can verify if SPSS script includes COMPUTE statements

---

### **Example 3: Single-Select with Conditions**

```spss
* ============================================================.
* Question ID: SPECIALTY
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'SPECIALTY',
*  'question_type': 'Single',
*  'entry_conditions': ['false'],           ← NEVER SHOWN!
*  'conditions': ["f('SPECIALTY').any('99')"],
*  'question_attributes': {
*    'ValidationCode': 'checkOS()',
*    'AutoCheckOther': 'true'
*  }}
* -----------------------------------------------------------

* This question has entry_conditions: ['false']
* Means it's NEVER shown to respondents
* Likely pre-filled or for internal routing only
```

**What you learn:**
- ✅ `entry_conditions: ['false']` → Question skipped
- ✅ Validation function name visible
- ✅ Can add appropriate SPSS comments

---

## 🔍 How to Use This Information

### **1. Quality Check Workflow**

```spss
1. Read the ORIGINAL QUESTION DETAILS comment block
2. Identify key attributes:
   - question_type (Single/Multi/Open)
   - VariableType (Hidden = computed)
   - entry_conditions (when shown)
   - conditions (post-response logic)
   - ValidationCode
3. Review the generated SPSS code below
4. Verify all logic is implemented
```

### **2. Common Checks**

| Original Attribute | Expected in SPSS |
|-------------------|------------------|
| `question_type: 'Multi'` | Multiple binary variables (Q_1, Q_2, etc.) |
| `VariableType: 'Hidden'` | COMPUTE statements, not INPUT |
| `entry_conditions: [...]` | DO IF condition at start |
| `conditions: [...]` | Screen-out or validation logic |
| `ValidationCode: '...'` | Validation checks in SPSS |
| `Disabled: 'true'` | Computed/derived variable |

### **3. Debugging Example**

```spss
* Original shows: 'VariableType': 'Hidden', 'Disabled': 'true'
* But generated code only has: tit hidS5. LIST respid, hidS5_1.
* 
* ❌ PROBLEM: Missing COMPUTE statements!
* ✅ FIX NEEDED: Add derivation logic from parent questions
```

---

## 📊 File Structure

### **Complete .sps File Layout:**

```spss
* ============================================================.
* SPSS Validation Script
* Generated: 2025-10-09 23:45:00
* Source: R79641.md
* Model: gpt-4o
* ============================================================.

* ============================================================.
* Question ID: Q1
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {question details here}
* -----------------------------------------------------------

[SPSS script for Q1]


* ============================================================.
* Question ID: Q2
* ============================================================.
*
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {question details here}
* -----------------------------------------------------------

[SPSS script for Q2]

...

* ============================================================.
* End of Script - Total Questions Processed: N
* ============================================================.
```

---

## 🎯 Key Features

### **1. SPSS Comment Format**
All original details are marked with `*` (SPSS comment marker):
```spss
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
* {'Question ID': 'hidS5', ...}
* -----------------------------------------------------------
```

This means:
- ✅ Won't affect SPSS execution
- ✅ Readable in SPSS syntax editor
- ✅ Can be copied/edited
- ✅ Preserved in SPSS logs

### **2. Multi-line Formatting**
Long details are automatically split across lines:
```spss
* {'Question ID': 'S0', 
*  'question_type': 'Multi',
*  'Question Label': 'Very long question text...',
*  ...}
```

### **3. Separator Lines**
Clear visual separation:
```spss
* -----------------------------------------------------------
* ORIGINAL QUESTION DETAILS:
* -----------------------------------------------------------
```

---

## 💡 Pro Tips

### **Tip 1: Search by Attribute**
Use SPSS editor search to find specific types:
```
Search for: * 'VariableType': 'Hidden'
Result: All hidden/computed variables
```

### **Tip 2: Extract Original Logic**
Copy the details_normalized block to a Python script for analysis:
```python
# Extract from .sps file
details = "{'Question ID': 'hidS5', ...}"
import ast
q = ast.literal_eval(details)
print(q['question_attributes']['VariableType'])
```

### **Tip 3: Generate Review Reports**
Create a checklist by scanning comment blocks:
```python
import re

with open('processed_R79641.sps', 'r') as f:
    content = f.read()

# Find all Hidden variables
hidden_vars = re.findall(r"'VariableType': 'Hidden'", content)
print(f"Found {len(hidden_vars)} hidden variables to review")
```

---

## ✅ Summary

**New output format includes:**
- ✅ Original question details in SPSS comments
- ✅ All attributes and sub-questions visible
- ✅ Easy to compare logic vs implementation
- ✅ Self-documenting scripts
- ✅ Better quality assurance

**Benefits:**
- 🎯 Easier debugging
- 🎯 Better understanding
- 🎯 Quality validation
- 🎯 Documentation in one file

**See example:** `SAMPLE_OUTPUT_FORMAT.sps`

🚀 **Your .sps files are now much more informative and maintainable!**



