#install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# download plugins
mkdir ~/.vim/bundle 
source clone_plugins.sh

# copy .vimrc in this repo to the user ~/.vimrc
cp .vimrc ~/.vimrc
