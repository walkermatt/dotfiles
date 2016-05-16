# Common aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# By default make xclip set the main system clipboard
alias xclip='xclip -selection c'

# Tweak less so search is case insensitive by default
alias less='less --ignore-case'

# Common form of find
alias f='find -type f -iname '

# Generate a password
alias pass="shuf -n3 /usr/share/dict/words | tr -d '\n'"
