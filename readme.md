# Install
    find ./Dropbox/Matt/dotfiles/ -maxdepth 1 -not -name ".*" -printf "%P\n" | while read file; do ln -s "./Dropbox/Matt/dotfiles/$file" ".$file"; done
