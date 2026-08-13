---
title: Asterisk
date: 2026-07-27
category: page
type: root-index
css: /static/css/style.css
---

:::::::: {.container .grid .split .gap-6}

::::::: {tag="aside" .font-sans .text-xs .muted}

Asterisk is an archive of things that have stayed with me long enough to be worth keeping.

Epoch &middot; 2026 \
Entry &middot; 0010

:::::::

::::::: {.content}

:::::: {tag="section" .intro}

![Wizard Frog greets you all.](/static/images/frog0.svg){height="100"}

This is where I supposedly live my digital life.

Sometimes I [write](link) about things I've learned and occasionally understood, or about things that have taken my interest. Or I spend hours on the web, collecting a pile of [references](link) on various topics. Or [tinkering](link) with
stuff I don't really know about. Or take [notes](link) about what does this mean anyway.

You can browse it [chronologically](link) or take a look at the [graph](link).

I hope you find something worth carrying with you.
::::::


:::::: {tag="section" .featured .counter}
## Featured
::::: {tag="a" href="link" .featured-link}

::feed(src="recent" tag="featured")

:::::
::::::


:::::: {tag="section" .recent .counter}
## Recent
::::: {.recent-list}

::feed(src="recent" limit=5)

:::::

::::: {.block .marginy-4}
[See All](link)
:::::
::::::


:::::: {tag="section" .current .counter}
## Currently

### Building

[Artifact](link)

A tiny publishing system.

Built with Bash, Lua, Pandoc, and some other unix utilites.

Updated on ::value(artifact-update)

[Source](link) [About](link)

[Asterisk](link)

An ongoing archive.

Built with Markdown and [Artifact](link).

Updated on ::@value(asterisk-update)

[Source](link) [About](link)

### Reading

Not much for now.

- Dune (::value(dune-percent)%)
- Programming with Lua (::value(plua-percent)%)
- Bash CookBook (::query(bcookbook-percent)%)

See [list](link) for what it should've been.

### Learning

Even smaller.

- Bash
- Math
::::::

:::::::

::::::::
