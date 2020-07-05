" uss-find.vim - find in dir plugin
" Maintainer: Yogesh Dhamija <ydhamija96.github.io>
" Version 0.1

if(exists("g:loaded_uss_find"))
    finish
endif
let g:loaded_uss_find = 1

nnoremap <Plug>UssFindInDir :call <SID>display_help_and_search()<CR>
if !hasmapto('<Plug>UssFindInDir')
    nmap <unique> \f <Plug>UssFindInDir
endif

function! s:display_help_and_search() abort
    let l:helptext = ":set grepprg?\n    grepprg=".&grepprg."\n:pwd\n    ".getcwd()."\n\n"
    call inputsave()
    let searchstring = input(l:helptext . ":copen | silent grep! ")
    call inputrestore()
    if(len(searchstring) > 0)
        exec "copen"
        exec "silent grep! " . searchstring
    endif
endfunction
