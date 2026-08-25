# Expected: A raised payment error reaches the caller.
# Observed: return inside ensure discards the pending exception.
# Question: Can cleanup code replace a return value or swallow a failure?
# Run: ruby cases/12_ensure_overrides_exception.rb

def charge
  raise "card declined"
ensure
  # rubocop:disable Lint/EnsureReturn -- this is the trap under demonstration.
  return :recorded
  # rubocop:enable Lint/EnsureReturn
end

p charge
# => :recorded

# Safer: perform cleanup in ensure without return, break, or another exception.
