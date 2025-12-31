# --- General Settings ---

set fish_greeting ""

# --- Paths ---

fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path "$HOME/.local/bin"

# --- Abbreviations ---

abbr -a k kubectl
abbr -a ka 'kubectl --all-namespaces'
abbr -a kns 'kubectl config set-context --current --namespace'

# --- Functions ---

function fish_reload
  source ~/.config/fish/config.fish
end

# Utils

function ls
  command eza --classify=always --group-directories-first $argv
end

function ll
  command eza --oneline --long --classify=always --icons=always --group-directories-first $argv
end

function vi
  command vim $argv
end

function nano
  command micro $argv
end

function grep
  command rg $argv
end

function find
  command fd $argv
end

# Media

function mp
  command mplayer -ass -af scaletempo $argv
end

function sflac
  command shnsplit -t "%n-%t" -f $argv[1] -o flac $argv[2]
end

# Kubernetes

function setns
  set context $argv
  set cluster (kubectl config current-context)
  kubectl config set-context $cluster --namespace=$context
end

function fns
    set ns (kubectl get namespaces -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' | fzf)
    if test -n "$ns"
        kubectl config set-context --current --namespace=$ns
    end
end

function h
  helm $argv
end

function ha
  helm $argv --all --all-namespaces
end

function patchf
  kubectl patch --type merge -p '{"metadata":{"finalizers": null}}' $argv
end

# --- Extensions ---

zoxide init fish | source
fzf --fish | source
starship init fish | source
