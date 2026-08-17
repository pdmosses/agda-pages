# CHANGELOG

The `main` branch of the Agda-Pages repository may have been updated since
the latest release; significant unreleased updates are listed below.

The Agda-Pages documentation website is built and deployed from the latest commit
of the `main` branch.

Major updates are generally tested in the `dev` branch of the repository before
they are merged into the `main` branch.

## Upgrading to the latest commit

Assuning that you have added the Agda-Pages repository to your repository as a
Git submodule, you can upgrade to the latest commit of the `main` branch by
executing the following command in your root directory:

```sh
git submodule update --remote
```

----

## [Unreleased] – 2026-08-17

- Fix non-POSIX-compatible use of `type` in `agda-pages.mk`

----

## [0.0.1] – 2026-08-16

This is the *initial alpha-release* of Agda-Pages. The following websites
were generated and deployed using this release:

-   [Agda-Pages Demo](https://pdmosses.github.io/agda-pages-demo/)
-   [XDS-Agda](https://pdmosses.github.io/xds-agda/dev/)
-   [Agda-StdLib Pages](https://pdmosses.github.io/agda-stdlib/pages/master/)
-   [TypeTopology Pages](https://pdmosses.github.io/TypeTopology/)

Much of the code in v0.0.1 was originally copied from the
[Agda-Material](https://github.com/pdmosses/agda-material/) template.
Agda-Material users should note the following *significant differences*:

-   The Agda-Pages repository is intended for use as a Git submodule.
-   Agda-Pages uses a subdirectory of your repository for website generation. 
-   Agda-Pages does not support inclusion in generated websites of the
    plain HTML pages produced by the Agda back-end.
-   Agda-Pages supports metadata in literate Markdown Agda files.
-   The names of the Makefile arguments differ from Agda-Material.
-   Argument value lists are space-separated.
-   The `docs`, `site`, and `temp` directories are siblings of your
    `Makefile` and `mkdocs.yml` files.
-   All non-generated Markdown source files in `docs` need to be listed
    as protected.
-   Extra javascripts and stylesheets can be added only in designated
    `custom` files.

----

## Format

The CHANGELOG format follows [keepachangelog]:

### Changed

### Deprecated

### Removed

### Fixed

### Security

(Empty subsections are to be omitted in future releases.)

## Versioning

The code release numbering follows [semantic versioning]: A version number is
of the form *X.Y.Z*, where *X* is the major version, *Y* is the minor version,
and *Z* is the patch version. When referring to version numbers, they are prefixed
by '*v*'.

Major version zero (*0.Y.Z*) is for initial development, where anything *may*
change at any time. In practice, the patch version *Z* is incremented for bug
fixes and backwards compatible changes; those that introduce new features,
affect the UI, or could break generated websites are indicated by incrementing
the minor version *Y*.

> [!NOTE]
> Minor updates to the Agda-Pages documentation are deployed silently,
> independently of code releases.

The `main` branch of the repo may include unreleased changes. A `dev` branch
will be used for development, and inherently unstable.

[keepachangelog]: https://keepachangelog.com/en/1.1.0/
[semantic versioning]: https://semver.org

[unreleased]: https://github.com/pdmosses/agda-pages/compare/v0.0.1...HEAD
[0.0.1]:      https://github.com/pdmosses/agda-pages/releases/tag/v0.0.1