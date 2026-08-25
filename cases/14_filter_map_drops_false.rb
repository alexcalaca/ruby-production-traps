# Expected: filter_map removes only absent nil values.
# Observed: It removes both nil and false because both are falsey.
# Question: Is false meaningful data that must survive this pipeline?
# Run: ruby cases/14_filter_map_drops_false.rb

feature_flags = [true, false, nil]
persisted = feature_flags.filter_map { |flag| flag }

p persisted
# => [true]

# Safer: map first and reject(&:nil?) when false must be retained.
