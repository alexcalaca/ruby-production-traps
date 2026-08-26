# Expected: Normalizing Hash keys preserves all entries.
# Observed: Keys that normalize to the same value collide, and one entry is lost.
# Question: Can key normalization turn distinct external inputs into one key?
# Run: ruby cases/32_transform_keys_collision.rb

headers = { "Content-Type" => "json", "content-type" => "xml" }
normalized = headers.transform_keys(&:downcase)

p before: headers, after: normalized
# => { before: { ...two entries... }, after: { "content-type" => "xml" } }

# Safer: detect collisions before transforming or collect all values per normalized key.
