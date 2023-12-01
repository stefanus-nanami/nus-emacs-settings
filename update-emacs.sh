#!/bin/sh

# Tap Emacs Plus.
brew tap d12frosted/emacs-plus

# Uninstall first.
# brew uninstall emacs-plus

# Install current version of Emacs.
brew install emacs-plus --with-xwidgets --with-imagemagick --with-native-comp --with-poll --with-EmacsIcon4-icon
