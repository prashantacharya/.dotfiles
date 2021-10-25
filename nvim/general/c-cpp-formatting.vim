function! s:AutoFormat() abort
  let l:file_name = expand('%')
  let l:file_type = expand('%:e')
    " if the file type is c or header
    if l:file_type=="c" || l:file_type=="h"
    execute '!clang-format -i ' . l:file_name
    :edit!
  endif
endfunction
command! Format call s:AutoFormat()
