# Expected: Appending to one missing key creates a bucket for only that key.
# Observed: Missing keys share one default Array, and no key is inserted.
# Question: Was the Hash initialized with a value or with a per-key block?
# Run: ruby cases/02_shared_hash_default.rb

events = Hash.new([])
events[:errors] << "timeout"

p errors: events[:errors], warnings: events[:warnings], keys: events.keys
# => { errors: ["timeout"], warnings: ["timeout"], keys: [] }

# Safer: Hash.new { |hash, key| hash[key] = [] }
