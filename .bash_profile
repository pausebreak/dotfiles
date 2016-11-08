export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=/usr/local/bin:$PATH:~/bin
export EDITOR=vim
export OG_REPO_BASE_PATH=~/src/opengov/

alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset' --abbrev-commit --date=relative --all"
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

source ~/.git-completion.bash
source ~/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

eval "$(thefuck --alias)"
eval "$(rbenv init -)"
