# dotfiles

Use GNU stow to place these files where you want them.

To stow package(s):

```sh
stow --dir=/path/to/dotfiles --target=/path/to/home/directory --simulate --verbose package1 package2
```

where,

- `--dir` is the path to your dotfiles repository

- `--target` is the base directory that your dotfiles structure starts from. For example, `dotfiles/btop/.config/btop/btop.conf` indicates I want my `btop.conf` to be inside `.config/btop`, and implicitly I want `.config` to lie in my home directory. Therefore, I would set the target to be my home directory

- `--simulate` allows you to do a dry-run first

- `--verbose[=n]` changes the verbosity level. n=3 allows you to really see what's going on.

Specifying the `dir` and `target` allows you to run this command from any directory on your computer and successfully stow the packages.

Resources:

- [Managing dotfiles with GNU stow](https://medium.com/quick-programming/managing-dotfiles-with-gnu-stow-9b04c155ebad)

- [GNU Stow Documentation](https://www.gnu.org/software/stow/manual/stow.html#Invoking-Stow)
