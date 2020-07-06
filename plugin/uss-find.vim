" uss-find.vim - find in dir plugin
" Maintainer: Yogesh Dhamija <ydhamija96.github.io>
" Version 0.1

if(exists("g:loaded_uss_find"))
    finish
endif
let g:loaded_uss_find = 1

nnoremap <Plug>UssFindInDir :call ussFind#DisplayHelpAndSearch()<CR>
if !hasmapto('<Plug>UssFindInDir')
    nmap <unique> \f <Plug>UssFindInDir
endif
