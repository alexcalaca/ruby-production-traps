# Expected: Equal Hashes behave the same for every lookup.
# Observed: Hash equality ignores their default values and default procs.
# Question: Does code compare Hash contents while relying on missing-key behavior?
# Run: ruby cases/33_hash_equality_ignores_defaults.rb

zero_default = Hash.new(0)
error_default = Hash.new(:error)

p equal: (zero_default == error_default)
p missing_values: [zero_default[:missing], error_default[:missing]]
# => { equal: true }
# => { missing_values: [0, :error] }

# Safer: compare default/default_proc explicitly when lookup behavior is significant.
