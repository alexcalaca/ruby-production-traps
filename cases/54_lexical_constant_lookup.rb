# Expected: An inherited method body resolves DEFAULT from the superclass hierarchy.
# Observed: Lexical nesting can win before ancestor lookup.
# Question: Is an unqualified constant intentionally lexical in this class body?
# Run: ruby cases/54_lexical_constant_lookup.rb

class ParentClient
  DEFAULT = "parent"
end

module Region
  DEFAULT = "region"

  class ChildClient < ParentClient
    def self.default
      DEFAULT
    end
  end
end


p Region::ChildClient.default
# => "region"

# Safer: qualify constants when ownership matters, such as ParentClient::DEFAULT.
