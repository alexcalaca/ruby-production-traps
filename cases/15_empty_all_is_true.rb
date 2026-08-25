# Expected: No approvals means an approval check is false.
# Observed: all? on an empty collection is true (vacuous truth).
# Question: Must the collection be non-empty before every item can authorize work?
# Run: ruby cases/15_empty_all_is_true.rb

approvals = []
authorized = approvals.all? { |approval| approval == :granted }

p authorized: authorized
# => { authorized: true }

# Safer: approvals.any? && approvals.all? { |approval| approval == :granted }
