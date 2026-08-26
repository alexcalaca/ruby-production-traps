# Expected: The loop variable disappears when the loop finishes.
# Observed: for does not create a new local scope, so the variable remains.
# Question: Can a loop overwrite a meaningful local variable used afterward?
# Run: ruby cases/44_for_loop_variable_leaks.rb

# These warnings describe the behavior this case intentionally demonstrates.
# rubocop:disable Lint/UselessAssignment, Style/For
environment = :production

for environment in [:staging, :test]
  # work
end
# rubocop:enable Lint/UselessAssignment, Style/For

p environment
# => :test

# Safer: prefer each blocks and avoid reusing outer local names.
