set nocompatible
filetype off
filetype indent off
filetype plugin off

if has('win32')
else
  " git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git
  set rtp+=~/.vim/vundle.git/
  call vundle#rc()

  " :BundleInstall!
  " Bundle 'rails.vim'
  Bundle 'altercation/vim-colors-solarized'
  " Bundle 'tpope/vim-rails'
  Bundle 'Shougo/neocomplcache'
  Bundle 'Shougo/unite.vim'
  " Bundle 'unite.vim'
  " Bundle 'git://github.com/vim-ruby/vim-ruby.git'

  " ruby
  Bundle 'vim-scripts/ruby-matchit'

  Bundle 'nathanaelkane/vim-indent-guides'
  Bundle 'tpope/vim-fugitive'
  " Bundle 'scrooloose/nerdcommenter'
  " Bundle 'tpope/vim-surround'
  " Bundle 'thinca/vim-quickrun'
  " Bundle 'thinca/vim-ref'
  " Bundle 'kana/vim-fakeclip'

  " :OverCommandLine で起動する
  Bundle 'osyo-manga/vim-over'

  " :Unite codic
  Bundle 'koron/codic-vim'
  Bundle 'rhysd/unite-codic.vim'

  Bundle 'itchyny/calendar.vim'
  let g:calendar_google_calendar = 1
  let g:calendar_google_task = 1

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

elseif has('unix')
  " mac terminal
  colorscheme desert
  " let g:solarized_termcolors=256
  " let g:solarized_termtrans=1
  " let g:solarized_visibility="high"
  " let g:solarized_contrast="high"
  " colorscheme solarized
  " set background=dark
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

" Insert mode でのカーソル移動
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-k> <C-o>D

set directory=~/swp
set clipboard=unnamed,autoselect
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
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'.fugitive#statusline()}%=%-14.(%l,%c%V%)\ %8P
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
match ZenkakuSpace /\s\+$\|　/

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
highlight CursorLine ctermbg=0 guibg=darkblue

" 補完内容が詳細に表示されるようになる
set completeopt=menu,preview

"===================================================================
" vim-indent-guides
"===================================================================
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
" let g:indent_guides_enable_on_vim_startup=1
" 1インデント目からガイドする
let g:indent_guides_start_level=1
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのガイドカラー
hi IndentGuidesOdd  ctermbg=yellow
" 偶数インデントのガイドカラー
hi IndentGuidesEven ctermbg=gray
" ハイライト色の変化の幅 (Terminal では未サポート)
"let g:indent_guides_color_change_percent = 20
" ガイドの幅
let g:indent_guides_guide_size = 1
" ガイド幅をインデント幅に合わせる
"let g:indent_guides_guide_size = &tabstop




filetype plugin indent on


" memo
":so $VIMRUNTIME/syntax/colortest.vim


