# Expected: ^ and $ require the entire String to match.
# Observed: They anchor a line, so a dangerous second line can pass validation.
# Question: Is a line-oriented regular expression validating a whole payload?
# Run: ruby cases/17_regex_line_anchors.rb

role = "admin\nattacker"

p line_anchored: !!(/^admin$/ =~ role)
p string_anchored: !!(/\Aadmin\z/ =~ role)
# => { line_anchored: true }
# => { string_anchored: false }

# Safer: use \A and \z for whole-String validation.
