---
name: roast
description: Run ponytail-review in a fresh context with high effort & no conversation history
context: fork
background: false
disable-model-invocation: true
effort: high
---

Invoke the ponytail-review skill and follow it to review: $ARGUMENTS

If no target is given, review everything on this branch, including
uncommitted work: `git diff $(git merge-base HEAD $(git symbolic-ref --short refs/remotes/origin/HEAD))`,
plus any untracked files listed by `git status --short`.
If `origin/HEAD` isn't set, use the merge base with `main` or `master`, whichever exists.
