# Expected: Redefining an instance method also updates its module-function version.
# Observed: module_function copies the method; the two versions can diverge later.
# Question: Are module and mixed-in APIs assumed to be permanently identical?
# Run: ruby cases/53_module_function_copies_method.rb

module Formatter
  def label
    "version-1"
  end
  module_function :label

  # rubocop:disable Lint/DuplicateMethods -- redefinition exposes the copied method.
  def label
    "version-2"
  end
  # rubocop:enable Lint/DuplicateMethods
end


receiver = Object.new.extend(Formatter)

p module_call: Formatter.label, extended_call: receiver.label
# => { module_call: "version-1", extended_call: "version-2" }

# Safer: use extend self when one live implementation should serve both call styles.
