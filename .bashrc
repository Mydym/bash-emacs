reset
if [[ -f /etc/bashrc ]]; then
  source /etc/bashrc
fi

SHELL=/bin/bash
export SHELL
PATH=$HOME/.brew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin
HISTFILE=~/.bash_history
SAVEHIST=5000
HISTSIZE=5000

# supprime les lignes en double dans l'historique
export HISTCONTROL=ignoreboth:erasedups

USER=`/usr/bin/whoami`
export USER
GROUP=`/usr/bin/id -gn $user`
export GROUP
MAIL="$USER@student.42.fr"
export MAIL
alias ls="ls -G"
alias ll="ls -l"
alias la="ls -la"
alias grep="grep --color=auto"
#alias emacs="~/homebrew/bin/emacs"
alias em='emacs -nw'
alias h='history'
alias rm='/bin/rm'
#alias sed='~/.brew/opt/gnu-sed/libexec/gnubin/sed'
alias sed='~/homebrew/Cellar/gnu-sed/4.2.2/bin/gsed'
export HOMEBREW_CACHE=~/Library/Caches
alias brew='~/homebrew/bin/brew'

#\033[1;31m
PS1="\n-[\033[33m\D{%D} \t\033[0m]"
PS1+="\033[0;37m---\033[0m[\033[0;32m\u\033[1;0m@\033[0;33m\H\033[0m]\033[0;37m---\033[0m[\033[0;33m\s\033[0m]"
PS1+="\n\033[0;37m--\e[0m[\033[0;31m\w\e[0m]\n\$ > "

if [ -e $HOME/app/Emacs.app/Contents/MacOS/Emacs ];then
	echo emacs ok app
	alias em="$HOME/app/Emacs.app/Contents/MacOS/Emacs -nw"
	$HOME/app/Emacs.app/Contents/MacOS/Emacs --version
	export EDITOR="$HOME/app/Emacs.app/Contents/MacOS/Emacs -nw"
elif [ -e $HOME/homebrew/bin/emacs ];then
	echo emacs ok brew
	alias em="$HOME/homebrew/bin/emacs"
	$HOME/homebrew/Cellar/emacs/24.5/bin/emacs --version
	export EDITOR="$HOME/homebrew/Cellar/emacs/24.5/bin/emacs"
else
	echo emacs local
	emacs --version
fi

PATH=$HOME/depot/bin:$HOME/homebrew/bin:$PATH
PATH=$PATH:$HOME/homebrew/Cellar/unoconv/0.7/bin

# 750
umask 027

if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
	source $(brew --prefix)/etc/bash_completion
else
	echo -e "\033[0;31mbash completion not exist\033[0m"
fi

if [[ -x /usr/libexec/path_helper ]]; then
	/usr/libexec/path_helper -s
fi

MANPATH="$HOME/man/perkamon-fr-3.70-1/build/C"
MANPATH="$HOME/man/perkamon-fr-3.70-1/perkamon/man-pages:$MANPATH"
MANPATH="$MANPATH:/usr/share/man"
export MANPATH

man_links()
{
	if [ -n "$2" ];then
		links  "https://www.freebsd.org/cgi/man.cgi?query=$2($1)&format=ascii"
	else
		links  "https://www.freebsd.org/cgi/man.cgi?query=$@&format=ascii"
	fi
}

alias manbsd=man_links
alias man1="man -M ~/Documents/man1_lnk"
#alias man='/usr/bin/man -M ~/man/man'
#alias pdf='~/app/Skim.app/Contents/MacOS/Skim'
# man tabs
tabs -4
