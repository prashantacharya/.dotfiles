" Use ripgrep for file searches.
let FZF_DEFAULT_COMMAND = 'rg --files'

" Search for files.
nnoremap <C-p> :Files<CR>

" Search for text in current file (buffer)
nnoremap <C-f> :Rg<CR>

" Search for text in all project directory.
nnoremap <leader>f :BLines<CR>

