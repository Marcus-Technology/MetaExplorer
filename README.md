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

`mexplore` is the main command, `<file>` any target you want to inspect (file, directory, or symlink), and `[flags]` is where you put the optional flags that modify the command’s behavior.

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

MetaExplorer currently supports a single flag: `--no-hashes` (or `-n`). This flag disables hash generation for the specified file.

#### Example Usage:

```
# With --no-hashes
mexplore testfile --no-hashes

# With -n
mexplore testfile -n
```

## Running MetaExplorer Without Installing

You can run MetaExplorer directly from its folder without installing it. The usage syntax is the same, but you’ll need to run the command using `./mexplore` from within the script’s directory, or `<directory>/mexplore` if you’re calling it from elsewhere.

## Configuring the MetaExplorer Installation

### Main Script Location
To change where the `mexplore` script is installed:

Open the [Makefile](https://github.com/Marcus-Technology/MetaExplorer/blob/main/Makefile).

Find the line `BINDIR ?= /usr/local/bin`.

Replace `/usr/local/bin` with the directory where you want the main script installed.

### Library Files Location

To change where the library files are installed:

- In the [Makefile](https://github.com/Marcus-Technology/MetaExplorer/blob/main/Makefile), locate the line `LIBDIR ?= /usr/local/lib/metaexplorer`.

- Replace `/usr/local/lib` (note: not including `/metaexplorer`) with the directory where you want the library files stored.

Next, update the runtime path inside the [mexplore](https://github.com/Marcus-Technology/MetaExplorer/blob/main/mexplore) script:

- Open the mexplore script and find the variable `librarydir="/usr/local/lib/metaexplorer"` (around line 44).

- Replace `/usr/local/lib` (again, excluding `/metaexplorer`) with the same directory you chose for the library installation.

## Changelog

You can view the MetaExplorer changelog in the [CHANGELOG.md](https://github.com/Marcus-Technology/MetaExplorer/blob/main/CHANGELOG.md) file.

## License

MetaExplorer is licensed under the [GNU General Public License v3.0](https://github.com/Marcus-Technology/MetaExplorer/blob/main/LICENSE).  
You may use, modify, and distribute this software in accordance with the terms of the GPL-3.0 license.

---

© 2025-2026 MarcTek
