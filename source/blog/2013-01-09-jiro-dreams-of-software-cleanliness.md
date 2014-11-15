---
title: Jiro Dreams of Software - Maintain Cleanliness
---
Code cleanliness is one of the easiest ways to tell if a developer actually cares about what they are doing. I define code cleanliness as a lack of anything without meaning and a consistent code style. This means that there is no unneeded spacing, no unused files checked into source control, no obvious comments.

By consistent style, I mean that the code follow all of the conventions for the particular language, and the code looks the same throughout the project. You shouldn't be able to tell when different developers have worked on the same file.

This may sound knit-picky and irrelevant, but keeping a code base clean can go a long way toward making it maintainable. Software projects can suffer from the [Broken Window Theory](http://en.wikipedia.org/wiki/Broken_windows_theory), where it is easy to think thoughts like "Well, this class looks bad anyway. Why even bother to refactor it?" It's best to stamp out those thoughts on the smallest level possible.

As an aside, if you're a vim user try adding `set list listchars=tab:▸\ ,trail:·` to your config to help you keep track of errant whitespace.