Issues I noticed in tests:

# Bidi algorithm

`usage-01.tex` quotes `fa-hafez`.  On the first line, we see a parenthesis
typeset incorrectly.  I tried `method=one`, `method=two`, `method=three` and `method=unicode`.  None seems to work.

The same problem shows towards the end of `usage-07.tex` when
we add parenthesis to the item head.

# Math

Theorem environments have RTL issues.  These are based on `enumeration`
constructs of CONTEXT.  Only some cases seem to work, and with certain
hacks.

For example, with `alternative=serried`, the head alignment needs to be explicitly set to RTL (`headstyle=\righttoleft\bf`).
