# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Additional config by user
export PS1="%n@%M:%d %% "

# source the syntax hilighting
source $HOME/dev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
