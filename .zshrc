# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH=$HOME/linuxbrew/.linuxbrew/homebrew/bin:$PATH

# Add asdf shims to PATH
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"


# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
setopt HIST_IGNORE_SPACE

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions git kubectl helm docker docker-compose dnf asdf pyenv)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# aliases
alias zshrc="source ~/.zshrc"

# kubectl completion
if command -v kubectl &> /dev/null; then
    source <(kubectl completion zsh)
    alias kcl=kubectl
    complete -F __start_kubectl kcl
    compdef kcl=kubectl
    # for multiple kubeconfig files to be used
    export KUBECONFIG=$(find ~/.kube -type f -name "*.yml" | sed -z "s/\n/:/g")
fi

# helm aliases
if command -v helm &> /dev/null; then
    source <(helm completion zsh)
fi

if command -v docker &> /dev/null; then
    alias dex="docker exec -it"
    alias drun="docker run -it --entrypoint=/bin/sh"
    alias dk="docker"
    compdef dk=docker
    alias dkc="docker-compose"
    compdef dkc=docker-compose
    alias dki="docker images"
    alias dcu="docker-compose up"
    alias dcd="docker-compose down"
fi

# zshrc-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="?"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?"

# eval $(ssh-agent -s)
# ssh-add ~/.ssh/gitkey

export PATH="$HOME/.local/bin:$PATH"