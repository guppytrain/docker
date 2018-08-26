export HISTTIMEFORMAT="%d/%m/%y %T "
export PS1='\u@\h:\W \$ '
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
# alias rl='exec bash'
alias rl="if [ -n $(which bash) ]; then exec bash; else exec ${SHELL:-sh}; fi"
# source /etc/profile.d/bash_completion.sh
