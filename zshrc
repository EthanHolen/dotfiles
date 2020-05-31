######################
# Ethan Holen's .zshrc
######################

# Path to your oh-my-zsh installation.
export ZSH="/Users/ethanholen/.oh-my-zsh"

# Theme
#ZSH_THEME="Pure"
#ZSH_THEME="agnoster"
ZSH_THEME="bureau"
#ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# TODO: Figure out Antigen
# antigen bundle ael-code/zsh-colored-man-pages


# My Custom commands
gt(){
    git clone "$(pbpaste)"
}

re(){
    mv "$1" ~/.Trash
}

bup(){
    brew update
    brew upgrade
    brew cleanup

}

guu(){

    git add -A
    git commit -m "$@"
    git push
}
glo(){
    git log --oneline
}
zuc(){
	ssh eholen@zucchini.cs.colostate.edu
}
brw(){
	brew install "$@"
}

brwc(){
	brew cask install "$@"
}
ggi() {
    git init
    mit
    git add .
    git commit -m "Init"
    git remote add origin $(osascript -e 'tell application "Safari" to return URL of front document')
    git push -u origin master
}

clean(){
    mv ~/Downloads/* ~/.Trash/
    rm -rf ~/.Trash/*
}

mk(){
    mkdir "$@" && cd "$@"
}

ytb(){
    youtube-dl -f best "$@"
}

dot(){
    # copy all dotfiles into repo and guu them
    cd ~/Dropbox/Personal/macSetup/dotfiles
    # .zshrc
    cp ~/.zshrc zshrc
    # .vimrc
    cp  ~/.vimrc vimrc
    # brew
    brew leaves > myBrew
    brew cask list > myBrewCasks
    # guu
    guu "Update on $(date)"
    
}

# opening the logsim application
lgs(){

   open ~/Dropbox/school/Sophomore\ 2019-2020/Sem\ 2/CS\ 270/Logisim\ 2.app/Contents/Resources/Java/logisim.jar
}



disp(){
	displayplacer "id:D631D03C-B0E1-548A-9469-60A31124B782 res:3840x2160 hz:30 color_depth:8 scaling:off origin:(0,0) degree:0" "id:BFA4F43F-5DA2-B4C7-C5BA-C668D92C6384 res:1440x2560 hz:59 color_depth:8 scaling:off origin:(-1440,-148) degree:90"
}


# My aliases
alias ppj="cd ~/Dropbox/code/personal/currentProjects/studentSetup/"
alias sc="cd ~/Dropbox/Code/school/CS270"
alias sci="cd ~/Dropbox/Code/school/CIS350"
alias sch="cd ~/Dropbox/school/Sophomore\ 2019-2020/Sem\ 2/"

alias vcg="code ~/.vimrc"
alias zcg="code ~/.zshrc"
alias currp="cd ~/Dropbox/code/personal/currentProjects/"
alias wp="cd ~/Dropbox/Code/work/"
alias zshreload="source ~/.zshrc"

# Where I keep my syntax highlighting
source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# IDK?
setopt  autocd autopushd 


# Plugins 
plugins=(git)
plugins=(zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

