"""
Setup script to create the project directory structure
"""
import os
from pathlib import Path

def create_project_structure():
    """Create all required directories for the project."""
    
    directories = [
        'training',
        'macros',
        'generation',
        'prompts/system',
        'prompts/user',
        'output',
        'output/batch_outputs'
    ]
    
    print("Creating project directory structure...\n")
    
    for directory in directories:
        dir_path = Path(directory)
        dir_path.mkdir(parents=True, exist_ok=True)
        print(f"✓ Created: {directory}/")
    
    print("\n" + "="*60)
    print("Project structure created successfully!")
    print("="*60)
    print("\nNext steps:")
    print("1. Copy your files to the appropriate directories:")
    print("   - Training .md files → training/")
    print("   - macro.txt → macros/")
    print("   - Generation .md files → generation/")
    print("   - Prompt templates → prompts/system/ and prompts/user/")
    print("\n2. Copy .env.template to .env and add your OpenAI API key")
    print("\n3. Run: python batch.py")
    print("="*60 + "\n")

if __name__ == "__main__":
    create_project_structure()