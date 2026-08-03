# User Guide

This section explains how to use Agda-Pages to generate and publish a website
with highlighted listings of your (plain and/or literate) Agda source files.

!!! warning

    Web pages are generated from plain Agda and literate **LaTeX**
    (`*.lagda`, `*.lagda.tex`) or **Markdown** (`*.lagda.md`) Agda.
    Imports of other kinds of literate Agda will result in *missing pages*
    and *broken links!*

It is assumed that you have some Agda code in a GitHub repository. The
[Agda-Pages repository] `README` file indicates how to install Agda-Pages
in your repository, and lists its software dependencies.

The **[Configuration]** section explains the files and directories used by
Agda-Pages to generate websites, and how to configure Agda-Pages.

The **[Features]** section lists optional theme features that affect the
appearance of generated websites, and explains how to override the default
feature list.

The **[Generation]** section summarizes all the `make`-commands defined by
Agda-Pages.

[Configuration]:         Configuration.md
[Features]:              Features.md
[Generation]:            Generation.md
[Agda-Pages Repository]: https://github.com/pdmosses/agda-pages/
