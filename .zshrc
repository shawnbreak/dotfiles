# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
.
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gianu" # set by `omz`

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
# ENABLE_CORRECTION="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
        zsh-autosuggestions
	sudo
	web-search
	copybuffer
	copypath
	dirhistory
	copyfile
	zsh-syntax-highlighting
)

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
export EDITOR=emacsclient
export TERM=xterm-256color
#export PATH=$PATH:~/.local/share/nvim/mason/bin

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ll="exa -lhgb --git"
#alias ll="exa --long --color -I .git"
alias v="nvim"
alias open="xdg-open"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#eval "$(starship init zsh)"
. "$HOME/.cargo/env"


[ -f "/home/shawn/.ghcup/env" ] && . "/home/shawn/.ghcup/env" # ghcup-env
eval "$(zoxide init zsh)"
alias e="emacsclient -n"
alias ew="emacsclient"

alias grep="grep --color=auto --null"
. "/home/shawn/.acme.sh/acme.sh.env"

export PATH=~/go/bin:$PATH

pandock() {
    docker run --rm \
	   -v "$(pwd):/data" \
	   -v "/usr/share/fonts:/usr/share/fonts" \
	   -v "/usr/share/fontconfig:/usr/share/fontcconfig" \
	   -u $(id -u):$(id -g) \
	   pandoc/extra:latest-ubuntu \
	   --pdf-engine=xelatex \
	   --toc \
	   --toc-depth=2 \
	   --number-sections \
	   -f markdown+smart \
	   -V block-headings \
	   -V colorlinks=true \
	   -V urlcolor=blue \
	   -V linkcolor=blue \
	   -V toc-color=NavyBlue \
	   -V titlepage=true \
	   -V toc-own-page=true \
	   -V mainfont="Noto Serif CJK SC" \
	   -V sansfont="Noto Sans CJK SC" \
	   -V monofont="JetBrainsMono Nerd Font" \
	   -V CJKmainfont="Noto Serif CJK SC" \
	   --template eisvogel \
	   --highlight-style tango \
	   -V lang=zh_CN.UTF-8 $@
}

