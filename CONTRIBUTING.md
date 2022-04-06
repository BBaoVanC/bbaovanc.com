# Contributing to bobatheme

## Where to put stuff

### Discussions

The best place to ask questions or have discussions is the (relatively new)
discussions feature on GitHub, available
[here](https://github.com/BBaoVanC/bbaovanc.com/discussions). It's not too big
of an issue though because discussions and issues can easily be converted
between eachother.

### Issues

Issues should be used only for, well, issues. Ignore all the placeholder ones
prefixed with "Translate:" and tagged with the "translation" tag as they are
placeholders used in the projects tab. I might mark them as closed in the future
to clean it up but I'll worry about that later.

### Translations

Discussion relating to translations should either go as comments or reviews on
the pull request adding the translation, or as a discussion under the
[Translations category](https://github.com/BBaoVanC/bbaovanc.com/discussions/categories/translations).

## Writing translations

Translations should aim to get the meaning as close as possible to original
document. The changes in a translation pull request *should*:

- only update one page (multiple pages should be split into separate pull
  requests)
- only contain changes for a single new file (no changes unrelated to
  translation)
- thoroughly compared to the original text in order to get the same meaning
  across

## Pull requests

### Commit messages

It's not too big of a deal what you put in your commit messages, but try to give
each commit a rough description of what it changes. I'll use squash merges most
of the time anyways.

### Description

If the pull request doesn't require any extra information in addition to the
title, you can probably leave the description blank. Otherwise you can put some
information, just try to keep it concise; it's better to read a couple sentences
than an entire essay with the same amount of information.

## Building

## Automatic deploy previews with GitHub Actions

My GitHub Actions workflows will automatically build each pull request into a
public deploy preview on demo.bbaovanc.com, and will link it in a comment.

## Manual (local) building

You can also build the site yourself using Hugo, including a live local preview.

1. Make sure you install the latest version of Hugo, or at least the
   `min_version` listed in
   [theme.toml](https://github.com/BBaoVanC/bobatheme/blob/master/theme.toml#L11).
2. Clone the repo
3. Make sure to download and checkout the submodules (use `git submodule update
   --init --recursive`). The `--recursive` flag is especially important because
   bobatheme has a submodule in itself for icons.
4. Run `hugo serve -D` to run a local webserver. Hugo will show the URL you can
   access the preview at. It will automatically rebuild and reload pages when
   you save them.
