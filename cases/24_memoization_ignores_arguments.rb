# Expected: A memoized method returns a result for each argument.
# Observed: One instance variable caches only the first call, regardless of arguments.
# Question: Is every input that affects the result represented in the cache key?
# Run: ruby cases/24_memoization_ignores_arguments.rb

class Price
  def converted(currency)
    @converted ||= "100 #{currency}"
  end
end

price = Price.new

p usd: price.converted("USD"), eur: price.converted("EUR")
# => { usd: "100 USD", eur: "100 USD" }

# Safer: cache by argument, for example @converted ||= {}; @converted[currency] ||= ...
