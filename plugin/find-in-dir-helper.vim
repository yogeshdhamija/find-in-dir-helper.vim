" find-in-dir-helper.vim - find in dir plugin
" Maintainer: Yogesh Dhamija <yogeshdhamija.github.io>
" Version 0.1

if(exists("g:loaded_find_in_dir_helper"))
    finish
endif
let g:loaded_find_in_dir_helper = 1

nnoremap <Plug>FindInDirHelper :call findInDirHelper#DisplayHelpAndSearch()<CR>

if !hasmapto('<Plug>FindInDirHelper')
    nmap <unique> \f <Plug>FindInDirHelper
endif
