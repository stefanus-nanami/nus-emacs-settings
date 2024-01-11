# nus-emacs-settings
Contains all items of my .emacs.d directory.

## TL;DR
How to setup my emacs...

1.  Clone this repository to `~/.emacs.d`.
2.  Install font and programs.
    - [Hack](https://sourcefoundry.org/hack/)
	- [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
3.  Start emacs.
4.  Install font using `M-x all-the-icons-install-fonts`.
5.  Install font using `M-x nerd-icon-install-fonts`.
6.  Install necessary tree sitter languages using `M-x treesit-install-language-grammar`.
7.  Create `~/.emacs.d/local/user-profile.el` and `~/.emacs.d/local/llm-provider.el`.
8.  (Optional) Change frame size, font size, etc. on `~/.emacs.d/early-init.el`.
9.  (Optional) Clone emacs-w3m sub-module and build.  
    ```
    $ autoconf
    $ ./configure
    $ ./make
    $ ./make install
    ```
10. Restart emacs.

## Font
I use Hack font for all my text editors. Download it [here](https://sourcefoundry.org/hack/).

## Key Bindings
Check what keys available by using `helm-descbinds` or M-F1.

## User profile
Provide user profile by creating `~/.emacs.d/local/user-profile.el`. The content should be something
like this.

``` emacs-lisp
(setq user-full-name "Your name")
(setq user-mail-address "email_address@your.server")

(provide 'user-profile)
```

The contents below `~/.emacs.d/local` will be automatically ignored by Git.

## Locating file(s).
UNIX variants will use locate for locating files. macOS will rely on Spotlight to locating files,
please make sure you have `mdfind` command available. Windows do not have any default tools for
locating files. So you will have to use [Everything](https://www.voidtools.com) and `es` command
line tool to do so.

## Using LLM
Due to our company restriction, I rely on [Ollama](https://ollama.ai) to use LLM for my coding
works. Create `~/.emacs.d/local/llm-provider.el` to customize. The default is to use Ollama running
on localhost.

``` emacs-lisp
(require 'llm-ollama)
(setopt ellama-provider
        (make-llm-ollama
         :host "your-ollama-server"
         :port port_no
         :chat-model "model-name"
         :embedding-model "model-name"))

(provide 'llm-provider)
```

The contents below `~/.emacs.d/local` will be automatically ignored by Git.

## Dictionary
On macOS, I use default dictionary service provided by the OS. On UNIX, I use
[dictd](https://github.com/cheusov/dictd) that runs locally on my PC. On Windows, I also use dictd
that runs on WSL2.

## EGLOT
Still rely heavily on dabbrev for auto completion, but recently I also use EGLOT. EGLOT's
performance is actually quite good, but still it lacks behind the "dumb completion" of dabbrev.

## Tree-sitter
There are problems with tree-sitter handling C/C++ preprocessor/macros. If you encounter strange
behavior on indentation or syntax-highlighting, you can toggle tree-sitter mode using
`toggle-tree-sitter`.

## Web browsing in text?
No problem use `M-x w3m`. I feel old...
