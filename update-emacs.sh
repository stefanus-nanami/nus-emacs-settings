#!/bin/sh

# Tap Emacs Plus.
brew tap d12frosted/emacs-plus

# Uninstall first.
brew uninstall emacs-plus

# Install Emacs 30.
brew install emacs-plus@30 --with-xwidgets --with-imagemagick --with-native-comp --with-poll --with-EmacsIcon4-icon
