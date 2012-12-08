" load plugins managed by NeoBundle
source ~/.vim/rc.d/vimrc.neobundle
" color settings
source ~/.vim/rc.d/vimrc.colors

" settings for encodings
source ~/.vim/rc.d/vimrc.encodings

" settings for completion
source ~/.vim/rc.d/vimrc.completion

" Basic settings
source ~/.vim/rc.d/vimrc.basic

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

" ------------------------------------------------------------------------------
" for vim-powerline 
" ------------------------------------------------------------------------------
set laststatus=2 " always display status line
let g:Powerline_symbols = 'fancy'

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

"��ưŪ�� QuickFix �ꥹ�Ȥ�ɽ������
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc


" for vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
