# Contributing to bobatheme

## Where to put questions/issues/etc

For now, please use [GitHub
Issues](https://github.com/BBaoVanC/bbaovanc.com/issues) for issues and [GitHub
Discussions](https://github.com/BBaoVanC/bbaovanc.com/discussions) for anything
else. I will look into making my own forum in the future for this.

## Building

Just in case you need it.

## Automatic deploy previews with GitHub Actions

My GitHub Actions workflows will automatically build each pull request into a
public deploy preview on demo.bbaovanc.com, and will link it in a comment.

## Manual (local) building

You can also build the site yourself using Hugo, including a live local preview.

1. Make sure you install the latest version of Hugo, or hopefully at least the
   `min_version` listed in
   [theme.toml](https://github.com/BBaoVanC/bobatheme/blob/master/theme.toml#L11).
   Let me know if that minimum version isn't enough and I'll fix it.
2. Clone the repo
3. Make sure to download and checkout the submodules (use `git submodule update
   --init --recursive`). The `--recursive` flag is especially important because
   bobatheme has a submodule in itself for icons.
4. Run `hugo serve -D` to run a local webserver. Hugo will show the URL you can
   access the preview at. It will automatically rebuild and reload pages when
   you save them.
