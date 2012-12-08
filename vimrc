source ~/.vim/rc.d/vimrc.neobundle	" load plugins managed by NeoBundle
source ~/.vim/rc.d/vimrc.basic		" load Basic settings
source ~/.vim/rc.d/vimrc.statusline	" load statusline settings
source ~/.vim/rc.d/vimrc.indent		" load indent settings
source ~/.vim/rc.d/vimrc.appearance	" load setting for appearance of Vim
source ~/.vim/rc.d/vimrc.colors		" load color settings
source ~/.vim/rc.d/vimrc.encodings	" load settings for encodings
source ~/.vim/rc.d/vimrc.completion	" load settings for completion

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

" ------------------------------------------------------------------------------
"  Edit Settings
" ------------------------------------------------------------------------------

" turn off ime automatically when exit insert mode.
"set noimdisable
"set iminsert=0 imsearch=0
"set noimcmdline
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>



"�������뤬�����ܤβ����ܤ��֤���Ƥ��뤫��ɽ������
set ruler

" vim-powerline�ǥե���Ȥ˥ѥå������Ƥʤ��ʤ�ʲ��򥳥��ȥ�����
let g:Powerline_symbols = 'fancy'

"���ơ������饤���ʸ�������ɤȲ���ʸ����ɽ������
" if winwidth(0) >= 120
  " set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %F%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" else
  " set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %f%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" endif

"���ϥ⡼�ɻ������ơ������饤��Υ��顼���ѹ�
" augroup InsertHook
" autocmd!
" autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
" autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
" augroup END


" for vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
