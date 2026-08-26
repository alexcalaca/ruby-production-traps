# Expected: defined? returns a Boolean.
# Observed: It returns a descriptive String or nil.
# Question: Is that result serialized or compared strictly with true?
# Run: ruby cases/41_defined_returns_string.rb

result = defined?(puts)

p value: result, class: result.class, equals_true: (result == true)
# => { value: "method", class: String, equals_true: false }

# Safer: use !!defined?(expression) when a real Boolean is required.
