# Expected: Changing one hash value leaves the other value unchanged.
# Observed: Both values refer to the same mutable String and both appear changed.
# Question: Did each entry receive a value, or merely a reference to one object?
# Run: ruby cases/01_shared_string_reference.rb

status = +"pending"
orders = { first: status, second: status }

orders[:first].upcase!

p orders
# => { first: "PENDING", second: "PENDING" }

# Safer: create a distinct object for each value, for example status.dup.
