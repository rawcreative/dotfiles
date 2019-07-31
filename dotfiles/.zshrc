# Path to your oh-my-zsh installation.
export ZSH=/Users/tim/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rawcreative"

DISABLE_AUTO_UPDATE="true"

DISABLE_AUTO_TITLE="true"

plugins=(
  brew
  brew-cask
  git
  osx
  laravel
  zsh-syntax-highlighting
)

# User configuration
#PATH=${PATH}:"$(brew --prefix php@7.2)"/bin
#PATH=${PATH}:/usr/local/opt/php@7.2/sbin
PATH=${PATH}:"$HOME"/.composer/vendor/bin
PATH=${PATH}:"$(brew --prefix sqlite)"/bin
PATH=${PATH}:"$(brew --prefix)"/opt/python/libexec/bin
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/bin
PATH=${PATH}:/usr/sbin

export PATH=${PATH}

source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
