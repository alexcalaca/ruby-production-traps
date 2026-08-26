# Expected: The original business failure reaches the caller after cleanup.
# Observed: An exception raised by ensure replaces the exception already in flight.
# Question: Can cleanup failure hide the incident's real root cause?
# Run: ruby cases/59_ensure_exception_replaces_original.rb

def persist
  raise "database write failed"
ensure
  raise "cleanup failed"
end


begin
  persist
rescue RuntimeError => error
  p reported: error.message, cause: error.cause.message
end
# => { reported: "cleanup failed", cause: "database write failed" }

# Safer: make cleanup resilient and preserve or explicitly report both failures.
