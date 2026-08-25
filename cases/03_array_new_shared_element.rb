# Expected: Array.new(3, []) creates three independent inner Arrays.
# Observed: It stores the same inner Array reference three times.
# Question: Is the second argument safe to share and mutate?
# Run: ruby cases/03_array_new_shared_element.rb

rows = Array.new(3, [])
rows[0] << "invoice-1"

p rows
# => [["invoice-1"], ["invoice-1"], ["invoice-1"]]

# Safer: Array.new(3) { [] }
