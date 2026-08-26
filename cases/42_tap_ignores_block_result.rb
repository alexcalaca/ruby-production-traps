# Expected: tap returns the normalized value produced by its block.
# Observed: tap always returns its receiver and ignores the block's result.
# Question: Is tap being used for transformation rather than observation or mutation?
# Run: ruby cases/42_tap_ignores_block_result.rb

status = " PAID ".tap { |value| value.strip.downcase }

p status
# => " PAID "

# Safer: use then/yield_self for transformation, or mutate intentionally inside tap.
