# Expected: Dividing completed by total produces a fractional percentage.
# Observed: Integer divided by Integer truncates toward zero.
# Question: Are both operands integers in a rate, average, or allocation calculation?
# Run: ruby cases/29_integer_division.rb

completed = 1
total = 3
percentage = (completed / total) * 100

p percentage: percentage
# => { percentage: 0 }

# Safer: completed.fdiv(total) * 100
