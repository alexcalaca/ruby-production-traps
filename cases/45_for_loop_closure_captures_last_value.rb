# Expected: Each callback remembers the loop value from its own iteration.
# Observed: for reuses one local variable, so every closure sees its final value.
# Question: Does deferred work capture a value or one changing variable binding?
# Run: ruby cases/45_for_loop_closure_captures_last_value.rb

callbacks = []

# rubocop:disable Style/For -- the for binding is the trap under demonstration.
for tenant in ["alpha", "beta"]
  callbacks << -> { tenant }
end
# rubocop:enable Style/For

p callbacks.map(&:call)
# => ["beta", "beta"]

# Safer: use each, whose block parameter has per-invocation bindings.
