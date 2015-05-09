# My custom mods for macos

export PATH="$HOME/bin:$PATH:/Applications/mybin"
export PATH="$PATH:~/progs/nand2tetris/tools"
export PATH="$PATH:/Users/davis/Library/Android/sdk/platform-tools"
export VIM_APP_DIR=/Applications/mybin


##
# Your previous /Users/davis/.bash_profile file was backed up as /Users/davis/.bash_profile.macports-saved_2015-03-19_at_15:06:30
##

# MacPorts Installer addition on 2015-03-19_at_15:06:30: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PS1="\h\w$ "

test -r /sw/bin/init.sh && . /sw/bin/init.sh

# go ahead. uncomment this and it will fsck up your
# aws authentication
#export AWS_ACCESS_KEY_ID=AKIAJ46QQECQI3666PQ
#export AWS_SECRET_ACCESS_KEY=TjsAKNKk05dfiKjjL56LJ1rN++rmatSnr1mc/MmX1

alias strace='dtruss -f -t open'
alias grep='grep --color=auto'
alias updatedb='sudo /usr/libexec/locate.updatedb'

# http://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls='ls -G'
