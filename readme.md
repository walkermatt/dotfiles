# Install

    find ./Dropbox/Matt/dotfiles/ -maxdepth 1 -not -name ".*" -printf "%P\n" | while read file; do ln -s "./Dropbox/Matt/dotfiles/$file" ".$file"; done

    ln -s ~/Dropbox/Matt/dotfiles/config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css
