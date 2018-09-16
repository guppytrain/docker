# make docker-machine wrapper
[ -n "$(complete -p | grep _docker_machine)" ] \
&& make-completion-wrapper _docker_machine _dmachine docker-machine > /dev/null \
&& complete -F _dmachine dkm

# make docker-compose wrapper
[ -n "$(complete -p | grep _docker_compose)" ] \
&& make-completion-wrapper _docker_compose _dcompose docker-compose > /dev/null \
&& complete -F _dcompose dkc

