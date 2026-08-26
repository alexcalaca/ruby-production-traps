# Expected: A one-character String occupies one byte in a storage or protocol limit.
# Observed: length counts characters while bytesize counts encoded bytes.
# Question: Is the limit defined in characters, bytes, or display width?
# Run: ruby cases/36_string_length_vs_bytesize.rb

card = "💳"

p length: card.length, bytesize: card.bytesize, encoding: card.encoding.name
# => { length: 1, bytesize: 4, encoding: "UTF-8" }

# Safer: validate against the unit required by the database or external protocol.
