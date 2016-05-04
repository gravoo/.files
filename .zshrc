# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rkj"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux vi-mode zsh-256color)

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/$USER/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
#setopt autocd extendedglob nomatch
#unsetopt beep
bindkey -v
export KEYTIMEOUT=1
# End of lines configured by zsh-newuser-install

function startNet()
{
	local=$1
	if [[ -z "$local" ]]; then
		local='NETIASPOT-CD8AC0'	
	fi
	sudo netctl start wlp8s0-$local
	
}
export TERM=xterm-256color

function dailySession()
{
	~/.files/.dailySession
}

#source of history search
source ~/zsh-history-substring-search/zsh-history-substring-search.zsh

#attach to tmux on start
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        dailySession
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

#if [[ -z $(pgrep xterm) && -n $(pgrep i3) ]]; then
    #i3-sensible-terminal 
#else
    #echo "xterm is running"
#fi

#my repos
export MYHOMEREPO=~/
export MYWORKREPO=~/gitRepo
export WRLING=142
function setVolume()
{
    pacmd set-sink-volume 1 $(($1 * 5000))
}

function touchpadToggle()
{
    ~/toggletouchpad.sh
}

function checkRepo()
{
    if [ -e "$MYWORKREPO" ]; then
        cd $MYWORKREPO
        export http_proxy="http://10.144.1.10:8080"
        export https_proxy="https://10.144.1.10:8080"
        wrling
        return 1
    else
        cd $MYHOMEREPO
        startNet
        return 0
    fi
}

#connect to wrling
function wrling()
{
	ssh wrling$WRLING.emea.nsn-net.net 
}

#secured coppy from home dir to remote host
function scpU()
{
    scp -r $1 wrling$WRLING:~bsadowsk/$2
}

#secured coppy from remote to home dir host
function scpD()
{
    scp -r wrling$WRLING:~bsadowsk/$1 $2
}
#connect to wrling with own terminall
function wrlingt()
{
	ssh -t wrling$WRLING.emea.nsn-net.net 
}

