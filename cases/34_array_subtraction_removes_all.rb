# Expected: Subtracting [item] removes one matching occurrence.
# Observed: Array#- removes every occurrence found in the right-hand Array.
# Question: Is this operation set-like subtraction or single-item consumption?
# Run: ruby cases/34_array_subtraction_removes_all.rb

queue = [:retry, :retry, :deliver]
remaining = queue - [:retry]

p remaining
# => [:deliver]

# Safer: locate and delete one index when multiplicity matters.
