# Expected: Zero and an empty String behave as false in conditions.
# Observed: Only false and nil are falsey in Ruby.
# Question: Is presence or a numeric threshold being confused with truthiness?
# Run: ruby cases/40_zero_and_empty_string_are_truthy.rb

values = [0, "", false, nil]

p truthiness: values.map { |value| !!value }
# => { truthiness: [true, true, false, false] }

# Safer: test zero?, empty?, or the exact domain condition explicitly.
