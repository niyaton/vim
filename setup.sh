ln -i -n -s $PWD/vimrc ~/.vimrc
ln -i -n -s $PWD/vim ~/.vim

if [ ! -e "${PWD}/vim/bundle/neobundle.vim" ] ; then
	echo "clone neobundle.vim"
	git clone https://github.com/Shougo/neobundle.vim.git vim/bundle/neobundle.vim
fi
