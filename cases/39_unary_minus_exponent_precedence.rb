# Expected: -2**2 squares negative two and produces positive four.
# Observed: Exponentiation binds first, so Ruby negates the result and returns -4.
# Question: Are negative bases parenthesized in formulas and financial rules?
# Run: ruby cases/39_unary_minus_exponent_precedence.rb

p without_parentheses: -2**2
p with_parentheses: (-2)**2
# => { without_parentheses: -4 }
# => { with_parentheses: 4 }

# Safer: parenthesize negative bases rather than relying on precedence memory.
