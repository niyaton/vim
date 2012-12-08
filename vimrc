" load plugins managed by NeoBundle
source ~/.vim/rc.d/vimrc.neobundle


" Basic settings

"

" ------------------------------------------------------------------------------
" for auto setting fileencoding 
" ------------------------------------------------------------------------------
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconv$B$,(BeucJP-ms$B$KBP1~$7$F$$$k$+$r%A%'%C%/(B
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconv$B$,(BJISX0213$B$KBP1~$7$F$$$k$+$r%A%'%C%/(B
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodings$B$r9=C[(B
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " $BDj?t$r=hJ,(B
  unlet s:enc_euc
  unlet s:enc_jis
endif
" $BF|K\8l$r4^$^$J$$>l9g$O(B fileencoding $B$K(B encoding $B$r;H$&$h$&$K$9$k(B
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" $B2~9T%3!<%I$N<+F0G'<1(B
set fileformats=unix,dos,mac
" $B""$H$+!{$NJ8;z$,$"$C$F$b%+!<%=%k0LCV$,$:$l$J$$$h$&$K$9$k(B
if exists('&ambiwidth')
  set ambiwidth=double
endif

" ------------------------------------------------------------------------------
" for python
" ------------------------------------------------------------------------------
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4


" ------------------------------------------------------------------------------
" for color
" ------------------------------------------------------------------------------
if !has('gui_running')
	let g:zenburn_force_dark_Background = 1
	let g:zenburn_unified_CursorColumn = 1
	colorscheme zenburn
end

if has('gui_running')
	let g:zenburn_force_dark_Background = 1
	let g:zenburn_unified_CursorColumn = 1
	colorscheme zenburn
	"set guifont=Osaka-Mono:h14
	set guifont=Monaco\ for\ Powerline:h14
end

" colorscheme yuroyoro256
" colorscheme mrkn256

" $B%?!<%_%J%k%?%$%W$K$h$k%+%i!<@_Dj(B
if &term =~ "xterm-256color" || "screen-256color"
  " 256$B?'(B
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax enable


" ------------------------------------------------------------------------------
" for file type plugin
" ------------------------------------------------------------------------------
:filetype plugin on

" ------------------------------------------------------------------------------
" for neocomplcache
" ------------------------------------------------------------------------------
let g:neocomplcache_enable_at_startup = 1 "


" ------------------------------------------------------------------------------
" Basic Settings
" ------------------------------------------------------------------------------
set backspace=indent,eol,start

" enable mouse on terminal.
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" ------------------------------------------------------------------------------
"  Edit Settings
" ------------------------------------------------------------------------------

" turn off ime automatically when exit insert mode.
"set noimdisable
"set iminsert=0 imsearch=0
"set noimcmdline
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" for howm
let howm_dir = '~/Dropbox/howm'

" ------------------------------------------------------------------------------
" for vim-powerline 
" ------------------------------------------------------------------------------
set laststatus=2 " always display status line
let g:Powerline_symbols = 'fancy'

"¥«¡¼¥½¥ë¤¬²¿¹ÔÌÜ¤Î²¿ÎóÌÜ¤ËÃÖ¤«¤ì¤Æ¤¤¤ë¤«¤òÉ½¼¨¤¹¤ë
set ruler

" vim-powerline¤Ç¥Õ¥©¥ó¥È¤Ë¥Ñ¥Ã¥Á¤òÅö¤Æ¤Ê¤¤¤Ê¤é°Ê²¼¤ò¥³¥á¥ó¥È¥¢¥¦¥È
let g:Powerline_symbols = 'fancy'

"¥¹¥Æ¡¼¥¿¥¹¥é¥¤¥ó¤ËÊ¸»ú¥³¡¼¥É¤È²þ¹ÔÊ¸»ú¤òÉ½¼¨¤¹¤ë
" if winwidth(0) >= 120
  " set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %F%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" else
  " set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %f%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" endif

"ÆþÎÏ¥â¡¼¥É»þ¡¢¥¹¥Æ¡¼¥¿¥¹¥é¥¤¥ó¤Î¥«¥é¡¼¤òÊÑ¹¹
" augroup InsertHook
" autocmd!
" autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
" autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
" augroup END

"¼«Æ°Åª¤Ë QuickFix ¥ê¥¹¥È¤òÉ½¼¨¤¹¤ë
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
