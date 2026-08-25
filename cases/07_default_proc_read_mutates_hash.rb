# Expected: Reading a missing key is a side-effect-free lookup.
# Observed: An assigning default proc inserts that key during the read.
# Question: Can observation silently grow this Hash or change serialized output?
# Run: ruby cases/07_default_proc_read_mutates_hash.rb

groups = Hash.new { |hash, key| hash[key] = [] }

p before: groups
groups[:unknown]
p after: groups
# => { before: {} }
# => { after: { unknown: [] } }

# Safer: use fetch(key, immutable_default) when a read must not insert.
