#!/usr/bin/env python3
"""
Check current OpenAI batch jobs status
"""
import os
from openai import OpenAI
from dotenv import load_dotenv
from datetime import datetime

load_dotenv()

client = OpenAI(api_key=os.getenv('OPENAI_API_KEY'))

print("\n" + "="*60)
print("CURRENT OPENAI BATCH JOBS")
print("="*60)

try:
    # List all batches
    batches = client.batches.list(limit=20)
    
    if not batches.data:
        print("\n✅ No active batches found!")
    else:
        active_count = 0
        for batch in batches.data:
            status = batch.status
            model = batch.request_counts
            
            # Only show non-completed batches
            if status not in ['completed', 'failed', 'expired', 'cancelled']:
                active_count += 1
                print(f"\n📦 Batch ID: {batch.id}")
                print(f"   Status: {status}")
                print(f"   Created: {datetime.fromtimestamp(batch.created_at)}")
                print(f"   Requests: {batch.request_counts.total}")
                
                if status == 'validating':
                    print(f"   ⏳ Validating...")
                elif status == 'in_progress':
                    completed = batch.request_counts.completed
                    total = batch.request_counts.total
                    print(f"   ⏳ Progress: {completed}/{total}")
                
        if active_count == 0:
            print("\n✅ All batches are completed!")
        else:
            print(f"\n⚠️  {active_count} batch(es) still in progress")
            print("\n💡 Wait for these to complete before submitting new batches")
            
except Exception as e:
    print(f"\n❌ Error: {e}")

print("\n" + "="*60)



