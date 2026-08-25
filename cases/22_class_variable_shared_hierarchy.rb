# Expected: A subclass can configure its class variable independently.
# Observed: @@ variables are shared across the inheritance hierarchy.
# Question: Can one subclass silently reconfigure its parent and siblings?
# Run: ruby cases/22_class_variable_shared_hierarchy.rb

# rubocop:disable Style/ClassVars -- the shared class variable is the trap.
class Job
  @@queue = :default

  def self.queue = @@queue

  def self.queue=(value)
    @@queue = value
  end
end

class EmailJob < Job
end

EmailJob.queue = :critical

p job_queue: Job.queue, email_queue: EmailJob.queue
# => { job_queue: :critical, email_queue: :critical }
# rubocop:enable Style/ClassVars

# Safer: prefer class-instance variables and define inheritance behavior explicitly.
