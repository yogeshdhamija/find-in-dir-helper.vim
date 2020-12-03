# find-in-dir-helper.vim

**What does it do?**
This plugin sets up a keyboard shortcut.  You can:
- Engage the shortcut 
- Type the search string
- Press enter

Or, in visual mode, you can:
- Engage the shortcut

...and it will execute a directory search for the selected text.

**What's the shortcut?**
By default, `\f`.  
But it can be changed by remapping `<Plug>FindSelectedTextInDir` or `<Plug>FindInDirHelper` (for VISUAL and NORMAL mode respectively)

**What does it look like?**
This is what will show up on screen when the shortcut is triggered:
```
:set grepprg?                               
    grepprg=rg --follow --vimgrep --no-heading --no-ignore-vcs --hidden
:pwd
    /Users/yogeshdhamija

:copen | silent grep! ...     
```
(If you type, the text will show up where the `...` is.)

Those are the actual commands that you'd run if you wanted to search for things without using any plugins. See `:help :grep` to see how. 

This plugin also works with the [VSCode](https://code.visualstudio.com/) plugin, '[VSCode Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)'. There, it performs the analagous action of opening the editor's search panel (with pre-populated text if applicable).

To install: 
- Using [vim-plug](https://github.com/junegunn/vim-plug): `Plug 'yogeshdhamija/find-in-dir-helper.vim'`