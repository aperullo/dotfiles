# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ant/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

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
# plugins=(dnf)
plugins=(git kubectl thefuck zsh-autosuggestions helm)
source $ZSH/oh-my-zsh.sh

# User configuration

# helper functions
function is_installed {
    which $1 > /dev/null 2>&1
    return $?
}

# export MANPATH="/usr/local/man:$MANPATH"
export PATH="/home/ant/.local/bin:$PATH"
export PATH="/home/ant/bin:$PATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias zshrc="source ~/.zshrc"

# docker aliases
if is_installed podman; then
    alias docker="podman"
fi

if is_installed docker; then
    alias dex="docker exec -it"
    alias drun="docker run -it --entrypoint=/bin/sh"
    alias dk="docker"
    compdef dk=docker
    alias dki="docker images"
fi

# kubectl completion
if is_installed kubectl; then
    source <(kubectl completion zsh)
    alias kcl=kubectl
    complete -F __start_kubectl kcl
    compdef kcl=kubectl
    # for multiple kubeconfig files to be used
    export KUBECONFIG=$(find ~/.kube -type f -name "kube_config*" | sed -z "s/\n/:/g")
fi

# helm aliases
if is_installed helm; then
    source <(helm completion zsh)
fi

# zshrc-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="?"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# dnf aliases
if is_installed pacman; then
    alias dnfl="pacman -Si"             # List packages
    alias dnfli="pacman -Qi"            # List installed packages
    alias dnfp="pacman -Si"             # Show package information
    alias dnfs="pacman -Ss"             # Search package

    alias dnfu="sudo pacman -Syu"       # Upgrade package
    alias dnfi="sudo pacman -S"         # Install package
    alias dnfr="sudo pacman -Rs"        # Remove package
    alias dnfc="sudo pacman -Sc"        # Clean cache
fi

# vscode
# flatpak vscode doesn't create code command by default
alias code="flatpak run com.visualstudio.code"

# homebrew
if is_installed brew; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    export PATH=$HOME/linuxbrew/.linuxbrew/homebrew/bin:$PATH
fi

eval $(thefuck --alias)