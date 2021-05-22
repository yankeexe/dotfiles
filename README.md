# dotfiles

dotfiles for stuffs.

## Usage

### Restore to local machine
Download the config files
```bash
$ rsync -avu --progress <config-folder> <your-config-folder>
```

### Sync new changes from local to this repository
```bash
$ rsync -av --progress <local-config-files-or-dir> <path-to-repo>
```
---

## Directory Overview

```bash
├── README.md
├── fish
│   └── config.fish
├── nvim
│   ├── README.md
│   ├── autoload
│   ├── coc-settings.json
│   ├── general
│   ├── init.vim
│   ├── lang
│   ├── plug-config
│   ├── themes
│   └── vim-plug
├── tmux
│   └── .tmux.conf
├── vim
│   └── .vimrc
└── zsh
    └── .zshrc
```
