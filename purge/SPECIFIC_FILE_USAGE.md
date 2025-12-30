# Processing Specific Files

## Overview

The `multiagentic_batch_efficient.py` script now supports processing a specific input file instead of all files in the generation directory.

## Configuration

Add the following to your `.env` file:

```bash
# Process only this specific file
INPUT_FILE_NAME=R79550.md
```

## Usage Examples

### Example 1: Process R79550.md
```bash
# In your .env file:
INPUT_FILE_NAME=R79550.md
BATCH_SIZE=5
```

**Output files generated:**
- `output/SPSS_output_R79550.sps`
- `output/review_reports/processed_R79550_failures.jsonl`
- `output/review_reports/processed_R79550_review.jsonl`

### Example 2: Process R76587.md
```bash
# In your .env file:
INPUT_FILE_NAME=R76587.md
BATCH_SIZE=3
```

**Output files generated:**
- `output/SPSS_output_R76587.sps`
- `output/review_reports/processed_R76587_failures.jsonl`
- `output/review_reports/processed_R76587_review.jsonl`

### Example 3: Process all files (original behavior)
```bash
# In your .env file:
# INPUT_FILE_NAME=  (leave empty or don't set)
```

**Output files generated:**
- `output/SPSS_output_{filename}.sps` (for each file)
- `output/review_reports/processed_{filename}_failures.jsonl`
- `output/review_reports/processed_{filename}_review.jsonl`

## File Naming Convention

The output files are automatically named based on the input file:

- **Input:** `R79550.md`
- **SPSS Output:** `SPSS_output_R79550.sps`
- **Failures:** `processed_R79550_failures.jsonl`
- **Review Log:** `processed_R79550_review.jsonl`

## Error Handling

If the specified file doesn't exist, the script will raise a `FileNotFoundError`:

```
FileNotFoundError: Input file not found: /path/to/generation/R79550.md
```

Make sure the file exists in the `generation/` directory before running the script.


