bindkey -e

## menu-style
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
zstyle ':completion:*' special-dirs true
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Tab completion colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# add new installed packages into completions
zstyle ':completion:*' rehash true
# Use better completion for the kill command
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;34'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# use completion cache
zstyle ':completion::complete:*' use-cache true


autoload -Uz vcs_info
setopt PROMPT_SUBST
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-staged-changes true
zstyle ':vcs_info:git:*' check-for-unstaged-changes true
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:*' enable git 

export PROMPT='${vcs_info_msg_0_} %~/ : '

alias grep="grep --color=auto --null"
alias ls='ls --color=auto'

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

