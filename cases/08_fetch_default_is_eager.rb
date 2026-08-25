# Expected: The fallback runs only when the key is absent.
# Observed: A fallback passed as an argument is evaluated before fetch is called.
# Question: Does the fallback perform I/O, logging, billing, or other side effects?
# Run: ruby cases/08_fetch_default_is_eager.rb

fallback_calls = 0
fallback = -> { fallback_calls += 1; "from-database" }
cache = { account: "cached" }

value = cache.fetch(:account, fallback.call)

p value: value, fallback_calls: fallback_calls
# => { value: "cached", fallback_calls: 1 }

# Safer: cache.fetch(:account) { fallback.call }
