ln -i -h -s $PWD/zsh ~/.zsh
ln -i -h -s $PWD/zshrc ~/.zshrc

ln -i -h -s $PWD/tmux.conf ~/.tmux.conf

ln -i -h -s $PWD/vimrc ~/.vimrc
ln -i -h -s $PWD/vim ~/.vim

if [ ! -e "${PWD}/vim/bundle/neobundle.vim" ] ; then
	echo "clone neobundle.vim"
	git clone https://github.com/Shougo/neobundle.vim.git vim/bundle/neobundle.vim
fi
