" switch open buffers 
nmap <silent> <leader>n :bnext<CR>
nmap <silent> <leader>N :bprevious<CR>

" Close current buffer
nmap <silent> <c-w> :bw<CR> 

vnoremap < <gv
vnoremap > >gv

"=====================================
"      ALLOW GLOBAL COPY PASTE
"=====================================

vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"=============================================
"             MAGIC ZOOM BOOM
"=============================================

function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>
