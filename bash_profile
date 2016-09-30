# Bash profile #
alias vin='vim -c "NERDTree" $1'
# Add my own scripts #
export PATH=$PATH:$HOME/scripts

### Virtualenv ###
export WORKON_HOME=$HOME/Code/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh
source ~/.set_ps1

### Development Paths ###
DEV_ROOT=$HOME/Code/work
WWW_ROOT=$DEV_ROOT/gadv
MEDIA_ROOT=$WWW_ROOT/gapadventures/media-server
SASS_PATH=
declare -a G_PROJECTS=('gadventures.1.8.com' 'gadventures')
for G_PROJ in "${G_PROJECTS[@]}"; do
	TMP_MEDIA=$DEV_ROOT/$G_PROJ/gapadventures/media-server
	export SASS_PATH=$SASS_PATH:$TMP_MEDIA/:$TMP_MEDIA/common/:$TMP_MEDIA/compass-css/:$TMP_MEDIA/static/
done


### General commands ###
alias cleanpyc='find . -name "*.pyc" -delete'

# G Adventures #
alias update_index='w_www;./manage.py update_trips_index --loglevel=INFO'
alias run_server='w_www;./manage.py runserver 0.0.0.0:8000'
alias collect_static='w_www;./manage.py collectstatic --noinput --link'
alias dynamic_media='rsync -av --delete  gdev@tordcmedia:/var/www/www.gapadventures.com/gapadventures/media-server/dynamic/ $WWW_ROOT/gapadventures/media-server/dynamic --exclude=passport --exclude=background-checks --exclude=triplog_files --exclude=sherpa --exclude=reports --exclude=looptail --exclude=brochures --exclude=offline-maps'
alias img_lib_sync='rsync -av --delete  gdev@tordcmedia:/var/www/www.gapadventures.com/gapadventures/media-server/image_library/ $WWW_ROOT/gapadventures/media-server/image_library --exclude=passport --exclude=background-checks --exclude=triplog_files --exclude=sherpa --exclude=reports --exclude=looptail --exclude=brochures --exclude=offline-maps'
alias jsmessages='django-admin.py makemessages -l de -d djangojs --ignore=media-server/static/* --ignore=media-server/admin/*'
alias makemessages='django-admin.py makemessages -l de --ignore=media-server/static/* --ignore=media-server/admin/*'

# ecomm-devops #
alias devops='cd $DEV_ROOT/ecomm-devops/; workon devops'
alias db_restore='devops; fab local postgres_master_restore --host=localhost'

# G-API
alias run_gapi='cd $DEV_ROOT/gapi-layer;workon gapi-layer;export GAPI_CONFIG=gapi.localconfig.LocalConfig; python gapi/app.py'
alias run_gapiweb='cd $HOME/domains/gapi-web.git;workon gapi-web; ./manage.py runserver 9000'
alias make_gapi_docs='cd gapi_docs; sphinx-build -E -b html -d _build/doctrees . _build/html; cd ..'

# Git
alias status='git status'
alias gdiff='git diff --color --ignore-space-at-eol'

# Searching (ack)
alias ackpy='ack --python --js --html --css --type-set scss=.scss --scss --ignore-dir=migrations --ignore-dir=vendor --ignore-dir=_CACHE --ignore-dir=node_modules --ignore-dir=dynamic'

# Misc
alias broken_symlinks='find -L . -type l'
alias latest='cat `ls -t | head -1`'
alias manage='workon gadventures; cd $WWW_ROOT; ./manage.py shell_plus --ptpython --vi'
alias restart_dnsmasq='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist ; sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist'
alias codeps='enscript -G1rjE --color -o -'
alias dus='du -Psckx * | sort -nr'

alias pretty='python -m json.tool'
alias ngrok='/Applications/ngrok'
