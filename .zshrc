# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/roy/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="random"


#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE='awesome-fontconfig'
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"lo

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


export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"

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
plugins=(git node npm git git-extras extract alias-tips z zsh-autosuggestions colored-man-pages fasd fzf sudo hacker-quotes zsh-syntax-highlighting)

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

#todo - create func to check exist before mount
#sudo mount 192.168.1.98:/home/medaware/Tests /mnt/nfs
#sudo mount 192.168.1.98:/home/medaware/SHEBA/pull_data /home/dev/medaware/pull_data

export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

eval $(thefuck --alias)

#eval "$(fasd --init auto)"

alias v='f -e vim'
alias c='f -e bat'
alias sudo='sudo '
alias -s {txt,yml,xml}=vim
alias -s {log,json,conf,csv}=cat
alias -s {html}=w3m

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

function chpwd() {
    exa -l -snew
    #emulate -L zsh
    pwd
}

function d2h()
{
    printf "%x\n" $1
}

function i()
{
    sudo apt install $1
}

function f() { find . -type f -iname \*."*$1*" }
function fdir() { find . -type d -name "$1" }

function de(){docker exec -it $1 bash}

function pgrep(){
  ps -ef | grep $1 | awk '{print $2}'
}

function zsh-stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n25
}

#shortcuts for pipes less grep
alias -g G='| grep -i'
alias -g GV='| grep -i -v'
alias -g L='| less'
alias -g LG='less +G'
alias -g W='| wc -l'
alias -g P='xargs echo -n | xclip -selection clipboard'
alias -g C='| pbcopy'  # same as P
alias -g L1='`ls -Art | tail -n 1`'
alias -g S1='`ls -Ars | tail -n 1`'
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g OE="2>&1 | less"
#alias less='less +G'
alias grepi='grep -i $1'
alias l='exa -l -snew'
alias llse='exa -l -snew'
alias ltr='exa -l -snew'
alias lst='exa -l -snew'
alias lsr='exa -l --sort=size'
alias lall='exa -bghHliS'

#shell stuff aliases / history
alias agrep='alias | grep $1'
alias u='sudo apt update'
alias hi='history'
alias hg='history | grep $1'
alias pbcopy='xargs echo -n | xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias pwd='pwd | tee /dev/tty | pbcopy'
alias p='pwd'
alias real='realpath'
alias r='realpath'
alias number="sed ':a;s/\B[0-9]\{3\}\>/,&/;ta'"
alias 'wcl'=' wc -l | number'
alias diff='colordiff'
alias lastfiles='ls -1 | tail -n $1'
alias h1='`!!` |  head -1'
alias t1='!! |  tail -1'
alias oneline='paste -s'
alias mysum='paste -sd+ - | bc'
alias idea='sudo /opt/idea/ideaIC-2020.1/idea-IC-201.6668.121/bin/idea.sh '
#alias idea='sudo /opt/idea/ideaIC-2018.3/idea-IC-183.4284.148/bin/idea.sh &'
alias cat='bat'
alias d='d1'
alias cdl='cd `ls -Art | tail -n 1`'
function d1() {
    dirs -v | head -10 | sed 's/\t/ ---> /g'
}
function fcd () { [ -f "$1" ] && { cd "$(dirname "$1")"; } || { cd "$1"; } }
alias wh='which'
alias ro='robot'
alias t='tree'


#git stuff
alias gbd='git branch --sort=committerdate'
alias gall='git branch --sort=committerdate'
alias gfc='git fetch origin $(current_branch)'
alias gf='git fetch'
alias gm='git merge origin $(current_branch)'
alias gp='git push origin $(current_branch)'
alias gpc='git push origin $(current_branch) && custom-build'
alias glom='git pull origin master'
alias g1='git log --oneline'
alias g1me='g1 --author="$(g config user.name)"'
alias gwhat='git diff --stat --cached origin/master'
alias gwhat1='git cherry -v origin/master'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"


#process
alias pgrep1='ps -ef | grep $1'
alias j='jobs -l'
alias threads='ps -T -p $1'

#network
alias ngrep='sudo netstat -natop | grep $1'
alias sea="nc seashells.io 1337"
alias iotop="_ iotop"
alias listen='sudo lsof -i -P | grep -i "listen"'
alias ping='prettyping --nolegend'


#docker
alias dr='docker restart $1'
alias ds='docker stop $1'
alias dp='docker ps '
alias dps='docker ps --format '\''table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}'\'''
alias dpa='docker ps -a'

#shell stuff less used
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
alias monitor='echo "dstat\\nuptime\\ndmesg | tail\\nvmstat 1\\nmpstat -P ALL 1\\npidstat 1\\niostat -xz 1nfree -m\\nsar -n DEV 1\\nsar -n TCP,ETCP 1\\ntop\\niotop\\ndocker stats"'
alias top10='_ du -a . | sort -n -r | head -n 10'
alias xml='xmllint --format - | pygmentize -l xml'
alias docker-cleanup='_ ~/docker-cleanup.sh'
alias typeless='ca  t ~/.zsh_history | cut -d ";" -f 2- | cut -d " " -f 1-4 | sort | uniq -c | sort -g'
alias S='_ !!'
alias mytilix='tilix --maximize  -s /home/roy/sessions/mysql.json -s /home/roy/sessions/medaware.json -s /home/roy/sessions/logs.json -s /home/roy/sessions/test.json &'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


#medaware specific
alias medpid="docker top medaware_app | head -c 170 | grep -o '[[:digit:]]*'"
alias medaware='/home/roy/dev/workspace/medaware'
alias startMed='docker start medaware_db;docker start medaware_app'
alias startMac='docker start medaware_mssql;docker start medaware_db;docker start medaware_app'
alias lmed='less -G /home/dev/medaware/tomcat/logs/medaware-all.log'
alias llog='less -G /home/dev/medaware/tomcat/logs/medaware-all.log'
alias lerr='less -G /home/dev/medaware/tomcat/logs/medaware-error.log'
alias lsla='less -G /home/dev/medaware/tomcat/logs/medaware-sla.log'
alias tlog='less -G /home/roy/dev/workspace/tests/robot_Reports/tests_debug.log'
alias logs='cd /home/dev/medaware/tomcat/logs'
alias watch='watch '
alias pick1='docker exec -i medaware_db mysql -u medaware -pmedaware medaware -e "select patientid from patients" 2>/dev/null | tail -1 | tee /dev/tty | pbcopy'
alias count="docker exec -i medaware_db mysql -u medaware -pmedaware medaware -e 'select count(patientid) from patients' 2>/dev/null"
alias pids="docker exec -i medaware_db mysql -u medaware -pmedaware medaware -e 'select patientid from patients' 2>/dev/null"
alias alerts="docker exec -i medaware_db mysql -u medaware -pmedaware medaware -e 'select count(*),patientid from alerts group by patientid' 2>/dev/null"
alias localsettings='vim /home/dev/medaware/localSettings/applicationSettings.yml'
alias jenkinsLogs='cd /home/medaware/nfs/Tests/tests/results/Dev/custom-Build-and-Tests/'
alias err='l G err'
alias sla='l G sla'
alias sla='l G sla'
alias all='l G all'



function c1() {
  echo -e $@ | tee /dev/tty | pbcopy
}
function lsofw() {
  sudo lsof -p $1 | awk 'NR==1 || $4~/[0-9]+[uw]/'
}
function realpath() {
  /usr/bin/realpath $1 | tee /dev/tty | pbcopy
}
function pick {
         google-chrome "http://localhost:8080/MedAwareDemo/reports/#/patient?admissionID=-1&patientID=int`docker exec -i medaware_db mysql -u medaware -pmedaware medaware -e 'select patientid from patients' 2>/dev/null | tail -1`"
}
function mylocalip(){
	ip addr | grep enp0 | grep inet | awk {'print $2'} | sed 's/.\{3\}$//' | tee /dev/tty | pbcopy
}
function mywifiip(){
       ip addr | grep wlp3s0 | grep inet | awk {'print $2'} | sed 's/.\{3\}$//' | tee /dev/tty | pbcopy
}
#flat tar - make it generalize
#find . -name '*.jar' -not -name '*sources*' -exec tar --transform 's/.*\///g' -rvf my_file.tar {} \;

function largest() {
    _ du -a $1 | sort -n -r | head -n 10
}


function myip() {
    curl -s ipinfo.io/$1
}

function le() {
  if [[ $# -eq 0 ]]; then
    command less `ls -rt $1 | tail -n1`
  else
    if [ -d $1 ] ; then
        builtin cd `ls -rt | tail -n1`
    else
      command less `ls -rt | tail -n1`
    fi
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

function mkcd () {
  mkdir "$1"
  cd "$1"
}

function bck () {
  if [ "$#" -eq 1 ]; then
      cp "$1" "$1.bck"
  elif [ "$#" -eq 2 ]; then
    cp "$2" "$2.bck"
    cp "$1" "$2"
  else
         echo "Illegal number of parameters"
  fi


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

# explain.sh begins
explain () {
if [ "$#" -eq 0 ]; then
while read  -p "Command: " cmd; do
curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$cmd"
done
echo "Bye!"
elif [ "$#" -eq 1 ]; then
curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$1"
else
echo "Usage"
echo "explain                  interactive mode."
echo "explain 'cmd -o | ...'   one quoted command to explain it."
fi
}

function swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

#############################   medaware relevant ##########################################
alias myuser="echo medaware_rlimony"
alias y='yarn run build:server-dev'
alias portainer='docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer'


function startMed(){
  docker start medaware_db
  docker start medaware_app
}

function startMedBlack(){
  startMed
  docker start medaware_blackbox
}

function startMedMaccabi(){
  startMed
  docker start medaware_mssql
}

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
nfs(){
  if [[ $@ == "ssh" ]]; then
      command sshpass -p MedAware2017 ssh medaware@192.168.1.98
  elif [[ $1 == "scp" ]];
  then
      command sshpass -p MedAware2017 scp -r $2 medaware@192.168.1.98:/home/medaware/temp
  else

  fi
}
jenkins-slave-3(){
  if [[ $@ == "ssh" ]]; then
      command sshpass -p qwe123 ssh medaware@192.168.1.90
  elif [[ $1 == "scp" ]];
  then
      command sshpass -p qwe123 scp -r $2 medaware@192.168.1.90:/home/medaware/temp
  else

  fi
}
jenkins-slave-4(){
  if [[ $@ == "ssh" ]]; then
      command sshpass -p qwe123 ssh medaware@192.168.1.93
  elif [[ $1 == "scp" ]];
  then
      command sshpass -p qwe123 scp -r $2 medaware@192.168.1.93:/home/medaware/temp
  else

  fi
}
jenkins-slave-5(){
  if [[ $@ == "ssh" ]]; then
      command sshpass -p qwe123 ssh medaware@192.168.1.142
  elif [[ $1 == "scp" ]];
  then
      command sshpass -p qwe123 scp -r $2 medaware@192.168.1.142:/home/medaware/temp
  else

  fi
}
jenkins-slave-6(){
  if [[ $@ == "ssh" ]]; then
      command sshpass -p qwe123 ssh medaware@192.168.1.78
  elif [[ $1 == "scp" ]];
  then
      command sshpass -p qwe123 scp -r $2 medaware@192.168.1.78:/home/medaware/temp
  else

  fi
}
smatrix-slave(){
  if [[ $@ == "ssh" ]]; then
      command sshpass -p qwe123 ssh medaware@192.168.1.159
  elif [[ $1 == "scp" ]];
  then
      command sshpass -p qwe123 scp -r $2 medaware@192.168.1.159:/home/medaware/temp
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
devqa(){
  if [[ $@ == "ssh" ]]; then
      command sshpass -p medaware ssh medaware@192.168.1.199
  elif [[ $1 == "scp" ]];
  then
      command sshpass -p medaware scp -r $2 medaware@192.168.1.199:/home/medaware/temp
  else

  fi
}

medData(){
  if [[ $@ == "ssh" ]]; then
      command sshpass -p medaware ssh medaware@192.168.1.19
  elif [[ $1 == "scp" ]];
  then
      command sshpass -p medaware scp -r $2 medaware@192.168.1.19:/home/medaware/temp
  else

 fi
}
#PATH=$(echo "$PATH" | sed -e 's/\/home\/roy\/.nvm\/versions\/node\/v8.0.0\/bin://')

function color-ssh() {
    trap "colorterm.sh" INT EXIT
    if [[ "$*" =~ "192.168.1" ]]; then
        colorterm.sh prod
    elif [[ "$*" =~ "dev" ]]; then
        colorterm.sh dev
    else
        colorterm.sh other
    fi
    ssh $*
}


export PATH=/home/roy/anaconda3/bin:$PATH
