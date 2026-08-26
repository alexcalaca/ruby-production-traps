# Expected: dup creates a behaviorally identical copy of an object.
# Observed: dup omits singleton methods, while clone preserves them.
# Question: Does copied runtime-decorated behavior matter to this object?
# Run: ruby cases/52_dup_drops_singleton_methods.rb

client = Object.new

def client.region
  :east
end

duplicate = client.dup
clone = client.clone

p duplicate_responds: duplicate.respond_to?(:region), clone_responds: clone.respond_to?(:region)
# => { duplicate_responds: false, clone_responds: true }

# Safer: avoid singleton customization for copyable values or choose clone deliberately.
