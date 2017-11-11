ln -i -n -s $PWD/vimrc ~/.vimrc
ln -i -n -s $PWD/vim ~/.vim
ln -i -n -s $PWD/vim ~/.config/nvim
ln -i -n -s $PWD/vimrc ~/.config/nvim/init.vim

vim +PlugInstall +qall
