# Ruby Production Traps

Small, executable examples of Ruby behavior that can cause real production bugs.
The cases focus on semantics and state, not formatting or cosmetic style.

## Structure

Every file in `cases/` is standalone and contains:

- **Expected** — the tempting assumption.
- **Observed** — Ruby's actual behavior.
- **Question** — the review prompt that exposes the trap.
- **Run** — the command to reproduce it.
- **Safer** — a compact safer alternative.

Run one case from this directory:

```sh
ruby cases/01_shared_string_reference.rb
```

Run all cases:

```sh
for case_file in cases/*.rb; do ruby "$case_file"; done
```

The examples target core Ruby and its standard library; they do not depend on
Rails or this enclosing application.
