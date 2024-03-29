" https://github.com/Shougo/dein.vim
" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh ./installer.sh ~/.cache/dein
" :call dein#install()

if &compatible
  set nocompatible
endif

" execute 'set runtimepath+=' . s:dein_src
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1
  " deoplete requires Neovim or Vim8 with if_python3.
  " pip3 install --user pynvim

  " git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " common
  call dein#add('bronson/vim-toggle-wrap') " \w
  call dein#add('vim-scripts/AnsiEsc.vim')
  nnoremap ,a :<C-U>AnsiEsc<CR>
  call dein#add('majutsushi/tagbar')
  nnoremap <silent> ,t :TagbarToggle<CR>
  let g:tagbar_left = 1
  let g:tagbar_width = 30
  let g:tagbar_updateonsave_maxlines = 10000
  let g:tagbar_sort = 0

  if has('python3')
    " pip3 install --user pynvim
    call dein#add('Shougo/denite.nvim')
  else
    call dein#add('Shougo/unite.vim')
  endif
  call dein#add('Shougo/neomru.vim')

  " ruby
  call dein#add('tpope/vim-endwise') " Ruby の end を自動挿入してくれる
  call dein#add('tomtom/tcomment_vim') " control-- でコメントの on off
  source $VIMRUNTIME/macros/matchit.vim

  " syntax
  call dein#add('slim-template/vim-slim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('rust-lang/rust.vim')

  call dein#add('altercation/vim-colors-solarized')
  let g:solarized_termcolors=256
  let g:solarized_contrast="high"
  let g:solarized_termtrans=1
  set background=light

  " call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  call dein#end()
  call dein#save_state()
endif

if has('mac')
  set clipboard=unnamed,autoselect
else
  set clipboard=unnamedplus
endif

" vertical line (length: 80)
if (exists('+colorcolumn'))
  set colorcolumn=80
endif
nnoremap [space] <Nop>
nmap     <Space> [space]
xmap     <Space> [space]
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap "" :%s/'/"/g<CR>
nnoremap '' :%s/"/'/g<CR>
noremap [space]h  ^
noremap [space]j  G
noremap [space]k  1G
noremap [space]l  $
nnoremap ,p :pwd<CR>
nnoremap ,.. :cd ..<CR>:pwd<CR>
inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <C-e> <End>
inoremap <C-f> <Right>

set tags=./tags,tags;$HOME
" ctags で対象複数の場合は一覧表示する
nnoremap <C-]> g<C-]>

set ruler
set laststatus=2 " ステータス行を常に表示
set backspace=indent,eol,start
set nowrap
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan " 最後尾まで検索を終えたら次の検索で先頭に移る
nohlsearch "reset highlight
nnoremap <silent> [space]/ :noh<CR>

set noswapfile
set nobackup
" set backup
" set backupdir=~/.vimbackup
" let &directory = &backupdir

" Undo履歴をファイルに保存する
" set undodir=$HOME/.vim/undo
" set undofile
set noundofile

set expandtab " tab じゃなくて space
set smarttab
set tabstop=2     " ファイル中の<Tab>文字(キャラクターコード9)を、画面上の見た目で何文字分に展開するかを指定する。既にあるファイルをどのように表示するのか指定したい時に便利。
set shiftwidth=2  " vimが挿入するインデント('cindent')やシフトオペレータ(>>や<<)で挿入/削除されるインデントの幅を、画面上の見た目で何文字分であるか指定します。自動的に挿入される量、と覚えておくと良いです。
set softtabstop=0 " キーボードで<Tab>キーを押した時に挿入される空白の量。'softtabstop'が0以外の時には、例え'ts'を4に設定していても、<Tab>を1度押しても'softtabstop'分だけ空白が挿入されます。逆に'softtabstop'が0の場合には挿入されるのは'ts'で指定した量になります。
set tw=0
"autocmd CursorHold * update
set updatetime=500
set iminsert=0 imsearch=0

" Hard Tabs
" set listchars=tab:>-,trail:%,eol:↲,nbsp:x
" set listchars=tab:>-,eol:↲,nbsp:x
" set listchars=tab:>-,eol:↲
set listchars=tab:>-
set list

autocmd FileType c set tabstop=4 shiftwidth=4
autocmd FileType cpp set tabstop=4 shiftwidth=4
autocmd FileType java set tabstop=4 shiftwidth=4

inoremap ,date <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
inoremap ,bdate <C-R>=strftime("date: %Y-%m-%d %H:%M")<CR>
inoremap ,todo todo: <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
inoremap ,done done: <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
inoremap #!ruby #!/usr/bin/env ruby
inoremap #!sh #!/bin/sh
inoremap #!html <!DOCTYPE html>
inoremap ,# # -------------------------------------------------------------------------
inoremap .# # =========================================================================

" nnoremap [unite]    <Nop>
" nmap     ,u [unite]
" nnoremap <silent> [unite]b   :<C-u>Unite -buffer-name=buffers -start-insert -prompt=Buffer>\  buffer<CR>
" nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
" nnoremap <silent> [unite]fa  :<C-u>Unite -buffer-name=files -start-insert file_rec/async<CR>
" nnoremap <silent> [unite]fd  :<C-u>Unite -buffer-name=files -start-insert file_rec/async:!<CR>
" nnoremap <silent> [unite]fg  :<C-u>Unite -buffer-name=files -start-insert file_rec/git<CR>
" nnoremap <silent> [unite]fr  :<C-u>Unite -buffer-name=files -start-insert file_mru<CR>
" nnoremap <silent> [unite]g   :<C-u>Unite -buffer-name=ghq -start-insert ghq<CR>

if dein#tap('denite.nvim')
  " Add custom menus
  let s:menus = {}
  let s:menus.file = {'description': 'File search (buffer, file, file_rec, file_mru'}
  let s:menus.line = {'description': 'Line search (change, grep, line, tag'}
  let s:menus.others = {'description': 'Others (command, command_history, help)'}
  let s:menus.file.command_candidates = [
        \ ['buffer', 'Denite buffer'],
        \ ['file: Files in the current directory', 'Denite file'],
        \ ['file_rec: Files, recursive list under the current directory', 'Denite file_rec'],
        \ ['file_mru: Most recently used files', 'Denite file_mru']
        \ ]
  let s:menus.line.command_candidates = [
        \ ['change', 'Denite change'],
        \ ['grep :grep', 'Denite grep'],
        \ ['line', 'Denite line'],
        \ ['tag', 'Denite tag']
        \ ]
  let s:menus.others.command_candidates = [
        \ ['command', 'Denite command'],
        \ ['command_history', 'Denite command_history'],
        \ ['help', 'Denite help']
        \ ]

  call denite#custom#var('menu', 'menus', s:menus)

  nnoremap [denite] <Nop>
  nmap ,d [denite]
  nnoremap <silent> [denite]b :Denite buffer<CR>
  nnoremap <silent> [denite]c :Denite changes<CR>
  nnoremap <silent> [denite]f :Denite file<CR>
  nnoremap <silent> [denite]g :Denite grep<CR>
  nnoremap <silent> [denite]h :Denite help<CR>
  nnoremap <silent> [denite]l :Denite line<CR>
  nnoremap <silent> [denite]t :Denite tag<CR>
  nnoremap <silent> [denite]m :Denite file_mru<CR>
  nnoremap <silent> [denite]u :Denite menu<CR>
  ".git以下のディレクトリ検索
  nnoremap <silent> [denite]d :Denite -path=`substitute(finddir('.git', './;'), '.git', '', 'g')` file_rec/git<CR>
  call denite#custom#alias('source', 'file_rec/git', 'file_rec')
  call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

  call denite#custom#map(
        \ 'insert',
        \ '<Down>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<Up>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-N>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-P>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-G>',
        \ '<denite:assign_next_txt>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-T>',
        \ '<denite:assign_previous_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'normal',
        \ '/',
        \ '<denite:enter_mode:insert>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<Esc>',
        \ '<denite:enter_mode:normal>',
        \ 'noremap'
        \)
endif


" w!! で sudo で保存
cabbr w!! w !sudo tee > /dev/null %

" highlight ZenkakuSpace ctermbg=14 guibg=cyan
highlight ZenkakuSpace ctermbg=14
match ZenkakuSpace /\s\+$\|　\|\t/
set cursorline " カーソル行をハイライト
" highlight CursorLine ctermbg=White cterm=bold guifg=white guibg=white gui=bold
highlight CursorLine cterm=bold gui=bold
highlight LineNr ctermfg=grey ctermbg=white

" ：Gstatus                新しい窓を作ってgit statusを表示
  " ：Gstatus上の変更のあったファイルにカーソルを合わせた状態で
  "   Dで:Gdiff起動(差分表示)
  "   -でaddとresetの切り替え
  "   pでパッチを表示
  "   Enterでファイル表示
  "   :Gstatusの画面上で
  "   Cでcommit
" ：Gread                  現在開いているソースの直前のコミット時のソースを表示
  " 現在開いているソースの直前のコミット時のソースを表示してくれる。表示されたファイルは上書きされているのではなく、バッファに展開されているだけなので、心配無用。
  " revisionも指定できるので1つ前のコミット時の様子をみたければ:Gread HEAD^でいける。
  " 現在との差分を表示したい場合は：Gdiffを使おう。
" ：Gmove destination/path 現在開いているソースをgit mvする
" ：Gremove                現在開いているソースをgit rmする
" ：Gblame                 現在のソースをgit blame。vimが色づけしてくれる
" ：Gdiff                  現在のソースの変更点をvimdiffで表示
" Fugitive {{{
nnoremap [git] <Nop>
nmap [space]g [git]
nmap ,g [git]
nnoremap [git]d :<C-u>Gdiff HEAD<CR>
nnoremap [git]s :<C-u>Gstatus<CR>
nnoremap [git]l :<C-u>Glog<CR>
nnoremap [git]a :<C-u>Gwrite<CR>
nnoremap [git]c :<C-u>Gcommit<CR>
nnoremap [git]C :<C-u>Git commit --amend<CR>
nnoremap [git]b :<C-u>Gblame<CR>
nnoremap [git]n :<C-u>Git now<CR>
nnoremap [git]N :<C-u>Git now --all<CR>
" }}}

" 6 箇所該当しました (計 5 行内) みたいに出力する
nnoremap <expr> ,/ _(":%s/<Cursor>/&/gn")
function! s:move_cursor_pos_mapping(str, ...)
  let left = get(a:, 1, "<Left>")
  let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
  return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction
function! _(str)
  return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction

" colorscheme solarized

if has('filetype')
  filetype indent plugin on
endif
syntax enable
set notitle

" if has('vim_starting')
"   set nocompatible
"   if !has("win32")
"     set runtimepath+=~/.vim/bundle/neobundle.vim/
"   endif
" endif
"
" " set nocompatible
" filetype off
" filetype indent off
" filetype plugin off
"
"
" if has('win32')
" else
"   " git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git
"   " set rtp+=~/.vim/vundle.git/
"   " call vundle#rc()
"
"   " git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"   call neobundle#begin(expand('~/.vim/bundle/'))
"   " call neobundle#rc(expand('~/.vim/bundle/'))
"   NeoBundleFetch 'Shougo/neobundle.vim'
"
"   " C-p 使ってるし C-j が my tmux prefix なので残念
"   " NeoBundle 'ctrlpvim/ctrlp.vim'
"
"   " NeoBundle 'flazz/vim-colorschemes'
"   " You can specify revision/branch/tag.
"   " NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
"
"   " :BundleInstall!
"   " :NeoBundleInstall!
"
"   NeoBundle 'Shougo/vimproc.vim', {
"         \ 'build' : {
"         \     'windows' : 'tools\\update-dll-mingw',
"         \     'cygwin' : 'make -f make_cygwin.mak',
"         \     'mac' : 'make -f make_mac.mak',
"         \     'linux' : 'make',
"         \     'unix' : 'gmake',
"         \    },
"         \ }
"
"   " Bundle 'rails.vim'
"   NeoBundle 'tpope/vim-rails'
"   " NeoBundle 'vim-ruby/vim-ruby'
"   " NeoBundle 'tpope/vim-cucumber'
"   NeoBundle 'thinca/vim-quickrun', {'depends' : 'Shougo/vimproc'}
"   if has('mac')
"     NeoBundle 'rhysd/quickrun-mac_notifier-outputter', {'depends' : 'thinca/vim-quickrun'}
"   endif
"   NeoBundle 'osyo-manga/shabadou.vim'
"   NeoBundle 'joker1007/quickrun-rspec-notifier'
"   NeoBundle 'osyo-manga/unite-quickrun_config'
"
"   " quickrun{{{
"   " エスケープカラーを表示する。
"   " MyAutocmd FileType quickrun AnsiEsc
"   nnoremap ,a :<C-U>AnsiEsc<CR>
"   " ヤンクを取りやすいようにconcealcursorを無効にする。
"   autocmd FileType quickrun setlocal concealcursor=""
"   " TODO: quickrun#module#register できてない
" "  call quickrun#module#register(shabadou#make_quickrun_hook_anim(
" "        \"now_running",
" "        \['||| Now Running |||', '/// Now Running ///', '--- Now Running ---', '\\\ Now Running \\\', '||| Now Running |||', '/// Now Running ///', '--- Now Running ---', '\\\ Now Running \\\', ],
" "        \2,
" "        \), 1)
"   let s:ansiesc_hook = {
"         \ 'kind' : 'hook',
"         \ 'name' : 'ansiesc',
"         \ 'config' : {},
"         \ }
"   function! s:ansiesc_hook.on_exit(session, context)
"     let l:winnr = winnr("$")
"     execute l:winnr 'wincmd w'
"     let ft = &filetype
"     if ft == 'quickrun'
"       AnsiEsc
"     endif
"   endfunction
"   " TODO: quickrun#module#register できてない
" "  call quickrun#module#register(s:ansiesc_hook, 1)
"
"   vnoremap <leader>q :QuickRun >>buffer -mode v<CR>
"
"   let g:quickrun_config = {}
"   let g:quickrun_config._ = {
"         \'runner' : 'vimproc',
"         \'outputter/buffer/split' : ':botright 10sp',
"         \'outputter/error': 'buffer',
"         \'runner/vimproc/updatetime' : 40,
"         \'hook/now_running/enable' : 1,
"         \'hook/time/enable' : 1,
"         \}
"   let s:rspec_quickrun_config = {
"         \ 'command': 'rspec',
"         \ 'outputter': 'multi:error:rspec_notifier',
"         \ 'outputter/buffer/split': ':botright 8sp',
"         \ 'hook/close_buffer/enable_success' : 1,
"         \}
"   let g:quickrun_config['rspec/bundle'] =
"         \ extend(copy(s:rspec_quickrun_config), {
"         \ 'type': 'rspec/bundle',
"         \ 'exec': 'bundle exec %c %o --color --tty %s%a'
"         \})
"   let g:quickrun_config['rspec/normal'] =
"         \ extend(copy(s:rspec_quickrun_config), {
"         \ 'type': 'rspec/normal',
"         \ 'exec': '%c %o --color --tty %s%a'
"         \})
"   let g:quickrun_config['rspec/spring'] =
"         \ extend(copy(s:rspec_quickrun_config), {
"         \ 'type': 'rspec/spring',
"         \ 'exec': 'spring rspec %o --color --tty %s%a'
"         \})
"   let s:cucumber_quickrun_config = {
"         \ 'command': 'cucumber',
"         \ 'outputter': 'buffer',
"         \ 'outputter/buffer/split': ':botright 8sp',
"         \}
"   let g:quickrun_config['cucumber/bundle'] =
"         \ extend(copy(s:cucumber_quickrun_config), {
"         \ 'type': 'cucumber/bundle',
"         \ 'exec': 'bundle exec %c %o --color %s'
"         \})
"   let g:quickrun_config['cucumber/spring'] =
"         \ extend(copy(s:cucumber_quickrun_config), {
"         \ 'type': 'cucumber/spring',
"         \ 'exec': 'spring cucumber %o --color %s'
"         \})
"   let g:quickrun_config['markdown'] = {
"         \ 'type': 'markdown/gfm',
"         \ 'outputter': 'browser'
"         \}
"
"   function! s:RSpecQuickrun()
"     if exists('g:use_spring_rspec') && g:use_spring_rspec == 1
"       let b:quickrun_config = {'type' : 'rspec/spring'}
"     elseif exists('g:use_zeus_rspec') && g:use_zeus_rspec == 1
"       let b:quickrun_config = {'type' : 'rspec/zeus'}
"     else
"       let b:quickrun_config = {'type' : 'rspec/bundle'}
"     endif
"     nnoremap <expr><silent> <Leader>lr "<Esc>:QuickRun -args :" . line(".") . "<CR>"
"   endfunction
"   autocmd BufReadPost *_spec.rb call s:RSpecQuickrun()
"
"   function! s:CucumberQuickrun()
"     if exists('g:use_spring_cucumber') && g:use_spring_cucumber == 1
"       let b:quickrun_config = {'type' : 'cucumber/spring'}
"     elseif exists('g:use_zeus_cucumber') && g:use_zeus_cucumber == 1
"       let b:quickrun_config = {'type' : 'cucumber/zeus'}
"     else
"       let b:quickrun_config = {'type' : 'cucumber/bundle'}
"     endif
"     nnoremap <expr><silent> <Leader>lr "<Esc>:QuickRun -cmdopt \"-l " . line(".") . "\"<CR>"
"   endfunction
"   autocmd BufReadPost *.feature call s:CucumberQuickrun()
"
"   function! s:SetUseSpring()
"     let g:use_spring_rspec = 1
"     let g:use_zeus_rspec = 0
"     let g:use_spring_cucumber = 1
"     let g:use_zeus_cucumber = 0
"   endfunction
"
"   function! s:SetUseZeus()
"     let g:use_zeus_rspec = 1
"     let g:use_spring_rspec = 0
"     let g:use_zeus_cucumber = 1
"     let g:use_spring_cucumber = 0
"   endfunction
"
"   function! s:SetUseBundle()
"     let g:use_zeus_rspec = 0
"     let g:use_spring_rspec = 0
"     let g:use_zeus_cucumber = 0
"     let g:use_spring_cucumber = 0
"   endfunction
"
"   command! -nargs=0 UseSpringRSpec let b:quickrun_config = {'type' : 'rspec/spring'} | call s:SetUseSpring()
"   command! -nargs=0 UseZeusRSpec   let b:quickrun_config = {'type' : 'rspec/zeus'}   | call s:SetUseZeus()
"   command! -nargs=0 UseBundleRSpec let b:quickrun_config = {'type' : 'rspec/bundle'} | call s:SetUseBundle()
"   command! -nargs=0 UseSpringCucumber let b:quickrun_config = {'type' : 'cucumber/spring'} | call s:SetUseSpring()
"   command! -nargs=0 UseZeusCucumber   let b:quickrun_config = {'type' : 'cucumber/zeus'}   | call s:SetUseZeus()
"   command! -nargs=0 UseBundleCucumber let b:quickrun_config = {'type' : 'cucumber/bundle'} | call s:SetUseBundle()
"   " }}}
"
"
"
"
"   " colorschemes
"   NeoBundle 'altercation/vim-colors-solarized'
"   NeoBundle 'jpo/vim-railscasts-theme'
"   NeoBundle 'tomasr/molokai'
"   " NeoBundle 'baskerville/bubblegum'
"   " NeoBundle 'nanotech/jellybeans.vim'
"   " NeoBundle 'w0ng/vim-hybrid'
"   " NeoBundle 'vim-scripts/twilight'
"   " NeoBundle 'jonathanfilip/vim-lucius'
"   " NeoBundle '29decibel/codeschool-vim-theme'
"
"
"   " NeoBundle 'Shougo/neocomplcache'
"   NeoBundle 'Shougo/neocomplete'
"   let g:neocomplete#enable_at_startup = 1
"
"   " neosnippet
"   NeoBundle 'Shougo/neosnippet', {
"         \   'depends' : ["Shougo/neosnippet-snippets"]
"         \}
"   NeoBundle 'Shougo/neosnippet-snippets'
"   imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"   smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"   " neosnippet {{{
"   if neobundle#tap('neosnippet')
"     let g:neosnippet#snippets_directory = [
"           \'~/.vim/snippets',
"           \'~/.vim/bundle/itamae-snippets',
"           \]
"     call neobundle#untap()
"   endif
"   nnoremap <silent> ,itamae :<C-U>set ft=ruby.itamae<CR>
"   " }}}
"
"
"
"   NeoBundle 'mattn/webapi-vim'
"   NeoBundle 'Shougo/unite.vim'
"   NeoBundle 'Shougo/neomru.vim'
"   NeoBundle 'sorah/unite-ghq'
"
"   NeoBundle 'Shougo/vimfiler'
"   " N  新規ファイルを作成
"   " K  新規ディレクトリを作成
"   " D  ファイル削除
"   " c copy
"   " p paste
"   " m move
"   " r rename
"   " yy 選択中のファイルのフルパスをコピー
"   " gs セーフモードのオン/オフの切り替え
"   " .  隠しファイルの表示/非表示の切り替え
"   " Ctrl+l 画面の再描画
"   let g:vimfiler_as_default_explorer = 1  "vimデフォルトのエクスプローラをvimfilerで置き換える(e.g. :e .)
"   " let g:vimfiler_safe_mode_by_default = 0 "セーフモードを無効にした状態で起動する
"   " :VimFiler -split -simple -winwidth=35 -no-quit コマンドで、IDEのファイルエクスプローラのような見た目になります。長いので.vimrcでマップして呼び出しましょう。
"   "  => :Vimfiler -explorer で事足りてるからいいか。
"
"   " 関数などのアウトラインをいい感じに見られる
"   " :Unite outline
"   " NeoBundle 'h1mesuke/unite-outline'
"   " NeoBundle 'Shougo/unite-outline'
"   NeoBundle 'totem3/unite-outline'
"
"   NeoBundle 'tpope/vim-fugitive'
"   " ：Gstatus                新しい窓を作ってgit statusを表示
"     " ：Gstatus上の変更のあったファイルにカーソルを合わせた状態で
"     "   Dで:Gdiff起動(差分表示)
"     "   -でaddとresetの切り替え
"     "   pでパッチを表示
"     "   Enterでファイル表示
"     "   :Gstatusの画面上で
"     "   Cでcommit
"   " ：Gwrite                 現在開いているソースをgit add
"   " ：Gread                  現在開いているソースの直前のコミット時のソースを表示
"     " 現在開いているソースの直前のコミット時のソースを表示してくれる。表示されたファイルは上書きされているのではなく、バッファに展開されているだけなので、心配無用。
"     " revisionも指定できるので1つ前のコミット時の様子をみたければ:Gread HEAD^でいける。
"     " 現在との差分を表示したい場合は：Gdiffを使おう。
"   " ：Gmove destination/path 現在開いているソースをgit mvする
"   " ：Gremove                現在開いているソースをgit rmする
"   " ：Gcommit                git commit
"     " git-commitに-vオプションを付けたい場合はそのまま:Gcommit -vとすればいい。
"   " ：Gblame                 現在のソースをgit blame。vimが色づけしてくれる
"   " ：Gdiff                  現在のソースの変更点をvimdiffで表示
"   " Fugitive {{{
"   nnoremap [git] <Nop>
"   nmap [space]g [git]
"   nmap ,g [git]
"   nnoremap [git]d :<C-u>Gdiff HEAD<CR>
"   nnoremap [git]s :<C-u>Gstatus<CR>
"   nnoremap [git]l :<C-u>Glog<CR>
"   nnoremap [git]a :<C-u>Gwrite<CR>
"   nnoremap [git]c :<C-u>Gcommit<CR>
"   nnoremap [git]C :<C-u>Git commit --amend<CR>
"   nnoremap [git]b :<C-u>Gblame<CR>
"   nnoremap [git]n :<C-u>Git now<CR>
"   nnoremap [git]N :<C-u>Git now --all<CR>
"
"   " ftdetect is often failed
"   " MyAutocmd BufEnter * if expand("%") =~ ".git/COMMIT_EDITMSG" | set ft=gitcommit | endif
"   " MyAutocmd BufEnter * if expand("%") =~ ".git/rebase-merge" | set ft=gitrebase | endif
" " }}}
"
"   NeoBundle 'gregsexton/gitv'
"   " gitv {{{
"   nnoremap [git]vn :<C-u>Gitv<CR>
"   " 全てのブランチを表示
"   nnoremap [git]va :<C-u>Gitv --all<CR>
"   nnoremap [git]vf :<C-u>Gitv!<CR>
"
"   " http://d.hatena.ne.jp/cohama/20130517/1368806202
"   function! GitvGetCurrentHash()
"     return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
"   endfunction
"
"   function! s:my_gitv_settings()
"     " setlocal foldlevel=99
"     autocmd FileType git :setlocal foldlevel=99
"     " autocmd FileType git setlocal nofoldenable foldlevel=0
"
"     setlocal iskeyword+=/,-,.
"     " カーソル下のブランチ名で checkout
"     " ブランチ間移動 r/R
"     nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
"
"     " カーソル位置のコミットに対する操作
"     nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
"     nnoremap <buffer> <Space>ri :<C-u>Git rebase -i <C-r>=GitvGetCurrentHash()<CR><Space>
"     nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
"     nnoremap <buffer> <Space>p :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
"     nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
"   endfunction
"   autocmd FileType gitv call s:my_gitv_settings()
"
"   " }}}
"
" " 最近使ってないので、暫く off にしてみる。vim が重いのをやめたい。
" "   " syntax check
" "   " :SyntasticCheck, :Errors
" "   NeoBundle 'scrooloose/syntastic'
" " "  let g:syntastic_enable_signs=1
" "   " syntastic_auto_loc_listを1にしとくと error で Quickfix が立ち上がる
" "   " let g:syntastic_auto_loc_list=1
" " "  let g:syntastic_check_on_open=1
" "   " let g:syntastic_auto_loc_list=2
" "   if executable('rubocop')
" "     let g:syntastic_ruby_checkers = ['rubocop']
" "   endif
" "   if executable('jshint')
" "     let g:syntastic_javascript_checker = 'jshint'
" "   endif
" "   " let g:syntastic_disabled_filetypes=['html']
"
"
"   " syntax
"   NeoBundle "slim-template/vim-slim"
"   " NeoBundle 'tpope/vim-haml'
"   " NeoBundle 'nono/vim-handlebars'
"   " NeoBundle 'juvenn/mustache.vim'
"   NeoBundle "kchmck/vim-coffee-script"
"   NeoBundle 'tacahilo/itamae-snippets' " :set ft=ruby.itamae
"   NeoBundle 'mattn/emmet-vim' " html タグへの展開は C-y,
"   NeoBundle "vim-scripts/paredit.vim"
"   NeoBundle 'vim-jp/vim-go-extra'
"   NeoBundle 'google/vim-ft-go'  " 最新のvimだと対応しているらしい
"   NeoBundle 'elixir-lang/vim-elixir'
"   NeoBundle 'leafgarland/typescript-vim'
"
"   " vim-markdown {{{
"   NeoBundle 'plasticboy/vim-markdown'
"   NeoBundle 'kannokanno/previm' " :PrevimOpen でブラウザで開く
"   NeoBundle 'tyru/open-browser.vim'
"   au BufRead,BufNewFile *.md set filetype=markdown
"   let g:vim_markdown_folding_disabled=1
"   " let g:previm_open_cmd = 'open -a Firefox' " open-browser があれば不要
"   " }}}
"
"   NeoBundle 'bling/vim-airline'
"   NeoBundle 'vim-airline/vim-airline-themes'
"   " vim-airline {{{
"   let g:airline#extensions#tabline#enabled = 1
"   let g:airline_powerline_fonts = 1
"   " let g:airline_theme = "wombat"
"   let g:airline_theme = "powerlineish"
"   " let g:airline_theme = "sol"
"   let g:airline#extensions#hunks#hunk_symbols = [
"         \ g:gitgutter_sign_added . ' ',
"         \ g:gitgutter_sign_modified . ' ',
"         \ g:gitgutter_sign_removed . ' '
"         \ ]
"   " }}}
"
"
"   " ruby
"   NeoBundle 'tpope/vim-endwise' " Ruby の end を自動挿入してくれる
"   NeoBundle 'tomtom/tcomment_vim' " control-- でコメントの on off
"   " NeoBundle 'vim-scripts/ruby-matchit'
"   " matchitスクリプトの読み込み
"   source $VIMRUNTIME/macros/matchit.vim
"
" " Bundle 'scrooloose/nerdcommenter'
"   " Bundle 'thinca/vim-ref'
"   " Bundle 'kana/vim-fakeclip'
"
"   " e.g. viwS' cs'" ds"
"   NeoBundle 'tpope/vim-surround'
"
"   NeoBundle 'haya14busa/incsearch.vim'
"   map /  <Plug>(incsearch-forward)
"   map ?  <Plug>(incsearch-backward)
"   map g/ <Plug>(incsearch-stay)
"   NeoBundle 'osyo-manga/vim-anzu' " display search result like (current/all)
"   nmap n <Plug>(anzu-n-with-echo)
"   nmap N <Plug>(anzu-N-with-echo)
"   nmap * <Plug>(anzu-star-with-echo)
"   nmap # <Plug>(anzu-sharp-with-echo)
"   set statusline=%{anzu#search_status()}
"
"   NeoBundle 'nathanaelkane/vim-indent-guides' " indent を色付きに見やすくする
"   NeoBundle 'bronson/vim-toggle-wrap' " \w
"   " NeoBundle 'godlygeek/tabular'
"
"   NeoBundle 'majutsushi/tagbar'
"   " TagBar
"   nnoremap <silent> ,t :TagbarToggle<CR>
"   let g:tagbar_left = 1
"   let g:tagbar_width = 30
"   let g:tagbar_updateonsave_maxlines = 10000
"   let g:tagbar_sort = 0
"
"
"   " ファイルを tree 表示する
"   " :NERDTree
"   " NeoBundle 'scrooloose/nerdtree'
"
"   " ANSIカラー情報が含まれる場合反映して表示する
"   NeoBundle 'vim-scripts/AnsiEsc.vim'
"
"   " :OverCommandLine で起動する
"   NeoBundle 'osyo-manga/vim-over'
"
"   " :Unite codic
"   NeoBundle 'koron/codic-vim'
"   NeoBundle 'rhysd/unite-codic.vim'
"
"   NeoBundle 'itchyny/calendar.vim'
"   let g:calendar_google_calendar = 1
"   let g:calendar_google_task = 1
"
"   " 括弧を自動で閉じてくれるやつ
"   " esc 2回押す必要が生じたり abbrev が効かなくなったりしたのでやめた
"   " NeoBundle 'Townk/vim-autoclose'
"
" " clang_complete
" " NeoBundle 'Rip-Rip/clang_complete'
" " let g:clang_periodic_quickfix = 1
" " let g:clang_complete_copen = 1
" " let g:clang_use_library = 1
" " " this need to be updated on llvm update
" " let g:clang_library_path = '/usr/lib/llvm-3.4/lib'
" " " specify compiler options
" " let g:clang_user_options = '-std=c++11 -stdlib=libc++'
"
"   " tweetvim
"   " NeoBundle 'basyura/TweetVim'
"   " NeoBundle 'mattn/webapi-vim'
"   " NeoBundle 'basyura/twibill.vim'
"   " NeoBundle 'tyru/open-browser.vim'
"   " " NeoBundle 'h1mesuke/unite-outline' 上でもういれてる
"   " " NeoBundle 'Shougo/unite.vim' 上でもういれてる
"   " NeoBundle 'basyura/bitly.vim'
"
"   " gist
"   " :Gist        Post current buffer to gist, using default privacy option.
"   " :'<,'>Gist   Post selected text to gist, using default privacy option. This applies to all permutations listed below (except multi).
"   " :Gist -p     Create a private gist.
"   " :Gist -P     Create a public gist. (Only relevant if you've set gists to be private by default.)
"   " :Gist --list
"   NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
"
"   " :GoogleTranslate
"   " :GoogleTranslate ja
"   " :GoogleTranslate zh-cn ja
"   " NeoBundle 'mattn/googletranslate-vim'
"
"   " hatena blog
"   " :HatebloCreate
"   " :HatebloCreateDraft
"   " :HatebloList
"   " :HatebloUpdate [new_entry_title]
"   " :HatebloDelete
"   NeoBundle 'moznion/hateblo.vim'
"   " NeoBundle 'moznion/hateblo.vim', {
"   "         \ 'depends': ['mattn/webapi-vim', 'Shougo/unite.vim']
"   " \ }
"
"   call neobundle#end()
" endif
"
" " grep後にcwinを表示
" " autocmd QuickFixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
"
" "---------------------------------------------------------------------------
"
" " 256色モード
" if stridx($TERM, "256color") >= 0
"   set t_Co=256
" else
"   set t_Co=16
" endif
"
" if has('win32')
"   colorscheme darkblue
"   " set guifont=MS_Gothic:h8:cSHIFTJIS
" "  set linespace=1
" "  " 一部のUCS文字の幅を自動計測して決める
" "  if has('kaoriya')
" "    set ambiwidth=auto
" "  endif
" elseif has('mac')
"   " colorscheme darkblue
"   let g:solarized_termcolors=256
"   " exe "hi Comment" . s:fg_base01 .s:bg_base02 .s:fmt_none
"   " let g:solarized_visibility="high"
"   let g:solarized_contrast="high"
"   let g:solarized_termtrans=1
"   colorscheme solarized
"
"   set clipboard=unnamed,autoselect
"
" elseif has('unix')
"   " xubuntu
"   " colorscheme slate
"   " colorscheme desert
"   " colorscheme pablo
"   " colorscheme elflord " when normal terminal
"   " colorscheme railscasts
"   let g:solarized_termcolors=256
"   let g:solarized_contrast="high"
"   let g:solarized_termtrans=1
"   colorscheme solarized
"   " colorscheme molokai
"   " let g:molokai_original = 1
"
"   set clipboard=unnamedplus
"
" " elseif has('xfontset')
" "   " UNIX用 (xfontsetを使用)
" "   set guifontset=a10,r10,k10
" else
"   " ubuntu
"   colorscheme slate
" endif
"
" set scrolloff=3 " 常にカーソル位置から5行余裕を取る
"
" " 80桁を意識させる線が現れる。少し邪魔。
" if (exists('+colorcolumn'))
"     set colorcolumn=80
"     highlight ColorColumn ctermbg=9
" endif
"
" "カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
" nnoremap j gj
" nnoremap k gk
" nnoremap Y y$
" nnoremap "" :%s/'/"/g<CR>
" nnoremap '' :%s/"/'/g<CR>
" noremap [space]h  ^
" noremap [space]j  G
" noremap [space]k  1G
" noremap [space]l  $
" nnoremap ,p :pwd<CR>
" nnoremap ,.. :cd ..<CR>:pwd<CR>
"
" " vimgrep の検索結果など、Quickfix 操作用
" " :cw[indow] で window open
" nnoremap [q :cprevious<CR>   " 前へ
" nnoremap ]q :cnext<CR>       " 次へ
" nnoremap [Q :<C-u>cfirst<CR> " 最初へ
" nnoremap ]Q :<C-u>clast<CR>  " 最後へ
"
" set tags=./tags,tags;$HOME
" " ctags で対象複数の場合は一覧表示する
" nnoremap <C-]> g<C-]>
"
" " insert normal remap
" " Insert mode でのカーソル移動
" inoremap <C-b> <Left>
" inoremap <C-f> <Right>
" inoremap <C-a> <Home>
" inoremap <C-e> <End>
" inoremap <C-d> <Del>
" " inoremap <C-k> <C-o>D
"
" " from http://vim-users.jp/2011/04/hack214/ {{{
" vnoremap ( t(
" vnoremap ) t)
" vnoremap ] t]
" vnoremap [ t[
" onoremap ( t(
" onoremap ) t)
" onoremap ] t]
" onoremap [ t[
" " }}}
"
"
" " :au[tocmd] [group] {event} {pat} [nested] {cmd}
" " - [group]を指定していないautocmdをvimrc内に記述していると、vimrcを再読み込みするたびにそのautocmdが登録されてしまいます。 
" "   vimrcを読み込んだ回数だけautocmdが実行され段々Vimが重くなっていきます。
" " - autocmdは対応したイベントが発生したときに指定したコマンドを実行します。
" "   今回の場合、「新しいファイルを開いたとき(BufNewFile)」または「既存のファイルを読み込んだとき(BufRead)」に、
" "   「拡張子が *.XX であれば」nnoremap以降を実行する、という指定になります。
" augroup vimrc
"   " これを宣言することでグループvimrcに属するautocmdを初期化できます。
"   " autocmd!が現在のグループに属しているautocmdをすべて登録解除するので、
"   " その後にグループvimrcに属したautocmdを使えばOKです。
"   autocmd!
" augroup END
"
" autocmd vimrc BufNewFile,BufRead *.rb nnoremap <C-x> :!ruby %
" autocmd vimrc BufNewFile,BufRead *.py nnoremap <C-x> :!python %
" autocmd vimrc BufNewFile,BufRead *.pl nnoremap <C-x> :!perl %
"
" set directory=~/swp
"
" " set nu
" set nonu
" set ruler
" "印刷時行番号も出力
" set printoptions=number:y
" set shiftround
" set autoindent
" "set noautoindent
" set backspace=indent,eol,start
" set autoread " 他でファイルが編集された時に自動再読み込み
" " set background=dark
" set background=light
"
" "set encoding=japan
" "set fileencoding=euc-jp
" set encoding=utf-8
" set fileencoding=utf-8
" " set termencoding=utf-8
" " set fileencodings=euc-jp,iso-2022-jp
"
" " search
" set incsearch
" set hlsearch
" set ignorecase
" set smartcase " ignorecase を有効にしている場合に大文字が入ると ignorecase が無効になる
" set wrapscan " 最後尾まで検索を終えたら次の検索で先頭に移る
" nohlsearch "reset highlight
" " anzu status も同時に消す
" nnoremap <silent> [space]/ :noh<CR>:AnzuClearSearchStatus<CR>
"
" set hidden " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
" " set gdefault   " 置換の時 g オプションをデフォルトで有効にする
"
" set history=50
"
" " status line
" set laststatus=2 " ステータス行を常に表示
" " airline に置き換えられた
" " set statusline=%<%f\ %m%r%h%w%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %8P
" " git の branch 表示する設定
" " set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'.fugitive#statusline()}%=%-14.(%l,%c%V%)\ %8P
"
" set noswapfile
" set nobackup
" " set backup
" " set backupdir=~/.vimbackup
" " let &directory = &backupdir
"
" " Undo履歴をファイルに保存する
" " set undodir=$HOME/.vim/undo
" " set undofile
" set noundofile
"
" " set wrap
" set nowrap
" set ic
" " set noic
"
" set expandtab " tab じゃなくて space
" set smarttab
" set tabstop=2     " ファイル中の<Tab>文字(キャラクターコード9)を、画面上の見た目で何文字分に展開するかを指定する。既にあるファイルをどのように表示するのか指定したい時に便利。
" set shiftwidth=2  " vimが挿入するインデント('cindent')やシフトオペレータ(>>や<<)で挿入/削除されるインデントの幅を、画面上の見た目で何文字分であるか指定します。自動的に挿入される量、と覚えておくと良いです。
" set softtabstop=0 " キーボードで<Tab>キーを押した時に挿入される空白の量。'softtabstop'が0以外の時には、例え'ts'を4に設定していても、<Tab>を1度押しても'softtabstop'分だけ空白が挿入されます。逆に'softtabstop'が0の場合には挿入されるのは'ts'で指定した量になります。
" " autocmd FileType perl set tabstop=2
" " autocmd FileType perl set shiftwidth=2
" " autocmd FileType ruby set tabstop=2
" " autocmd FileType ruby set shiftwidth=2
" " autocmd FileType eruby set tabstop=2
" " autocmd FileType eruby set shiftwidth=2
" " autocmd FileType javascript set tabstop=2
" " autocmd FileType javascript set shiftwidth=2
" autocmd FileType c set tabstop=4 shiftwidth=4
" autocmd FileType cpp set tabstop=4 shiftwidth=4
"
"
" "text witdh
" set tw=0
"
" set showmatch " 対応する括弧の表示
"
" set showcmd " 入力中のコマンドを表示
" set wildmenu " 補完候補を表示する
"
"
"
" "autocmd CursorHold * update
" set updatetime=500
"
" set iminsert=0 imsearch=0
"
" " Hard Tabs
" " set listchars=tab:>-,trail:%,eol:↲,nbsp:x
" " set listchars=tab:>-,eol:↲,nbsp:x
" " set listchars=tab:>-,eol:↲
" set listchars=tab:>-
" set list
"
" " #asakusarb #vim #ruby
" " let g:ruby_fold = 1
" " let g:ruby_foldable_groups = '#'
"
" inoremap ,date <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
" inoremap ,bdate <C-R>=strftime("date: %Y-%m-%d %H:%M")<CR>
" inoremap ,todo todo: <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
" inoremap ,done done: <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
" inoremap #!ruby #!/usr/bin/env ruby
" inoremap #!sh #!/bin/sh
" inoremap #!html <!DOCTYPE html>
" inoremap ,# # -------------------------------------------------------------------------
" inoremap .# # =========================================================================
"
" " 一般的な正規表現に近づける。
" " nmap / /\v
" " 置換条件を省略すると最後に検索した検索条件を利用します。
" " 複雑な正規表現等で置換を行う際は / による検索で、
" " ハイライトされる範囲が正しい事を確認してから、
" " 以下のようにすることで直前に引っ掛けた箇所をそのまま置換することができます。
" " /FooBarBaz          " FooBarBazを検索
" " :%s//HogeFugaPiyo/g " FooBarBaz -> HogeFugaPiyoに置換される。
"
" " バッファ一覧
" nmap ,b :buffers<CR>
" nnoremap [space]n :<C-U>bnext<CR>
" nnoremap [space]p :<C-U>bprevious<CR>
" nnoremap ,l :<C-U>bnext<CR>
" nnoremap ,h :<C-U>bprevious<CR>
" nnoremap <Leader>1   :e #1<CR>
" nnoremap <Leader>2   :e #2<CR>
" nnoremap <Leader>3   :e #3<CR>
" nnoremap <Leader>4   :e #4<CR>
" nnoremap <Leader>5   :e #5<CR>
" nnoremap <Leader>6   :e #6<CR>
" nnoremap <Leader>7   :e #7<CR>
" nnoremap <Leader>8   :e #8<CR>
" nnoremap <Leader>9   :e #9<CR>
"
"
" " Space prefix
" nnoremap [space] <Nop>
" nmap     <Space> [space]
" xmap     <Space> [space]
"
" " Edit vimrc
" nnoremap [space]v :<C-U>edit $MYVIMRC<CR>
"
" " Reload vimrc"{{{
" if has('vim_starting')
"   function! ReloadVimrc()
"     source $MYVIMRC
"     if has('gui_running')
"       source $MYGVIMRC
"     endif
"
"   echom "Reload vimrc"
"   endfunction
" endif
" nmap <expr> [space]rv ReloadVimrc()
" "}}}
"
" nnoremap <silent> ,vf :<C-U>VimFiler<CR>
" " nnoremap <silent> [space]vf :<C-U>VimFiler<CR>
" nnoremap [unite]    <Nop>
" nmap     ,u [unite]
" nmap     [space]u [unite]
" nnoremap <silent> [unite]b   :<C-u>Unite -buffer-name=buffers -start-insert -prompt=Buffer>\  buffer<CR>
" nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
" nnoremap <silent> [unite]fa  :<C-u>Unite -buffer-name=files -start-insert file_rec/async<CR>
" nnoremap <silent> [unite]fd  :<C-u>Unite -buffer-name=files -start-insert file_rec/async:!<CR>
" nnoremap <silent> [unite]fg  :<C-u>Unite -buffer-name=files -start-insert file_rec/git<CR>
" nnoremap <silent> [unite]fr  :<C-u>Unite -buffer-name=files -start-insert file_mru<CR>
" nnoremap <silent> [unite]g   :<C-u>Unite -buffer-name=ghq -start-insert ghq<CR>
"
" " dot file も表示するように?
" call unite#custom#source('file_rec,file_rec/async', 'matcher', 'matcher_default')
"
"
" " Abbreviations
" " http://vim-jp.org/vimdoc-ja/map.html#abbreviations
" " ab コマンドラインモードと挿入モードの短縮入力の設定
" " ca コマンドラインモードの短縮入力の設定
" " ia 挿入モードの短縮入力の設定
" " vim-autoclose 入れたら効かなくなったので inoremap にした
" " iabbrev ,# # -------------------------------------------------------------------------
" " iabbrev .# # =========================================================================
"
" " w!! で sudo で保存
" cabbr w!! w !sudo tee > /dev/null %
"
" " perl test
" "       augroup filetypedetect
" "       autocmd! BufNewFile,BufRead *.t setf perl
" "       augroup END
"
"
" " minibufexpl.vim の設定
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBuffs = 1
"
"
" " 自動cd
" " ref. http://nanasi.jp/articles/vim/cd_vim.html
"
" " golang
" if $GOROOT != ''
"   augroup golang
"     autocmd! golang
"     " gofmt Go source files when they are saved
"     " autocmd FileType go autocmd BufWritePre <buffer> Fmt
"   augroup END
" endif
"
" " 編集中のファイルのディレクトリに移動
" nnoremap ,d :execute ":lcd" . expand("%:p:h")<CR>
"
" " ChangeLog
" let g:changelog_username = 'Kazuma Furuhashi <k.furuhashi10@gmail.com>'
"
" " netrw tree view
" let g:netrw_liststyle = 3
"
" syntax on
" highlight ZenkakuSpace ctermbg=6 guibg=cyan
" match ZenkakuSpace /\s\+$\|　\|\t/
"
"
"
" set cursorline " カーソル行をハイライト
" if has('mac')
"   " autocmd InsertLeave * setlocal nocursorline
"   " autocmd InsertEnter * setlocal cursorline
" elseif has('unix')
"   " カレントウィンドウにのみ罫線を引く
"   augroup cch
"     autocmd! cch
"     autocmd WinLeave * set nocursorline
"     autocmd WinEnter,BufRead * set cursorline
"   augroup END
"
"   " hi clear CursorLine
"   " hi CursorLine gui=underline
"   " highlight CursorLine ctermbg=0 ctermfg=White guibg=darkblue
"   " highlight CursorLine ctermbg=#222222 guibg=darkblue
" "  highlight CursorLine ctermbg=8 guibg=darkblue
"   " highlight CursorLine ctermbg=8
"   " highlight Search ctermbg=3
"   " highlight Visual ctermbg=2
"   " hi LineNr term=bold ctermfg=239 ctermbg=none gui=bold guifg=Black
" else
" endif
"
"
" " 補完内容が詳細に表示されるようになる
" set completeopt=menu,preview
"
" " vim-indent-guides {{{
" let g:indent_guides_auto_colors=0 " 自動カラーを無効にする
" let g:indent_guides_color_change_percent = 35 " ハイライト色の変化の幅 (Terminal では未サポート?)
" let g:indent_guides_enable_on_vim_startup=1 " 自動的にvim-indent-guidesをオンにする
" let g:indent_guides_guide_size = 1 " ガイドの幅
" " let g:indent_guides_guide_size = &tabstop " ガイド幅をインデント幅に合わせる
" " let g:indent_guides_start_level=1 " 1インデント目からガイドする
"
" " 奇数インデントのガイドカラー
" " hi IndentGuidesOdd  ctermbg=yellow
" " hi IndentGuidesOdd  ctermbg=white
" " 偶数インデントのガイドカラー
" " hi IndentGuidesEven ctermbg=gray
" " hi IndentGuidesEven ctermbg=darkgray
"
" if has('mac')
"   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=DarkGrey ctermbg=darkgrey
"   autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=DarkCyan ctermbg=12
" elseif has('unix')
"   " on Xubuntu
"   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=DarkGrey ctermbg=darkgrey
"   autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=DarkCyan ctermbg=lightgrey
"   " hi IndentGuidesOdd  ctermbg=magenta
"   " hi IndentGuidesEven ctermbg=white
" endif
"
"
" " }}}
"
" " ポップアップメニューのカラーを設定
" autocmd Syntax * hi Pmenu ctermfg=15 ctermbg=18 guibg=#666666
" autocmd Syntax * hi PmenuSel ctermbg=39 ctermfg=0 guibg=#8cd0d3 guifg=#666666
" autocmd Syntax * hi PmenuSbar guibg=#333333
"

" filetype plugin indent on
" set notitle

" memo
":so $VIMRUNTIME/syntax/colortest.vim

" 保存したいが権限ないとき
" :w !sudo tee % > /dev/null

" モード 再割当有り 再割当無し
" ノーマルモード＋ビジュアルモード noremap map
" コマンドラインモード＋インサートモード noremap! map!
" ノーマルモード nnoremap nmap
" ビジュアル(選択)モード	vnoremap	vmap
" コマンドラインモード	cnoremap	cmap
" インサート(挿入)モード	inoremap	imap

" ソートできる
" sort, sort u, sort!, sort! u

" ファイル全体から 文字列 が 含まれていない行 を削除
" :v/{文字列}/d

" ファイル全体から 文字列 が 含まれている行以外 を削除
" :g/{文字列}/d

" q:      コマンド実行履歴
" q/, q?  検索履歴

" ]c 次の変更行にジャンプ
" [c 前の変更行にジャンプ

" 改行(^M) の入力は C-v, C-m
"
