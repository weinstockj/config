mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/bling/vim-airline
git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/scrooloose/syntastic

