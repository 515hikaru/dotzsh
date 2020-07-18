# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hikaru/.zshrc'

# load completions
fpath+="$HOME/zsh/share/completions"

autoload -Uz compinit
compinit
autoload -U bashcompinit
bashcompinit
# End of lines added by compinstall
# prompt
PS1='%F{196}%n%f:%F{159}%c%f%# '

# editor
export EDITOR=vim

# aliases
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection c -o'

# Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/ghq"
export PATH=$PATH:$GOPATH/bin

# ghq
ghq() {
    if [[ $1 == "look" ]]; then
        if [[ -n $2 ]]; then
            dir="$(ghq list --full-path --exact "$2")"
            if [ -z "$dir" ]; then
                echo "no directroies found for '$2'"
                return 1
            fi
            cd $dir
        else
            echo 'usage: ghq-cd $repo'
        fi
    else
        command ghq "$@"
    fi
}

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

# Created by `userpath` on 2020-07-15 12:51:34
export PATH="$PATH:/home/hikaru/.local/bin"

eval "$(register-python-argcomplete pipx)"
