![Stable](https://img.shields.io/badge/status-stable-brightgreen) ![License](https://img.shields.io/badge/license-MIT-blue)
# vim-easydash

**vim-easydash** is a lightweight, extensible dashboard plugin for Vim and Neovim. It displays a customizable start screen when you launch your editor, featuring an ASCII logo and quick-access menu options for productivity.

## Features

- Custom ASCII logo support
- Configurable menu with key mappings and custom commands
- Clean, centered dashboard buffer with no file listing or swap file
- Auto-centering and auto-resizing on window events
- Designed for easy extension and user configuration

## Installation

### Vim

Add this to your favorite plugin manager:

```vim
Plug 'josstei/vim-easydash'
```

### Neovim

For `init.vim` or `init.lua` (vim-plug example):

```vim
Plug 'josstei/vim-easydash'
```

Or with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  'josstei/vim-easydash'
}
```

Or clone it directly:

```sh
git clone https://github.com/josstei/vim-easydash ~/.vim/pack/plugins/start/vim-easydash
```

---

## Usage

vim-easydash launches automatically on startup if no files are specified.  
To open it manually:

```vim
:call easydash#Open()
```

---

## Customization

Place your customizations in your `.vimrc`, `init.vim`, or `init.lua`.

```vim
" Set dashboard name
let g:easydash_name = 'EasyDash'

" ASCII logo (list of strings)
let g:easydash_logo = [
        \ '',
        \ '·······················································',
        \ ':      ____                ______          _          :',
        \ ':     |  __|               |  _  \        | |         :',
        \ ':     | |__  ____ ___ _   _| | | |____ ___| |___      :',
        \ ':     |  __|/ _  / __| | | | | | / _  / __| __  \     :',
        \ ':     | |__| (_| \__ \ |_| | |/ / (_| \__ \ | | |     :',
        \ ':     \____/\____|___/\__. |___/ \____|___/_| |_|     :',
        \ ':                      __/ |                          :',
        \ ':                     |___/                           :',
        \ '·······················································',
        \ '',
        \ ]

" Define menu options (identifiers)
let g:easydash_options = ['newfile', 'quit']

" Custom menu entries
let g:easydash_menu_files = {
      \ 'keymap': 'n',
      \ 'label': 'New File',
      \ 'command': ':enew<CR>',
      \ }

let g:easydash_menu_quit = {
      \ 'keymap': 'q',
      \ 'label': 'Quit',
      \ 'command': ':qa!<CR>',
      \ }

" Optionally add extra lines below the menu
let g:easydash_extras = [
      \ '',
      \ 'Start your session with ease!',
      \ ]
```

### How to Build Custom Menu Options

Custom menu items are defined as global variables in your Vim config. The pattern is:

- Add your option’s identifier to `g:easydash_options` (the order in this list determines display order).
- For each identifier (e.g., `editconfig`), declare a dictionary variable named `g:easydash_menu_<identifier>` with these keys:
  - `keymap`: The shortcut key (single letter, e.g., `'e'`).
  - `label`: The label shown in the menu (e.g., `'Edit Config'`).
  - `command`: The Vim command to execute when the key is pressed (must end with `<CR>` to execute; can be any Vim command or plugin command).

**Example: Add a custom "Edit Config" menu entry:**

```vim
let g:easydash_options = ['files', 'recent', 'editconfig', 'quit']

let g:easydash_menu_editconfig = {
      \ 'keymap': 'e',
      \ 'label': 'Edit Config',
      \ 'command': ':e $MYVIMRC<CR>',
      \ }
```

Now, pressing `e` on the dashboard will open your Vim config file.

| Global Variable                | Description                  | Example                                       |
|-------------------------------|------------------------------|-----------------------------------------------|
| g:easydash_options            | List of identifiers          | ['files', 'recent', 'quit', 'editconfig']     |
| g:easydash_menu_<identifier>  | Dict with keymap/label/command | see above                                     |

You can add as many custom menu entries as you want—just make sure to add their identifiers to `g:easydash_options` in the correct order, and define a corresponding `g:easydash_menu_<identifier>` dictionary for each.

---

## How It Works

- When Vim or Neovim starts and no files are specified, vim-easydash opens the dashboard buffer.
- The dashboard displays your logo, menu options (with key mappings), and any extra messages.
- Every menu entry is mapped to a key for quick access.
- The dashboard auto-centers and resizes as you adjust your window.

## Contributing

Contributions are welcome!  
Feel free to open [issues](https://github.com/josstei/vim-easydash/issues) or [pull requests](https://github.com/josstei/vim-easydash/pulls) for improvements or bug fixes.

---

## License

[MIT License](LICENSE)
