# Current folder bin
# mkdir .git/safe in the root of repositories you trust
function add_trusted_local_bin_to_path() {
  export PATH=".git/safe/../../bin:$PATH"
  export PATH=".git/safe/../../.bundle/bin:$PATH"
}

# Make sure add_trusted_local_bin_to_path runs after chruby so we
# prepend the default chruby gem paths
if [[ -n "$ZSH_VERSION" ]]; then
  if [[ ! "$preexec_functions" == *add_trusted_local_bin_to_path* ]]; then
    preexec_functions+=("add_trusted_local_bin_to_path")
  fi
fi

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Fixes arrow key bindings
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

# Disable autocorrect
unsetopt correct

# s5
eval "$($HOME/.s5/bin/s5 init -)"

# Git extras
export PATH="$HOME/.git-extras/bin:$PATH"
# Bundler bin
export PATH=./bundle/bin:$PATH

# Aliases

# Git
alias g='git'
alias gut='git'

# Reloads ZSH
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
