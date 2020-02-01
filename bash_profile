PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin

export PATH="/usr/local/opt/gettext/bin:$PATH"

# Don't forget to activate this in .bashrc or .bash_profile (source ~/.set_ps1.sh)
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

source ~/.git-prompt.sh

export PS1=$'\[\e[0;36m\][\u] \[\e[1;33m\]\w \[\e[0;32m\]$(__git_ps1 " (%s)") \[\e[0m\]\n \xe2\x86\xaa '
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export CI_REGISTRY=registry.points.com
export CI_REGISTRY_USER=jweatherby
export CI_REGISTRY_PASSWORD=PxYz5azkdajXUvuwv1RL

alias dlogin="docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY"
alias restartdns="docker restart \$(docker ps --filter 'name=dns' -q)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
