echo "done"

#!/bin/sh
set -eu

repo_dir=$(cd "$(dirname "$0")" && pwd)

echo "vim config setup"
echo "repository: $repo_dir"

if ! command -v nvim >/dev/null 2>&1; then
  echo "Error: Neovim is required."
  echo "For legacy Vim support, checkout the vim branch."
  exit 1
fi

mkdir -p "$HOME/.config"
ln -i -n -s "$repo_dir/vim" "$HOME/.config/nvim"
ln -i -n -s "$repo_dir/vimrc" "$HOME/.config/nvim/init.vim"

echo "Installing plugins for Neovim..."
nvim +PlugInstall +qall

echo "done"