# Expected: Reassigning the accumulator builds a numeric total.
# Observed: each_with_object always returns the original Integer object, here 0.
# Question: Is the accumulator mutable, or is the block only rebinding a variable?
# Run: ruby cases/09_each_with_object_immutable.rb

# These warnings describe the behavior this case intentionally demonstrates.
# rubocop:disable Lint/EachWithObjectArgument, Lint/UselessAssignment
total = [10, 20, 30].each_with_object(0) do |amount, sum|
  sum += amount
end
# rubocop:enable Lint/EachWithObjectArgument, Lint/UselessAssignment

p total
# => 0

# Safer: use sum or inject for immutable accumulators.
