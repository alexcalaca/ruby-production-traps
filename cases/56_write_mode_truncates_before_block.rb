# Expected: A file remains intact if an error occurs before writing in the block.
# Observed: Opening with "w" truncates the file before the block body runs.
# Question: Can an interrupted rewrite destroy the last good configuration?
# Run: ruby cases/56_write_mode_truncates_before_block.rb

require "tempfile"

Tempfile.create("production-trap") do |file|
  file.write("important-data")
  file.flush

  begin
    File.open(file.path, "w") { raise "failed before write" }
  rescue RuntimeError
    # Inspect the file after the simulated failure.
  end

  p contents_after_failure: File.read(file.path)
end
# => { contents_after_failure: "" }

# Safer: write a sibling temporary file, fsync it, then atomically rename it.
