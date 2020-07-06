" Location: autoload/uss-find.vim
" Maintainer: Yogesh Dhamija <ydhamija96.github.io>

if(exists("g:autoloaded_uss_find"))
    finish
endif
let g:autoloaded_uss_find = 1

function! ussFind#DisplayHelpAndSearch() abort
    let l:helptext = ":set grepprg?\n    grepprg=".&grepprg."\n:pwd\n    ".getcwd()."\n\n"
    call inputsave()
    let searchstring = input(l:helptext . ":copen | silent grep! ")
    call inputrestore()
    if(len(searchstring) > 0)
        exec "copen"
        exec "silent grep! " . searchstring
    endif
endfunction
