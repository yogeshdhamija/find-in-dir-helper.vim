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

function! findInDirHelper#FindSelectedTextInDir() abort
    if(exists("g:vscode"))
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("workbench.action.findInFiles", startPos[1], endPos[1], startPos[2], endPos[2]+1, 1)
    else
      try
        let a_save = @a
        silent! normal! "ay
        let searchstring = @a
        let l:helptext = ":set grepprg?\n    grepprg=".&grepprg."\n:pwd\n    ".getcwd()."\n\n:copen | silent grep! " . searchstring
        redraw!
        echo "Executing:\n\n" . l:helptext
        exec "copen"
        exec "silent grep! " . searchstring
      finally
        let @a = a_save
      endtry
    endif
endfunction
