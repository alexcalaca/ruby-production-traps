# Expected: status = inside an instance method invokes status=.
# Observed: Without an explicit receiver, Ruby creates a local variable.
# Question: Did an apparent state update call the writer or only bind a local?
# Run: ruby cases/47_local_assignment_skips_setter.rb

class Order
  attr_reader :status

  def initialize
    @status = :pending
  end

  def mark_paid
    status = :paid
    status
  end
end

order = Order.new
method_result = order.mark_paid

p method_result: method_result, stored_status: order.status
# => { method_result: :paid, stored_status: :pending }

# Safer: write self.status = :paid and provide the corresponding writer.
