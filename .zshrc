
stty intr 

# path

case ${OSTYPE} in
  darwin*)
    export PATH="${HOME}/ios/cocos2d-x-2.2.1/tools/project-creator:${PATH}"
    export PATH="/usr/local/bin:${PATH}"
# ln -s /usr/local/opt/git/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin
    ;;
  linux*)
    ;;
esac



# rbenv
if [ -d ${HOME}/.rbenv ]; then
    # shims は tmux のため
    export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
    eval "$(rbenv init - zsh)"
#     # phpenv
#     # --------------------------------------------------
#     # IMPORTANT NOTES
#     # For rbenv users: Make sure that ~/.rbenv/bin takes
#     # precedence in the PATH over ~/.phpenv/bin by placing
#     # it before, so rbenv gets used from ~/.rbenv.
#     # --------------------------------------------------
#     if [ -d ${HOME}/.phpenv ]; then
# #         export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${HOME}/.phpenv/bin:${HOME}/.phpenv/shims:${PATH}"
#         export PATH="${PATH}:${HOME}/.phpenv/bin:${HOME}/.phpenv/shims"
# #         export PATH="${HOME}/.phpenv/bin:${HOME}/.phpenv/shims:${PATH}"
#         eval "$(phpenv init - zsh)"
# #        eval "$(rbenv init - zsh)"
#     fi
fi
# plenv
if [ -d ${HOME}/.plenv  ]; then
    export PATH=${HOME}/.plenv/bin:${HOME}/.plenv/shims:${PATH}
    eval "$(plenv init - zsh)"
fi

# ndenv
## install
## $ git clone https://github.com/riywo/ndenv ~/.ndenv
## $ echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bash_profile
## $ echo 'eval "$(ndenv init -)"' >> ~/.bash_profile
## $ exec $SHELL -l
## $ git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build
if [ -d ${HOME}/.ndenv  ]; then
    export PATH=${HOME}/.ndenv/bin:${HOME}/.ndenv/shims:${PATH}
    eval "$(ndenv init - zsh)"
fi
# pyenv
if [ -d ${HOME}/.pyenv  ]; then
    export PATH=${HOME}/.pyenv/bin:${HOME}/.pyenv/shims:${PATH}
    eval "$(pyenv init - zsh)"
fi

# for go lang
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  # export GOPATH=$HOME/go
  export GOPATH=$HOME
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi
# Go completion
# if [ -f $GOROOT/misc/zsh/go ]; then
#     source $GOROOT/misc/zsh/go
# fi

# unset PS1
PS1=%F{5}%#%f
# PS1=%F{7}%K{6}%#%k%f
# PS1=%F{7}%K{6}%/%#%k%f
# RPROMPT=%F{7}%K{6}%T%k%f

# 時間出す
# RPROMPT=%F{5}%T%f

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info
# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{3}%1v%f|)"



export MYSQL_PS1="(\u@\h) [\d]>"

# %M  ホスト名    localhost.localdomain
# %m  ホスト名    localhost
# %n  ユーザ名    root
# %#  ユーザ種別  #（rootの場合）
# %（root以外）
# %y  ログイン端末名  pts/0
# %l  ログイン端末名  pst/0（tty*の場合はttyを省略）
# %?  直前のコマンドの戻り値  0
# %h
# %!  コマンド実行数 （history数）   1
# %d
# %/  カレントディレクトリ    /root/currentdir
# %~  カレントディレクトリ    ~/currentdir
# %C  カレントディレクトリ    currentdir
# %c
# %.  カレントディレクトリ    currentdir （$PWD=$HOMEの場合は~）
# %D  日付    12-07-31 書式）yy-mm-dd
# %W  日付    07/31/12 書式）mm/dd/yy
# %w  日付    Sun 31 書式）day dd
# %*  時間    15:50:30 書式）hh:mm:ss
# %T  時間    15:50 書式）hh:mm
# %t
# %@  時間    03:50PM 書式）hh:mm(am/pm format)

# %B  ボールド(%bで終了)
# %E  終了でのクリア
# %U  アンダーライン(%uで終了)
# %S  強調(%sで終了)
# %F  文字の色(%fで終了)
# %K  文字背景の色(%kで終了)
# 0:black、1:red、2:green、3:yellow、4:blue、5:magenta、6:cyan、7:white

# 実行後に右プロンプトを削除する
setopt transient_rprompt
# プロンプト中の変数を展開する
setopt prompt_subst

# emacs
bindkey -e
export LANG=ja_JP.UTF-8
export EDITOR=vim
# export EDITOR=emacs

# 補完
autoload -U compinit
compinit -u
# case insensitive に補完 大文字を入力した場合は区別する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ディレクトリ名だけで cd
# setopt auto_cd
# 重複は記憶しない
setopt pushd_ignore_dups

# cd -[Tab]で移動履歴
setopt auto_pushd
# typoにやさしい
setopt correct

# 補完一覧ファイル種別表示
setopt list_types

# setopt nolistbeep
# setopt no_beep

# history
HISTFILE=~/.zsh_history
# メモリ内の履歴の数
HISTSIZE=100000
# saveする量
SAVEHIST=1000000
# 重複を記録しない
setopt hist_ignore_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# setopt hist_reduce_blanks
# 履歴ファイルを共有
setopt share_history
# 実行時刻と実行時間も保存する
setopt extended_history
function history-all { history -E 1 } # 全履歴の一覧を出力す

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
# setopt hist_ignore_all_dups
# ヒストリを呼び出してから実行する間に一旦編集可能
# setopt hist_verify
# 余分な空白は詰めて記録
# setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
# setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
# setopt hist_no_store
# 補完時にヒストリを自動的に展開
# setopt hist_expand
# 履歴をインクリメンタルに追加
# setopt inc_append_history
# インクリメンタルからの検索
# bindkey "^R" history-incremental-search-backward
# bindkey "^S" history-incremental-search-forward

# 3秒以上かかったら報告
REPORTTIME=3

# 補完候補をつめて表示する
setopt list_packed


# alias
case ${OSTYPE} in
  darwin*)
    # change the color of directory to light blue.
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -FG'
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias mvim='open -a MacVim'
    alias chrome='open -a /Applications/Google\ Chrome.app'
    alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
    ;;
  linux*)
    # LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
    # export LS_COLORS
    # export LS_COLORS="di=01;34"
    export LS_COLORS="di=35;40"
    alias ls='ls -F --color'
    # for clipboard
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    alias tmcp='tmux save-buffer - | pbcopy'
    alias chrome='/usr/bin/google-chrome'
    ;;
esac

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias l='ls -al'
alias la='ls -al'
alias lr='ls -altrh'
alias mv='mv -i'
alias :q=exit
alias pp=popd
alias p='pwd'
alias bi='bundle install --path vendor/bundle --without production'
alias be='bundle exec'
alias rmigc='bundle exec rake db:migrate db:test:clone'
alias g='git'
alias ga='git add -A'
alias gb='git branch -a'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gdc='git diff --cached'

# いらなそう。そのうちけすよてい
# alias gl='git log'

# alias glo='git log --oneline'
alias glo='git log --decorate --pretty=oneline'
alias gs='git status'
alias gsb='git status -sb'
alias ta='tmux a'
alias topc='top -ocpu -n10 -s5'
alias topm='top -omem -n10 -s5'

alias memo='vim ~/memo'
alias dated='date +%Y%m%d'
alias datet='date +%Y%m%d%H%M'
alias date-='date +%Y-%m-%d'

# インストールしたCpanモジュールを出力
alias perl-installed="find `perl -e 'print \"@INC\"'` -name \"*.pm\" -print"

# compdef
compdef mosh=ssh

# zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


# RVM
# [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

# postgresql
case ${OSTYPE} in
  darwin*)
    ;;
  linux*)
    export POSTGRES_HOME='/usr/lib/postgresql/9.3/'
    export POSTGRES_INCLUDE='/usr/include/postgresql'
    export POSTGRES_LIB='/usr/lib/postgresql/9.3/lib'
    ;;
esac

# -------------------------------------------------------------------------
# peco
# -------------------------------------------------------------------------
function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function e () {
    local selected_file=$(git ls-files | peco --query "$LBUFFER")
    if [ -n "$selected_file" ]; then
      vim ${selected_file}
    fi
}

function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-cd () {
  local selected_dir=$(find ~/ -type d | peco)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-cd
bindkey '^x^f' peco-cd


peco-find-cd() {
  local FILENAME="$1"
  local MAXDEPTH="${2:-3}"
  local BASE_DIR="${3:-`pwd`}"

  if [ -z "$FILENAME" ] ; then
    echo "Usage: peco-find-cd <FILENAME> [<MAXDEPTH> [<BASE_DIR>]]" >&2
    return 1
  fi

  local DIR=$(find ${BASE_DIR} -maxdepth ${MAXDEPTH} -name ${FILENAME} | peco | head -n 1)

  if [ -n "$DIR" ] ; then
    DIR=${DIR%/*}
    echo "pushd \"$DIR\""
    pushd "$DIR"
  fi
}

peco-git-cd() {
  peco-find-cd ".git" "$@"
}

peco-docker-cd() {
  peco-find-cd "Dockerfile" "$@"
}

peco-vagrant-cd() {
  peco-find-cd "Vagrantfile" "$@"
}

peco-go-cd() {
  peco-find-cd ".git" 5 "$GOPATH"
}

# http://blog.kamipo.net/entry/2013/02/20/122225
function static_httpd {
  if type plackup > /dev/null; then
    plackup -MPlack::App::Directory -e 'Plack::App::Directory->new(root => ".")->to_app'
  elif type ruby > /dev/null; then
    if ruby -v | grep -qm1 'ruby 2\.'; then
      ruby -run -e httpd -- --port=5000 .
    else
      ruby -rwebrick -e 'WEBrick::HTTPServer.new(:Port => 5000, :DocumentRoot => ".").start'
    fi
  elif type python > /dev/null; then
    if python -V 2>&1 | grep -qm1 'Python 3\.'; then
      python -m http.server 5000
    else
      python -m SimpleHTTPServer 5000
    fi
  elif type node > /dev/null; then
    node -e "var c=require('connect'), d=process.env.PWD; c().use(c.logger()).use(c.static(d)).use(c.directory(d)).listen(5000);"
  elif type php > /dev/null && php -v | grep -qm1 'PHP 5\.[45]\.'; then
    php -S 0.0.0.0:5000
  elif type erl > /dev/null; then
    erl -eval 'inets:start(), inets:start(httpd, [{server_name, "httpd"}, {server_root, "."}, {document_root, "."}, {port, 5000}])'
  fi
}

# mysql
function SELECT () {
    mysql -uroot -e "SET NAMES utf8; SELECT $*"
}
function SHOW () {
    mysql -uroot -e "SET NAMES utf8; SHOW $*"
}
alias SELECT="noglob SELECT"
alias SHOW="noglob SHOW"

# include
[ -f $HOME/dotfiles/zsh/.http_status ] && source $HOME/dotfiles/zsh/.http_status

# 個別設定を読み込む
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

# added by travis gem
[ -f ${HOME}/.travis/travis.sh ] && source ${HOME}/.travis/travis.sh

