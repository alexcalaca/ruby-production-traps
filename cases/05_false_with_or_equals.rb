# Expected: ||= preserves an already memoized false result.
# Observed: false is treated like an empty cache and the work runs again.
# Question: Can the cached value legitimately be false or nil?
# Run: ruby cases/05_false_with_or_equals.rb

checks = 0
enabled = false

2.times do
  enabled ||= begin
    checks += 1
    false
  end
end

p enabled: enabled, checks: checks
# => { enabled: false, checks: 2 }

# Safer: track initialization separately, or check instance_variable_defined?.
