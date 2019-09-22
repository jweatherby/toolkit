PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin

source ~/.set_ps1.sh

export PATH="/usr/local/opt/gettext/bin:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export CI_REGISTRY=registry.points.com
export CI_REGISTRY_USER=jweatherby
export CI_REGISTRY_PASSWORD=PxYz5azkdajXUvuwv1RL

alias dlogin="docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY"
alias restartdns="docker restart \$(docker ps --filter 'name=dns' -q)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


