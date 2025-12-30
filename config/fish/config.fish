set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showcleanstate 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'no'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_cleanstate '✔'
set __fish_git_prompt_char_dirtystate '✚'
set __fish_git_prompt_char_stagedstate '●'
set __fish_git_prompt_char_invalidstate '✖'
set __fish_git_prompt_char_untrackedfiles '…'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

# Supress welcome message
set fish_greeting ""

# Path fixes
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /Users/obourgeois/.local/bin

# Functions
function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

function add_to_path --description 'Persistently prepends paths to your PATH'
  set --universal fish_user_paths $fish_user_paths $argv
end

function fish_reload
  source ~/.config/fish/config.fish
end

function ls
  command ls -FGh $argv
end

function vi
  command vim $argv
end

function mp
  command mplayer -ass -af scaletempo $argv
end

function sflac
  command shnsplit -t "%n-%t" -f $argv[1] -o flac $argv[2]
end

function setns
  set context $argv
  set cluster (kubectl config current-context)
  kubectl config set-context $cluster --namespace=$context
end

function ethon
  networksetup -setnetworkserviceenabled "USB 10/100/1000 LAN" on
end

function ethoff
  networksetup -setnetworkserviceenabled "USB 10/100/1000 LAN" off
end

function k
  kubectl $argv
end

function ka
  kubectl $argv --all-namespaces
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

function ding
  $argv; echo -en "\007"; osascript -e 'display notification "Your command has finished running!"'
end

function hi
  ack --passthru $argv
end
