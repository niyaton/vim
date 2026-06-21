if has('nvim')
  let s:config_dir = stdpath('config')
else
  let s:config_dir = expand('~/.vim')
endif

" load settings from rc.d directory
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.vimplug')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.basic')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.editing')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.statusline')    
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.indent')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.colors')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.appearance')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.search')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.encodings')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.completion')

" ------------------------------------------------------------------------------
" for python
" ------------------------------------------------------------------------------
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" ------------------------------------------------------------------------------
" for ruby
" ------------------------------------------------------------------------------

autocmd FileType ruby setl autoindent
autocmd FileType ruby setl smartindent
autocmd FileType ruby setl expandtab
autocmd FileType ruby setl tabstop=2 shiftwidth=2 softtabstop=2

" ------------------------------------------------------------------------------
" Basic Settings
" ------------------------------------------------------------------------------
set backspace=indent,eol,start

" for vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
