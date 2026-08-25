# Expected: A bang method returns the updated object on success.
# Observed: Many bang methods return nil when they make no change.
# Question: Is the return value being mistaken for the transformed value?
# Run: ruby cases/10_bang_method_nil.rb

email = "already@example.com"
normalized = email.downcase!

p email: email, normalized: normalized
# => { email: "already@example.com", normalized: nil }

# Safer: use the non-bang method when the transformed value is required.
