# Configuration

This section explains the organization of the files and directories used by
Agda-Pages to generate websites, and how to configure Agda-Pages. The
[Agda-Pages Demo] repository illustrates the details.

## Files and directories

The [Agda-Pages Demo] repository is organized as follows:

```
.
├─  LICENSE
├─  README.md
├─  agda/
│   ├─ Demo/
│   │  ├─ index.lagda.md
│   │  └─ ...
│   ├─ .gitignore
│   └─ demo.agda-lib
└─  pages/
    ├─  agda-pages/
    │   └─ ...
    ├─  docs/
    │   ├─ .nav.yml
    │   ├─ Library/
    │   │  └─ index.md
    │   └─ index.md
    ├─  Makefile
    └─  mkdocs.yml
```

### Agda code directory

Your Agda code can be in multiple directories (including your repository root
directory). You configure their location in your `Makefile`. The default
location is a sibling directory of your `Makefile` named `agda`.

!!! warning

    A top-level Agda module named *either* `index` *or* `README`
    generates the **home page** for the website!

In the demo repository, all the Agda code is in the subdirectory `agda/Demo`,
and the name of the module in `agda/Demo/index.lagda.md` is `Demo.index`; the
source file for the demo website home page is the ordinary Markdown file
`pages/docs/index.md`.

### Pages directory

To generate webpages listing your Agda code, Agda-Pages requires a
*subdirectory* of your repository. You configure its location in your
`Makefile`; the default is a top-level directory named `pages` (as in the
demo repository).

The pages directory should contain a directory `docs`, a `Makefile`, and a
`mkdocs.yml` website configuration file; you cannot configure these names.
The contents are explained below.

The pages directory is also the default location for the `agda-pages` submodule
(as in the demo repository); you can configure a different location in the
`Makefile`.

!!! warning

    Agda-Pages may overwrite other files in the pages directory.

#### `docs` directory

Unless you have an Agda module named `index` or `README`, Agda-Pages requires
the `docs` directory to contain a Markdown source file for your home page,
named *either* `index.md` *or* `README.md`.[^1]

[^1]:
    The website builder used by Agda-Pages (MkDocs) treats `index.md` and
    `README.md` as equivalent source files for the webpage `index.html`.
    If both an `index.md` file and a `README.md` file are found in the same
    directory, then the `index.md` file is used and the `README.md` file is
    ignored.

In general, Agda-Pages generates a Markdown source file in `docs` from each
Agda code file. You configure the Agda root module name(s) in your `Makefile`;
Agda-Pages generates a webpage for each (transitively) imported Agda file,
and ignores any non-imported Agda files.

The `docs` directory should contain Markdown source files for all webpages that
are not generated from your Agda code. The paths of such Markdown files
(relative to `docs`) should be disjoint from the paths of your Agda files
(relative to the Agda code directory), to avoid the risk of overwriting your
Markdown files with generated files. For example, the demo repository contains
`pages/docs/Library/index.md` (to generate a webpage at the URL `Library/`)
assuming that the imported library modules do not include a module named
`Library` or `Library.index`!

!!! warning

    All files in the `docs` directory other than Markdown source files are
    included in the generated website.

## Configuration files

### `Makefile`

This file has to be a sibling of `docs`. It should set all non-default argument
values before including `agda-pages.mk` from the `agda-pages` directory.

For example, the `Makefile` in the demo repository is:

```makefile
SOURCES := ../agda
MODULES := Demo.index
PROTECT := docs/index.md docs/Library/index.md

include agda-pages/agda-pages.mk
```

The full list of arguments and their default values is as follows.

argument     | default      | interpretation
------------ | ------------ | --------------------------------------------------
`AGDA-PAGES` | `agda-pages` | path to the `agda-pages` submodule directory
`SOURCES`    | `agda`       | Agda import include-path(s), separated by spaces
`MODULES`    | `index`      | Agda root module name(s), separated by spaces
`PROTECT`    |              | protected file path(s), separated by spaces
`INDEXES`    | `true`       | linking directory names to `index` pages
`SERVER`     | `8000`       | `localhost` port for `make serve` 
`SD`         | `sd`         | for sd v1.0.0; for sd v1.1.0 set `SD := sd -A`

!!! info

    The `SD` argument addresses a recent breaking change in `sd v1.1.0`;
    see the [sd] repository.

(`VERSION` is an optional argument of some versioning commands, and
should *not* be set in the `Makefile`.)

The paths in the `Makefile` are relative to the pages directory. 

`PROTECT` should include all your non-generated Markdown source files,
to avoid their removal during website generation. A glob pattern such as
`docs/.../*.md` protects all the files in a subdirectory `...` of the `docs`
directory.

### `mkdocs.yml`

This file has to be a sibling of `docs`. *After* inheriting `agda-pages.yml`
from the `agda-pages` directory, it should specify the `site_name` of the
website; it may also specify the `site_url`, `repo_name`, and `repo_url`. 

For example, the `mkdocs.yml` in the demo repository is:

```yaml
INHERIT:   agda-pages/agda-pages.yml

site_name: Agda-Pages Demo
site_url:  https://pdmosses.github.io/agda-pages-demo/
repo_name: agda-pages-demo
repo_url:  https://github.com/pdmosses/agda-pages-demo
```

The `mkdocs.yml` may also extend or override the values of keys specified
in the inherited `agda-pages` file, such as the default list of theme
features (see the [Features] section).

### `.nav.yml`

The file `.nav.yml` in the `docs` directory of the demo repository separates
the navigation for the webpages generated from the modules in your Agda code
directory from those generated from imported library files, by filtering on
the glob pattern `Demo/*`. See the [Awesome-nav] plugin documentation for
explanations of further possibilities.

[Agda-Pages Demo]: https://github.com/pdmosses/agda-pages/
[Features]:        Features.md
[Awesome-nav]:     https://lukasgeiter.github.io/mkdocs-awesome-nav/
