# Expected: Objects equal with == are interchangeable as Hash keys.
# Observed: Hash uses eql? and hash, which remain identity-based unless implemented.
# Question: Does a value object define ==, eql?, and hash consistently?
# Run: ruby cases/51_equality_without_hash_contract.rb

class UserId
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def ==(other)
    other.is_a?(UserId) && value == other.value
  end
end


first = UserId.new(7)
equivalent = UserId.new(7)
lookup = { first => :found }

p array_includes: [first].include?(equivalent), hash_finds: lookup.key?(equivalent)
# => { array_includes: true, hash_finds: false }

# Safer: implement eql? and hash from the same immutable fields used by ==.
