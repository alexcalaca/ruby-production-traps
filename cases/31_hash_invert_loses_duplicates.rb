# Expected: Inverting a Hash preserves every original pair.
# Observed: Duplicate values become one key, so the last pair silently wins.
# Question: Are the original values guaranteed to be unique before inversion?
# Run: ruby cases/31_hash_invert_loses_duplicates.rb

status_codes = { first: 200, second: 200, missing: 404 }
inverted = status_codes.invert

p original_size: status_codes.size, inverted: inverted
# => { original_size: 3, inverted: { 200 => :second, 404 => :missing } }

# Safer: group keys by value when the relationship is many-to-one.
