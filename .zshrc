# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/roy/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE='awesome-fontconfig'
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
export HISTCONTROL=ignoredups;
setopt  HISTAPPEND;
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
plugins=(git node npm git git-extras extract alias-tips z zsh-autosuggestions)

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
function fd() { find . -type d -name "$1" }

function de(){docker exec -it $1 bash}

function pgrep(){
  ps -ef | grep $1 | awk '{print $2}'
}

alias pgrep1='ps -ef | grep $1'
alias agrep='alias | grep $1'
alias gf='git fetch origin $(current_branch)'
alias gm='git merge origin $(current_branch)'
alias g1='git log --oneline'
alias g1me='g1 --author="$(g config user.name)"'
alias u='sudo apt update'
alias h='history'
alias hg='history | grep $1'
alias j='jobs -l'
alias ngrep='sudo netstat -natop | grep $1'
alias dp='docker ps -a'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias ltr='ll -ltr'
alias number="sed ':a;s/\B[0-9]\{3\}\>/,&/;ta'"
alias threads='ps -T -p $1'
alias 'wcl'=' wc -l | number'
alias gwhat='git diff --stat --cached origin/master'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias sea="nc seashells.io 1337"
alias iotop="_ iotop"
alias listen='sudo lsof -i -P | grep -i "listen"'
alias diff='colordiff'
alias lastfiles='ls -1 | tail -n $1'
alias h1='`!!` |  head -1'
alias t1='!! |  tail -1' 

alias ntmux="TMUX= tmux new-session -d -s "
alias stmux="tmux switch-client -t "
alias df='df -h'
alias du='du -h -c'
alias mkdir='mkdir -p'
alias gurl='perl -pe s@\"\}@@g | perl -pe s@\\\\/@/@g | grep -i -o -P "http://[^\s\\\\\"]+"'
alias gip='grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}"'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ports='netstat -tulanp'

#flat tar - make it generalize
#find . -name '*.jar' -not -name '*sources*' -exec tar --transform 's/.*\///g' -rvf my_file.tar {} \;



function myip() {
    curl -s ipinfo.io/$1
}

function le() {
  if [[ $# -eq 0 ]]; then
    if [ -d $1 ] ; then
        builtin cd `ls -rt | tail -n1`
    else
      command less `ls -rt | tail -n1`
    fi
  else
      command less `ls -rt $1 | tail -n1`
  fi
}

function show() {
  if [[ $1 == *.tar.gz ]]; then
      tar -ztvf $1
  elif [[ $1 == *.tar ]]; then
          tar -tvf $1
  elif [[ $1 == *.zip ]]; then
        unzip -l $1
  elif [[ $1 == *.jar  ]]; then
        jar tf $1
  else
      echo "not defined yet..."
  fi
}

cdl()    {
  cd"$@";
  ltr;
}


function mkcd () {
  mkdir "$1"
  cd "$1"
}

function bck () {
  cp "$2" "$2.bck"
  cp "$1" "$2"
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


#############################   medaware relevant ##########################################
alias myuser="echo medaware_rlimony"
alias y='yarn run build:server-dev'


function dmed(){
  de `dp | grep tomcat | awk '{print $1}'`
}

function dmysql(){
  de `dp | grep mysql | awk '{print $1}'`
}

test() {
    if [[ $@ == "ssh" ]]; then
        command sshpass -p medaware ssh medaware@192.168.1.81
    elif [[ $1 == "scp" ]];
    then
        command sshpass -p medaware scp -r $2 medaware@192.168.1.81:/home/medaware/temp
    else

    fi
}
test96(){
  if [[ $@ == "ssh" ]]; then
      command sshpass -p medaware ssh medaware@192.168.1.96
  elif [[ $1 == "scp" ]];
  then
      command sshpass -p medaware scp -r $2 medaware@192.168.1.96:/home/medaware/temp
  else

  fi
}

staging(){
  if [[ $@ == "ssh" ]]; then
      command sshpass -p medaware ssh medaware@192.168.1.188
  elif [[ $1 == "scp" ]];
  then
      command sshpass -p medaware scp -r $2 medaware@192.168.1.188:/home/medaware/temp
  else

  fi
}


transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }
