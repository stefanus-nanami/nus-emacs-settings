#!/bin/sh

# Uninstall first.
brew uninstall emacs-plus

# Install Emacs 29.
brew install emacs-plus@29 --with-xwidgets --with-imagemagick --with-native-comp --with-poll --with-EmacsIcon4-icon
