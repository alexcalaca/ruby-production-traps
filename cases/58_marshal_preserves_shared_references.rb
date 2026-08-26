# Expected: Serialization produces independent copies of repeated nested values.
# Observed: Marshal preserves aliasing relationships inside the object graph.
# Question: Can mutating one loaded branch unexpectedly update another branch?
# Run: ruby cases/58_marshal_preserves_shared_references.rb

shared = []
original = { primary: shared, backup: shared }

loaded = Marshal.load(Marshal.dump(original))
loaded[:primary] << :changed

p loaded
# => { primary: [:changed], backup: [:changed] }

# Safer: rebuild independent values when aliases are not part of the domain model.
