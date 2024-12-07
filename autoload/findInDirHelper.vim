" Location: autoload/find-in-dir-helper.vim
" Maintainer: Yogesh Dhamija <yogeshdhamija.github.io>

if(exists("g:autoloaded_find_in_dir_helper"))
    finish
endif
let g:autoloaded_find_in_dir_helper = 1

function! s:grep_cmd() abort
    return "lgrep"
endfunction

function! s:open_cmd() abort
    return "lopen"
endfunction

function! s:help_text() abort
    return ":set grepprg?\n    grepprg=".&grepprg."\n:pwd\n    ".getcwd()."\n\n:".s:open_cmd()." | silent ".s:grep_cmd()."! "
endfunction

function! findInDirHelper#DisplayHelpAndSearch() abort
    if(exists("g:vscode"))
        call v:lua.require("vscode").call("workbench.action.findInFiles")
    else
        call inputsave()
        let searchstring = input(s:help_text())
        call inputrestore()
        if(len(searchstring) > 0)
            exec "silent ".s:grep_cmd()."! " . searchstring
            exec "".s:open_cmd().""
        endif
    endif
endfunction

function! findInDirHelper#FindSelectedTextInDir() abort
    normal! gv
    if(exists("g:vscode"))
        let startPos = getpos("v")
        let endPos = getpos(".")
        call v:lua.require("vscode").call("workbench.action.findInFiles")
    else
      try
        let a_save = @a
        silent! normal! "ay
        let initialSearchString = @a
        redraw!
        call inputsave()
        let searchstring = input(s:help_text(), initialSearchString)
        call inputrestore()
        if(len(searchstring) > 0)
            exec "silent ".s:grep_cmd()."! " . searchstring
            exec "".s:open_cmd().""
        endif
      finally
        let @a = a_save
      endtry
    endif
endfunction
