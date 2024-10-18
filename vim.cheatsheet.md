# VIM Cheatsheet for my config

## Navigation
- `[h|j|k|l]` to navigate lines
- `w`/`W`: next word, WORD
- `b`/`B`: back a word, WORD
- `<C-w>` + `[h|j|k|l]` to navigate panes
- `<C-w>` + `[s|v]` to add new window below/right
- `<C-x>` or `:Buffers` to show buffers

## Edit
- `o`/`O`: insert line below/above
- `i`: insert mode
- `a`: insert above char
- `A`: insert @ end of line
- `:e $file` buffer on file path

## Fuzzy
- `<C-r>` or `:Files` for finding files
- `:GFiles` for tracked files
- `<C-p>` or `:Lines` for line search
- `<C-g>` or `:Rg` for lines in folder + subfolders

## Signature
- `m [a..z, 0..9]` for marker
- `m [A..Z]` for global marker
- `m <space>` for cleaning markers
- `m /` for location list for markers

## Vimspector
- `<leader>dd`: Start debugging
- `<leader>dc`: End debugging
- `<leader>do`: Show output
- `<leader>de`: Eval
- `:VimspectorWatch $EXPRESSION`: Watch expression
- `<F9>`: Continue
- `<F8>`: Step over
- `<F7>`: Step into
- `<F5>`: Toggle breakpoint

## Coc
- `<space> a`: show all annotations
- `<leader> a`: actions
- `<leader> rn`: rename symbol

