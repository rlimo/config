# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/roy/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
#export HISTCONTROL=ignoredups;
#export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";


# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git node npm git git-extras extract alias-tips z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval $(thefuck --alias)

function d2h()
{
    printf "%x\n" $1
}

function i()
{
    sudo apt install $1
}

function f() { find . -type f -name "$1" }

function de(){docker exec -it $1 bash}

function pgrep(){
  ps -ef | grep $1 | awk '{print $2}'
}

alias pgrep1='ps -ef | grep $1'
alias agrep='alias | grep $1'
alias gf='git fetch origin $(current_branch)'
alias gm='git merge origin $(current_branch)'
alias g1='git log --oneline'
alias u='sudo apt update'
alias y='yarn run build:server-dev'
alias h='history'
alias hg='history | grep $1'
alias ngrep='sudo netstat -natop | grep $1'
alias dp='docker ps -a'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
function ip() {
    curl -s ipinfo.io/$1
}


function lastcommandfailed() {
  code=$?
  if [ $code != 0 ]; then
    echo -n $'\033[37;1m[exited \033[31;1m'
    echo -n $code
    echo -n $'\033[37;1m] '
  fi
}

function new_tmux() {
    TMUX= tmux new-session -d -s $1
    tmux switch-client -t $1
}

function activevirtualenv() {
  if [ -n "$VIRTUAL_ENV" ]; then
      echo -n "("
      echo -n $(basename $VIRTUAL_ENV)
      echo -n ") "
  fi
}

function json_keys() {
    grep "{.*}" -o $1 | jq -r 'keys' | grep "[a-z]" | sort -u
}

function json() {
    grep "{.*}" -o $1 | jq -r $2
}

alias ntmux="TMUX= tmux new-session -d -s "
alias stmux="tmux switch-client -t "
alias df='df -h'
alias du='du -h -c'
alias mkdir='mkdir -p'
alias gurl='perl -pe s@\"\}@@g | perl -pe s@\\\\/@/@g | grep -i -o -P "http://[^\s\\\\\"]+"'
alias gip='grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}"'
