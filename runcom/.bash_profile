for DOTFILE in `find $HOME/.dotfiles`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done