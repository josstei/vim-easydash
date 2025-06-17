![Stable](https://img.shields.io/badge/status-stable-brightgreen) ![License](https://img.shields.io/badge/license-MIT-blue)
# vim-easydash

**vim-easydash** is a lightweight, extensible dashboard plugin for Vim and Neovim. It displays a customizable start screen when you launch your editor, featuring an ASCII logo and quick-access menu options, each with convenient key mappings. Designed for ease of configuration and minimalism, vim-easydash provides an elegant entry point to your sessions.

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

## Customization

Place your customizations in your `.vimrc`, `init.vim`, or `init.lua`.  

```vim
" Set dashboard name
let g:easydash_name = 'EasyDash'

" ASCII logo (list of strings)


" Define menu options (identifiers)
let g:easydash_options = ['files', 'recent', 'quit']

" Custom menu entries
let g:easydash_menu_files = {
      \ 'keymap': 'f',
      \ 'label': 'Find Files',
      \ 'command': ':Files<CR>',
      \ }
let g:easydash_menu_recent = {
      \ 'keymap': 'r',
      \ 'label': 'Recent Files',
      \ 'command': ':History<CR>',
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
