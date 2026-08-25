# Expected: Each job starts with no tenant when it does not provide one.
# Observed: A reused worker Thread retains state left by the previous job.
# Question: Is request/job context cleared in ensure before a worker is reused?
# Run: ruby cases/26_thread_local_leaks_between_jobs.rb

jobs = [{ tenant: "tenant-a" }, {}]
observed_tenants = []

worker = Thread.new do
  jobs.each do |job|
    Thread.current[:tenant] = job[:tenant] if job.key?(:tenant)
    observed_tenants << Thread.current[:tenant]
  end
end
worker.join

p observed_tenants
# => ["tenant-a", "tenant-a"]

# Safer: set all context for every job and clear it in an ensure block.
