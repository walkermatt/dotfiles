# Enable recursive globbing of ** into child directories
shopt -s globstar

# Disable <c-s> (flow control), without this
# you need <c-q> to resume and it's really annoying in Vim
stty stop undef

# Vi style keybindings
# set -o vi

# Set the editor to be Vim
export EDITOR="/usr/bin/vim"

# Verify a historic command before running it
# including reusing last argument (ls !$)
# and last command (sudo !!)
shopt -s histverify

# Increase the number of history items
export HISTSIZE=10000
export HISTCONTROL=ignorespace
export HISTIGNORE='history:fg:bg:exit'

# Include timestamps in historty
export HISTTIMEFORMAT="%F %T "

# Include any custom command aliases
source ~/.bash_aliases

# Key bindings, up/down arrow searches through history
# just like the Vim (searches for history that starts
# with what ever you've already typed)
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

# Setup Python virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ] ; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
