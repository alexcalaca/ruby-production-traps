# Expected: Building a lazy pipeline executes its mapping block.
# Observed: No work or side effect occurs until a consumer requests values.
# Question: Does correctness depend on a lazy pipeline being fully consumed?
# Run: ruby cases/28_lazy_enumerator_defers_work.rb

processed = []
pipeline = [1, 2, 3].lazy.map do |id|
  processed << id
  id * 10
end

p after_build: processed
p first_value: pipeline.first, after_first: processed
# => { after_build: [] }
# => { first_value: 10, after_first: [1] }

# Safer: keep side effects outside lazy transformations or force evaluation explicitly.
