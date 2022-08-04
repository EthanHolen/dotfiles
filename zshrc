# --------------------------
# Ethan Holen's .zshrc
# --------------------------


# NOTES
# this is for git log and glo to present in the terminal
# git config --global core.pager cat


#Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh



## THEME
ZSH_THEME="powerlevel10k/powerlevel10k"

# emacs doom command
export PATH="$HOME/.emacs.d/bin:$PATH"

# AUTOSUGGESTIONS
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh




### Set "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"





export CS314_USE_DATABASE_TUNNEL=true


# Using thefuck command
eval $(thefuck --alias)



# My Functions

# Git
guu(){
    git add -A
    git commit -m "$@"
    git push
}
gcmt(){
    git add --all
    git commit -m "$@"
}



#Brew
bup(){
    brew update
    brew upgrade
    brew cleanup
}
bi(){
    brew install "$@"
}
bu(){
    brew uninstall "$@"
}
bs(){
    brew search "$@"
}



#Orginization
mk(){
    mkdir "$@" && cd "$@"
}


#Other
ytb(){
    youtube-dl -f best "$@"
}

ytba(){
    youtube-dl -f bestaudio "$@"
}


dot(){
    # copy all config files into repo and guu them

    cd ~/Dropbox/Personal/macSetup/dotfiles
    # Make sure repo is up to date
    git pull

    # copied files
    cp ~/.zshrc zshrc
    cp  ~/.vimrc vimrc
    cp ~/.p10k.zsh p10k.zsh
    cp ~/.ssh/config sshrc

    # VSCode JSON files
    cp ~/Library/Application\ Support/Code/User/settings.json settings.json
    cp ~/Library/Application\ Support/Code/User/keybindings.json keybindings.json

    # Karibener config
    cp ~/.config/karabiner/karabiner.json karabiner.json


    rm Brewfile
    brew bundle dump

    # guu
    guu "Update on $(date)"

    cd
}

scratch(){
    code -n ~/Dropbox/scratchpad/$(date "+%m-%d-%Y-%H:%M:%S").md
}


# Usage: compresspdf [input file] [output file] [screen*|ebook|printer|prepress]
compresspdf() {
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

blank-ubuntu(){
    docker run -it --rm -v "$(pwd)":/vol ubuntu:latest bash
    # apt -y update && apt -y upgrade && cd ./vol
}



# My aliases
alias vcg="code ~/.vimrc"
alias zcg="code ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias c="clear"
alias please="sudo"
alias cr="cargo run"
alias dwn="~/Downloads"





# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-autosuggestions
	git
    autojump
    zsh-syntax-highlighting
    kubectl
	)

source $ZSH/oh-my-zsh.sh

# export NVM_DIR=~/.nvm

## NVM setup
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



#/usr/share/autojump/autojump.zsh

#/usr/local/bin/autojump

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<




# exa ls overrides
alias ls="exa"
alias ll="exa -alh"
alias tree="exa --tree"

# cat --> bat
alias cat="bat"
alias catp="bat -p"
alias kjv="~/Dropbox/Personal/terminal-Bibles/kjv/kjv"



# vim keybindings for terminal
bindkey -v