# Expected: Range#cover? and Range#include? answer the same membership question.
# Observed: cover? compares endpoints; include? may enumerate discrete values.
# Question: Is the code checking an interval or membership in generated values?
# Run: ruby cases/37_range_cover_vs_include.rb

letters = "a".."z"

p cover: letters.cover?("dog"), include: letters.include?("dog")
# => { cover: true, include: false }

# Safer: choose cover? for bounds and include? for discrete membership deliberately.
