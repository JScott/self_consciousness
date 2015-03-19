# self_consciousness

A module on top of self_identity to store what's "normal" and how the code has changed since then.

## Usage

First, use [self_identity](https://github.com/colstrom/self_identity) in your code, this builds on top of that.

Run `self_consciousness normalize` to set the identity in your current directory as "normal". Then run `self_consciousness report` to print a diff of what changed in the most recent run from that.

You can also use it in code with `SelfConsciousness.normalize` and `SelfConsciousness.report` if that helps you in some way. The bin is just a wrapper around that. You can also call `SelfConsciousness.introspect` which will set the data for reporting but not generate the diff.

## Confused?

Check out the `example` directory.

## Data format:

Inside .self_consciousness you'll find the following key/value Moneta stores:

- `dependencies`: the method chain dependencies that are "normal"
- `additions`: the dependencies that have been added since normalizing
- `removals`: the dependencies that have been removed since normalizing
