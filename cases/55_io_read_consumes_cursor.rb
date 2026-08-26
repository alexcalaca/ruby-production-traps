# Expected: Reading an IO object twice returns its contents twice.
# Observed: The first read advances the cursor; the second begins at end-of-file.
# Question: Is a stream being retried or inspected after another consumer read it?
# Run: ruby cases/55_io_read_consumes_cursor.rb

require "stringio"

stream = StringIO.new("payload")

p first_read: stream.read, second_read: stream.read
# => { first_read: "payload", second_read: "" }

# Safer: rewind seekable streams or pass the already-read value onward.
