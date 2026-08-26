# Expected: Forwarding *arguments preserves keyword arguments.
# Observed: On modern Ruby, the captured Hash is forwarded as a positional argument.
# Question: Does a delegator explicitly accept and forward **keywords?
# Run: ruby cases/48_keyword_delegation_needs_double_splat.rb

def request(timeout:)
  timeout
end

def forward(*arguments)
  request(*arguments)
end

begin
  forward(timeout: 5)
rescue ArgumentError => error
  p error: error.class, message: error.message
end
# => { error: ArgumentError, message: "wrong number of arguments..." }

# Safer: def forward(*args, **kwargs); request(*args, **kwargs); end
