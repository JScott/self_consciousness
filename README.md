# self_consciousness

A module on top of self_identity to store what's "normal" and how the code has changed since then.

Use `require 'self_identity'` in the script you want to be conscious of. Then have the script, or the script running it, call `SelfConsciousness.normalize`. Whenever that script calls `SelfConsciousness.report`, you'll get a diff of the method chain since you last normalized. You can also call `SelfConsciousness.introspect` to create the diff without reporting.

Confused? Check out the `example` directory.

If you don't know what the method chain is, check out [self_identity](https://github.com/colstrom/self_identity) first.

## Data format:

Inside .self_consciousness you'll find the following key/value Moneta stores:

- `dependencies`: the method chain dependencies that are "normal"
- `additions`: the dependencies that have been added since normalizing
- `removals`: the dependencies that have been removed since normalizing
