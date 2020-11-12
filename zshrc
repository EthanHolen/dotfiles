######################
# Ethan Holen's .zshrc
######################

# Path to your oh-my-zsh installation.
export ZSH="/Users/ethanholen/.oh-my-zsh"

# Theme
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="powerlevel10k/powerlevel10k"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


POWERLEVEL10K_PROMPT_ON_NEWLINE=true




# GCC aliases
alias g++='g++-10'
alias gcc='gcc-10'









# FIGURE THIS OUT FOR PYTHON
#PATH="~/.pyenv/versions/3.5.0/bin:${PATH}"



# TODO: Figure out Antigen
# antigen bundle ael-code/zsh-colored-man-pages

# My Functions

# Git
guu(){
    git add -A
    git commit -m "$@"
    git push
}
gcmt(){
    git add .
    git commit -m "$@"
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
gstart(){
	git remote add origin "$@"
	git push -u origin master
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


    rm Brewfile
    brew bundle dump

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

# Docker
alias ubuntus="docker start ubuntu_container && docker exec -it ubuntu_container bash"
alias ubuntuq="docker stop ubuntu_container"

# Random
alias please="sudo"

# Where I keep my syntax highlighting
#source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



#https://apple.stackexchange.com/questions/396433/zsh-autosuggestions-how-to-install-zpty-module
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# CMAKE
PATH="/Applications/CMake.app/Contents/bin":"$PATH"

# IDK? prolly important?
setopt  autocd autopushd


# Plugins
plugins=(git)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh





[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh



# NOTES
# this is for git log and glo to present in the terminal
# git config --global core.pager cat

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
