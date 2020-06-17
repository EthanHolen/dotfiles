######################
# Ethan Holen's .zshrc
######################

# Path to your oh-my-zsh installation.
export ZSH="/Users/ethanholen/.oh-my-zsh"

# Theme
#ZSH_THEME="Pure"
#ZSH_THEME="agnoster"
#ZSH_THEME="bureau"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="powerlevel10k/powerlevel10k"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


POWERLEVEL10K_PROMPT_ON_NEWLINE=true

# TODO: Figure out Antigen
# antigen bundle ael-code/zsh-colored-man-pages

# My Functions

# Git
guu(){
    
    git add -A
    git commit -m "$@"
    git push
}
gt(){
    git clone "$(pbpaste)"
}
glo(){
    git log --oneline
}
greset(){
    git reset --hard
    git pull
}


#Brew
bup(){
    brew update
    brew upgrade
    brew cleanup
}
brw(){
    brew install "$@"
}
brwc(){
    brew cask install "$@"
}


#SSH
zuc(){
    ssh eholen@zucchini.cs.colostate.edu
}


#Trash
re(){
    mv "$1" ~/.Trash
}
clean(){
    mv ~/Downloads/* ~/.Trash/
    rm -rf ~/.Trash/*
}


#Orginization
mk(){
    mkdir "$@" && cd "$@"
}


#Other
ytb(){
    youtube-dl -f best "$@"
}

dot(){
    # copy all dotfiles into repo and guu them
    cd ~/Dropbox/Personal/macSetup/dotfiles
    # Make sure repo is up to date
    git pull
    
    # copied files
    cp ~/.zshrc zshrc
    cp  ~/.vimrc vimrc
    cp ~/.p10k.zsh p10k.zsh
    cp ~/.ssh/config sshrc
    
    # brew
    brew leaves > myBrew
    brew cask list > myBrewCasks
    # guu
    guu "Update on $(date)"
    
    cd
}



# My aliases
alias ppj="cd ~/Dropbox/code/personal/currentProjects/studentSetup/"
alias sc="cd ~/Dropbox/Code/school/CS270"
alias sci="cd ~/Dropbox/Code/school/CIS350"
alias sch="cd ~/Dropbox/school/Sophomore\ 2019-2020/Summer/"

alias vcg="vim ~/.vimrc"
alias zcg="vim ~/.zshrc"
alias web="cd ~/Dropbox/Code/personal/website/EthanHolen.github.io/"
alias currp="cd ~/Dropbox/code/personal/currentProjects/"
alias wp="cd ~/Dropbox/Code/work/"
alias zshreload="source ~/.zshrc"

# Where I keep my syntax highlighting
#source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# IDK? prolly important?
setopt  autocd autopushd


# Plugins
plugins=(git)
#plugins=(zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
