# Expected: Numeric values equal with == identify the same Hash entry.
# Observed: Hash keys use eql? and hash; Integer 1 and Float 1.0 are distinct.
# Question: Were identifiers or measurements normalized before becoming keys?
# Run: ruby cases/19_numeric_hash_keys.rb

rates = { 1 => "integer", 1.0 => "float" }

p equal_with_double_equals: (1 == 1.0)
p entries: rates, size: rates.size
# => { equal_with_double_equals: true }
# => { entries: { 1 => "integer", 1.0 => "float" }, size: 2 }

# Safer: normalize key types at the boundary.
