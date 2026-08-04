# Generation

All `make` commands are to be run from the directory that contains
`mkdocs.yml`, `docs`, and your `Makefile`.

To check your Agda code, generate/update your local website,
and browse[^1] a preview of your website locally, run:

```sh
make check
make web
make serve
```

Then to publish the generated website on GitHub Pages, run:

```sh
make deploy
```

[^1]:
    By default, MkDocs serves the website at `localhost:8000`. You can change
    that by setting `SERVER` to a different port number in your Makefile.

MkDocs reports any broken internal links when serving or deploying the website.
You can also check *before* deploying that all internal and external links are
valid by installing [linkcheck], serving your website locally, and running:

```sh
your-path-to-linkcheck/linkcheck -e :your-localhost-port --skip-file your-path-to-agda-pages/skip.txt
```

To avoid error reports arising from checking links to CSS files, the skip-file
contains the line:

```sh
\.css$
```

Links to private or unpublished repositories are also reported as errors;
use a custom skip-file to suppress them.

| Command        | Effect                                              |
| -------------- | --------------------------------------------------- |
| `make check`   | load the root module(s) and all imported modules    |
| `make web`     | generate hyperlinked highlighted web pages          |
| `make serve`   | browse the generated web pages using a local server |
| `make deploy`  | deploy an *unversioned* website on GitHub Pages[^2] |

[^2]:
    In case of an [`RPC failed`][RPC failed] error, try running
    `git config --global http.postBuffer 10g`.

## Versioning

The [mike] utility makes it easy to deploy multiple versions of your website.
It is enabled by the following setting in `mkdocs.yml`:

```yaml
extra:
  version:
    provider: mike
```

A version selector is then shown at the top of each deployed page.

Version identifiers that "look like" versions (e.g. `1.2.3`, `1.0b1`, `v1.0`)
are treated as ordinary versions, whereas other identifiers, like `devel`,
are treated as development versions, and listed above ordinary versions.

When deploying the generated website as a version, other versions of the
website remain untouched. Deployed versions can however be subsequently
updated or deleted.

If the specified version has already been deployed, redeployment updates the
contents to the current generated website.

The Agda-Material `make` commands support a simple form of version management.
For further version management commands, see the [mike] documentation.

| Command                    | Effect                                   |
| -------------------------- | ---------------------------------------- |
| `make start-versioning`    | clear any *unversioned* deployed website |
| `make deploy  VERSION=...` | deploy version `...` of the website      |
| `make default VERSION=...` | set the default version to `...`         |
| `make delete  VERSION=...` | remove deployed version `...`            |
| `make list-versions`       | display a list of all deployed versions  |

!!! warning

    ***Deleting the `default` version can break existing links to your website!***

    To avoid that, first use `make default VERSION=...'` to change the default to
    a different version.

## Miscellaneous

| Command          | Effect                                                     |
| ---------------- | ---------------------------------------------------------- |
| `make clean`     | remove unprotected configuration-dependent generated files |
| `make clean-all` | remove all unprotected generated files                     |
| `make help`      | show explanations of the main targets                      |

!!! warning

    `make clean` and `make clean-all` **delete** the local generated website!

[mike]: https://github.com/jimporter/mike/
[linkcheck]: https://github.com/filiph/linkcheck/
[RPC failed]: https://stackoverflow.com/questions/15240815/
