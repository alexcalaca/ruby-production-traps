# Expected: Mutating a duplicate cannot affect the original configuration.
# Observed: dup copies only the outer Hash; nested objects remain shared.
# Question: Which nested values are still aliases after the copy?
# Run: ruby cases/04_shallow_dup.rb

original = { retries: { limit: 3 }, tags: ["billing"] }
copy = original.dup
copy[:retries][:limit] = 10
copy[:tags] << "urgent"

p original
# => { retries: { limit: 10 }, tags: ["billing", "urgent"] }

# Safer: rebuild nested values explicitly or use a deliberate deep-copy strategy.
