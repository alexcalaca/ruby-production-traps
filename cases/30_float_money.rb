# Expected: Decimal-looking Float arithmetic is exact for money.
# Observed: Binary floating-point representation introduces a visible error.
# Question: Can rounding drift accumulate across financial calculations?
# Run: ruby cases/30_float_money.rb

total = 0.1 + 0.2

p total: total, exactly_thirty_cents: (total == 0.3)
# => { total: 0.30000000000000004, exactly_thirty_cents: false }

# Safer: use integer minor units or BigDecimal constructed from Strings.
