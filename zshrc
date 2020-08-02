
# fpath=(~/.zsh/completion $fpath)

autoload -U promptinit; promptinit
prompt pure

export GOPATH= $HOME/go  # GOPATHにすると決めた場所
export PATH=$GOPATH/bin:$PATH

# #補完のリスト表示時にls --colorと同じカラースキームを使用
# eval `dircolors /etc/DIR_COLORS`
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# powerline-goのせってい
function powerline_precmd() {
     eval "$($GOPATH/bin/powerline-go -error $? -shell zsh -eval  -colorize-hostname -cwd-max-depth 1 -cwd-mode dironly  -numeric-exit-codes -truncate-segment-width 5 -shorten-eks-names)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi



#単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true

#blenderのpath
PATH=/Applications/blender/blender.app/Contents/MacOS:$PATH; export PATH;


# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 開始と終了を記録
setopt EXTENDED_HISTORY

# プロセスを横断してヒストリを共有
setopt inc_append_history

# cdを使わずにディレクトリを移動できる
setopt auto_cd
# "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd
# コマンドの打ち間違いを指摘してくれる
setopt correct

function history-all { history -E 1 }

# setopt PROMPT_SUBST
# source ~/.git-prompt.sh

# GIT_PS1_SHOWDIRTYSTATE=1
# GIT_PS1_SHOWUPSTREAM=1
# GIT_PS1_SHOWUNTRACKEDFILES=1
# #GIT_PS1_SHOWSTASHSTATE=1

# PROMPT='[%n@%m:%~]$(__git_ps1 " (%s)")%# '

#Gitifyのパス
export PATH=$HOME/Gitify/:$PATH


export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"

#yarnのパス
export PATH="$HOME/.yarn/bin:$PATH"



# iTerm2の色設定
export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"
# define for PS1
black=$'\e[30m' # Black - Regular
red=$'\e[31m' # Red
green=$'\e[32m' # Green
yellow=$'\e[33m' # Yellow
blue=$'\e[34m' # Blue
purple=$'\e[35m' # Purple
cyan=$'\e[36m' # Cyan
white=$'\e[37m' # White
