#!/usr/bin/env bash

# install homebrew
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install neovim
if ! command -v nvim &> /dev/null
then	
  brew install neovim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install iterm2
if [[ ! -d /Applications/iiiiTerm.app ]]; then
  #brew cask install iterm2
  #curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash
  curl -O https://raw.githubusercontent.com/morhetz/gruvbox-contrib/master/iterm2/gruvbox-dark.itermcolors
  curl -O https://raw.githubusercontent.com/morhetz/gruvbox-contrib/master/iterm2/gruvbox-light.itermcolors
  /usr/libexec/PlistBuddy -c 'Delete "Custom Color Presets:Gruvbox Light"' $HOME/Library/Preferences/com.googlecode.iterm2.plist
  /usr/libexec/PlistBuddy -c 'Delete "Custom Color Presets:Gruvbox Dark" dict' $HOME/Library/Preferences/com.googlecode.iterm2.plist
  /usr/libexec/PlistBuddy -c 'Add "Custom Color Presets:Gruvbox Light" dict' $HOME/Library/Preferences/com.googlecode.iterm2.plist
  /usr/libexec/PlistBuddy -c 'Add "Custom Color Presets:Gruvbox Dark" dict' $HOME/Library/Preferences/com.googlecode.iterm2.plist
  /usr/libexec/PlistBuddy -c 'Merge "gruvbox-light.itermcolors" "Custom Color Presets:Gruvbox Light"' $HOME/Library/Preferences/com.googlecode.iterm2.plist
  /usr/libexec/PlistBuddy -c 'Merge "gruvbox-dark.itermcolors" "Custom Color Presets:Gruvbox Dark"' $HOME/Library/Preferences/com.googlecode.iterm2.plist
  # TODO: Figure out how to actually switch to these themes programmatically
fi


if ! command -v omz &> /dev/null
then	
  KEEP_ZSHRC='yes' sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
