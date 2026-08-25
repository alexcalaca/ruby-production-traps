# Expected: Duplicating a frozen object preserves its frozen state.
# Observed: dup returns an unfrozen copy, while clone preserves frozen state.
# Question: Can copying bypass an immutability assumption?
# Run: ruby cases/21_dup_thaws_frozen_object.rb

token = "secret".freeze
duplicate = token.dup
clone = token.clone
duplicate << "-changed"

p original_frozen: token.frozen?, duplicate: duplicate, clone_frozen: clone.frozen?
# => { original_frozen: true, duplicate: "secret-changed", clone_frozen: true }

# Safer: choose clone when frozen state must be preserved, then verify invariants.
