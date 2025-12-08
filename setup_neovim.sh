mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua
# cp init.vim ~/.config/nvim
cp init.lua ~/.config/nvim/lua

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
