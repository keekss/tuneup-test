# Dotfiles Marker

This is a marker file to indicate a version of [Kiko's dotfiles](https://github.com/keekss/dotfiles) are present here, so as to prevent unwanted overwriting of other dotfiles.

> The __target directory__ is the parent directory of this file

The following directories (and all files therein) were copied into the target directory:

* `.devcontainer` (this file's directory)
* `.vscode`

The behavior of these dotfiles is determined by the target directory.

Target directory | Dotfiles behavior | Previous dotfiles | Reason
:-- | :-- | :-- | :--
Root of codespace | Active | Replaced | Either no dotfiles existed previously, or this marker file was present (indicating a previous version of these dotfiles was present).
`keekss-dotfiles` | Inactivate | Unmodified | No marker file present, indicating previous dotfiles were not a previous version of these dotfiles. Copying to a separate directory out of caution.
