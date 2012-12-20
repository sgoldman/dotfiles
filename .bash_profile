#colors
C_DEFAULT="\[\033[m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_MAGENTA="\[\033[35m\]"

export PS1="$C_LIGHTGREEN\u $C_CYAN\W $C_DARKGRAY:$C_DEFAULT "

#aliases

#navigation
alias ..="cd .."
alias home="cd ~"

#show / hide hidden files
alias shidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hhidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

#open virtual hosts
alias openvhosts="open /etc/apache2/extra/httpd-vhosts.conf -a TextMate"
alias openhosts="open /etc/hosts -a TextMate"

#shortcuts
alias w="cd ~/WebRoot"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

#mate
export EDITOR='/usr/local/bin/mate -w'

#NVM
export NVM_HOME="$HOME/.nvm"
if [[ -f "$NVM_HOME/nvm.sh" ]]; then
    source "$NVM_HOME/nvm.sh"
fi

#NVM Tab completion
if [[ -f "$NVM_HOME/bash_completion" ]]; then
    source "$NVM_HOME/bash_completion"
fi

#NPM Tab completion
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
 

##
# Your previous /Users/shanagoldman/.bash_profile file was backed up as /Users/shanagoldman/.bash_profile.macports-saved_2012-08-29_at_16:55:51
##

# MacPorts Installer addition on 2012-08-29_at_16:55:51: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/shanagoldman/.bash_profile file was backed up as /Users/shanagoldman/.bash_profile.macports-saved_2012-10-31_at_14:14:05
##

# MacPorts Installer addition on 2012-10-31_at_14:14:05: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export CLICOLOR=1
export LSCOLORS=hxFxGxDxGxegedabagaced