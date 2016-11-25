# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
source .aliases
# User specific aliases and functions
#PS1="\u@\h\w>"
set -C
PATH=$PATH:.
export PS1="\[\e[31m\]\h\[\e[m\]:\[\e[32m\]\w\[\e[m\]> "
export TERM='xterm-256color'
