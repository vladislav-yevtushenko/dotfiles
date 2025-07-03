# PATH configuration
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock

# Docker/Colima setup - lazy load for performance
if command -v colima &> /dev/null; then
    export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
    _lazy_colima_setup() {
        if [[ -z "$TESTCONTAINERS_HOST_OVERRIDE" ]]; then
            export TESTCONTAINERS_HOST_OVERRIDE=$(colima ls -j | jq -r '.address')
        fi
    }
    alias docker='_lazy_colima_setup; unalias docker; docker'
fi
# Completion system - optimized for performance
autoload -Uz compinit
compinit -C

# Environment variables
export LANG=en_US.UTF-8
EDITOR="nvim"
VISUAL="zed"

# FZF configuration
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --follow --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude .git . "$1"
}

# Basic aliases
alias vim=nvim
alias vi=nvim
alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias dirs='dirs -lpv'

# FZF enhanced aliases
alias fzf='fzf --preview "[[ -f {} ]] && bat --color=always --style=header,grid --line-range :500 {} || echo \"Directory: {}\""'
alias fzf-files='fzf --preview "bat --color=always --style=header,grid --line-range :500 {}" --bind "ctrl-e:execute(bat --style=header,grid --line-range :500 {})+abort" | xargs -I{} realpath "{}" | pbcopy'
alias fzf-search='rg --line-number --hidden --no-ignore --color=always . | fzf --ansi --delimiter : --preview "file={1}; line={2}; [[ -f \"\$file\" ]] && bat --color=always --style=header,grid --highlight-line \$line \"\$file\" | head -200 || echo \"File not found: \$file\"" --bind "ctrl-e:execute(bat --style=header,grid --highlight-line {2} {1})+abort"'

# FZF search in directory function
fzf-search-dir() {
  local dir="${1:-.}"
  rg --line-number --hidden --no-ignore --color=always . "$dir" | fzf --ansi --delimiter : --preview "file={1}; line={2}; [[ -f \"\$file\" ]] && bat --color=always --style=header,grid --highlight-line \$line \"\$file\" | head -200 || echo \"File not found: \$file\""
}

# Google Cloud SDK
if [ -f '/Users/vlad/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vlad/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/vlad/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/vlad/google-cloud-sdk/completion.zsh.inc'; fi

# Lazy-loaded tools for better startup performance
thefuck_alias() {
    eval $(thefuck --alias)
    unset -f thefuck_alias
}
alias fuck='thefuck_alias; fuck'

_glab_completion() {
    source <(glab completion -s zsh)
    compdef _glab glab
    unset -f _glab_completion
}
compdef _glab_completion glab

