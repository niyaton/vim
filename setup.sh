#!/bin/sh
set -eu

repo_dir=$(cd "$(dirname "$0")" && pwd)

echo "vim config setup"
echo "repository: $repo_dir"

if command -v nvim >/dev/null 2>&1; then
  echo "  nvim found: setting up Neovim only"

  mkdir -p "$HOME/.config"
  ln -i -n -s "$repo_dir/vim" "$HOME/.config/nvim"
  ln -i -n -s "$repo_dir/vimrc" "$HOME/.config/nvim/init.vim"

  echo "  Installing plugins for Neovim..."
  nvim +PlugInstall +qall

  echo "  Skipped ~/.vimrc and ~/.vim because Neovim is available."
else
  echo "  nvim not found: setting up legacy Vim"

  ln -i -n -s "$repo_dir/vimrc" "$HOME/.vimrc"
  ln -i -n -s "$repo_dir/vim" "$HOME/.vim"

  echo "  Installing plugins for Vim..."

  vim +PlugInstall +qall
fi

if command -v git >/dev/null 2>&1 && git -C "$repo_dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$repo_dir" branch --show-current 2>/dev/null || true)
  if [ -n "$branch" ]; then
    echo "  Current git branch: $branch"
  fi
fi

echo "done"