# Expected: result receives the value of the complete boolean expression.
# Observed: and has lower precedence than assignment, so result receives true.
# Question: Is and/or being used where &&/|| expression semantics are intended?
# Run: ruby cases/11_and_or_assignment_precedence.rb

first_condition = true
second_condition = false
result_with_and = first_condition and second_condition
result_with_double_ampersand = first_condition && second_condition

p result_with_and: result_with_and
p result_with_double_ampersand: result_with_double_ampersand
# => { result_with_and: true }
# => { result_with_double_ampersand: false }

# Safer: use && and || for value expressions; reserve and/or for control flow.
