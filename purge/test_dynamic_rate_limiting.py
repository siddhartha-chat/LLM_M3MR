#!/usr/bin/env python3
"""
Test script for dynamic rate limiting functionality.
This script demonstrates how the rate limiter adjusts delays based on performance.
"""

import asyncio
import time
import random
from multiagentic_batch_efficient_parallel import rate_limiter

async def simulate_api_call(success_rate=0.8):
    """Simulate an API call with configurable success rate."""
    await rate_limiter.acquire()
    try:
        # Simulate API call delay
        await asyncio.sleep(random.uniform(0.1, 0.5))
        
        # Simulate success/failure
        if random.random() < success_rate:
            rate_limiter.record_success()
            return "success"
        else:
            rate_limiter.record_error()
            return "error"
    finally:
        rate_limiter.release()

async def test_dynamic_rate_limiting():
    """Test the dynamic rate limiting functionality."""
    print("🔧 Testing Dynamic Rate Limiting")
    print("=" * 50)
    
    # Test 1: High success rate (should decrease delay)
    print("\n📈 Test 1: High Success Rate (80%)")
    print(f"Initial delay: {rate_limiter.get_current_delay():.1f}s")
    
    for i in range(10):
        result = await simulate_api_call(success_rate=0.8)
        print(f"  Call {i+1}: {result}, delay: {rate_limiter.get_current_delay():.1f}s")
        await asyncio.sleep(0.1)  # Small delay between calls
    
    # Test 2: Low success rate (should increase delay)
    print(f"\n📉 Test 2: Low Success Rate (30%)")
    print(f"Current delay: {rate_limiter.get_current_delay():.1f}s")
    
    for i in range(10):
        result = await simulate_api_call(success_rate=0.3)
        print(f"  Call {i+1}: {result}, delay: {rate_limiter.get_current_delay():.1f}s")
        await asyncio.sleep(0.1)
    
    # Test 3: Reset and test again
    print(f"\n🔄 Test 3: Reset and High Success Rate")
    rate_limiter.reset_stats()
    print(f"Reset delay: {rate_limiter.get_current_delay():.1f}s")
    
    for i in range(10):
        result = await simulate_api_call(success_rate=0.9)
        print(f"  Call {i+1}: {result}, delay: {rate_limiter.get_current_delay():.1f}s")
        await asyncio.sleep(0.1)
    
    print(f"\n✅ Final delay: {rate_limiter.get_current_delay():.1f}s")
    print("Dynamic rate limiting test completed!")

if __name__ == "__main__":
    asyncio.run(test_dynamic_rate_limiting())





