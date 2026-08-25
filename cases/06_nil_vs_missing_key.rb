# Expected: hash[:key] reveals whether the key exists.
# Observed: It returns nil for both an absent key and a present key set to nil.
# Question: Does nil mean "stored nil" or "missing input" in this code path?
# Run: ruby cases/06_nil_vs_missing_key.rb

payload = { middle_name: nil }

p bracket_values: [payload[:middle_name], payload[:timezone]]
p key_presence: [payload.key?(:middle_name), payload.key?(:timezone)]
# => { bracket_values: [nil, nil] }
# => { key_presence: [true, false] }

# Safer: use key? for presence or fetch when absence should fail.
