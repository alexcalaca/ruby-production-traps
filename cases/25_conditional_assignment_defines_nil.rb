# Expected: A variable assigned only in an unreachable branch is undefined.
# Observed: The parser sees the assignment, so the local variable exists as nil.
# Question: Is nil coming from data, or from a branch that never assigned a value?
# Run: ruby cases/25_conditional_assignment_defines_nil.rb

def feature_enabled? = false

def access_token
  if feature_enabled?
    token = "secret"
  end

  token
end

p access_token
# => nil

# Safer: initialize deliberately and make unhandled branches explicit.
