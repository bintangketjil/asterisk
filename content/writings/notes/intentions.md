---
title: "Intentions"
date: 2026-08-18
category: writings
type: note
css: /static/css/style.css
---

::: {.container}
::: {tag="div" .article-content .maxw-base}
# Intentions

Things should be made with some kind of intentions, right?
Is it plain or not in the result would be another thing.
I think it aplies not only in particular, but in grand things too.

Take every day's life, we wake up in the morning --- or whatever your wake up time is,
with the intention to make stories out of this absurd routine [?].
Or me deciding a function should take list of inputs with the intention
to have immediate representation of how the output should be ordered.

Given input is a list of paths to some files, then I can structure them
in a way that make sense to me; the ordering of paths, we want it to group
naturally instead of whatever glob ordering they give us.
I want to have control too in deciding wether in that specific group
what path comes first.

I think that's what I was doing with [2fontface](link) pipeline.
Previously it just list file paths on given directory and for each files
initialize some values and then generate `@font-face` rules from it.

But now I think it is much cleaner, we separate jobs across functions,
we decide to sort files in discovering stage, and later do grouping
with more meaningful values, and better understading of what groups key is
and what groups value is.
Because I use associative array with groups key being the identity of a font
and groups value is the source of the font.

Besides that I also have font file, family, and face. Each has it's own meaning.
Several font files --- whether its format or variant of a file --- can represent
one font family, and face is the variant of a font. It is something like this:

~~~shell
+ font file (5)
- Inter (3 faces)
- Helvetica (2 faces)
~~~

I know I'm not making something new, but I guess I just like to do this kind of thing.
To finally understand what I really want, to build it with the same vision that
I had when I was thinking about doing the thing. And I know I'm using the word 'thing' alot. haha.

This is my first note entry. I should write more often, instead of just thinking about writing things.
:::
:::
