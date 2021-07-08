" Use ripgrep for file searches.
let FZF_DEFAULT_COMMAND = 'rg --files'

" Search for files.
nnoremap <C-p> :Files<CR>

" Search for text in current file (buffer)
nnoremap <C-f> :BLines<CR>

" Search for text in all project directory.
nnoremap <leader>f :Rg<CR>

" Switch among open tabs
nnoremap <C-o> :Windows<CR>
