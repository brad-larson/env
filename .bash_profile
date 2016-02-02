set -o vi
source ~/.colors.sh
source ~/.git-prompt.sh

export CLICOLOR=1

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

export PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$\n> "

export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

alias vi="vim"
alias vim="vim"
export EDITOR="vim"
export VISUAL=$EDITOR
export TERM=xterm
export TERM=xterm-color
export profile=~/.bash_profile
export coding=~/coding
export repos=~/coding/repos

alias gcb='(echo `__git_ps1` | cut -d "(" -f2 | cut -d ")" -f1)'
alias edit="vim -p"
alias la="ls -la"
alias master="git checkout master && git pull origin master"
alias branch="git branch"
alias gro="git remote add origin"
alias gpm="git pull origin master"
alias gpo="git push -u origin"
alias gpc='git push -u origin `gcb`'
alias gaa='git add `(git status | grep "modified:\|new file:" | awk -F":   "'" '{print"' $2'"}'"')`'
alias modified='vim -p `git status | grep "modified:\|new file:" | awk -F":  " '"'{print"' $2'"}'"' | tr -d "\n"`'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
if [ -f ~/.fzf.bash ]; then
  . ~/.fzf.bash
fi

docker-machine start default
eval "$(docker-machine env default)"
