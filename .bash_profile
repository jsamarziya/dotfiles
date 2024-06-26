# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

umask 077

# no core files
ulimit -c 0

set -o noclobber
# Don't wait for job termination notification
set -o notify

FIGNORE="CVS:.svn"

[ -r ~/.git-completion.bash ] && [ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
[ -r ~/.gradle-completion.bash ] && [ -f ~/.gradle-completion.bash ] && source ~/.gradle-completion.bash
[ -r ~/.maven-completion.bash ] && [ -f ~/.maven-completion.bash ] && source ~/.maven-completion.bash
[ -r ~/.ssh-completion.bash ] && [ -f ~/.ssh-completion.bash ] && source ~/.ssh-completion.bash
[ -r ~/.vagrant-completion.bash ] && [ -f ~/.vagrant-completion.bash ] && source ~/.vagrant-completion.bash
[ -r /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion ] && [ -f /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion ] && source /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
[ -r /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion ] && [ -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion ] && source /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
[ -r /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion ] && [ -f /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion ] && source /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion

# Bash completion (macports)
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

if command -v keychain > /dev/null; then
    eval `keychain --quiet --eval`
fi
