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

# Source recently used dir script 'z'
. ~/.bin/z/z.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Colourful prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

