# Expected: return exits only the Proc, like return inside a lambda.
# Observed: A Proc return exits the method that created it.
# Question: Can a callback skip code after the yield or iteration?
# Run: ruby cases/27_proc_nonlocal_return.rb

def process_statuses
  handler = proc { |status| return :stopped if status == :failed }
  [:ok, :failed, :ok].each(&handler)
  :completed
end

p process_statuses
# => :stopped

# Safer: use a lambda when return should be local to the callable object.
