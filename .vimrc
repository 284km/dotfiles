set nocompatible
filetype off
filetype indent off
filetype plugin off

if has('win32')
else
  " git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git
  " set rtp+=~/.vim/vundle.git/
  " call vundle#rc()

  " git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
  " call neobundle#rc(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  " NeoBundle 'tpope/vim-fugitive'
  " NeoBundle 'kien/ctrlp.vim'
  " NeoBundle 'flazz/vim-colorschemes'
  " You can specify revision/branch/tag.
  " NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

  " :BundleInstall!
  " :NeoBundleInstall!
  " Bundle 'rails.vim'
  NeoBundle 'altercation/vim-colors-solarized'
  " Bundle 'tpope/vim-rails'

  " NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neocomplete'
  let g:neocomplete#enable_at_startup = 1

  " neosnippet
  NeoBundle 'Shougo/neosnippet.vim'
  NeoBundle 'Shougo/neosnippet-snippets'
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)

  NeoBundle 'Shougo/unite.vim'
  " Bundle 'unite.vim'

  NeoBundle 'Shougo/vimfiler'
  "vimデフォルトのエクスプローラをvimfilerで置き換える(e.g. :e .)
  let g:vimfiler_as_default_explorer = 1
  "セーフモードを無効にした状態で起動する
  let g:vimfiler_safe_mode_by_default = 0
  " :VimFiler -split -simple -winwidth=35 -no-quit コマンドで、IDEのファイルエクスプローラのような見た目になります。長いので.vimrcでマップして呼び出しましょう。
  "  => :Vimfiler -explorer で事足りてるからいいか。

  " Bundle 'git://github.com/vim-ruby/vim-ruby.git'

  " 関数などのアウトラインをいい感じに見られる
  " :Unite outline
  " NeoBundle 'h1mesuke/unite-outline'
  " NeoBundle 'Shougo/unite-outline'
  NeoBundle 'totem3/unite-outline'

  " syntax check
  " :SyntasticCheck, :Errors
  NeoBundle 'scrooloose/syntastic'
  let g:syntastic_enable_signs=1
  let g:syntastic_auto_loc_list=2
  let g:syntastic_ruby_checkers = ['rubocop']
  " let g:syntastic_disabled_filetypes=['html']


  NeoBundle 'bling/vim-airline'
  let g:airline#extensions#tabline#enabled = 1

  " ruby
  NeoBundle 'vim-scripts/ruby-matchit'
  " Ruby の end を自動挿入してくれる
  NeoBundle 'tpope/vim-endwise'
  " control-- でコメントの on off
  NeoBundle 'tomtom/tcomment_vim'

  " indent を色付きに見やすくする
  NeoBundle 'nathanaelkane/vim-indent-guides'

  NeoBundle 'tpope/vim-fugitive'
  " Bundle 'scrooloose/nerdcommenter'
  " Bundle 'tpope/vim-surround'
  " Bundle 'thinca/vim-quickrun'
  " Bundle 'thinca/vim-ref'
  " Bundle 'kana/vim-fakeclip'


  " ファイルを tree 表示する
  " :NERDTree
  " NeoBundle 'scrooloose/nerdtree'

  " ANSIカラー情報が含まれる場合反映して表示する
  NeoBundle 'vim-scripts/AnsiEsc.vim'

  " :OverCommandLine で起動する
  NeoBundle 'osyo-manga/vim-over'

  " :Unite codic
  NeoBundle 'koron/codic-vim'
  NeoBundle 'rhysd/unite-codic.vim'

  NeoBundle 'itchyny/calendar.vim'
  let g:calendar_google_calendar = 1
  let g:calendar_google_task = 1

  " tweetvim
  " NeoBundle 'basyura/TweetVim'
  " NeoBundle 'mattn/webapi-vim'
  " NeoBundle 'basyura/twibill.vim'
  " NeoBundle 'tyru/open-browser.vim'
  " " NeoBundle 'h1mesuke/unite-outline' 上でもういれてる
  " " NeoBundle 'Shougo/unite.vim' 上でもういれてる
  " NeoBundle 'basyura/bitly.vim'

  call neobundle#end()
endif

" grep後にcwinを表示
" autocmd QuickFixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin

"---------------------------------------------------------------------------

if has('win32')
  colorscheme darkblue
  set guifont=MS_Gothic:h8:cSHIFTJIS
"  set linespace=1
"  " 一部のUCS文字の幅を自動計測して決める
"  if has('kaoriya')
"    set ambiwidth=auto
"  endif
elseif has('mac')
  " macvim
  " colorscheme darkblue
  let g:solarized_termcolors=256
  " exe "hi Comment" . s:fg_base01 .s:bg_base02 .s:fmt_none
  " let g:solarized_visibility="high"
  let g:solarized_contrast="high"
  let g:solarized_termtrans=1
  colorscheme solarized
  set background=dark

set clipboard=unnamed,autoselect

elseif has('unix')
  " mac terminal, xubuntu
  " colorscheme slate
  colorscheme elflord
  " colorscheme pablo
  let g:solarized_termcolors=256
  let g:solarized_contrast="high"
  let g:solarized_termtrans=1
  " colorscheme solarized
  set background=dark

  set clipboard=unnamedplus

  
" elseif has('xfontset')
"   " UNIX用 (xfontsetを使用)
"   set guifontset=a10,r10,k10
else
  " ubuntu
  colorscheme slate
endif

"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk


set tags=./tags,tags;$HOME
" ctags で対象複数の場合は一覧表示する
nnoremap <C-]> g<C-]>

" insert normal remap
" Insert mode でのカーソル移動
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-k> <C-o>D

set directory=~/swp

set nu
"印刷時行番号も出力
set printoptions=number:y
set shiftround
set autoindent
"set noautoindent
set backspace=indent,eol,start

"set encoding=japan
"set fileencoding=euc-jp
set encoding=utf-8
set fileencoding=utf-8
" set termencoding=utf-8
" set fileencodings=euc-jp,iso-2022-jp

set hidden
set history=50
set hlsearch
set ignorecase
set incsearch
set laststatus=2

set noswapfile
set nobackup
" set backup
" set backupdir=~/.vimbackup
" let &directory = &backupdir

" 自動再読み込み
set autoread

set ruler

" set wrap
set nowrap
set ic
" set noic

" tab じゃない space
set expandtab

set tabstop=2
set shiftwidth=2
" autocmd FileType perl set tabstop=2
" autocmd FileType perl set shiftwidth=2
" autocmd FileType ruby set tabstop=2
" autocmd FileType ruby set shiftwidth=2
" autocmd FileType eruby set tabstop=2
" autocmd FileType eruby set shiftwidth=2
" autocmd FileType javascript set tabstop=2
" autocmd FileType javascript set shiftwidth=2



"text witdh
set tw=0

" 入力中のコマンドを表示
set showcmd

" 対応する括弧の表示
set showmatch

" 補完候補を表示する
set wildmenu


set smartcase
" set statusline=%<%f\ %m%r%h%w%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %8P
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'.fugitive#statusline()}%=%-14.(%l,%c%V%)\ %8P
set wrapscan

"autocmd CursorHold * update
set updatetime=500

set iminsert=0 imsearch=0

" Hard Tabs
" set listchars=tab:>-,trail:%,eol:↲,nbsp:x
" set listchars=tab:>-,eol:↲,nbsp:x
" set listchars=tab:>-,eol:↲
set listchars=tab:>-
set list

inoremap ,date <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
inoremap ,bdate <C-R>=strftime("date: %Y-%m-%d %H:%M")<CR>
inoremap ,todo todo: <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
inoremap ,done done: <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
iabbrev ,# # -------------------------------------------------------------------------
iabbrev .# # =========================================================================

" perl test
"       augroup filetypedetect
"       autocmd! BufNewFile,BufRead *.t setf perl
"       augroup END


" minibufexpl.vim の設定
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1


" 自動cd
" ref. http://nanasi.jp/articles/vim/cd_vim.html

" golang
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
  "gocode
  exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
  "golint
  exe "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")

  " ファイル保存時に auto format
  " auto BufWritePre *.go Fmt
endif

au BufEnter * execute ":lcd " . expand("%:p:h")


" ChangeLog
let g:changelog_username = 'Kazuma Furuhashi <k.furuhashi10@gmail.com>'

" netrw tree view
let g:netrw_liststyle = 3

syntax on
highlight ZenkakuSpace ctermbg=6 guibg=cyan
match ZenkakuSpace /\s\+$\|　\|\t/


if has('win32')
elseif has('mac')
elseif has('unix')
  " カーソル行をハイライト
  set cursorline
  " カレントウィンドウにのみ罫線を引く
  augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
  augroup END
 
  hi clear CursorLine
    hi CursorLine gui=underline
    " highlight CursorLine ctermbg=darkblue guibg=darkblue
    " highlight CursorLine ctermbg=0 ctermfg=White guibg=darkblue
    " highlight CursorLine ctermbg=#222222 guibg=darkblue
    highlight CursorLine ctermbg=8 guibg=darkblue
    highlight Search ctermbg=3
    highlight Visual ctermbg=2
    hi LineNr term=bold ctermfg=239 ctermbg=none gui=bold guifg=Black

else
endif



" 補完内容が詳細に表示されるようになる
set completeopt=menu,preview

"===================================================================
" vim-indent-guides
"===================================================================
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" " 1インデント目からガイドする
" let g:indent_guides_start_level=1
" " 自動カラーを無効にする
let g:indent_guides_auto_colors=0

" 奇数インデントのガイドカラー
" hi IndentGuidesOdd  ctermbg=yellow
" hi IndentGuidesOdd  ctermbg=white
" 偶数インデントのガイドカラー
" hi IndentGuidesEven ctermbg=gray
" hi IndentGuidesEven ctermbg=darkgray

" on Xubuntu
hi IndentGuidesOdd  ctermbg=magenta
hi IndentGuidesEven ctermbg=white

" ハイライト色の変化の幅 (Terminal では未サポート)
"let g:indent_guides_color_change_percent = 20
" ガイドの幅
let g:indent_guides_guide_size = 1
" ガイド幅をインデント幅に合わせる
"let g:indent_guides_guide_size = &tabstop




filetype plugin indent on

set notitle

" memo
":so $VIMRUNTIME/syntax/colortest.vim

" 保存したいが権限ないとき
" :w !sudo tee % > /dev/null

" モード	再割当有り	再割当無し
" ノーマルモード＋ビジュアルモード	noremap	map
" コマンドラインモード＋インサートモード	noremap!	map!
" ノーマルモード	nnoremap	nmap
" ビジュアル(選択)モード	vnoremap	vmap
" コマンドラインモード	cnoremap	cmap
" インサート(挿入)モード	inoremap	imap


