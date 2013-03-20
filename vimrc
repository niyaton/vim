source ~/.vim/rc.d/vimrc.neobundle	" load plugins managed by NeoBundle
source ~/.vim/rc.d/vimrc.basic		" load Basic settings
source ~/.vim/rc.d/vimrc.editing	" load edit settings
source ~/.vim/rc.d/vimrc.statusline	" load statusline settings
source ~/.vim/rc.d/vimrc.indent		" load indent settings
source ~/.vim/rc.d/vimrc.colors		" load color settings
source ~/.vim/rc.d/vimrc.appearance	" load setting for appearance of Vim
source ~/.vim/rc.d/vimrc.search		" load search settings
source ~/.vim/rc.d/vimrc.encodings	" load settings for encodings
source ~/.vim/rc.d/vimrc.completion	" load settings for completion
source ~/.vim/rc.d/vimrc.plugin_settings " load plugin settings

" ------------------------------------------------------------------------------
" for python
" ------------------------------------------------------------------------------
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" ------------------------------------------------------------------------------
" Basic Settings
" ------------------------------------------------------------------------------
set backspace=indent,eol,start

" for vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
