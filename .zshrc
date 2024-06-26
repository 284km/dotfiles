
stty intr 

# path

case ${OSTYPE} in
  darwin*)
    # export PATH="${HOME}/ios/cocos2d-x-2.2.1/tools/project-creator:${PATH}"
    export PATH=/opt/homebrew/bin:${PATH}
    export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:${PATH}
    export PATH="/usr/local/bin:${PATH}"
# ln -s /usr/local/opt/git/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin
    ;;
  linux*)
    ;;
esac

export PATH="${HOME}/bin:${PATH}"
# export PATH="/usr/local/opt/openssl/bin:$PATH"

# mysqlenv
# if [ -d ${HOME}/.mysqlenv ]; then
#   source ~/.mysqlenv/etc/bashrc
#   # export PATH="${HOME}/.mysqlenv/bin:${HOME}/.mysqlenv/shims:${HOME}/.mysqlenv/mysql-build/bin:${PATH}"
# fi

# tfenv
# $ tfenv list-remote
# $ tfenv list
# $ tfenv use 0.7.0
# $ cat .terraform-version
# 0.7.0
if [ -d ${HOME}/.tfenv ]; then
    export PATH="${HOME}/.tfenv/bin:${PATH}"
fi

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

# export RUBYOPT=-w

if [ -d ${HOME}/.plenv  ]; then
    export PATH=${HOME}/.plenv/bin:${HOME}/.plenv/shims:${PATH}
    eval "$(plenv init - zsh)"
fi

if [ -d ${HOME}/.nodenv ]; then
    export PATH=${HOME}/.nodenv/bin:${PATH}
    eval "$(nodenv init - zsh)"
fi

# pyenv
# if [ -d ${HOME}/.pyenv  ]; then
#   # export PYTHONPATH=/Users/xxx/.pyenv/versions/anaconda3-4.3.1/lib/python3.6/:/Users/xxx/.pyenv/versions/anaconda3-4.3.1/lib/python3.6/site-packages/:/Users/xxx/.pyenv/versions/anaconda3-4.3.1/lib/python3.6/lib-dynload/
#   export PYTHONPATH=${HOME}/.pyenv/bin:${HOME}/.pyenv/shims
#   export PYTHONHOME=$PYTHONPATH
#
#     export PATH=${HOME}/.pyenv/bin:${HOME}/.pyenv/shims:${PATH}
#     eval "$(pyenv init - zsh)"
# fi
# alias python='python3'
# alias pip='pip3'

# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

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

# rust cargo
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
if [ -x "`which rustup`" ]; then
  export RUST_BACKTRACE=1
fi

if [ -d ${HOME}/,/flutter  ]; then
    export PATH=${HOME}/,/flutter/bin:${PATH}
fi

# unset PS1
PS1=%F{5}$\ %f
# PS1=%F{5}%#%f
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

source /opt/homebrew/opt/kube-ps1/share/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT
# RPROMPT='$(kube_ps1)'


export MYSQL_PS1="(\\u@\\h) [\\d] > "

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

# /etc 以下を読まないようにするため (El Capitan)
# http://d.hatena.ne.jp/sugyan/20151211/1449833480
setopt no_global_rcs

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

# setopt hist_ignore_all_dups # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
# setopt hist_verify          # ヒストリを呼び出してから実行する間に一旦編集可能
# setopt hist_reduce_blanks   # 余分な空白は詰めて記録
# setopt hist_save_no_dups    # 古いコマンドと同じものは無視
# setopt hist_no_store        # historyコマンドは履歴に登録しない
# setopt hist_expand          # 補完時にヒストリを自動的に展開
# setopt inc_append_history   # 履歴をインクリメンタルに追加
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
    # export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    export EDITOR=vim
#    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias mvim='open -a MacVim'
    alias chrome='open -a /Applications/Google\ Chrome.app'
    # alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
    ;;
  linux*)
    # LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
    # export LS_COLORS
    # export LS_COLORS="di=01;34"
    # export LS_COLORS="di=35;40" # poor visivility in Ubuntu
    alias ls='ls -F --color'
    # for clipboard
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    alias tmcp='tmux save-buffer - | pbcopy'
    alias P='p | pbcopy && pwd'
    alias CD='cd `pbpaste` && pwd'
    alias chrome='/usr/bin/google-chrome'
    alias -g tmux='tmux -2'
    ;;
esac

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias :q=exit
# $ docker pull rubylang/all-ruby
alias all-ruby='docker run --rm -t rubylang/all-ruby /all-ruby/all-ruby'
alias be='bundle exec'
alias bi='bundle install --path vendor/bundle --without production --jobs=4'
alias bibs='bundle install --path vendor/bundle --binstubs vendor/bin --without production --jobs=4'
alias c='git commit -v'
alias copy="tail -n2 ~/.zsh_history | head -n1 | awk -F';' '{print \$2}' | pbcopy"
alias cp_attribute="cp --preserve=all --attributes-only"
alias g='git'
alias ga='git add -A'
alias gb='git branch -a'
alias gc='git checkout'
alias gcb='git checkout -b'
alias d='git diff'
# alias ghq=ghq_in_tmux
alias gn='git-now --all'
alias gnf='git-now --fixup'
alias l='ls -al'
alias la='ls -al'
alias lh='ls -ahl'
alias lr='ls -altrh'
alias mv='mv -i'
alias p='pwd'
alias pp=popd
alias rmigc='bundle exec rake db:migrate db:test:clone'
alias s='git status -bs'
alias v='vim'

alias lc='echo $(fc -ln -1)'
alias lcp='echo $(fc -ln -1) | pbcopy'
alias mkdir='mkdir -p'
alias less='less --no-init --quit-if-one-screen'
alias -g B=' | bcat'
alias -g C=' | pbcopy'
alias -g G=' | grep'
alias -g L=' | less'

alias ta='tmux a'
alias tl='tmux list-sessions'
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


### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

# postgresql
# case ${OSTYPE} in
#   darwin*)
#     ;;
#   linux*)
#     export POSTGRES_HOME='/usr/lib/postgresql/9.3/'
#     export POSTGRES_INCLUDE='/usr/include/postgresql'
#     export POSTGRES_LIB='/usr/lib/postgresql/9.3/lib'
#     ;;
# esac

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

function ghq_in_tmux() {
  case $1 in
    look)
      noglob tmux new-window -n "$2" -- ghq "$@"
      ;;
    *)
      command ghq "$@"
      ;;
  esac
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

# direnv
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# [ -f $HOME/dotfiles/zsh/.bitbucket ]   && source $HOME/dotfiles/zsh/.bitbucket
[ -f $HOME/dotfiles/zsh/.debug ]       && source $HOME/dotfiles/zsh/.debug
[ -f $HOME/dotfiles/zsh/.ghq ]       && source $HOME/dotfiles/zsh/.ghq
[ -f $HOME/dotfiles/zsh/.http_status ] && source $HOME/dotfiles/zsh/.http_status
[ -f $HOME/dotfiles/zsh/.peco ]        && source $HOME/dotfiles/zsh/.peco
if [ -f $HOME/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source $HOME/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


if [ -d ${HOME}/google-cloud-sdk ]; then
  # The next line updates PATH for the Google Cloud SDK.
  source "$HOME/google-cloud-sdk/path.zsh.inc"
  # The next line enables shell command completion for gcloud.
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
  # export CLOUDSDK_PYTHON="$(which python2.7)"
fi

# RVM
# [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
# added by travis gem
# [ -f ${HOME}/.travis/travis.sh ] && source ${HOME}/.travis/travis.sh

# kubectl
source <(kubectl completion zsh)
alias k=kubectl
compdef __start_kubectl k

# 個別設定を読み込む
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

# 重複する PATH を unique にする
typeset -U path PATH

