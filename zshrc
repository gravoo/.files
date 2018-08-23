source /home/$USER/.files/.zsh_functions
alias refsource='source ~/.zshrc'
alias dotfiles="~/.files"
alias game="/home/$USER/Projects/Particles"
export HISTCONTROL=ignoreboth:erasedups

#attach to tmux on start
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new -s daily
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

#download only if tmux plugin does not exists
if [ ! -d $HOME/.tmux/plugins/ ]; then
    echo "downloading tmux plugin file"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source ~/.tmux.conf
    ~/.tmux/plugins/tpm/bin/install_plugins
fi



