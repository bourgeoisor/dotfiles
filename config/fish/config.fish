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
abbr -a h helm
abbr -a ha 'helm --all --all-namespaces'
abbr -a g git
abbr -a ga 'git add'
abbr -a gc 'git commit'
abbr -a gs 'git status'
abbr -a gp 'git push'
abbr -a gd 'git diff'
abbr -a vi vim
abbr -a nano micro
abbr -a ls 'eza -F --group-directories-first'
abbr -a ll 'eza -1lF --icons=always --group-directories-first'
abbr -a grep 'rg'
abbr -a find 'fd'

# --- Functions ---

function fish_reload
  source ~/.config/fish/config.fish
end

# Media

function mp
  command mplayer -ass -af scaletempo $argv
end

function sflac
  command shnsplit -t "%n-%t" -f $argv[1] -o flac $argv[2]
end

# Switch Kubernetes Context (Cluster)
function ktx
    set -l ctx (kubectl config get-contexts -o name | fzf --height 40% --reverse --header "Select Context")
    if test -n "$ctx"
        kubectl config use-context $ctx
    end
end

# Switch Kubernetes Namespace
function kns
    set -l ns (kubectl get namespaces -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' | fzf --height 40% --reverse --header "Select Namespace")
    if test -n "$ns"
        kubectl config set-context --current --namespace=$ns
    end
end

# Tail logs
function klog
    set -l pod (kubectl get pods --no-headers | awk '{print $1}' | fzf --height 60% --reverse --preview "kubectl logs --tail=10 {}")
    if test -n "$pod"
        kubectl logs -f $pod
    end
end

# Patch resource
function patchf
  kubectl patch --type merge -p '{"metadata":{"finalizers": null}}' $argv
end

# Docker Shell

function dshell
    set -l container (docker ps --format "{{.Names}}" | fzf --height 40% --reverse --header "Select Container")
    if test -n "$container"
        docker exec -it $container (docker exec $container sh -c "which bash >/dev/null && echo bash || echo sh")
    end
end

# Git Checkout

function gco
    set -l branch (git branch -a | fzf --height 40% --layout=reverse --info=inline --preview 'git log --oneline --graph --color=always -n 10 (string trim (string replace "remotes/origin/" "" {}))' | string trim)
    if test -n "$branch"
        # Remove 'remotes/origin/' prefix if it's a remote branch
        set -l target (string replace "remotes/origin/" "" $branch)
        git checkout $target
    end
end

# Projects

function ws
    set -l project_dir ~/workspace
    set -l selection (ls $project_dir | fzf --height 40% --reverse --preview "tree -L 2 $project_dir/{}")
    if test -n "$selection"
        cd $project_dir/$selection
    end
end

# Kill Process

function fkill
    set -l pid (ps -ef | sed 1d | fzf -m --height 50% --reverse --header='[kill:process]' | awk '{print $2}')
    if test -n "$pid"
        echo $pid | xargs kill -9
    end
end

# --- Extensions ---

zoxide init fish | source
fzf --fish | source
starship init fish | source
