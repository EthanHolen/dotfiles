# --------------------------
# Ethan Holen's .zshrc
# --------------------------


# NOTES
# this is for git log and glo to present in the terminal
git config --global core.pager bat
export MANPAGER="bat"



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

# emacs doom command setup
export PATH="$HOME/.emacs.d/bin:$PATH"

# AUTOSUGGESTIONS
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh


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



#Orginization
mk(){
    mkdir "$@" && cd "$@"
}

# Yabai and skhd
yrs(){
    skhd --restart-service && yabai --restart-service
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



# vShasta config
export KUBECONFIG=~/.config/ahoy/kubeconfig.yaml


# My aliases
# Try to keep these at the bottom
alias vcg="code --wait ~/.vimrc"
alias zcg="code --wait ~/.zshrc && source ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias c="code --wait"
alias please="sudo"
alias cr="cargo run"
alias dwn="~/Downloads"
alias le="exa -al --git --icons"
alias tree="exa --tree"
alias o="open"
# homebrew
alias bi="brew install"
alias bs="brew search"
alias bu="brew uninstall"

alias cat="bat"
alias le="exa -al --git --icons"
alias ls="exa"

# pulumi
alias p="pulumi"
alias pup="pulumi up -y"
alias pdn="pulumi destroy -y"


# Kubernetes
alias ktp="kubectl top pods"


# python

export python="python3"
export CLOUDSDK_PYTHON="python3"


# Direnv setup https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"
















####################################
# The wonderful world of Mitch
####################################



## Google cloud stuff from Mitch

# Get current firewall ips as a comma delimited list
hpe_gcp_fw_current() {
  project="${1?}"

  gcloud compute --project ${project?} firewall-rules describe nmn-allow-ing-ssh-trusted-any --format="value[delimiter=',',terminator=','](sourceRanges)"
}

# Append to sys gcp firewall ip address
hpe_gcp_append_ip() {
  sys="${1?}"
  shift
  ip="${1?}"

  project=$(hpe_gcp_project ${sys})
  gcloud compute --project ${project?} firewall-rules update nmn-allow-ing-ssh-trusted-any --source-ranges="$(hpe_gcp_fw_current ${project})${ip}"
}

# Remove from system firewall ip address
hpe_gcp_remove_ip() {
  sys="${1?}"
  shift
  ip="${1?}"

  project=$(hpe_gcp_project ${sys})
  gcloud compute --project ${project?} firewall-rules update nmn-allow-ing-ssh-trusted-any --source-ranges="$(hpe_gcp_fw_current ${project})#${ip},"
}

# $ hpe_gcp_ssh beau
# gcloud compute --project hpe-beau-csm-livecd-18a5 ssh root@pit --zone=us-central1-a
# $ hpe_gcp_ssh fearne
# gcloud compute --project hpe-fearne-csm-livecd-3e07 ssh root@pit --zone=us-central1-c
# $ hpe_gcp_ssh caleb
# $

hpe_gcp_project() {
  sys="${1?}"
  gcloud projects list --filter="name = hpe-${sys}-csm-livecd" --format="value(PROJECT_ID)"
}

hpe_gcp_zone() {
    sys="${1?}"
    gcloud compute instances list --filter="pit" --format="value(zone)" --project $(hpe_gcp_project ${sys}) | head -n1
}

# spits out the gcloud ssh nonsense if wanted
hpe_gcp_ssh() {
  sys="${1?}"
  project=$(hpe_gcp_project ${sys})
  zone=$(hpe_gcp_zone ${sys})

  printf "gcloud compute --project %s ssh root@pit --zone=%s\n" "${project?}" "${zone?}"
}

# spits out the gcloud scp nonsense if wanted
hpe_gcp_scp() {
  sys="${1?}"
  project=$(hpe_gcp_project ${sys})
  zone=$(hpe_gcp_zone ${sys})

  printf "gcloud compute --project %s scp root@pit --zone=%s\n" "${project?}" "${zone?}"
}



####################################
# The end of the wonderful world of Mitch
####################################


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ethanholen/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ethanholen/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ethanholen/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ethanholen/google-cloud-sdk/completion.zsh.inc'; fi
