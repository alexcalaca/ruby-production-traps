# Expected: Freezing a configuration prevents any later mutation.
# Observed: freeze affects only the outer object; nested objects remain mutable.
# Question: Does an apparently immutable constant contain mutable descendants?
# Run: ruby cases/20_freeze_is_shallow.rb

config = { headers: { "Accept" => "application/json" } }.freeze
config[:headers]["Authorization"] = "secret"

p config
# => { headers: { "Accept" => "application/json", "Authorization" => "secret" } }

# Safer: recursively freeze nested state or construct deeply immutable values.
