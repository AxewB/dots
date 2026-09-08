# My dots

Requires [GNU Stow](https://www.gnu.org/software/stow/).

Install single config:

```sh
stow nvim
```

Install all configs:

```sh
stow */
```

Install my crappy shell with:

```sh
git submodule update --init --recursive
```


## In the end

For OpenSCAD config it is recommended to type this after stow:

```sh
git update-index --skip-worktree OpenSCAD/.config/OpenSCAD/OpenSCAD.conf
```

Otherwise git will always track all dynamically inserted lines by OpenSCAD itself.
