if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

export GPG_TTY=$(tty)
export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'
export UPDATE_ZSH_DAYS=1
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#444444,bg=grey,underline"

plugins=(git cargo zsh-autosuggestions jsontools)

# autosuggest plugin
bindkey '^ ' autosuggest-accept # ctrl+space to accept

export FZF_DEFAULT_COMMAND='find .'
source $ZSH/oh-my-zsh.sh
export EDITOR='vim'

# user configuration

export LANG=en_US.UTF-8
export AWS_PAGER=""

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/miniconda3/bin:$PATH
export PATH=$HOME/go/bin:$PATH

export GOPATH=$HOME/go
export GOBIN=$(go env GOPATH)/bin

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/replicadse/go/bin/bit bit

alias ll2="exa -Fla"
alias ll="lsd -AFh --blocks inode,date,user,name --date=\"+%Y-%m-%dT%H:%M:%S%Z\""
alias llt="lsd -Ahi1lF --total-size"
alias vim=nvim
alias fucking="sudo"
alias gsu="git add . && git commit -S -m \"super urgent\" && git push"

eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $HOME/.zshrc_plug
