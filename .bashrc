docker()
{
 if [ $# -gt 0 ] && [ "$1" == "yeet" ] ; then
     shift
     command  echo "Stopping running instances..."
     command docker stop $(docker ps -q)
     command echo "Removing containers..."
     command docker rm $(docker ps -a -q)
     command echo "Removing all images..."
     command docker rmi $(docker images -a -q) -f
 else
     command docker "$@"
 fi
}

#git
alias gc='git commit'
alias gco='git checkout'
alias gcl='git clone'
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gp='git push'

#functions
mkcd() { mkdir $1 && cd $1; }
desktop() { cd ~/Desktop; }
projects() { cd ~/git; }
up() { cd $(eval printf '../'%.0s {1..$1}); }
numfiles() { N="$(ls $1 | wc -l)"; echo "found $N files"; }

#alias
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias sbashrc='source ~/.bashrc'
alias hs='history | grep'
alias open=xdg-open
