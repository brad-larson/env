# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/brad/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/brad/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/brad/.fzf/man* && -d "/Users/brad/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/brad/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/brad/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/brad/.fzf/shell/key-bindings.zsh"

