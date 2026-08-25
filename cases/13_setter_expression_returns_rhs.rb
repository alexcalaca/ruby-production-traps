# Expected: Calling a setter expression returns the setter method's result.
# Observed: Ruby makes an assignment expression return its right-hand side.
# Question: Is caller logic relying on the return value of a writer method?
# Run: ruby cases/13_setter_expression_returns_rhs.rb

class Account
  attr_reader :status

  def status=(value)
    @status = value.strip.downcase
    # rubocop:disable Lint/Void -- exposes the setter's ignored method result.
    :stored
    # rubocop:enable Lint/Void
  end
end

account = Account.new
result = (account.status = " PAID ")

p status: account.status, assignment_result: result
# => { status: "paid", assignment_result: " PAID " }

# Safer: assign first, then query explicit state or call a non-setter command method.
