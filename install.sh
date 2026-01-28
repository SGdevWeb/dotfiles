#!/usr/bin/env bash

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installation des dotfiles depuis $DOTFILES"

# Fonction pour créer un lien symbolique
create_symlink() {
  local source="$1"
  local target="$2"

  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "$target existe déjà, création d'une sauvegarde..."
    mv "$target" "${target}.backup.$(date +%Y%m%d_%H%M%S)"
  fi

  mkdir -p "$(dirname "$target")"
  ln -sf "$source" "$target"
  echo "Lien créé: $target -> $source"
}

# Installation des fichiers de configuration
create_symlink "$DOTFILES/zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES/gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES/config/kitty" "$HOME/.config/kitty"
create_symlink "$DOTFILES/config/nvim" "$HOME/.config/nvim"

echo "Installation terminée!"
echo "Redémarre ton shell ou exécute: source ~/.zshrc"
