ln -i -n -s $PWD/vimrc ~/.vimrc
ln -i -n -s $PWD/vim ~/.vim
vim +PlugInstall +qall

if which nvim &> /dev/null
then
	ln -i -n -s $PWD/vim ~/.config/nvim
	ln -i -n -s $PWD/vimrc ~/.config/nvim/init.vim
	nvim +PlugInstall +qall
fi

