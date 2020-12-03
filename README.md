# find-in-dir-helper.vim

This plugin sets up a keyboard shortcut to engage a helper function which will make it easier to search for text recursively within a directory using `grepprg`. 

You can:
- Engage the shortcut (by default `\f`, but can be changed by remapping `<Plug>FindSelectedTextInDir` or `<Plug>FindInDirHelper` (for VISUAL and NORMAL mode respectively))
- Type the search string
- Press enter

Or, in visual mode, you can:
- Engage the shortcut
... and it will execute the search for the selected text.

This is what will show up on screen when it is triggered, showing you exactly what's happening:
```
:set grepprg?                               
    grepprg=rg --follow --vimgrep --no-heading --no-ignore-vcs --hidden
:pwd
    /Users/yogeshdhamija

:copen | silent grep! ...     
```
(if you type, it'll show up where the `...` is)

Those are the actual commands that you'd run if you wanted to search for things without using any plugins.

This plugin also works with the [VSCode](https://code.visualstudio.com/) [VSCode Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) plugin. There, it performs the analagous action of opening the editor's search panel (with pre-populated text if applicable).

To install: 
- Using [vim-plug](https://github.com/junegunn/vim-plug): `Plug 'yogeshdhamija/find-in-dir-helper.vim'`