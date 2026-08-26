# Expected: A JSON round trip preserves Ruby Symbol keys.
# Observed: JSON object keys are Strings, so Symbol-key lookups stop working.
# Question: Are key types normalized after crossing a serialization boundary?
# Run: ruby cases/57_json_stringifies_symbol_keys.rb

require "json"

original = { status: "paid" }
round_trip = JSON.parse(JSON.generate(original))

p keys: round_trip.keys, symbol_lookup: round_trip[:status], string_lookup: round_trip["status"]
# => { keys: ["status"], symbol_lookup: nil, string_lookup: "paid" }

# Safer: normalize keys explicitly or parse with symbolize_names: true when appropriate.
