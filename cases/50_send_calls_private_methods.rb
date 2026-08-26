# Expected: A private method cannot be called with an explicit receiver.
# Observed: send bypasses method visibility; public_send enforces it.
# Question: Can user-controlled method names reach private behavior through send?
# Run: ruby cases/50_send_calls_private_methods.rb

class Vault
  private

  def secret
    "launch-code"
  end
end


vault = Vault.new
via_send = vault.send(:secret)
via_public_send = begin
  vault.public_send(:secret)
rescue NoMethodError => error
  error.class
end

p via_send: via_send, via_public_send: via_public_send
# => { via_send: "launch-code", via_public_send: NoMethodError }

# Safer: use public_send for externally selected public operations and allowlist names.
