# MetaExplorer

MetaExplorer is a command‑line tool that outputs clean, structured metadata from files, folders, and symlinks. It is implemented entirely in Bash.

## Features

MetaExplorer provides detailed metadata for:

- Files
- Folders
- Symlinks

All output is formatted to be clean, structured, and easy to read.

Depending on the item type, MetaExplorer reports:

- Type (file, directory, or symlink)
- Size (automatically converted to Bytes, KB, MB, GB, or TB)
- Permissions
- Owner
- Group
- Last modified time
- Last accessed time
- Creation time
- Inode
- MIME type
- Magic bytes
- Absolute path
- Cryptographic hashes

## How to Install
### Dependencies

MetaExplorer requires the following packages to be installed on your system:

- coreutils
- bc
- file
- vim-common or vim
- awk

Use the commands below to install them on your distribution.

#### Debian/Ubuntu

```
sudo apt update
sudo apt install coreutils bc file vim-common gawk
```

#### RHEL/CentOS/Fedora

```
sudo dnf update
sudo dnf install coreutils bc file vim gawk
```

#### Arch Linux

```
sudo pacman -Syu
sudo pacman -S coreutils bc file vim gawk
```

### Install MetaExplorer

Once you have the dependencies installed, you can now install MetaExplorer.
You can download the zip by pressing the green `Code` button on the top right and hitting the `Download ZIP` button in the dropdown. Then extract the zip.
Alternatively, you can clone the repo using git:

```
git clone https://github.com/Marcus-Technology/MetaExplorer.git
```

Go into the MetaExplorer folder and run:

```
sudo make install
```

to start the installation process. It will only take seconds.

> By default, it installs the main script to `/usr/local/bin` and installs the library scripts to `/usr/local/lib/metaexplorer`.

Now you can use MetaExplorer!

### Uninstall MetaExplorer

If for some reason you want to uninstall MetaExplorer, you can do so by going into the folder you installed it in (or just download it again), and run:

```
sudo make uninstall
```

It will finish the uninstallation process in a few seconds.

## How to use MetaExplorer
To run MetaExplorer, use the following syntax:

```
mexplore <file> [flags]
```

`mexplore` is the main command, `<file>` any target you want to inspect (file, directory, or symlink), and `[flags]` is where you put optional flags that modify the command’s behavior.

You can also use:

```
mexplore --help    # or -h
mexplore --version # or -v
```

to get help on using MetaExplorer or to get the version of it you are using.

#### Example Usage:
```
# A File
mexplore myfile

# A Folder
mexplore testfolder

# A Symlink
mexplore examplelink
```

### MetaExplorer Flags

Right now, MetaExplorer has only one flag, and that is `--no-hashes` or `-n`. You would use it only if you don't want the file hashes generated.

#### Example Usage:

```
# With --no-hashes
mexplore testfile --no-hashes

# With -n
mexplore testfile -n
```
