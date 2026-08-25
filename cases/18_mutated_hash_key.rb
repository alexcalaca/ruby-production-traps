# Expected: A key object already stored in a Hash remains findable.
# Observed: Mutating content used by its hash code can make the entry unreachable.
# Question: Are mutable Arrays, Hashes, or custom objects used as keys?
# Run: ruby cases/18_mutated_hash_key.rb

key = ["north"]
routes = { key => "worker-1" }
key << "priority"

p lookup: routes[key], stored_key: routes.keys.first
# => { lookup: nil, stored_key: ["north", "priority"] }

# Safer: use immutable keys, duplicate and freeze them, or rehash after mutation.
