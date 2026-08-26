# Expected: Thread#join returns the value computed by the worker.
# Observed: join returns the Thread object; Thread#value returns the computed value.
# Question: Is orchestration accidentally passing a Thread instead of its result?
# Run: ruby cases/60_thread_join_returns_thread.rb

worker = Thread.new { 42 }
joined = worker.join

p join_is_worker: joined.equal?(worker), computed_value: worker.value
# => { join_is_worker: true, computed_value: 42 }

# Safer: use join only for synchronization and value when the result is needed.
