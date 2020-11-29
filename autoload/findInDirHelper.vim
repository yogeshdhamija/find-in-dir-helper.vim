" Location: autoload/find-in-dir-helper.vim
" Maintainer: Yogesh Dhamija <yogeshdhamija.github.io>

if(exists("g:autoloaded_find_in_dir_helper"))
    finish
endif
let g:autoloaded_find_in_dir_helper = 1

function! findInDirHelper#DisplayHelpAndSearch() abort
    let l:helptext = ":set grepprg?\n    grepprg=".&grepprg."\n:pwd\n    ".getcwd()."\n\n"
    call inputsave()
    let searchstring = input(l:helptext . ":copen | silent grep! ")
    call inputrestore()
    if(len(searchstring) > 0)
        exec "copen"
        exec "silent grep! " . searchstring
    endif
endfunction
