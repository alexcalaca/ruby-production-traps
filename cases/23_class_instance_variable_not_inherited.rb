# Expected: A subclass reads the class-level configuration set by its parent.
# Observed: Class-instance variables belong to each Class object and are not inherited.
# Question: Is inheritance of class-level configuration explicit or merely assumed?
# Run: ruby cases/23_class_instance_variable_not_inherited.rb

class ApiClient
  @timeout = 5

  class << self
    attr_reader :timeout
  end
end

class AdminClient < ApiClient
end

p parent_timeout: ApiClient.timeout, child_timeout: AdminClient.timeout
# => { parent_timeout: 5, child_timeout: nil }

# Safer: make the reader fall back to superclass or copy configuration in inherited.
