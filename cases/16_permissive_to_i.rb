# Expected: to_i rejects input that is not a valid integer.
# Observed: It parses a numeric prefix and returns 0 when no prefix exists.
# Question: Can malformed input quietly become a valid-looking identifier or amount?
# Run: ruby cases/16_permissive_to_i.rb

p "12invoices".to_i
p "not-a-number".to_i
# => 12
# => 0

# Safer: Integer(input, 10) raises ArgumentError for malformed input.
