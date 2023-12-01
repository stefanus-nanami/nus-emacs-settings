# nus-emacs-settings
Contains all items of my .emacs.d directory.

# Font
I use Hack font for all my text editors. Download it [here](https://sourcefoundry.org/hack/).

# Key Bindings
Check what keys available by using `helm-descbinds` or M-F1.

# User profile
Provide user profile by creating `~/.emacs.d/local/user-profile.el`. The content should be something
like this.

``` emacs-lisp
(setq user-full-name "Your name")
(setq user-mail-address "email_address@your.server")

(provide 'user-profile)
```

The contents below `~/.emacs.d/local` will be automatically ignored by Git.

# Locating file(s).
UNIX variants will use locate for locating files. macOS will rely on Spotlight to locating files,
please make sure you have `mdfind` command available. Windows do not have any default tools for
locating files. So you will have to use [Everything](https://www.voidtools.com) and `es` command
line tool to do so.

# Using LLM
Due to our company restriction, I rely on [Ollama](https://ollama.ai) to use LLM for my coding
works. Create `~/.emacs.d/local/llm-provider.el` to customize. The default is to use Ollama running
on localhost.

``` emacs-lisp
(require 'llm-ollama)
(setopt ellama-provider
        (make-llm-ollama
         :host "your-ollama-server"
         :port "port-no"
         :chat-model "model-name"
         :embedding-model "model-name"))

(provide 'llm-provider)
```

The contents below `~/.emacs.d/local` will be automatically ignored by Git.

# Dictionary
On macOS, I use default dictionary service provided by the OS. On UNIX, I use
[dictd](https://github.com/cheusov/dictd) that runs locally on my PC. On Windows, I also use dictd
that runs on WSL2.

# EGLOT
Still rely heavily on dabbrev for auto completion, but recently I also use EGLOT. EGLOT's
performance is actually quite good. But still it lacks behind the "dumb completion" of dabbrev.

# Tree-sitter
There are problems with tree-sitter handling C/C++ preprocessor/macros. If you encounter strange
behavior on indentation or syntax-highlighting, you can toggle tree-sitter mode using
`toggle-tree-sitter`.
