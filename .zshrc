if [ -f "$HOME/.zshrc_local" ]; then
    source $HOME/.zshrc_local
fi

PATH=$HOME/local/bin:$PATH
export PATH

# alias
alias ls="ls --color=auto"
alias ll="ls --color=auto -l"
alias grep="grep --color=auto"

# prompt
autoload -Uz promptinit && promptinit
prompt adam2 8bit
setopt transient_rprompt

if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# display
setopt print_eight_bit

# history
HISTFILE=${HOME}/.zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# complete
fpath=(~/.zsh/zsh-completions/src $fpath)
autoload -Uz compinit && compinit
setopt no_beep
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

zstyle ':completion:*:default' menu select=2

# cd
setopt auto_cd
setopt auto_pushd

# use Home, End, Delete
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# for quick response to press Esc
KEYTIMEOUT=1

# History + Peco

function peco-select-history() {
    BUFFER="$(history -nr 1 | peco --query "$LBUFFER" --prompt "History>")"
    CURSOR=$#BUFFER
}
zle -N peco-select-history
bindkey '^R' peco-select-history
