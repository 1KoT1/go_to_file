# go_to_file.vim — Enhanced file navigation for Vim

A lightweight Vim plugin that improves the native `gf` / `gF` commands with
smart window management and automatic line-number detection.

---

## Quick Start — Mapping Recommendation

**This plugin does not define any default key mappings** to avoid interfering
with your personal configuration. **You are strongly encouraged to add one
yourself.** The most natural choice is:

```vim
nnoremap <leader>gf :GoToFile<CR>
```

Add that line to your `init.vim` / `vimrc` right after installing the plugin.
Other popular options: `nnoremap <C-g> :GoToFile<CR>` or
`nnoremap <F5> :GoToFile<CR>`.

---

## Features

- **Smart window reuse** — If you already have multiple windows open, the
  plugin switches to the next window instead of creating yet another split.
- **Configurable split orientation** — When only one window is present, a new
  split is opened. The direction (vertical / horizontal) is controlled by a
  single option (vertical by default).
- **Automatic line number detection** — If a number appears right after the
  filename on the current line (e.g., `src/main.rs:42`), the plugin
  automatically jumps to that line after opening the file.
- **Internationalization** — Error messages are translatable via Vim's
  built-in gettext support. English and Russian are included out of the box.

---

## Installation

Use any plugin manager you prefer.

**vim-plug** (https://github.com/junegunn/vim-plug):

```vim
Plug '1KoT1/go_to_file'
```

**Dein.vim** (https://github.com/Shougo/dein.vim):

```vim
call dein#add('1KoT1/go_to_file')
```

**Vim 8 native packages**:

```bash
git clone https://github.com/1KoT1/go_to_file.git \
    ~/.vim/pack/plugins/start/go_to_file
```

---

## Usage

| Command       | Description                                                    |
| ------------- | -------------------------------------------------------------- |
| `:GoToFile`   | Open the file under the cursor with smart window management.   |

Place the cursor on a file path and run `:GoToFile`. If the line contains a
number immediately after the filename (e.g., `path/to/file.rs:42`), the
cursor will be positioned on that line after opening.

### Window behaviour in detail

1. **Multiple windows exist** (`winnr('$') > 1`):  
   The plugin switches to the *next* window (`wincmd w`) and opens the file
   there. The existing window layout is preserved.

2. **Only one window exists**:  
   A new split is created. By default the split is **vertical**; set
   `g:go_to_file_vertical` to `0` for a horizontal split.

---

## Options

| Variable                  | Type    | Default | Description                                                |
| ------------------------- | ------- | ------- | ---------------------------------------------------------- |
| `g:go_to_file_vertical`  | Boolean | `1`     | Use vertical split (`1`) or horizontal split (`0`).        |

Example in your `vimrc`:

```vim
" Open files in a horizontal split instead of vertical
let g:go_to_file_vertical = 0
```

---

## Language / Internationalization

The plugin supports message translation via Vim's `+gettext` feature.

- **English** — built-in
- **Russian** — built-in

To contribute a new translation:

1. Init: `msginit --input=lang/go_to_file.pot --output=lang/<code>.po --locale=<code>`
2. Translate the `msgstr` entries at `lang/<code>.po`
3. Compile: `msgfmt lang/<code>.po -o lang/<code>/LC_MESSAGES/go_to_file.mo`

---


## License

Distributed under the MIT License. See the [LICENSE](LICENSE) file for details.

