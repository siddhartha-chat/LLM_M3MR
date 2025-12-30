# Batch Size Comparison: Fixed vs Dynamic

## 📁 **File Overview**

| File | Purpose | Batch Strategy | Key Features |
|------|---------|----------------|--------------|
| `multiagentic_batch_efficient_parallel.py` | **Fixed Batch Size** | Uses `BATCH_SIZE` environment variable | Simple, predictable processing |
| `multi_batch_parallel_dynamic_size.py` | **Dynamic Batch Size** | Smart complexity-based grouping | Advanced optimizations |

## 🔧 **Fixed Batch Size Version** (`multiagentic_batch_efficient_parallel.py`)

### **Configuration**
```bash
# Set batch size via environment variable
BATCH_SIZE=6  # Fixed size for all batches
```

### **How It Works**
- **Simple Logic**: Divides questions into fixed-size batches
- **Predictable**: Always creates `ceil(total_questions / BATCH_SIZE)` batches
- **Example**: 164 questions ÷ 6 = 28 batches

### **Use Cases**
- ✅ **Consistent Processing**: Same batch size for all question types
- ✅ **Simple Configuration**: Just set `BATCH_SIZE` environment variable
- ✅ **Predictable Resource Usage**: Know exactly how many batches will be created
- ✅ **Easy Debugging**: Simple to understand and troubleshoot

### **Configuration Example**
```bash
# .env file
BATCH_SIZE=6
MAX_FEEDBACK_LOOPS=7
GLOBAL_RATE_LIMIT_DELAY=2.0
MAX_CONCURRENT_REQUESTS=3
```

---

## 🚀 **Dynamic Batch Size Version** (`multi_batch_parallel_dynamic_size.py`)

### **Configuration**
```bash
# No fixed batch size - uses smart grouping
MAX_COMPLEXITY_PER_BATCH=15  # Complexity threshold
```

### **How It Works**
- **Smart Grouping**: Groups questions by complexity score
- **Balanced Workload**: Ensures similar processing time per batch
- **Adaptive**: Batch sizes vary based on question complexity

### **Complexity Calculation**
```python
def calculate_complexity(q):
    complexity = 0
    # Base complexity by question type
    type_complexity = {"Single": 1, "Multi": 2, "Open": 1, "Hidden": 0}
    complexity += type_complexity.get(q.get("question_type", "Single"), 1)
    
    # Add complexity for conditions
    if q.get("entry_conditions"): complexity += len(q.get("entry_conditions", []))
    if q.get("conditions"): complexity += len(q.get("conditions", []))
    if q.get("sub_questions"): complexity += len(q.get("sub_questions", []))
    
    return complexity
```

### **Advanced Features**
- ✅ **Pattern Caching**: Reuses successful patterns for similar questions
- ✅ **Early Validation**: Skips problematic questions early
- ✅ **Smart Batching**: Groups by complexity for optimal processing
- ✅ **Rate Limiting**: Handles API rate limits with retry logic
- ✅ **Feedback Optimization**: Early termination when no progress

### **Use Cases**
- ✅ **Complex Surveys**: Better handling of varied question types
- ✅ **Performance Optimization**: Faster processing through caching
- ✅ **Reliability**: Better error handling and rate limit management
- ✅ **Resource Efficiency**: Optimal batch sizes reduce API calls

---

## 📊 **Performance Comparison**

| Metric | Fixed Batch Size | Dynamic Batch Size |
|--------|------------------|-------------------|
| **Setup Complexity** | ⭐ Simple | ⭐⭐⭐ Advanced |
| **Processing Speed** | ⭐⭐ Good | ⭐⭐⭐ Excellent |
| **Resource Usage** | ⭐⭐ Predictable | ⭐⭐⭐ Optimized |
| **Error Handling** | ⭐⭐ Basic | ⭐⭐⭐ Robust |
| **API Efficiency** | ⭐⭐ Standard | ⭐⭐⭐ High |

---

## 🎯 **When to Use Which**

### **Use Fixed Batch Size When:**
- ✅ You want **simple, predictable** processing
- ✅ You have **consistent question types** across surveys
- ✅ You need **easy configuration** and debugging
- ✅ You're processing **small to medium** surveys (< 200 questions)

### **Use Dynamic Batch Size When:**
- ✅ You have **complex, varied** question types
- ✅ You want **maximum performance** and efficiency
- ✅ You're processing **large surveys** (> 200 questions)
- ✅ You need **robust error handling** and rate limiting
- ✅ You want **advanced optimizations** like caching

---

## 🚀 **Quick Start**

### **Fixed Batch Size**
```bash
# Set your preferred batch size
export BATCH_SIZE=6
python multiagentic_batch_efficient_parallel.py
```

### **Dynamic Batch Size**
```bash
# Use advanced optimizations
python multi_batch_parallel_dynamic_size.py
```

---

## 📝 **Configuration Examples**

### **Fixed Batch Size Configuration**
```bash
# .env for fixed batch size
BATCH_SIZE=6
MAX_FEEDBACK_LOOPS=7
GLOBAL_RATE_LIMIT_DELAY=2.0
MAX_CONCURRENT_REQUESTS=3
INPUT_FILE_NAME=R77904.md
```

### **Dynamic Batch Size Configuration**
```bash
# .env for dynamic batch size
MAX_COMPLEXITY_PER_BATCH=15
GLOBAL_RATE_LIMIT_DELAY=3.0
MAX_CONCURRENT_REQUESTS=2
MAX_FEEDBACK_LOOPS=5
INPUT_FILE_NAME=R77904.md
```

Both versions include rate limiting and retry logic to handle API errors gracefully!


