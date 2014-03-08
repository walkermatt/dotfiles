# By default make xclip set the main system clipboard
alias xclip='xclip -selection c'

# Define a Yank Working Directory command
# I use this all the time to copy the working directory
# to the system clipboard. The tr call in the middle removes
# the trailing newline character
# alias ywd="pwd | tr -d '\n' | xclip"

# Tweak less
alias less='less --ignore-case'
alias f='find -type f -iname '
