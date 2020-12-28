# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

###########################################################################
# PATH
###########################################################################

# anyenv / rbenv
PATH="$HOME/.anyenv/bin:/Users/edgaras/.rbenv/bin:/usr/local/bin:$PATH"

# go tools
PATH="$PATH:$HOME/gotools/bin"

# global ~/go/bin
PATH="${HOME}/go/bin:${PATH}"

# krew plugins
PATH="${KREW_ROOT:-$HOME/.krew}/bin:${PATH}"

# finally, export the PATH
export PATH

###########################################################################
# LOCALE
###########################################################################

export LC_ALL=en_US.UTF-8 export LANG=en_US.UTF-8

###########################################################################
# ZSH STUFF
###########################################################################

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# ZSH_THEME=geoffgarside
ZSH_THEME="geoffgarside"

plugins=(git colored-man-pages zsh-completions helm)

# Add zsh completion scripts installed via Homebrew
fpath=("$HOMEBREW/share/zsh-completions" $fpath)
fpath=("$HOMEBREW/share/zsh/site-functions" $fpath)

# Reload the zsh-completions
autoload -U compinit && compinit -i

source "$ZSH/oh-my-zsh.sh"

# accept updates by default
export UPDATE_ZSH_DAYS=14
export DISABLE_UPDATE_PROMPT=true 

# load zsh plugins installed via brew
if [[ -d "$HOMEBREW/share/zsh-syntax-highlighting" ]]; then
	source "$HOMEBREW/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
if [[ -d "$HOMEBREW/share/zsh-autosuggestions" ]]; then
	# source "$HOMEBREW/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# PROMPT="[%*] %n:%c $(git_prompt_info)%(!.#.$) "
PROMPT='[%*] %{$fg[cyan]%}%n%{$reset_color%}:%{$fg[blue]%}%c%{$reset_color%}$(git_prompt_info) %(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

###########################################################################
# SYSTEM PATHS
###########################################################################

# use system paths (e.g. /etc/paths.d/)
eval "$(/usr/libexec/path_helper -s)"

###########################################################################
# GITHUB
###########################################################################

# Use github completions
eval "$(gh completion -s zsh)"

###########################################################################
# WORKPLACE ENV
###########################################################################

# /Users/$USER/.workplace_env/company_env
source /Users/$USER/.workplace_env/*

export EDITOR=vim

###########################################################################
# KUBERNETES
###########################################################################

#kube-ps1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

# kubectl completion
source="$HOME/.kube/.zsh_completion"

# kubernetes aliases
alias k='kubectl'