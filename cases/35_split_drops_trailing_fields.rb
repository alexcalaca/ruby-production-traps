# Expected: Splitting CSV-like input preserves every column, including empty ones.
# Observed: String#split removes trailing empty fields by default.
# Question: Can missing trailing columns change the meaning or shape of imported data?
# Run: ruby cases/35_split_drops_trailing_fields.rb

row = "paid,,"

p default_split: row.split(",")
p preserving_split: row.split(",", -1)
# => { default_split: ["paid"] }
# => { preserving_split: ["paid", "", ""] }

# Safer: pass -1 or use the CSV standard library for CSV data.
