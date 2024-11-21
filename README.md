# dotfiles

Use GNU stow to place these files where you want them.

To stow package(s):

```sh
stow --dir=/path/to/dotfiles --target=/path/to/home/directory --simulate --verbose package1 package2
```

where,

- `--dir` is the path to your dotfiles repository

- `--target` is the base directory that your dotfiles structure starts from

- `--simulate` allows you to do a dry-run first

- `--verbose[=n]` changes the verbosity level. n=3 allows you to really see what's going on.

Resources:

- [https://medium.com/quick-programming/managing-dotfiles-with-gnu-stow-9b04c155ebad] `--verbose[=n]` changes the verbosity level. n=3 allows you to really see what's going on.

Resources:

- [Managing dotfiles with GNU stow](https://medium.com/quick-programming/managing-dotfiles-with-gnu-stow-9b04c155ebad)

- [GNU Stow Documentation](https://www.gnu.org/software/stow/manual/stow.html#Invoking-Stow)
