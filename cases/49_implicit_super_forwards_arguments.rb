# Expected: super calls the parent implementation without the child's options.
# Observed: Bare super forwards every argument and the block automatically.
# Question: Does the parent method accept the exact same call contract?
# Run: ruby cases/49_implicit_super_forwards_arguments.rb

class BaseCache
  def refresh
    :refreshed
  end
end

class ForcedCache < BaseCache
  def refresh(force: false)
    super
  end
end

begin
  ForcedCache.new.refresh(force: true)
rescue ArgumentError => error
  p error: error.class, message: error.message
end
# => { error: ArgumentError, message: "wrong number of arguments..." }

# Safer: use super() to forward nothing, or pass the intended arguments explicitly.
