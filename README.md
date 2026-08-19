# Agda-Pages

Agda-Pages supports **generation of websites** with **module navigation**
between **highlighted, hyperlinked listings** of **plain** and **literate**
Agda code.[^1]

[^1]:
    Currently, Agda-Pages supports only the LaTeX and Markdown variants of
    literate Agda.

See the [Agda-Pages] website for an overview of the supported features and a
user guide.

See the [Agda-Pages Demo] website for examples of pages generated from some
Agda test files and their imported library files.

## Repository contents

To generate a website from Agda code, Agda-Pages requires installation of
the following files:

-   `javascripts/*.js`: Javascript files for Agda highlighting and [KaTeX]
-   `overrides/partials/path.html`: customization of Material for MkDocs theme
-   `stylesheets/*.css`: CSS files for Agda code highlighting
-   `agda-pages.mk`: make-commands for website generation and deployment
-   `agda-pages.yml`: a partial configuration file for generated websites

The remaining files document the installation and use of Agda-Pages:

-   `agda-pages-doc/`: source files for the [Agda-Pages] website
-   `agda-pages-features.yml`: the default list of theme features
-   `dependencies.sh`: a shell script to report installed package versions
-   `skip.txt`: a URL pattern for [linkcheck] to ignore

To serve the [Agda-Pages] doc website locally:

```sh
mkdocs serve --livereload --dev-addr localhost:8001
```

To deploy the [Agda-Pages] doc website to GitHub Pages:

```sh
mkdocs gh-deploy
```

> [!NOTE]
> gh-deploy calls `ghp_import`, but does not support its `prefix` option 

## Installation

To use Agda-Pages to generate a website from Agda code in your own repository,
it is recommended to install the Agda-Pages repository as a *submodule*.

The submodule can be located anywhere in your repository. For [Agda-Pages Demo],
it was added to the `pages` directory by executing the following commands[^2]
in the *Agda-Pages Demo root directory*:

```sh
git submodule add https://github.com/pdmosses/agda-pages pages/agda-pages
echo "\tbranch = main" >> .gitmodules
```

[^2]:
    Appending `branch = main` to `.gitmodules` avoids potential confusion
    that can arise from Git sometimes looking for a `master` branch.

The last argument of the above Git command determines the path to the added
submodule. To add the submodule to the root directory of your repository,
simply omit the last argument.

To upgrade the submodule to the latest commit of the Agda-Pages repositpry,
execute the following command in *your repository root directory*:

```sh
git submodule update --remote
```

(An alternative to adding Agda-Pages as a submodule is to copy the required
files manually.)

## Software dependencies

Agda-Pages has been tested with the software versions listed below.

-   [Agda] (2.8.0)
-   [Awesome-nav] (3.3.0)
-   [GNU Make] (3.81)
-   [MaterialX] (10.2.0)
-   [mike] (2.2.0)
-   [MkDocs] (1.6.1)
-   [pip] (26.2.1)
-   [Python 3] (3.14.7)
-   [sd] (1.0.0)

The Agda-Pages shell script `dependencies.sh` checks that the above software is
installed, and reports all the versions. Use of different versions might affect
generated websites, or lead to errors.

## Platform dependencies

Agda-Pages is intended for use on any Unix-like system. It has been developed
on MacBook laptops with Apple M1 and M3 chips running macOS Tahoe (26.5) with
CLI Tools.

## Contributing

Please report any [issues] with using Agda-Pages, including all relevant
details. [Pull requests] for addressing reported issues are welcome.
[Discussions] may include queries, comments, and suggestions for improvement,
announcements about Agda-Pages, and links to websites generated using it.

## Contact

Peter Mosses

[p.d.mosses@tudelft.nl]

[pdmosses.github.io]

[p.d.mosses@tudelft.nl]: mailto:p.d.mosses@tudelft.nl
[pdmosses.github.io]:    https://pdmosses.github.io

[Agda-Pages]:            https://pdmosses.github.io/agda-pages/
[Agda-Pages Repository]: https://github.com/pdmosses/agda-pages/
[Discussions]:           https://github.com/pdmosses/agda-pages/discussions/
[Issues]:                https://github.com/pdmosses/agda-pages/issues/
[Pull requests]:         https://github.com/pdmosses/agda-pages/pulls/
[Agda-Pages Demo]:       https://pdmosses.github.io/agda-pages-demo/

[Agda]:                  https://agda.readthedocs.io/en/stable/getting-started/index.html
[Awesome-nav]:           https://lukasgeiter.github.io/mkdocs-awesome-nav/
[GitHub Pages]:          https://pages.github.com
[GNU Make]:              https://www.gnu.org/software/make/manual/make.html
[KaTeX]:                 https://katex.org
[linkcheck]:             https://github.com/filiph/linkcheck/
[Material for MkDocs]:   https://squidfunk.github.io/mkdocs-material/getting-started/
[mike]:                  https://github.com/jimporter/mike/
[MkDocs]:                https://www.mkdocs.org/getting-started/
[pip]:                   https://pypi.org/project/pip/
[Python 3]:              https://www.python.org/downloads/
[sd]:                    https://github.com/chmln/sd/
