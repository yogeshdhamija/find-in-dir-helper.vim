" Location: autoload/find-in-dir-helper.vim
" Maintainer: Yogesh Dhamija <yogeshdhamija.github.io>

if(exists("g:autoloaded_find_in_dir_helper"))
    finish
endif
let g:autoloaded_find_in_dir_helper = 1

function! findInDirHelper#DisplayHelpAndSearch() abort
    if(exists("g:vscode"))
        call VSCodeNotify("workbench.action.findInFiles")
    else
        let l:helptext = ":set grepprg?\n    grepprg=".&grepprg."\n:pwd\n    ".getcwd()."\n\n"
        call inputsave()
        let searchstring = input(l:helptext . ":copen | silent grep! ")
        call inputrestore()
        if(len(searchstring) > 0)
            exec "copen"
            exec "silent grep! " . searchstring
        endif
    endif
endfunction

function! FindSelectedTextInDir() abort
    if(exists("g:vscode"))
        normal! gv
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("workbench.action.findInFiles", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    else
    endif
endfunction
