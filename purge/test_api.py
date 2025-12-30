#!/usr/bin/env python3
import os
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()

api_key = os.getenv("OPENAI_API_KEY")
model = os.getenv("MODEL", "gpt-5-mini")

print(f"Testing API with model: {model}")
print(f"API key (first 10 chars): {api_key[:10]}...")

try:
    client = OpenAI(api_key=api_key)
    
    # Simple test call
    response = client.chat.completions.create(
        model=model,
        messages=[{"role": "user", "content": "Say 'test successful'"}],
        max_tokens=10
    )
    
    print(f"\n✅ SUCCESS!")
    print(f"Response: {response.choices[0].message.content}")
    print(f"Model used: {response.model}")
    print(f"Tokens used: {response.usage.total_tokens}")
    
except Exception as e:
    print(f"\n❌ ERROR: {e}")
    print(f"Error type: {type(e).__name__}")
    
    if "insufficient_quota" in str(e):
        print("\n⚠️  This is a QUOTA issue - check your billing!")
    elif "model" in str(e).lower():
        print(f"\n⚠️  Model '{model}' might not exist or not be available")
    elif "429" in str(e):
        print("\n⚠️  Rate limit hit")

