# Expected: A Proc rejects missing or extra arguments like a normal method.
# Observed: A non-lambda Proc fills missing arguments with nil and ignores extras.
# Question: Can a callback signature drift without failing close to the source?
# Run: ruby cases/46_proc_lenient_arity.rb

handler = proc { |event, metadata| [event, metadata] }

p missing: handler.call(:created)
p extra: handler.call(:created, { source: :api }, :ignored)
# => { missing: [:created, nil] }
# => { extra: [:created, { source: :api }] }

# Safer: use a lambda when strict argument checking is part of the contract.
