#!/usr/bin/env bash
set -e

PROJECT_DIR="$(pwd)"
ALIASES_SRC="$PROJECT_DIR/.zsh_aliases"
ALIASES_DEST="$HOME/.zsh_aliases"
ZSHRC="$HOME/.zshrc"
SOURCE_LINE='[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases'

echo "▶ Configurando Zsh aliases..."

if [ -f "$ALIASES_SRC" ]; then
  if [ ! -f "$ALIASES_DEST" ]; then
    cp "$ALIASES_SRC" "$ALIASES_DEST"
    echo "✔ .zsh_aliases copiado a ~/"
  else
    echo "ℹ ~/.zsh_aliases ya existe, no se sobrescribió"
  fi
else
  echo "⚠ No se encontró .zsh_aliases en el proyecto"
fi

touch "$ZSHRC"

if ! grep -qxF "$SOURCE_LINE" "$ZSHRC"; then
  printf '\n%s\n' "$SOURCE_LINE" >> "$ZSHRC"
  echo "✔ Source agregado a ~/.zshrc"
else
  echo "ℹ El source ya estaba configurado"
fi

echo "✅ Setup de Zsh terminado"
