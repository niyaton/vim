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
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.colors')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.appearance')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.search')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.encodings')
execute 'source ' . fnameescape(s:config_dir . '/rc.d/vimrc.completion')

" for vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
