`prototype.rb` and `finalized.rb` represent two products in the early and late stage of development. Over time they add and remove functionality and we'd like to track how that changed, perhaps via a Continuous Integration server.

First, run `prototype.rb`. It requires [self_identity](https://github.com/colstrom/self_identity) which will save its state to file. This is what we want to base future comparisons off of so use `self_consciousness normalize` to set that run as "normal".

Then run `finalized.rb`. It will overwrite the previous identity with its own automatically, just like the prototype did. Now run `self_consciousness report` and the method chain differences will be printed.

If you normalize and report again without running any new code, it will let you know that nothing has changed.

## Warning

Make sure that you do this all from the same directory. Ruby will look to the current working directory to find the identity storages held in file.
