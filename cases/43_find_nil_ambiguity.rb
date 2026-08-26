# Expected: find distinguishes a matching nil element from no matching element.
# Observed: Both outcomes return nil.
# Question: Can nil be a legitimate member of the searched collection?
# Run: ruby cases/43_find_nil_ambiguity.rb

values = [false, nil]
found = values.find(&:nil?)
not_found = values.find { |value| value == :missing }

p found: found, not_found: not_found, indistinguishable: (found == not_found)
# => { found: nil, not_found: nil, indistinguishable: true }

# Safer: use find_index, a sentinel object, or a result type that carries presence.
